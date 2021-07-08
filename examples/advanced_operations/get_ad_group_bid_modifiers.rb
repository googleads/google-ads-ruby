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
# This example gets ad group bid modifiers.

require "optparse"
require "google/ads/google_ads"

def get_ad_group_bid_modifiers(customer_id, ad_group_id = nil)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  search_query = <<~QUERY
    SELECT  ad_group.id,
            ad_group_bid_modifier.criterion_id,
            ad_group_bid_modifier.bid_modifier,
            ad_group_bid_modifier.device.type,
            ad_group_bid_modifier.hotel_date_selection_type.type,
            ad_group_bid_modifier.hotel_advance_booking_window.min_days,
            ad_group_bid_modifier.hotel_advance_booking_window.max_days,
            ad_group_bid_modifier.hotel_length_of_stay.min_nights,
            ad_group_bid_modifier.hotel_length_of_stay.max_nights,
            ad_group_bid_modifier.hotel_check_in_day.day_of_week,
            ad_group_bid_modifier.hotel_check_in_date_range.start_date,
            ad_group_bid_modifier.hotel_check_in_date_range.end_date,
            ad_group_bid_modifier.preferred_content.type,
            campaign.id
    FROM ad_group_bid_modifier
  QUERY

  if ad_group_id
    search_query << "WHERE ad_group.id = #{ad_group_id}"
  end

  search_query << " LIMIT 10000"

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: search_query,
    page_size: PAGE_SIZE,
  )

  response.each do |row|
    ad_group_bid_modifier = row.ad_group_bid_modifier
    ad_group = row.ad_group
    campaign = row.campaign
    bid_modifier = '"nil"'

    if ad_group_bid_modifier.bid_modifier
      bid_modifier = sprintf("%.2f", ad_group_bid_modifier.bid_modifier)
    end

    puts "Ad group bid modifier with criterion ID #{ad_group_bid_modifier.criterion_id}, bid " \
        "modifier value #{bid_modifier} was found in an ad group with ID #{ad_group.id} of " \
        "campaign ID #{campaign.id}."

    criterion_details = "  - Criterion type: #{ad_group_bid_modifier.criterion}, "

    case ad_group_bid_modifier.criterion
    when :device
      criterion_details += "Type: #{ad_group_bid_modifier.device.type}"
    when :hotel_advance_booking_window
      hotel_advance_booking_window = ad_group_bid_modifier.hotel_advance_booking_window
      criterion_details += "Min Days: #{hotel_advance_booking_window.min_days}, " \
          "Max Days: #{hotel_advance_booking_window.max_days}"
    when :hotel_check_in_day
      hotel_check_in_day = ad_group_bid_modifier.hotel_check_in_day
      criterion_details += "Day of the week: #{hotel_check_in_day.day_of_week}"
    when :hotel_date_selection_type
      hotel_date_selection_type = ad_group_bid_modifier.hotel_date_selection_type
      criterion_details += "Date selection type: #{hotel_date_selection_type.min_days}"
    when :hotel_length_of_stay
      hotel_length_of_stay = ad_group_bid_modifier.hotel_length_of_stay
      criterion_details += "Min Nights: #{hotel_length_of_stay.min_nights}, " \
          "Max Nights: #{hotel_length_of_stay.max_nights}"
    when :hotel_check_in_date_range
      hotel_check_in_date_range = ad_group_bid_modifier.hotel_check_in_date_range
      criterion_details += "Start Date: #{hotel_check_in_date_range.start_date}, " \
          "End Date: #{hotel_check_in_date_range.end_date}"
    when :preferred_content
      criterion_details += "Type: #{ad_group_bid_modifier.preferred_content.type}"
    else
      criterion_details = '  - No Criterion type found.'
    end

    puts criterion_details
  end
end

if __FILE__ == $0
  PAGE_SIZE = 1000
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
  options[:ad_group_id] =  nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String,
        '(Optional) AdGroup ID') do |v|
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
    get_ad_group_bid_modifiers(options.fetch(:customer_id).tr("-", ""), options[:ad_group_id])
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
