#!/usr/bin/env ruby

#
# Copyright:: Copyright 2020 Google LLC
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
# This example gets all available ad group criterion CPC bid simulations for a
# given ad group. To get ad groups, run get_ad_groups.rb.

require 'optparse'
require 'google/ads/google_ads'

# [START get_ad_group_criterion_cpc_bid_simulations]
def get_ad_group_criterion_cpc_bid_simulations(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~QUERY
    SELECT ad_group_criterion_simulation.ad_group_id,
           ad_group_criterion_simulation.criterion_id,
           ad_group_criterion_simulation.start_date,
           ad_group_criterion_simulation.end_date,
           ad_group_criterion_simulation.cpc_bid_point_list.points
    FROM ad_group_criterion_simulation
    WHERE ad_group_criterion_simulation.type = CPC_BID 
    AND ad_group_criterion_simulation.ad_group_id = #{ad_group_id}
  QUERY

  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  responses.each do |response|
    response.results.each do |row|
      simulation = row.ad_group_criterion_simulation

      puts "Found ad group criterion CPC bid simulation for " \
      "ad group ID #{simulation.ad_group_id}, " \
      "criterion ID #{simulation.criterion_id}, " \
      "start date '#{simulation.start_date}', " \
      "end date '#{simulation.end_date}', and points:"

      simulation.cpc_bid_point_list.points.each do |point|
        puts "  bid: #{point.cpc_bid_micros} => " \
        "clicks: #{point.clicks}, " \
        "cost: #{point.cost_micros}, " \
        "impressions: #{point.impressions}, " \
        "biddable conversions: #{point.biddable_conversions.round(2)}, " \
        "biddable conversions value: #{point.biddable_conversions_value.round(2)}"
      end
    end
  end
end
# [END get_ad_group_criterion_cpc_bid_simulations]

if __FILE__ == $PROGRAM_NAME
  options = {}

  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:customer_id] = 'INSERT_GOOGLE_ADS_CUSTOMER_ID_HERE'
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = format('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
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
    get_ad_group_criterion_cpc_bid_simulations(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id]
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      error.location&.field_path_elements&.each do |field_path_element|
        STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED

        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
