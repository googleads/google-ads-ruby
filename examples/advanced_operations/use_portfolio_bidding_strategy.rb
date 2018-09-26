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

require 'optparse'
require 'google/ads/google_ads'

def use_portfolio_bidding_strategy(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters

  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_service = client.service(:CampaignBudget)
  bidding_service = client.service(:BiddingStrategy)
  campaign_service = client.service(:Campaign)

  # Create a budget, which can be shared by multiple campaigns.

  budget = client.resource(:CampaignBudget)
  budget.name = client.wrapper.string(sprintf(
      'Interplanetary budget #%d', (Time.new.to_f * 1000).to_i))
  budget.amount_micros = client.wrapper.int64(50_000_000)
  budget.delivery_method = client.enum(:BudgetDeliveryMethod)::STANDARD
  budget.explicitly_shared = client.wrapper.bool(true)

  response = budget_service.mutate_campaign_budgets(
      customer_id, [{create: budget}])
  budget_id = response.results.first.resource_name

  puts sprintf("Budget %s was created", budget_id)

  # Create a portfolio bidding strategy.
  bidding_strategy = client.resource(:BiddingStrategy)
  bidding_strategy.name = client.wrapper.string(sprintf(
      'Enhanced CPC #%d', (Time.new.to_f * 1000).to_i))
  bidding_strategy.enhanced_cpc = client.resource(:EnhancedCpc)

  response = bidding_service.mutate_bidding_strategies(
      customer_id, [{create: bidding_strategy}])
  bidding_id = response.results.first.resource_name

  puts sprintf("Portfolio bidding strategy %s was created", bidding_id)

  # Create campaigns.
  campaigns = (1..2).map do |i|
    campaign = client.resource(:Campaign)
    campaign.name = client.wrapper.string(sprintf(
        "Interplanetary Cruise #%d", (Time.new.to_f * 1000).to_i + i))
    campaign.status = client.enum(:CampaignStatus)::PAUSED
    campaign.bidding_strategy = client.wrapper.string(bidding_id)
    campaign.campaign_budget = client.wrapper.string(budget_id)
    campaign.advertising_channel_type =
        client.enum(:AdvertisingChannelType)::SEARCH
    network_settings = client.resource(:NetworkSettings)
    network_settings.target_google_search = client.wrapper.bool(true)
    network_settings.target_search_network = client.wrapper.bool(true)
    network_settings.target_content_network = client.wrapper.bool(false)
    network_settings.target_partner_search_network = client.wrapper.bool(false)
    campaign.network_settings = network_settings

    campaign
  end

  campaign_operations = campaigns.map {|c| {create: c}}
  response = campaign_service.mutate_campaigns(
    customer_id, campaign_operations)
  response.results.each do |c|
    puts sprintf("Campaign %s was created", c.resource_name)
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
    use_portfolio_bidding_strategy(options[:customer_id])
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
