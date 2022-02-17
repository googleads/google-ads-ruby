#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2022, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# This example adds a page feed with URLs for a Dynamic Search Ads campaign.

require 'optparse'
require 'google/ads/google_ads'

def add_dynamic_page_feed_asset(customer_id, campaign_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # The label for the DSA page URLs.
  dsa_page_url_label = "discounts"

  # Creates a list of assets.
  asset_resource_names = create_assets(client, dsa_page_url_label, customer_id)

  # Creates an AssetSet - this is a collection of assets that can be
  # associated with a campaign. Note: do not confuse this with an AssetGroup.
  # An AssetGroup replaces AdGroups in some types of campaigns.
  asset_set_resource_name = create_asset_set(client, customer_id)

  # Adds the Assets to the AssetSet.
  add_assets_to_asset_set(client, asset_resource_names, asset_set_resource_name, customer_id)

  # Links the AssetSet to the Campaign.
  link_asset_set_to_campaign(client, asset_set_resource_name, customer_id, campaign_id)

  # Optional: Targets web pages matching the feed's label in the ad group.
  add_dsa_target(client, dsa_page_url_label, customer_id, ad_group_id)

  puts "Dynamic page feed setup is complete for campaign with ID #{campaign_id}."
end

# [START add_asset]
def create_assets(client, dsa_page_url_label, customer_id)
  urls = [
    'http://www.example.com/discounts/rental-cars',
    'http://www.example.com/discounts/hotel-deals',
    'http://www.example.com/discounts/flight-deals',
  ]

  operations = urls.map do |url|
    client.operation.create_resource.asset do |asset|
      asset.page_feed_asset = client.resource.page_feed_asset do |pfa|
        # Sets the URL of the page to include.
        pfa.page_url = url
        # Recommended: adds labels to the asset. These labels can be used later
        # in ad group targeting to restrict the set of pages that can serve.
        pfa.labels << dsa_page_url_label
      end
    end
  end

  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: operations,
  )

  resource_names = []
  response.results.each do |result|
    resource_name = result.resource_name
    puts "Created asset with resource name '#{resource_name}'"
    resource_names << resource_name
  end

  resource_names
end
# [END add_asset]

# [START add_asset_set]
def create_asset_set(client, customer_id)
  # Creates an AssetSet which will be used to link the dynamic page feed assets to a campaign.
  # Creates an operation to add the AssetSet.
  operation = client.operation.create_resource.asset_set do |asset_set|
    asset_set.name = "My dynamic page feed #{Time.now}"
    asset_set.type = :PAGE_FEED
  end

  # Sends the mutate request.
  response = client.service.asset_set.mutate_asset_sets(
    customer_id: customer_id,
    operations: [operation],
  )
  # Prints some information about the response.
  resource_name = response.results.first.resource_name
  puts "Created asset set with resource name '#{resource_name}'"

  resource_name
end
# [END add_asset_set]

# [START add_asset_set_asset]
def add_assets_to_asset_set(client, asset_resource_names, asset_set_resource_name, customer_id)
  operations = asset_resource_names.map do |asset_resource_name|
    client.operation.create_resource.asset_set_asset do |asa|
      asa.asset = asset_resource_name
      asa.asset_set = asset_set_resource_name
    end
  end

  response = client.service.asset_set_asset.mutate_asset_set_assets(
    customer_id: customer_id,
    operations: operations,
  )
  resource_name = response.results.first.resource_name
  puts "Created asset set asset with resource name '#{resource_name}'"
end
# [END add_asset_set_asset]

# [START add_campaign_asset_set]
def link_asset_set_to_campaign(client, asset_set_resource_name, customer_id, campaign_id)
  # Creates a CampaignAssetSet representing the link between an AssetSet and a Campaign.
  # Creates an operation to add the CampaignAssetSet.
  operation = client.operation.create_resource.campaign_asset_set do |cas|
    cas.campaign = client.path.campaign(customer_id, campaign_id)
    cas.asset_set = asset_set_resource_name
  end

  # Issues the mutate request.
  response = client.service.campaign_asset_set.mutate_campaign_asset_sets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created a campaign asset set with resource name '#{resource_name}'"
end
# [END add_campaign_asset_set]


# [START add_dsa_target]
def add_dsa_target(client, dsa_page_url_label, customer_id, ad_group_id)
  operation = client.operation.create_resource.ad_group_criterion do |agc|
    agc.ad_group = client.path.ad_group(customer_id, ad_group_id)
    agc.cpc_bid_micros = 1_500_000

    # Creates the webpage info, or criterion for targeting webpages of an
    # advertiser's website.
    agc.webpage = client.resource.webpage_info do |webpage|
      webpage.criterion_name = "Test Criterion"
      # Creates the webpage condition info that targets an advertiser's webpages
      # based on the custom label specified by the dsaPageUrlLabel
      # (e.g. "discounts").
      webpage.conditions << client.resource.webpage_condition_info do |wci|
        wci.operand = :CUSTOM_LABEL
        wci.argument = dsa_page_url_label
      end
    end
  end

  response = client.service.ad_group_criterion.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created ad group criterion with resource name '#{resource_name}'"
end
# [END add_dsa_target]

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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String,
      'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'The campaign ID.') do |v|
      options[:campaign_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'The ad group ID.') do |v|
      options[:ad_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_dynamic_page_feed_asset(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
      options.fetch(:ad_group_id),
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
