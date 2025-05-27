#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This example illustrates how to create a new customer under a given manager
# account.
#
# Note: This example must be run using the credentials of a Google Ads manager
# account. By default, the new account will only be accessible via the manager
# account.

require 'google/ads/google_ads'
require 'date'
require_relative 'argument_parser'
require_relative 'error_handler'

# [START create_customer]
def create_customer(manager_customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  customer = client.resource.customer do |c|
    c.descriptive_name = "Account created with CustomerService on #{(Time.new.to_f * 1000).to_i}"

    # For a list of valid currency codes and time zones, see this documentation:
    # https://developers.google.com/google-ads/api/reference/data/codes-formats
    c.currency_code = "USD"
    c.time_zone = "America/New_York"

    # The below values are optional. For more information about URL options, see:
    # https://support.google.com/google-ads/answer/6305348
    c.tracking_url_template = "{lpurl}?device={device}"
    c.final_url_suffix = "keyword={keyword}&matchtype={matchtype}&adgroupid={adgroupid}"
  end

  response = client.service.customer.create_customer_client(
    customer_id: manager_customer_id,
    customer_client: customer
  )

  puts "Created a customer with resource name #{response.resource_name} under " \
      "the manager account with customer ID #{manager_customer_id}."
end
# [END create_customer]

if __FILE__ == $0
  # Parse arguments using the shared parser.
  options = ArgumentParser.parse_arguments(ARGV)

  # Manager customer ID is required for this script.
  unless options[:manager_customer_id]
    puts "Usage: #{$0} -m MANAGER_CUSTOMER_ID"
    puts "  -m, --manager-customer-id MANAGER-CUSTOMER-ID   The Google Ads manager customer ID."
    exit 1
  end

  begin
    create_customer(options[:manager_customer_id])
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise # Re-raise the error after handling to ensure script exits non-zero.
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
