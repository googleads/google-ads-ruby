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

def add_dynamic_search_ads(customer_id)
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
  campaign_budget = client.resource.campaign_budget do |b|
    b.name = "Interplanetary Cruise #{(Time.now.to_f * 1000).to_i}"
    b.amount_micros =  50_000_000
    b.delivery_method = :STANDARD
  end

  operation = client.operation.create_resource.campaign_budget(campaign_budget)

  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )

  puts("Created campaign budget with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_campaign(client, customer_id, budget_resource_name)
  campaign = client.resource.campaign do |c|
    c.name = "Interplanetary Cruise #{(Time.now.to_f * 1000).to_i}"

    c.advertising_channel_type = :SEARCH
    c.status = :PAUSED
    c.manual_cpc = client.resource.manual_cpc
    c.campaign_budget = budget_resource_name

    c.dynamic_search_ads_setting = client.resource.dynamic_search_ads_setting do |s|
      s.domain_name =  "example.com"
      s.language_code =  "en"
    end

    c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
    c.end_date = DateTime.parse(Date.today.next_year.to_s).strftime('%Y%m%d')
  end

  operation = client.operation.create_resource.campaign(campaign)
  require 'pry'; binding.pry

  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )
  puts("Created campaign with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_ad_group(client, customer_id, campaign_resource_name)
  ad_group = client.resource.ad_group do |ag|
    ag.type = :SEARCH_DYNAMIC_ADS
    ag.name = "Earth to Mars Cruises #{(Time.now.to_f * 1000).to_i}"

    ag.campaign =  campaign_resource_name

    ag.status = :PAUSED
    ag.tracking_url_template = "http://tracker.example.com/traveltracker/{escapedlpurl}"

    ag.cpc_bid_micros = 3_000_000
  end

  operation = client.operation.create_resource.ad_group(ad_group)

  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  puts("Created ad group with ID: #{response.results.first.resource_name}")
  response.results.first.resource_name
end

def create_expanded_dsa(client, customer_id, ad_group_resource_name)
  ad_group_ad = client.resource.ad_group_ad do |aga|
    aga.status = :PAUSED
    aga.ad = client.resource.ad do |ad|
      ad.expanded_dynamic_search_ad = client.resource.expanded_dynamic_search_ad_info do |info|
        info.description = "Buy tickets now!"
      end
    end

    aga.ad_group = ad_group_resource_name
  end

  operation = client.operation.create_resource.ad_group_ad(ad_group_ad)

  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )
  puts("Created ad group ad with ID: #{response.results.first.resource_name}")
end

def add_web_page_criteria(client, customer_id, ad_group_resource_name)
  criterion = client.resource.ad_group_criterion do |agc|
    agc.ad_group = ad_group_resource_name
    agc.cpc_bid_micros = 10_000_000

    agc.status = :PAUSED
    agc.webpage = client.resource.webpage_info do |wi|
      wi.criterion_name = "Special Offers"
    end
  end

  webpage_info_url = client.resource.webpage_condition_info do |wci|
    wci.operand = :URL
    wci.argument = "/specialoffers"
  end

  webpage_info_page_title = client.resource.webpage_condition_info do |wci|
    wci.operand = :PAGE_TITLE
    wci.argument = "Special Offer"
  end

  criterion.webpage.conditions << webpage_info_url
  criterion.webpage.conditions << webpage_info_page_title

  operation = client.operation.create_resource.ad_group_criterion(criterion)

  response = client.service.ad_group_criterion.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [operation],
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
    add_dynamic_search_ads(options.fetch(:customer_id).tr("-", ""))
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
