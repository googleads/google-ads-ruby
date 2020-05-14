#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
# This example demonstrates how to add an ad group bid modifier for mobile
# devices. To get ad group bid modifiers,
# see advanced_operations/get_ad_group_bid_modifier.rb

require 'optparse'
require 'google/ads/google_ads'

def add_ad_group_bid_modifier(customer_id, ad_group_id, bid_modifier_value)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates an ad group bid modifier for mobile devices with the specified
  # ad group ID and bid modifier value.
  ad_group_bid_modifier = client.resource.ad_group_bid_modifier do |mod|
    # Sets the ad group.
    mod.ad_group = client.path.ad_group(customer_id, ad_group_id)

    # Sets the Bid Modifier.
    mod.bid_modifier = bid_modifier_value

    # Sets the Device.
    mod.device = client.resource.device_info do |device|
      device.type = :MOBILE
    end
  end

  # Create the operation.
  operation = client.operation.create_resource.ad_group_bid_modifier(ad_group_bid_modifier)

  # Add the ad group ad.
  response = client.service.ad_group_bid_modifier.mutate_ad_group_bid_modifiers(
      customer_id, [operation])

  puts "Added #{response.results.size} ad group bid modifiers:"
  response.results.each do |added_ad_group_bid_modifier|
    puts "\t#{added_ad_group_bid_modifier.resource_name}"
  end
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
  options[:bid_modifier_value] = 1.5

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'AdGroup ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-B', '--bid-modifier-value BID-MODIFIER-VALUE', String,
        'Bid Modifier Value') do |v|
      options[:bid_modifier_value] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_ad_group_bid_modifier(options.fetch(:customer_id).tr("-", ""),
        options[:ad_group_id], options[:bid_modifier_value])
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
    raise
  end
end
