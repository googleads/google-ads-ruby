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
# This example adds a Portfolio Bidding Strategy and uses it to construct a
# campaign.

require "optparse"
require "google/ads/google_ads"

def use_portfolio_bidding_strategy(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters

  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START use_portfolio_bidding_strategy]
  # Create a budget, which can be shared by multiple campaigns.
  budget = client.resource.campaign_budget do |cb|
    cb.name = "Interplanetary budget ##{(Time.new.to_f * 1000).to_i}"
    cb.amount_micros = 50_000_000
    cb.delivery_method = :STANDARD
    cb.explicitly_shared = true
  end

  operation = client.operation.create_resource.campaign_budget(budget)

  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )
  budget_id = response.results.first.resource_name
  # [END use_portfolio_bidding_strategy]

  puts "Budget #{budget_id} was created"

  # [START use_portfolio_bidding_strategy_1]
  # Create a portfolio bidding strategy.
  bidding_strategy = client.resource.bidding_strategy do |bs|
    bs.name = "Enhanced CPC ##{(Time.new.to_f * 1000).to_i}"
    bs.target_spend = client.resource.target_spend do |ts|
      ts.cpc_bid_ceiling_micros = 2_000_000
    end
  end

  operation = client.operation.create_resource.bidding_strategy(bidding_strategy)

  response = client.service.bidding_strategy.mutate_bidding_strategies(
    customer_id: customer_id,
    operations: [operation],
  )
  bidding_id = response.results.first.resource_name

  puts "Portfolio bidding strategy #{bidding_id} was created"
  # [END use_portfolio_bidding_strategy_1]

  # [START use_portfolio_bidding_strategy_2]
  # Create campaigns.
  campaigns = 2.times.map do |i|
    client.resource.campaign do |c|
      c.name = "Interplanetary Cruise ##{(Time.new.to_f * 1000).to_i + i}"
      c.status = :PAUSED
      c.bidding_strategy = bidding_id
      c.campaign_budget = budget_id
      c.advertising_channel_type = :SEARCH
      c.network_settings = client.resource.network_settings do |ns|
        ns.target_google_search = true
        ns.target_search_network = true
        ns.target_content_network = false
        ns.target_partner_search_network = false
      c.contains_eu_political_advertising = :DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING
      end
    end
  end
  # [END use_portfolio_bidding_strategy_2]

  campaign_operations = campaigns.map {|c|
    client.operation.create_resource.campaign(c)
  }
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: campaign_operations,
  )
  response.results.each do |c|
    puts "Campaign #{c.resource_name} was created"
  end
end

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
    use_portfolio_bidding_strategy(options.fetch(:customer_id).tr("-", ""))
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
