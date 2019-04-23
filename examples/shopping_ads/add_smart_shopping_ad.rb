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
# This example creates a Smart Shopping campaign, a Smart Shopping ad group, a Smart Shopping ad
# group ad and a listing group for "All products".

require 'optparse'
require 'google/ads/google_ads'
require 'date'


def add_smart_shopping_campaign_and_ad(
  customer_id,
  merchant_center_account_id,
  create_default_listing_group
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_resource_name = add_campaign_budget(client, customer_id)

  campaign_resource_name = add_smart_shopping_campaign(
    client,
    customer_id,
    budget_resource_name,
    merchant_center_account_id,
  )

  ad_group_resource_name = add_smart_shopping_ad_group(
    client,
    customer_id,
    campaign_resource_name,
  )

  add_smart_shopping_ad(
    client,
    customer_id,
    ad_group_resource_name,
  )

  if ceate_default_listing_group
    add_shopping_listing_group(
      client,
      customer_id,
      ad_group_resource_name
    )
  end
end

def add_campaign_budget(client, customer_id)
  budget = client.resource(:CampaignBudget)
  budget.name = client.wrapper.string("Interplanetary cruise budget #{(Time.now.to_f*1000).to_i}")
  budget.delivery_method = :STANDARD
  budget.amount_micros = client.wrapper.int64(5_000_000)
  budget.explicitly_shared = client.wrapper.bool(false)

  op = client.operation(:CampaignBudget)
  op["create"] = budget

  campaign_budget_service = client.service(:CampaignBudget)
  response = campaign_budget_service.mutate_campaign_budgets(customer_id, [op])
  budget_resource_name = response.results.first.resource_name
  puts "Created campaign budget with id: #{budget_resource_name}"

  budget_resource_name
end

def add_smart_shopping_campaign(client, customer_id, budget_resource_name, merchant_center_account_id)
  shopping_setting = client.resource(:ShoppingSetting)
  shopping_setting.sales_country = client.wrapper.string("US")
  shopping_setting.merchant_id = client.wrapper.int64(merchant_center_account_id.to_i)

  campaign = client.resource(:Campaign)
  campaign.name = client.wrapper.string("Interplanetary cruise #{(Time.now.to_f*1000).to_i}")
  campaign.advertising_channel_type = :SHOPPING
  campaign.advertising_channel_sub_type = :SHOPPING_SMART_ADS
  campaign.status = :PAUSED
  campaign.campaign_budget = client.wrapper.string(budget_resource_name)
  campaign.maximize_conversion_value = client.resource(:MaximizeConversionValue)
  campaign.maximize_conversion_value.target_roas = client.wrapper.double(3.5)
  campaign.tracking_url_template = client.wrapper.string("http://example.com/track")

  op = client.operation(:Campaign)
  op["create"] = campaign

  campaign_service = client.service(:Campaign)
  response = campaign_service.mutate_campaigns(customer_id, [op])

  puts("Created campaign with id #{response.results.first.resource_name}")

  response.results.first.resource_name
end

def add_smart_shopping_ad_group(client, customer_id, campaign_resource_name)
  ad_group = client.resource(:AdGroup)
  ad_group.name = client.wrapper.string("Earth to Mars Cruises #{(Time.now.to_f*1000).to_i}")
  ad_group.campaign = client.wrapper.string(campaign_resource_name)
  ad_group.type = :SHOPPING_SMART_ADS
  ad_group.status = :ENABLED

  op = client.operation(:AdGroup)
  op["create"] = ad_group

  ad_group_service = client.service(:AdGroup)
  response = ad_group_service.mutate_ad_groups(customer_id, [op])

  puts("Created smart shopping ad group with id #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def add_shopping_listing_group(client, customer_id, ad_group_resource_name)
  ad = client.resource(:Ad)
  ad.shopping_smart_ad = client.resource(:ShoppingSmartAdInfo)

  ad_group_ad = client.resource(:AdGroupAd)
  ad_group_ad.ad = ad
  ad_group_ad.ad_group = client.wrapper.string(ad_group_resource_name)

  op = client.operation(:AdGroupAd)
  op["create"] = ad_group_ad

  ad_group_ad_service = client.service(:AdGroupAd)
  response = ad_group_ad_service.mutate_ad_group_ads(customer_id, [op])

  puts("Created ad group ad with id #{response.results.first.resource_name}")
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
  options[:merchant_center_account_id] = 'INSERT_MERCHANT_CENTER_ACCOUNT_ID_HERE'
  options[:create_default_listing_group] = false

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: #{__FILE__} [options]")

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on(
      '-M',
      '--customer-id MERCHANT-CENTER-ACCOUNT-ID',
      String,
      'Merchant center account id'
    ) do |v|
      options[:merchant_center_account_id] = v
    end


    opts.on('-l', '--create-default-listing-group CREATE-DEFAULT-LISTING-GROUP', String, 'create default listing group') do |v|
      options[:create_default_listing_group] = if v == "true"
        true
      else
        false
      end
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_smart_shopping_campaign_and_ad(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:merchant_center_account_id),
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
