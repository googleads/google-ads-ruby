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
# This example adds a call ad to a given ad group.
#
# More information about call ads can be found at:
# https://support.google.com/google-ads/answer/6341403.
#
# To get ad group IDs, run basic_operations/get_ad_groups.rb.

require 'date'
require 'google/ads/google_ads'
require 'optparse'

def add_call_ad(customer_id,
    ad_group_id,
    phone_number,
    phone_country,
    conversion_action_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    aga.status = :PAUSED
    aga.ad = client.resource.ad do |ad|
      # The URL of the webpage to refer to.
      ad.final_urls << "https://www.example.com"
      ad.call_ad = client.resource.call_ad_info do |ca|
        # Sets basic information.
        ca.business_name = "Google"
        ca.headline1 = "Travel"
        ca.headline2 = "Discover"
        ca.description1 = "Travel the World"
        ca.description2 = "Travel the Universe"
        # Sets the country code and phone number of the business to call.
        ca.country_code = phone_country
        ca.phone_number = phone_number
        # Sets the verification URL to a webpage that includes the phone number.
        ca.phone_number_verification_url = "https://www.example.com/contact"
        # The fields below are optional.
        # Configures call tracking and reporting.
        ca.call_tracked = true
        ca.disable_call_conversion = false
        # Sets path parts to append for display.
        ca.path1 = "services"
        ca.path2 = "travels"
        if conversion_action_id
          ca.conversion_action = client.path.
            conversion_action(customer_id, conversion_action_id)
          ca.conversion_reporting_state = :USE_RESOURCE_LEVEL_CALL_CONVERSION_ACTION
        end
      end
    end
  end

  # Issues a mutate request to add the ad group ad.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created ad group ad with resource name: '#{resource_name}'"
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
  options[:phone_number] = 'INSERT_PHONE_NUMBER_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'An ad group ID.') do |v|
      options[:ad_group_id] = v
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
    add_call_ad(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id],
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
