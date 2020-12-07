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
# This example adds a feed that syncs feed items from a Google My Business (GMB)
# account and associates the feed with a customer.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_google_my_business_location_extensions(
  customer_id,
  gmb_email_address,
  gmb_access_token,
  business_account_identifier)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  gmb_feed_resource_name = create_feed(
    client,
    customer_id,
    gmb_email_address,
    gmb_access_token,
    business_account_identifier,
  )

  create_customer_feed(client, customer_id, gmb_feed_resource_name)
end

# [START add_google_my_business_location_extensions_4]
def create_feed(
  client,
  customer_id,
  gmb_email_address,
  gmb_access_token,
  business_account_identifier)
  # Creates a feed operation.
  operation = client.operation.create_resource.feed do |feed|
    feed.name = "Google My Business feed #{(Time.new.to_f * 1000).to_i}"
    feed.origin = :GOOGLE
    feed.places_location_feed_data = client.resource.places_location_feed_data do |data|
      data.email_address = gmb_email_address
      data.business_account_id = business_account_identifier
      data.label_filters << "Stores in New York"
      data.oauth_info = client.resource.o_auth_info do |oauth|
        oauth.http_method = "GET"
        oauth.http_request_url = "https://www.googleapis.com/auth/adwords"
        oauth.http_authorization_header = "Bearer #{gmb_access_token}"
      end
    end
  end

  # [START add_google_my_business_location_extensions_1]
  # Issues a mutate request to add the feed and print its information.
  # Since it is a system generated feed, Google Ads will automatically:
  # 1. Set up the feed attributes on the feed.
  # 2. Set up a feed mapping that associates the feed attributes of the feed with the
  #    placeholder fields of the LOCATION placeholder type.
  response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out the GMB feed resource name.
  gmb_feed_resource_name = response.results.first.resource_name
  puts "GMB feed created with resource name: #{gmb_feed_resource_name}"

  gmb_feed_resource_name
  # [END add_google_my_business_location_extensions_1]
end
# [END add_google_my_business_location_extensions_4]

# [START add_google_my_business_location_extensions_5]
def create_customer_feed(
  client,
  customer_id,
  gmb_feed_resource_name)
  # Creates a customer feed operation.
  operation = client.operation.create_resource.customer_feed do |cf|
    cf.feed = gmb_feed_resource_name
    cf.placeholder_types << :LOCATION
    cf.matching_function = client.resource.matching_function do |m|
      m.left_operands << client.resource.operand do |op|
        op.constant_operand = client.resource.constant_operand do |co|
          co.boolean_value = true
        end
      end
      m.function_string = "IDENTITY(true)"
      m.operator = :IDENTITY
    end
  end

  # [START add_google_my_business_location_extensions_3]
  # After the completion of the feed ADD operation above the added feed will
  # not be available for usage in a customer feed until the sync between the
  # Google Ads and GMB accounts completes. The loop below will retry adding the
  # customer feed up to ten times with an exponential back-off policy.
  number_of_attempts = 0
  added_customer_feed = nil
  customer_feed_service_client = client.service.customer_feed

  loop do
    number_of_attempts += 1
    begin
      # Issues a mutate request to add a customer feed and print its information
      # if the request succeeded.
      response = customer_feed_service_client.mutate_customer_feeds(
        customer_id: customer_id,
        operations: [operation]
      )
      puts "Customer feed created with resource name: " \
        "#{response.results.first.resource_name}"
    rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
      # Waits using exponential backoff policy
      sleep_seconds = POLL_FREQUENCY_SECONDS * (2 ** number_of_attempts)
      puts "Attempt #{number_of_attempts} to add the customer feed was " \
        "not successful. Waiting #{sleep_seconds} seconds before trying again."
      sleep sleep_seconds
    end
    break if number_of_attempts >= MAX_CUSTOMER_FEED_ADD_ATTEMPTS || added_customer_feed
  end
  # [END add_google_my_business_location_extensions_3]

  if added_customer_feed.nil?
    raise "Could not create the customer feed after #{MAX_CUSTOMER_FEED_ADD_ATTEMPTS} " \
      "attempts. Please retry the customer feed ADD operation later."
  end
end
# [END add_google_my_business_location_extensions_5]

if __FILE__ == $0
  # The maximum number of customer feed ADD operation attempts to make before
  # throwing an exception.
  MAX_CUSTOMER_FEED_ADD_ATTEMPTS = 10
  POLL_FREQUENCY_SECONDS = 5

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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-E', '--gmb-email-address GMB-EMAIL-ADDRESS', String, 'GMB Email Address') do |v|
      options[:gmb_email_address] = v
    end

    opts.on('-T', '--gmb-access-token GMB-ACCESS-TOKEN', String, 'GMB Access Token') do |v|
      options[:gmb_access_token] = v
    end

    opts.on('-B', '--business-account-identifier BUSINESS-ACCOUNT-IDENTIFIER', String, 'Business Account Identifier') do |v|
      options[:business_account_identifier] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_google_my_business_location_extensions(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:gmb_email_address),
      options.fetch(:gmb_access_token),
      options.fetch(:business_account_identifier),
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
