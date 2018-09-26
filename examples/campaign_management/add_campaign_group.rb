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
# This example adds a campaign group and then adds campaigns to the group.
# To get campaigns, run get_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'

def add_campaign_group(client, customer_id)
  # Create campaign group Service
  campaign_group_service = client.service(:CampaignGroup)

  # Create a campaign group and set its name.
  campaign_group = client.resource(:CampaignGroup)
  campaign_group.name = client.wrapper.string(
      sprintf("Mars campaign group #%s", (Time.new.to_f * 1000).to_i))

  # Create the operation.
  campaign_group_operation = client.operation(:CampaignGroup)
  campaign_group_operation['create'] = campaign_group

  # Add the campaign group.
  response = campaign_group_service.mutate_campaign_groups(
      customer_id, [campaign_group_operation])

  campaign_group_resource_name = response.results.first.resource_name

  puts sprintf('Added campaign group with resource name: %s',
      campaign_group_resource_name)

  campaign_group_resource_name
end

def add_campaigns_to_group(client, customer_id, campaign_group_resource_name,
    campaign_ids)
  # Create campaign group Service
  campaign_service = client.service(:Campaign)

  campaign_operations = []

  # Create a Campaign Resource and related Update Operation for each ID
  campaign_ids.each do |campaign_id|
    # Create a campaign group and set its name.
    campaign = client.resource(:Campaign)
    campaign.resource_name = client.path.campaign(customer_id, campaign_id)

    # Create an update mask for the changes in the Campaign
    mask = client.field_mask.with campaign do
      campaign.campaign_group =
          client.wrapper.string(campaign_group_resource_name)
    end

    # Create the operation.
    operation = {
      update: campaign,
      update_mask: mask
    }

    campaign_operations << operation
  end

  # Add the campaign group.
  response = campaign_service.mutate_campaigns(customer_id, campaign_operations)

  puts sprintf("Added %d campaigns to campaign group with resource name %s:",
      response.results.length, campaign_group_resource_name)

  response.results.each do |updated_campaign|
    puts sprintf("\t%s", updated_campaign.resource_name)
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
  options[:campaign_ids] = []

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_ids] << v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
    client = Google::Ads::GoogleAds::GoogleAdsClient.new

    campaign_group_resource_name =
        add_campaign_group(client, options[:customer_id])

    add_campaigns_to_group(client, options[:customer_id],
        campaign_group_resource_name, options[:campaign_ids])
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
