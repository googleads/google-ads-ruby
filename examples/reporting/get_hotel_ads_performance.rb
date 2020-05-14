#!/usr/bin/ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2019 Google LLC
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
# This example gets Hotel-ads performance statistics for the 50 Hotel ad groups
# with the most impressions over the last 7 days.

require 'optparse'
require 'google/ads/google_ads'

def get_hotel_ads_performance(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service.google_ads

  # Limits to the 50 keywords with the most impressions in the date range.
  # If you wish to exclude entries with zero impressions, include a
  # predicate in the WHERE statement like 'metrics.impressions > 0'
  query = <<~QUERY
    SELECT campaign.id,
           campaign.advertising_channel_type,
           ad_group.id,
           ad_group.status,
           metrics.impressions,
           metrics.hotel_average_lead_value_micros,
           segments.hotel_check_in_day_of_week,
           segments.hotel_length_of_stay
    FROM hotel_performance_view
    WHERE segments.date DURING LAST_7_DAYS
      AND campaign.advertising_channel_type = 'HOTEL'
      AND ad_group.status = 'ENABLED'
    ORDER BY metrics.impressions DESC
    LIMIT 50
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)

  if response.response.results.empty?
    puts sprintf("The given query returned no entries:\n %s", query)
    return
  end

  response.each do |row|
    campaign = row.campaign
    ad_group = row.ad_group
    metrics = row.metrics
    segments = row.segments

    puts "Ad Group ID #{ad_group.id} in campaign ID #{campaign.id} with hotel "\
      "check-in on #{segments.hotel_check_in_day_of_week} and "\
      "#{segments.hotel_length_of_stay} day(s) of stay had #{metrics.impressions} "\
      "impression(s) and #{metrics.hotel_average_lead_value_micros} average lead value "\
      "(in micros) during the last 7 days."
  end
end

if __FILE__ == $PROGRAM_NAME
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

  begin
    get_hotel_ads_performance(options.fetch(:customer_id).tr("-", ""))
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
