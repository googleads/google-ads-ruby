#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
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
# This example generates budget recommendations on-the-fly for Performance Max
# campaigns.
#
# Use this example to get budget recommendations during campaign creation
# workflows.
#
# This example uses the following:
# 1) Performance Max for the campaign type
# 2) United States for the geo targeting
# 3) Maximize Conversion Value for the bidding strategy
#
# To get impact metrics for a custom budget, run
# get_recommendation_impact_metrics.rb.

require 'optparse'
require 'google/ads/google_ads'

def generate_budget_recommendations(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  recommendation_service = client.service.recommendation

  asset_group_info =
    client.resource.generate_recommendations_request_asset_group_info do |agi|
      agi.final_url = "https://www.your-company.com/"
    end

  bidding_info = client.resource.bidding_info do |bi|
    bi.bidding_strategy_type = :MAXIMIZE_CONVERSION_VALUE
  end

  response = recommendation_service.generate_recommendations(
    customer_id: customer_id,
    recommendation_types: [:CAMPAIGN_BUDGET],
    advertising_channel_type: :PERFORMANCE_MAX,
    bidding_info: bidding_info,
    positive_locations_ids: [2840], # 2840 is for United States
    asset_group_info: [asset_group_info],
  )

  # Initialize a list to store all budget recommendations with impact metrics.
  budget_recommendations_list = []
  # Initialize a list to store budget recommendation amounts.
  budget_amounts = []

  # Get budget recommendations with their associated impact metrics.
  response.recommendations.each do |rec|
    campaign_budget_rec = rec.campaign_budget_recommendation
    # Loop through the budget options in the campaign budget recommendation
    # to compile a list of budget amounts and their respective potential
    # impact metrics. If you have a campaign creation interface,
    # you could display this information for end users to decide which
    # budget amount best aligns with their goals.
    campaign_budget_rec.budget_options.each do |budget_option|
      impact = budget_option.impact
      budget_amount_micros = budget_option.budget_amount_micros
      if budget_amount_micros > 0
        budget_amount = (budget_amount_micros / 1_000_000.0).round(2)
        budget_data = {
          budget_amount: budget_amount,
          potential_metrics: impact&.potential_metrics,
        }
        budget_recommendations_list << budget_data
        budget_amounts << budget_amount
      end
    end
  end

  puts "budget_recommendations_list:\n#{budget_recommendations_list.inspect}"
  puts "budget_amounts:\n#{budget_amounts.inspect}"
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

    opts.on('-C', '--customer-id CUSTOMER-ID', String,
        'The Google Ads customer ID.') do |v|
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
    generate_budget_recommendations(options.fetch(:customer_id).tr("-", ""))
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
