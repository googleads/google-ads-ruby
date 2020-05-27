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
# This example demonstrates how to add a campaign-level bid modifier
# for call interactions.

require 'optparse'
require 'google/ads/google_ads'

def add_campaign_bid_modifier(customer_id, campaign_id, bid_modifier)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operation = client.operation.create_resource.campaign_bid_modifier do |campaign_bid_modifier|
    # Sets the campaign.
    campaign_bid_modifier.campaign = client.path.campaign(customer_id, campaign_id)

    # Sets the Bid Modifier.
    campaign_bid_modifier.bid_modifier = bid_modifier

    # Sets the Interaction Type.
    campaign_bid_modifier.interaction_type = client.resource.interaction_type_info
    campaign_bid_modifier.interaction_type.type = :CALLS
  end

  # Create campaign Bid Modifier Service
  campaign_bid_modifier_service = client.service.campaign_bid_modifier
  # Add the Campaign Bid Modifier
  response = campaign_bid_modifier_service.mutate_campaign_bid_modifiers(
    customer_id: customer_id,
    operations: [operation],
  )

  puts sprintf('Added %d campaign bid modifiers:', response.results.size)
  response.results.each do |added_campaign_bid_modifier|
    puts sprintf("\t%s", added_campaign_bid_modifier.resource_name)
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:bid_modifier] = 'INSERT_BID_MODIFIER_HERE'

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

    opts.on('-B', '--bid-modifier BID-MODIFIER', String,
        'Bid Modifier') do |v|
      options[:bid_modifier] = v.to_f
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_campaign_bid_modifier(options.fetch(:customer_id).tr("-", ""),
        options[:campaign_id], options[:bid_modifier])
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
