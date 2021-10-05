#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# Adds a channel-level data exclusion for Smart Bidding.
#
# The exclusion specifically excludes conversions from being used by Smart
# Bidding for the time interval specified.
#
# For more information on using data exclusions, see:
# https://developers.google.com/google-ads/api/docs/campaigns/bidding/data-exclusions

require 'optparse'
require 'google/ads/google_ads'

def add_bidding_data_exclusion(customer_id, start_date_time, end_date_time)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  # [START add_bidding_data_exclusion]
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operation = client.operation.create_resource.bidding_data_exclusion do |bda|
    # A unique name is required for every data excluseion.
    bda.name = "Seasonality Adjustment #{(Time.new.to_f * 1000).to_i}"

    # The CHANNEL scope applies the data exclusion to all campaigns of specific
    # advertising channel types. In this example, the conversion_rate_modifier
    # will only apply to Search campaigns. Use the CAMPAIGN scope to instead
    # limit the scope to specific campaigns.
    bda.scope = :CHANNEL
    bda.advertising_channel_types << :SEARCH

    # If setting scope CAMPAIGN, add individual campaign resource name(s)
    # according to the commented out line below.
    #
    # bda.campaigns << "INSERT_CAMPAIGN_RESOURCE_NAME_HERE"

    bda.start_date_time = start_date_time
    bda.end_date_time = end_date_time
  end

  response = client.service.bidding_data_exclusion.mutate_bidding_data_exclusions(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Added data exclusion with resource name #{response.results.first.resource_name}."
  # [END add_bidding_data_exclusion]
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
  options[:start_date_time] = 'INSERT_START_DATE_TIME_HERE'
  options[:end_date_time] = 'INSERT_END_DATE_TIME_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-s', '--start-date-time START-DATE-TIME', String,
            'The start date of the adjustment period, must be in the format:' \
            'yyyy-MM-dd HH:mm:ss') do |v|
      options[:start_date_time] = v
    end

    opts.on('-e', '--end-date-time END-DATE-TIME', String,
            'The end date of the adjustment period, must be in the format:' \
            'yyyy-MM-dd HH:mm:ss') do |v|
      options[:end_date_time] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_bidding_data_exclusion(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:start_date_time),
      options.fetch(:end_date_time),
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
