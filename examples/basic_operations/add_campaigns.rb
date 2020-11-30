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

  # [START add_campaigns_1]
  # Create a budget, which can be shared by multiple campaigns.
  campaign_budget = client.resource.campaign_budget do |cb|
    cb.name = "Interplanetary Budget #{(Time.new.to_f * 1000).to_i}"
    cb.delivery_method = :STANDARD
    cb.amount_micros = 500000
  end

  operation = client.operation.create_resource.campaign_budget(campaign_budget)

  # Add budget.
  return_budget = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )
  # [END add_campaigns_1]

  # [START add_campaigns]
  # Create campaign.
  campaign = client.resource.campaign do |c|
    c.name = "Interplanetary Cruise #{(Time.new.to_f * 1000).to_i}"
    c.advertising_channel_type = :SEARCH

    # Recommendation: Set the campaign to PAUSED when creating it to prevent
    # the ads from immediately serving. Set to ENABLED once you've added
    # targeting and the ads are ready to serve.
    c.status = :PAUSED

    # Set the bidding strategy and budget.
    c.manual_cpc = client.resource.manual_cpc
    c.campaign_budget = return_budget.results.first.resource_name

    # Set the campaign network options.
    c.network_settings = client.resource.network_settings do |ns|
      ns.target_google_search = true
      ns.target_search_network = true
      ns.target_content_network = false
      ns.target_partner_search_network = false
    end

    # Optional: Set the start date.
    c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')

    # Optional: Set the end date.
    c.end_date = DateTime.parse((Date.today.next_year).to_s).strftime('%Y%m%d')
  end
  # [END add_campaigns]

  # Create the operation.
  campaign_operation = client.operation.create_resource.campaign(campaign)

  # Add the campaign.
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [campaign_operation],
  )

  puts "Created campaign #{response.results.first.resource_name}."
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
    raise
  end
end
