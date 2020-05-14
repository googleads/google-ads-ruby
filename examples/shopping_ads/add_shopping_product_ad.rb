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
# This account must be linked to your Google Ads account.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_shopping_product_ad(
    customer_id, merchant_center_id, create_default_listing_group)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_name = add_campaign_budget(client, customer_id)

  campaign_name = add_standard_shopping_campaign(
    client,
    customer_id,
    budget_name,
    merchant_center_id,
  )

  ad_group_name = add_shopping_product_ad_group(
    client,
    customer_id,
    campaign_name,
  )

  add_shopping_product_ad_group_ad(client, customer_id, ad_group_name)

  if create_default_listing_group
    # The default listing group will be for 'All products' and will contain
    # a single biddable unit node.
    add_default_shopping_listing_group(client, customer_id, ad_group_name)
  end
end

def add_campaign_budget(client, customer_id)

  operation = client.operation.create_resource.campaign_budget do |budget|
    budget.name = "Interplanetary Budget ##{(Time.new.to_f * 1000).to_i}"
    budget.delivery_method = :STANDARD
    budget.amount_micros = 500_000
  end

  service = client.service.campaign_budget
  response = service.mutate_campaign_budgets(customer_id, [operation])

  budget_name = response.results.first.resource_name

  puts "Added a budget with resource name: #{budget_name}"

  budget_name
end

def add_standard_shopping_campaign(
    client, customer_id, budget_name, merchant_center_id)

  operation = client.operation.create_resource.campaign do |campaign|
    campaign.name = "Interplanetary Cruise Campaign ##{(Time.new.to_f * 1000).to_i}"

    # Shopping campaign specific settings
    campaign.advertising_channel_type = :SHOPPING

    campaign.shopping_setting = client.resource.shopping_setting do |shopping_setting|
      shopping_setting.merchant_id = merchant_center_id
      shopping_setting.sales_country = "US"
      shopping_setting.campaign_priority = 0
      shopping_setting.enable_local = true
    end

    campaign.status = :PAUSED

    campaign.manual_cpc = client.resource.manual_cpc do |manual_cpc|
      manual_cpc.enhanced_cpc_enabled = true
    end

    campaign.campaign_budget = budget_name
  end

  service = client.service.campaign
  response = service.mutate_campaigns(customer_id, [operation])

  campaign_name = response.results.first.resource_name

  puts "Added a standard shopping campaign with resource name #{campaign_name}."

  campaign_name
end

def add_shopping_product_ad_group(client, customer_id, campaign_name)
  operation = client.operation.create_resource.ad_group do |ad_group|
    ad_group.name = "Earth to Mars cruise ##{(Time.new.to_f * 1000).to_i}"
    ad_group.status = :ENABLED
    ad_group.campaign = campaign_name
    ad_group.type = :SHOPPING_PRODUCT_ADS
    ad_group.cpc_bid_micros = 10_000_000
  end

  service = client.service.ad_group
  response = service.mutate_ad_groups(customer_id, [operation])

  ad_group_name = response.results.first.resource_name

  puts "Added a product shopping ad group with resource name #{ad_group_name}."

  ad_group_name
end

def add_shopping_product_ad_group_ad(client, customer_id, ad_group_name)

  operation = client.operation.create_resource.ad_group_ad do |ad_group_ad|
    ad_group_ad.ad_group = ad_group_name
    ad_group_ad.status = :PAUSED
    ad_group_ad.ad = client.resource.ad do |ad|
      ad.shopping_product_ad = client.resource.shopping_product_ad_info
    end
  end

  service = client.service.ad_group_ad
  response = service.mutate_ad_group_ads(customer_id, [operation])

  puts "Created shopping product ad group ad " \
       "#{response.results.first.resource_name}"
end

def add_default_shopping_listing_group(client, customer_id, ad_group_name)

  operation = client.operation.create_resource.ad_group_criterion do |criterion|
    criterion.ad_group = ad_group_name
    criterion.status = :ENABLED
    criterion.listing_group = client.resource.listing_group_info do |lgi|
      lgi.type = :UNIT
    end

    criterion.cpc_bid_micros = 500_000
  end

  service = client.service.ad_group_criterion
  response = service.mutate_ad_group_criteria(customer_id, [operation])

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

    opts.on('-M', '--merchant-center-id MERCHANT-CENTER-ID', Integer,
        'Merchant Center ID') do |v|
      options[:merchant_center_id] = v
    end

    opts.on('-d', '--create-default-listing-group CREATE-DEFAULT-LISTING-GROUP',
        String, 'Create Default Listing Group') do |v|
      options[:create_default_listing_group] = true if v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_shopping_product_ad(
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
    raise
  end
end
