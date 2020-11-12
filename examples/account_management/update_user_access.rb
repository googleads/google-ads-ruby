#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# Updates the access role of a user, given the email address.
#
# This code example should be run as a user who is an Administrator on the
# Google Ads account with the specified customer ID.
#
# See https://support.google.com/google-ads/answer/9978556 to learn more about
# account access levels.

require 'optparse'
require 'google/ads/google_ads'

def update_user_access(customer_id, email_address, access_role)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  if !ACCESS_ROLES.include?(access_role)
    raise "Illegal access role specified. Expected one of " \
      "#{ACCESS_ROLES.join(" ")}"
  end

  user_id = get_user_id(client, customer_id, email_address)

  if user_id
    modify_user_access(client, customer_id, user_id, access_role)
  end
end

def get_user_id(client, customer_id, email_address)
  query = <<~QUERY
    SELECT
      customer_user_access.user_id,
      customer_user_access.email_address,
      customer_user_access.access_role,
      customer_user_access.access_creation_date_time
    FROM customer_user_access
    WHERE customer_user_access.email_address LIKE "#{email_address}"
  QUERY

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  result = response.first.customer_user_access
  if result
    puts "Customer user access with User ID #{result.user_id}, Access Role " \
      "#{result.access_role}, Creation Time #{result.access_creation_date_time}, " \
      "was found in customer ID #{customer_id}."

    result.user_id
  else
    puts "No customer user access found with email address #{email_address}."
    nil
  end
end

def modify_user_access(client, customer_id, user_id, access_role)
  operation = client.operation.update_resource.customer_user_access(
      client.path.customer_user_access(customer_id, user_id)) do |ua|
    ua.access_role = access_role.to_sym
  end

  response = client.service.customer_user_access.mutate_customer_user_access(
    customer_id: customer_id,
    operation: operation,
  )

  puts "Successfully updated customer user access with resource name " \
    "#{response.results.first.resource_name}."
end

if __FILE__ == $0
  ACCESS_ROLES = %w[
    ADMIN
    STANDARD
    READ_ONLY
    EMAIL_ONLY
  ]

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
  options[:email_address] = 'INSERT_EMAIL_ADDRESS_HERE'
  options[:access_role] = 'INSERT_ACCESS_ROLE_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-e', '--email-address EMAIL-ADDRESS', String, 'Email Address') do |v|
      options[:email_address] = v
    end

    opts.on('-a', '--access-role ACCESS-ROLE', String, 'Access Role') do |v|
      options[:access_role] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    update_user_access(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:email_address),
      options.fetch(:access_role),
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
