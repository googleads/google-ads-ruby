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
# This example adds a campaign. To get campaigns, run get_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_campaigns(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  cbudget_service = client.service(:CampaignBudget)
  campaign_service = client.service(:Campaign)

  # Create a budget, which can be shared by multiple campaigns.
  cbudget = client.resource(:CampaignBudget)
  cbudget.name = client.wrapper.string(
      sprintf('Interplanetary Budget %s',(Time.new.to_f * 1000).to_i))
  cbudget.delivery_method = client.enum(:BudgetDeliveryMethod)::STANDARD
  cbudget.amount_micros = client.wrapper.int64(500000)
  cbudget_operation = client.operation(:CampaignBudget)
  cbudget_operation['create'] = cbudget

  # Add budget.
  return_budget = cbudget_service.mutate_campaign_budgets(
      customer_id, [cbudget_operation])

  # Create campaign.
  campaign = client.resource(:Campaign)
  campaign.name = client.wrapper.string(
      sprintf('Interplanetary Cruise %s',(Time.new.to_f * 1000).to_i))
  campaign.advertising_channel_type =
      client.enum(:AdvertisingChannelType)::SEARCH

  # Recommendation: Set the campaign to PAUSED when creating it to prevent
  # the ads from immediately serving. Set to ENABLED once you've added
  # targeting and the ads are ready to serve.
  campaign.status = client.enum(:CampaignStatus)::PAUSED

  # Set the bidding strategy and budget.
  campaign.manual_cpc = client.resource(:ManualCpc)
  campaign.campaign_budget = client.wrapper.string(
      return_budget.results.first.resource_name)

  # Set the campaign network options.
  campaign.network_settings = client.resource(:NetworkSettings)
  campaign.network_settings.target_google_search = client.wrapper.bool(true)
  campaign.network_settings.target_search_network = client.wrapper.bool(true)
  campaign.network_settings.target_content_network = client.wrapper.bool(false)
  campaign.network_settings.target_partner_search_network =
      client.wrapper.bool(false)

  # Optional: Set the start date.
  campaign.start_date = client.wrapper.string(
      DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d'))

  # Optional: Set the end date.
  campaign.end_date = client.wrapper.string(
      DateTime.parse((Date.today.next_year).to_s).strftime('%Y%m%d'))

  # Create the operation.
  campaign_operation = client.operation(:Campaign)
  campaign_operation['create'] = campaign

  # Add the campaign.
  response = campaign_service.mutate_campaigns(
      customer_id, [campaign_operation])

  puts sprintf("Created campaign %s.", response.results.first.resource_name)
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
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

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
    add_campaigns(options.fetch(:customer_id).tr("-", ""))
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
