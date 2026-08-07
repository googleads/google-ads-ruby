#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This example fetches pending multi-party approvals and approves the first one.
#
# Multi-party authorization (MPA) reviews can only be resolved one at a time.
# In this code example, we illustrate approving the first pending review request.

require 'optparse'
require 'google/ads/google_ads'

def fetch_and_approve_pending_multi_party_auth_reviews(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Retrieve the list of pending MPA reviews.
  pending_reviews = fetch_pending_mpa_reviews(client, customer_id)

  if !pending_reviews.empty?
    # Multi-party auth reviews can only be resolved one at a time. In this
    # code example, we illustrate approving the first pending review request.
    approve_mpa_review(client, customer_id, pending_reviews.first)
  else
    puts "No pending multi-party auth reviews found for customer ID #{customer_id}."
  end
end

# [START fetch_mpa_review]
def fetch_pending_mpa_reviews(client, customer_id)
  pending_reviews = []

  # Create a query that will retrieve all the pending MPA reviews.
  query = <<~QUERY
    SELECT
      multi_party_auth_review.resource_name,
      multi_party_auth_review.multi_party_auth_review_id,
      multi_party_auth_review.creation_date_time,
      multi_party_auth_review.review_status,
      multi_party_auth_review.request_user_email,
      multi_party_auth_review.operation_type,
      multi_party_auth_review.justification,
      multi_party_auth_review.target_resource,
      multi_party_auth_review.customer_user_access_review.old_customer_user_access,
      multi_party_auth_review.customer_user_access_review.new_customer_user_access,
      multi_party_auth_review.customer_user_access_invitation_review.new_customer_user_access_invitation
    FROM multi_party_auth_review
    WHERE multi_party_auth_review.review_status = 'PENDING'
  QUERY

  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  responses.each do |response|
    response.results.each do |row|
      mpa_review = row.multi_party_auth_review
      puts "#{mpa_review.request_user_email} created a pending " \
        "multi-party auth review with ID #{mpa_review.multi_party_auth_review_id} " \
        "at #{mpa_review.creation_date_time}. This request is for target " \
        "resource type = #{mpa_review.target_resource} and operation type = " \
        "#{mpa_review.operation_type}. The justification is " \
        "\"#{mpa_review.justification}\"."

      if mpa_review.target_resource == :CUSTOMER_USER_ACCESS
        access_review = mpa_review.customer_user_access_review
        if mpa_review.operation_type == :UPDATE
          # When updating a customer user access, only the new access level
          # is populated.
          puts "\tOld resource name: #{access_review.old_customer_user_access}, " \
            "new access role: #{access_review.new_customer_user_access.access_role}."
        elsif mpa_review.operation_type == :REMOVE
          puts "\tOld resource name: #{access_review.old_customer_user_access}."
        end
      elsif mpa_review.target_resource == :CUSTOMER_USER_ACCESS_INVITATION
        new_invite = mpa_review.customer_user_access_invitation_review.new_customer_user_access_invitation
        puts "\tInvitation email address: #{new_invite.email_address}, " \
          "Role: #{new_invite.access_role}."
      end

      pending_reviews << mpa_review.resource_name
    end
  end

  pending_reviews
end
# [END fetch_mpa_review]

# [START approve_mpa_review]
def approve_mpa_review(client, customer_id, pending_review)
  # Currently, you can only approve one request at a time. In addition, the approvals
  # can only be done by a second administrator.
  response = client.service.multi_party_auth_review.resolve_multi_party_auth_review(
    customer_id: customer_id,
    operations: [
      {
        multi_party_auth_review: pending_review,
        new_status: :APPROVED,
      }
    ],
  )

  result_or_error = response.result_or_error.first

  if result_or_error&.result
    result = result_or_error.result
    puts "Approved multi-party auth review: #{result.multi_party_auth_review}."
    if !result.customer_user_access_invitation.to_s.empty?
      puts "New user invitation created: #{result.customer_user_access_invitation}"
    elsif !result.customer_user_access.to_s.empty?
      puts "Affected customer user access resource: #{result.customer_user_access}"
    end
  elsif result_or_error&.partial_failure_error
    # Partial failure error
    errors_count = 0
    failures = client.decode_partial_failure_error(result_or_error.partial_failure_error)
    failures.each do |failure|
      failure.errors.each do |error|
        puts "\tError with message '#{error.message}'."
        errors_count += 1
      end
    end
    puts "#{errors_count} partial failure error(s) occurred"
  else
    puts "No result or error returned."
  end
end
# [END approve_mpa_review]

if __FILE__ == $PROGRAM_NAME
  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  if options[:customer_id].nil? || options[:customer_id] == 'INSERT_CUSTOMER_ID_HERE'
    puts "Missing required argument: --customer-id (-C) is required."
    exit 1
  end

  begin
    fetch_and_approve_pending_multi_party_auth_reviews(
      options.fetch(:customer_id).tr("-", "")
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
