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
# This example demonstrates usage of the higher level 'factories' constructs
# within the library

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_campaigns(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  campaign_budget_operation = client.operation.create_resource.campaign_budget do |cb|
    cb.name = client.wrapper.string(
      "Interplanetary Budget #{(Time.new.to_f * 1000).to_i}",
    )

    cb.delivery_method = :STANDARD
    cb.amount_micros = client.wrapper.int64(500000)
  end

  return_budget = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id,
    [campaign_budget_operation]
  )

  campaign_budget_resource_name = return_budget.results.first.resource_name

  # Create campaign.
  campaign = client.resource.campaign
  campaign.name = client.wrapper.string(
    "Interplanetary Cruise #{(Time.new.to_f * 1000).to_i}",
  )
  campaign.advertising_channel_type = :SEARCH

  # Recommendation: Set the campaign to PAUSED when creating it to prevent
  # the ads from immediately serving. Set to ENABLED once you've added
  # targeting and the ads are ready to serve.
  campaign.status = :PAUSED

  campaign.manual_cpc = client.resource.manual_cpc
  campaign.campaign_budget = client.wrapper.string(
    campaign_budget_resource_name,
  )

  campaign.network_settings = client.resource.network_settings do |ns|
    ns.target_google_search = client.wrapper.bool(true)
    ns.target_search_network = client.wrapper.bool(true)
    ns.target_content_network = client.wrapper.bool(false)
    ns.target_partner_search_network = client.wrapper.bool(false)
  end

  # Alternate non-block style, where we pass the campaign object we built
  # up
  campaign_operation = client.operation.create_resource.campaign(campaign)
  campaign_service = client.service.campaign

  # Add the campaign.
  response = campaign_service.mutate_campaigns(
    customer_id,
    [campaign_operation],
  )
  campaign_resource_name = response.results.first.resource_name
  puts "Created campaign #{campaign_resource_name}"

  # when we fetch campaigns from the API, they have resource names populated,
  # but because we just created this one, it isn't populated, so this will
  # let us work with the campaign we just created as an updatable campaign
  campaign.resource_name = campaign_resource_name

  update_operation = client.operation.update_resource.campaign(campaign) do
    campaign.name = client.wrapper.string(
      "A different interplanetary Cruise #{(Time.new.to_f * 1000).to_i}",
    )
  end

  campaign_service.mutate_campaigns(customer_id, [update_operation])

  # Finally remove the campaign
  remove_op = client.operation.remove_resource.campaign(campaign_resource_name)
  campaign_service.mutate_campaigns(customer_id, [remove_op])

  # updates also work with only a resource name, so let's pull one out and
  # then update it
  ga_service = client.service.google_ads
  res = ga_service.search(customer_id, <<~EOQUERY)
  select campaign.resource_name, campaign.name from campaign limit 1
  EOQUERY

  campaign_resource_name = res.first.campaign.resource_name

  # note here, we have to pass the campaign (`camp`) as a block arg, because
  # we only have a resource name.
  update_operation = client.operation.update_resource.campaign(campaign_resource_name) do |camp|
    camp.name = client.wrapper.string(
      "A different interplanetary Cruise #{(Time.new.to_f * 1000).to_i}",
    )
  end

  campaign_service.mutate_campaigns(customer_id, [update_operation])
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
