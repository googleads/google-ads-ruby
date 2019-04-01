#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2019, Google Inc. All Rights Reserved.
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
# This code example adds a Dynamic Search Ads campaign. To get campaigns, run
# get_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'

def add_dynamic_search_ads_campaign(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_resource_name = create_budget(client, customer_id)
  campaign_resource_name = create_campaign(
    client,
    customer_id,
    budget_resource_name,
  )

  ad_group_resource_name = create_ad_group(
    client,
    customer_id,
    campaign_resource_name,
  )

  create_expanded_dsa(client, customer_id, ad_group_resource_name)
  add_web_page_criteria(client, customer_id, ad_group_resource_name)
end

def create_budget(client, customer_id)
  campaign_budget = client.resource(:CampaignBudget)
  campaign_budget.name = client.wrapper.string(
    "Interplanetary Cruise #{(Time.now.to_f * 1000).to_i}"
  )
  campaign_budget.amount_micros = client.wrapper.int64(
    50_000_000
  )
  campaign_budget.delivery_method = :STANDARD

  operation = client.operation(:CampaignBudget)
  operation["create"] = campaign_budget

  campaign_budget_service = client.service(:CampaignBudget)
  response = campaign_budget_service.mutate_campaign_budgets(
    customer_id,
    [operation],
  )

  puts("Created campaign budget with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_campaign(client, customer_id, budget_resource_name)
  campaign = client.resource(:Campaign)
  campaign.name = client.wrapper.string(
    "Interplanetary Cruise #{(Time.now.to_f * 1000).to_i}",
  )
  campaign.advertising_channel_type = :SEARCH
  campaign.status = :PAUSED
  campaign.manual_cpc = client.resource(:ManualCpc)
  campaign.campaign_budget = client.wrapper.string(
    budget_resource_name,
  )

  campaign.dynamic_search_ads_setting = client.resource(
    :DynamicSearchAdsSetting,
  )
  campaign.dynamic_search_ads_setting.domain_name = client.wrapper.string(
    "example.com",
  )
  campaign.dynamic_search_ads_setting.language_code = client.wrapper.string(
    "en",
  )

  campaign.start_date = client.wrapper.string(
    DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d'),
  )

  campaign.end_date = client.wrapper.string(
    DateTime.parse(Date.today.next_year.to_s).strftime('%Y%m%d'),
  )

  operation = client.operation(:Campaign)
  operation["create"] = campaign

  campaign_service = client.service(:Campaign)
  response = campaign_service.mutate_campaigns(customer_id, [operation])
  puts("Created campaign with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_ad_group(client, customer_id, campaign_resource_name)
  ad_group = client.resource(:AdGroup)
  ad_group.type = :SEARCH_DYNAMIC_ADS
  ad_group.name = client.wrapper.string(
    "Earth to Mars Cruises #{(Time.now.to_f * 1000).to_i}",
  )
  ad_group.campaign = client.wrapper.string(
    campaign_resource_name,
  )

  ad_group.status = :PAUSED
  ad_group.tracking_url_template = client.wrapper.string(
    "http://tracker.example.com/traveltracker/{escapedlpurl}",
  )
  ad_group.cpc_bid_micros = client.wrapper.int64(3_000_000)

  operation = client.operation(:AdGroup)
  operation["create"] = ad_group

  ad_group_service = client.service(:AdGroup)
  response = ad_group_service.mutate_ad_groups(customer_id, [operation])

  puts("Created ad group with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_expanded_dsa(client, customer_id, ad_group_resource_name)
  ad_group_ad = client.resource(:AdGroupAd)
  ad_group_ad.status = :PAUSED
  ad_group_ad.ad = client.resource(:Ad)
  ad_group_ad.ad.expanded_dynamic_search_ad = client.resource(
    :ExpandedDynamicSearchAdInfo,
  )
  ad_group_ad.ad.expanded_dynamic_search_ad.description = client.wrapper.string(
    "Buy tickets now!",
  )
  ad_group_ad.ad_group = client.wrapper.string(
    ad_group_resource_name,
  )

  operation = client.operation(:AdGroupAd)
  operation["create"] = ad_group_ad

  ad_group_ad_service = client.service(:AdGroupAd)
  response = ad_group_ad_service.mutate_ad_group_ads(customer_id, [operation])
  puts("Created ad group ad with ID: #{response.results.first.resource_name}")
end

def add_web_page_criteria(client, customer_id, ad_group_resource_name)
  criterion = client.resource(:AdGroupCriterion)
  criterion.ad_group = client.wrapper.string(ad_group_resource_name)
  criterion.cpc_bid_micros = client.wrapper.int64(
    10_000_000,
  )
  criterion.status = :PAUSED
  criterion.webpage = client.resource(:WebpageInfo)
  criterion.webpage.criterion_name = client.wrapper.string(
    "Special Offers"
  )

  webpage_info_url = client.resource(:WebpageConditionInfo)
  webpage_info_url.operand = :URL
  webpage_info_url.argument = client.wrapper.string("/specialoffers")

  webpage_info_page_title = client.resource(:WebpageConditionInfo)
  webpage_info_page_title.operand = :PAGE_TITLE
  webpage_info_page_title.argument = client.wrapper.string("Special Offer")

  criterion.webpage.conditions << webpage_info_url
  criterion.webpage.conditions << webpage_info_page_title

  operation = client.operation(:AdGroupCriterion)
  operation["create"] = criterion

  ad_group_criterion_service = client.service(:AdGroupCriterion)
  response = ad_group_criterion_service.mutate_ad_group_criteria(
    customer_id,
    [operation],
  )
  puts("Created ad group criterion with ID: #{response.results.first.resource_name}")
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
    opts.banner = sprintf("Usage: #{__FILE__} [options]")

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
    add_dynamic_search_ads_campaign(options.fetch(:customer_id).tr("-", ""))
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
