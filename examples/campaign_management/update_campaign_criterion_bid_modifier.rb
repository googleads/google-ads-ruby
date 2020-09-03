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
# This example demonstrates how to update a campaign criterion with a new bid
# modifier.

require 'optparse'
require 'google/ads/google_ads'

def update_campaign_criterion_bid_modifier(
    customer_id,
    campaign_id,
    criterion_id,
    bid_modifier
  )
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create the resource name.
  resource_name = client.path.campaign_criterion(
    customer_id,
    campaign_id,
    criterion_id
  )

  operation = client.operation.update_resource.campaign_criterion(resource_name) do |campaign_criterion|
    # Sets the Bid Modifier.
    campaign_criterion.bid_modifier = bid_modifier
  end

  # Create campaign criterion Service
  criteria_service = client.service.campaign_criterion

  # Update the Campaign Bid Modifier
  response = criteria_service.mutate_campaign_criteria(
    customer_id: customer_id,
    operations: [operation]
  )

  puts "Updated #{response.results.size} campaign criterion bid modifiers:"
  response.results.each do |criteria_service|
    puts "\t#{criteria_service.resource_name}"
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
  options[:criterion_id] = 'INSERT_CRITERION_ID_HERE'
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

    opts.on('-r', '--criterion-id CRITERION-ID', String, 'Criterion ID') do |v|
      options[:criterion_id] = v
    end

    opts.on('-B', '--bid-modifier-value BID-MODIFIER-VALUE', String,
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
    update_campaign_criterion_bid_modifier(
      options.fetch(:customer_id).tr("-", ""),
      options[:campaign_id],
      options[:criterion_id],
      options[:bid_modifier]
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
