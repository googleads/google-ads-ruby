#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# This example gets all available criterion bid modifier simulations for a given
# campaign. To get campaigns, run get_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def get_campaign_criterion_bid_modifier_simulations(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a query that retrieves the criterion bid modifier simulations.
  query = <<~QUERY
    SELECT campaign_criterion_simulation.criterion_id,
           campaign_criterion_simulation.start_date,
           campaign_criterion_simulation.end_date,
           campaign_criterion_simulation.bid_modifier_point_list.points
    FROM campaign_criterion_simulation
    WHERE campaign_criterion_simulation.type = BID_MODIFIER
      AND campaign_criterion_simulation.campaign_id = #{campaign_id}
  QUERY

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all messages and prints the requested field values
  # for the campaign criterion bid modifier simulation in each row.
  responses.each do |response|
    response.results.each do |row|
      simulation = row.campaign_criterion_simulation
      puts "Found campaign-level criterion bid modifier simulation for "\
        "criterion with ID #{simulation.criterion_id}, " \
        "start date #{simulation.start_date}, " \
        "end date #{simulation.end_date}, and points:"
      simulation.bid_modifier_point_list.points.each do |point|
        puts "  bid modifier: #{point.bid_modifier.round(2)} ==> " \
          "clicks: #{point.clicks}, cost: #{point.cost_micros}, " \
          "impressions: #{point.impressions}, " \
          "parent clicks: #{point.parent_clicks}, " \
          "parent cost micros: #{point.parent_cost_micros}, " \
          "parent impressions: #{point.parent_impressions}, " \
          "parent required budget: #{point.parent_required_budget_micros}"
      end
    end
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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_campaign_criterion_bid_modifier_simulations(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
