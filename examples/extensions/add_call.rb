#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2022 Google LLC
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
# This example adds a call extension to a specific account.

require 'date'
require 'google/ads/google_ads'
require 'optparse'

def add_call(customer_id,
    phone_number,
    phone_country,
    conversion_action_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  asset_resource_name = add_extension_asset(client,
    customer_id,
    phone_number,
    phone_country,
    conversion_action_id)
  link_asset_to_account(client, customer_id, asset_resource_name)
end

def add_extension_asset(client,
    customer_id,
    phone_number,
    phone_country,
    conversion_action_id)
  # Creates the call asset.
  operation = client.operation.create_resource.asset do |asset|
    asset.type = :CALL
    asset.call_asset = client.resource.call_asset do |ca|
      ca.country_code = phone_country
      ca.phone_number = phone_number
      # Optional: Specifies day and time intervals for which the asset may serve.
      ad_schedule = client.resource.ad_schedule_info do |as|
        # Sets the day of this schedule as Monday.
        as.day_of_week = :MONDAY
        # Sets the start hour to 9am.
        as.start_hour = 9
        # Sets the end hour to 5pm.
        as.end_hour = 17
        # Sets the start and end minute of zero, for example: 9:00 and 5:00.
        as.start_minute = :ZERO
        as.end_minute = :ZERO
      end
      # Appends the ad schedule to the list of ad schedule targets on the asset.
      ca.ad_schedule_targets << ad_schedule

      # Sets the conversion action ID if provided.
      if conversion_action_id
        ca.call_conversion_action = client.path.
          conversion_action(customer_id, conversion_action_id)
        ca.call_conversion_reporting_state = :USE_RESOURCE_LEVEL_CALL_CONVERSION_ACTION
      end
    end
  end

  # Issues a mutate request to add the asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created a call asset with resource name: '#{resource_name}'"

  resource_name
end


def link_asset_to_account(client, customer_id, asset_resource_name)
  operation = client.operation.create_resource.customer_asset do |ca|
    ca.asset = asset_resource_name
    ca.field_type = :CALL
  end

  response = client.service.customer_asset.mutate_customer_assets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created a customer asset with resource name: '#{resource_name}'"
end

if __FILE__ == $0
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
  options[:phone_number] = 'INSERT_PHONE_NUMBER_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-N', '--phone-number PHONE-NUMBER', String,
        "A phone number for your business, e.g. '(800) 555-0100'") do |v|
      options[:phone_number] = v
    end

    opts.on('-P', '--phone-country PHONE-COUNTRY', String,
        'A two-letter ISO-3166 code representing a country code, for a ' \
        'list of all codes see: ' \
        'https://developers.google.com/google-ads/api/reference/data/codes-formats#expandable-17') do |v|
      options[:phone_country] = v
    end

    opts.on('-V', '--conversion-action-id CONVERSION-ACTION-ID', String,
      'Specifies the conversion action ID to attribute call conversions to. ' \
      'If not set, the default conversion action is used.') do |v|
      options[:conversion_action_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_call(
      options.fetch(:customer_id).tr("-", ""),
      options[:phone_number],
      options.fetch(:phone_country, 'US'),
      options[:conversion_action_id],
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
