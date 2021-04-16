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
# This example shows how to add ad group bid modifiers to a hotel ad group
# based on hotel check-in day and hotel length of stay.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START add_hotel_ad_group_bid_modifiers]
def add_hotel_ad_group_bid_modifiers(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  operations = []
  ad_group_resource = client.path.ad_group(customer_id, ad_group_id)

  # 1) Creates an ad group bid modifier based on the hotel check-in day.
  operations << client.operation.create_resource.ad_group_bid_modifier do |bm|
    # Sets the ad group.
    bm.ad_group = ad_group_resource

    # Sets the check-in day to Monday.
    bm.hotel_check_in_day = client.resource.hotel_check_in_day_info do |info|
      info.day_of_week = :MONDAY
    end

    # Sets the bid modifier value to 150%.
    bm.bid_modifier = 1.5
  end

  # 2) Creates an ad group bid modifier based on the hotel length of stay.
  operations << client.operation.create_resource.ad_group_bid_modifier do |bm|
    # Sets the ad group.
    bm.ad_group = ad_group_resource

    # Creates the hotel length of stay info.
    bm.hotel_length_of_stay = client.resource.hotel_length_of_stay_info do |info|
      info.min_nights = 3
      info.max_nights = 7
    end

    # Sets the bid modifier value to 170%.
    bm.bid_modifier = 1.7
  end

  # 3) Issues a mutate request to add an ad group bid modifiers.
  ad_group_bid_modifier_service = client.service.ad_group_bid_modifier
  response = ad_group_bid_modifier_service.mutate_ad_group_bid_modifiers(
    customer_id: customer_id,
    operations: operations,
  )

  # Print out resource names of the added ad group bid modifiers.
  puts "Added #{response.results.size} hotel ad group bid modifiers:"
  response.results.each do |added_ad_group_bid_modifier|
    puts "\t#{added_ad_group_bid_modifier.resource_name}"
  end
end
# [END add_hotel_ad_group_bid_modifiers]

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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', Integer,
        'AdGroup ID') do |v|
      options[:ad_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_hotel_ad_group_bid_modifiers(options.fetch(:customer_id).tr("-", ""),
        options[:ad_group_id])
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
