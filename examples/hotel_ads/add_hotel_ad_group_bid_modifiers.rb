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
require 'google/ads/googleads'
require 'date'

def add_hotel_ad_group_bid_modifiers(customer_id, ad_group_id)
  # GoogleadsClient will read a config file from ENV['HOME']/googleads_config.rb
  # when called without parameters
  client = Google::Ads::Googleads::GoogleadsClient.new
  operations = []

  # 1) Creates an ad group bid modifier based on the hotel check-in day.
  check_in_day_ad_group_bid_modifier = client.resource(:AdGroupBidModifier)

  # Sets the ad group.
  ad_group_resource = client.path.ad_group(customer_id, ad_group_id)
  check_in_day_ad_group_bid_modifier.ad_group =
      client.wrapper.string(ad_group_resource)

  # Sets the check-in day to Monday.
  hotel_check_in_day = client.resource(:HotelCheckInDayInfo)
  hotel_check_in_day.day_of_week = client.enum(:DayOfWeek)::MONDAY
  check_in_day_ad_group_bid_modifier.hotel_check_in_day = hotel_check_in_day

  # Sets the bid modifier value to 150%.
  check_in_day_ad_group_bid_modifier.bid_modifier = client.wrapper.double(1.5)

  # Creates an ad group bid modifier operation.
  check_in_day_ad_group_bid_modifier_operation =
      client.operation(:AdGroupBidModifier)
  check_in_day_ad_group_bid_modifier_operation['create'] =
      check_in_day_ad_group_bid_modifier
  operations << check_in_day_ad_group_bid_modifier_operation

  # 2) Creates an ad group bid modifier based on the hotel length of stay.
  length_of_stay_ad_group_bid_modifier = client.resource(:AdGroupBidModifier)

  # Sets the ad group.
  length_of_stay_ad_group_bid_modifier.ad_group =
      client.wrapper.string(ad_group_resource)

  # Creates the hotel length of stay info.
  length_of_stay_info = client.resource(:HotelLengthOfStayInfo)
  length_of_stay_info.min_nights = client.wrapper.int64(3)
  length_of_stay_info.max_nights = client.wrapper.int64(7)
  length_of_stay_ad_group_bid_modifier.hotel_length_of_stay =
      length_of_stay_info

  # Sets the bid modifier value to 170%.
  length_of_stay_ad_group_bid_modifier.bid_modifier = client.wrapper.double(1.7)

  # Creates an ad group bid modifier operation.
  length_of_stay_ad_group_bid_modifier_operation =
      client.operation(:AdGroupBidModifier)
  length_of_stay_ad_group_bid_modifier_operation['create'] =
      length_of_stay_ad_group_bid_modifier
  operations << length_of_stay_ad_group_bid_modifier_operation

  # 3) Issues a mutate request to add an ad group bid modifiers.
  ad_group_bid_modifier_service = client.service(:AdGroupBidModifier)
  response = ad_group_bid_modifier_service.mutate_ad_group_bid_modifiers(
      customer_id, operations)

  # Print out resource names of the added ad group bid modifiers.
  puts sprintf("Added %d hotel ad group bid modifiers:", response.results.size)
  response.results.each do |added_ad_group_bid_modifier|
    puts sprintf("\t%s", added_ad_group_bid_modifier.resource_name)
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
    add_hotel_ad_group_bid_modifiers(options[:customer_id],
        options[:ad_group_id])
  rescue Google::Ads::Googleads::Errors::GoogleAdsError => e
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
