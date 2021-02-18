#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This example creates a standard shopping product campaign, ad group, and ad.
#
# Prerequisite: You need to have access to a Merchant Center account. You can
# find instructions to create a Merchant Center account here:
# https://support.google.com/merchants/answer/188924
#
# This example creates a Smart Shopping campaign, a Smart Shopping ad group,
# a Smart Shopping ad group ad and a listing group for "All products".
#
# Prerequisites
# - You need to have access to a Merchant Center account. You can find instructions
# to create a Merchant Center account here: https://support.google.com/merchants/answer/188924.
# This account must be linked to your Google Ads account. The integration instructions can be
# found at: https://developers.google.com/adwords/shopping/full-automation/articles/t15.
# - You need your Google Ads account to track conversions. The different ways to track conversions
# can be found here: https://support.google.com/google-ads/answer/1722054.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_shopping_smart_ad(
    customer_id, merchant_center_id, create_default_listing_group)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_name = add_campaign_budget(client, customer_id)

  campaign_name = add_smart_shopping_campaign(
    client,
    customer_id,
    budget_name,
    merchant_center_id,
  )

  ad_group_name = add_smart_shopping_ad_group(
    client,
    customer_id,
    campaign_name,
  )

  add_smart_shopping_ad_group_ad(client, customer_id, ad_group_name)

  if create_default_listing_group
    # A product group is a subset of inventory. Listing groups are the equivalent
    # of product groups in the API and allow you to bid on the chosen group or
    # exclude a group from bidding.
    # This method creates an ad group criterion containing a listing group.
    add_default_shopping_listing_group(client, customer_id, ad_group_name)
  end
end

def add_campaign_budget(client, customer_id)
  operation = client.operation.create_resource.campaign_budget do |budget|
    budget.name = "Interplanetary Budget ##{(Time.new.to_f * 1000).to_i}"
    budget.delivery_method = :STANDARD
    budget.amount_micros = 500_000
    # Budgets for Smart Shopping campaigns cannot be shared.
    budget.explicitly_shared = false
  end

  service = client.service.campaign_budget
  response = service.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )

  budget_name = response.results.first.resource_name

  puts "Added a budget with resource name: #{budget_name}"

  budget_name
end

# [START add_shopping_smart_ad_2]
def add_smart_shopping_campaign(
    client, customer_id, budget_name, merchant_center_id)

  operation = client.operation.create_resource.campaign do |campaign|
    campaign.name = "Interplanetary Cruise Campaign ##{(Time.new.to_f * 1000).to_i}"

    # Configures settings related to shopping campaigns including
    # advertising channel type, advertising sub-type and shopping setting.
    campaign.advertising_channel_type = :SHOPPING
    campaign.advertising_channel_sub_type = :SHOPPING_SMART_ADS
    campaign.shopping_setting = client.resource.shopping_setting do |shopping_setting|
      shopping_setting.merchant_id = merchant_center_id
      # Sets the sales country of products to include in the campaign.
      # Only products from Merchant Center targeting this country will appear in the
      # campaign.
      shopping_setting.sales_country = "US"
    end

    # Recommendation: Set the campaign to PAUSED when creating it to prevent
    # the ads from immediately serving. Set to ENABLED once you've added
    # targeting and the ads are ready to serve.
    campaign.status = :PAUSED

    # Bidding strategy must be set directly on the campaign.
    # Setting a portfolio bidding strategy by resource name is not supported.
    # Maximize conversion value is the only strategy supported for Smart Shopping
    # campaigns.
    # An optional ROAS (Return on Advertising Spend) can be set for
    # MaximizeConversionValue.
    # The ROAS value must be specified as a ratio in the API. It is calculated by dividing
    # "total value" by "total spend".
    # For more information on maximize conversion value, see the support article:
    # http://support.google.com/google-ads/answer/7684216.
    campaign.maximize_conversion_value = client.resource.maximize_conversion_value do |m|
      m.target_roas = 3.5
    end

    campaign.campaign_budget = budget_name
  end

  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  campaign_name = response.results.first.resource_name

  puts "Added a Smart Shopping Campaign with resource name #{campaign_name}."

  campaign_name
end
# [END add_shopping_smart_ad_2]

# [START add_shopping_smart_ad_1]
def add_smart_shopping_ad_group(client, customer_id, campaign_name)
  operation = client.operation.create_resource.ad_group do |ad_group|
    ad_group.name = "Earth to Mars cruise ##{(Time.new.to_f * 1000).to_i}"
    ad_group.status = :ENABLED
    ad_group.campaign = campaign_name
    # Sets the ad group type to SHOPPING_SMART_ADS.
    # This cannot be set to other types.
    ad_group.type = :SHOPPING_SMART_ADS
  end

  service = client.service.ad_group
  response = service.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  ad_group_name = response.results.first.resource_name

  puts "Added a Smart Shopping ad group with resource name #{ad_group_name}."

  ad_group_name
end
# [END add_shopping_smart_ad_1]

# [START add_shopping_smart_ad]
def add_smart_shopping_ad_group_ad(client, customer_id, ad_group_name)

  operation = client.operation.create_resource.ad_group_ad do |ad_group_ad|
    ad_group_ad.ad_group = ad_group_name
    ad_group_ad.ad = client.resource.ad do |ad|
      ad.shopping_smart_ad = client.resource.shopping_smart_ad_info
    end
  end

  service = client.service.ad_group_ad
  response = service.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created a Smart Shopping ad group ad " \
       "#{response.results.first.resource_name}"
end
# [END add_shopping_smart_ad]

def add_default_shopping_listing_group(client, customer_id, ad_group_name)

  operation = client.operation.create_resource.ad_group_criterion do |criterion|
    criterion.ad_group = ad_group_name
    criterion.status = :ENABLED
    criterion.listing_group = client.resource.listing_group_info do |lgi|
      lgi.type = :UNIT
    end
  end

  service = client.service.ad_group_criterion
  response = service.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Added an ad group criterion containing a listing group with resource " \
       "name #{response.results.first.resource_name}."
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
  options[:merchant_center_id] = 'INSERT_MERCHANT_CENTER_ID_HERE'
  # Specifying any value for this field on the command line will override this
  # to true.
  options[:create_default_listing_group] = false

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: #{File.basename(__FILE__)} [options]")

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-M', '--merchant-center-account-id MERCHANT-CENTER-ACCOUNT-ID', Integer,
        'Merchant Center ID') do |v|
      options[:merchant_center_id] = v
    end

    opts.on('-d', '--create-default-listing-group CREATE-DEFAULT-LISTING-GROUP',
        TrueClass, 'Create Default Listing Group') do |v|
      options[:create_default_listing_group] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_shopping_smart_ad(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:merchant_center_id),
      options.fetch(:create_default_listing_group),
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
