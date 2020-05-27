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
# This example creates a keyword plan, which can be reused for retrieving
# forecase metrics and historic metrics.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_keyword_plan(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  keyword_plan = create_keyword_plan(client, customer_id)
  plan_campaign = create_keyword_plan_campaign(
    client,
    customer_id,
    keyword_plan,
  )
  plan_ad_group = create_keyword_plan_ad_group(
    client,
    customer_id,
    plan_campaign,
  )
  create_keyword_plan_keywords(client, customer_id, plan_ad_group)
  create_keyword_plan_negative_keywords(client, customer_id, plan_campaign)
end

def create_keyword_plan(client, customer_id)
  operation = client.operation.create_resource.keyword_plan do |kp|
    kp.name = "Keyword plan for traffic estimate ##{(Time.new.to_f * 1000).to_i}"
    kp.forecast_period = client.resource.keyword_plan_forecast_period do |fp|
      fp.date_interval = :NEXT_QUARTER
    end
  end

  keyword_plan_service = client.service.keyword_plan
  response = keyword_plan_service.mutate_keyword_plans(
    customer_id: customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Created keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_campaign(client, customer_id, keyword_plan)
  operation = client.operation.create_resource.keyword_plan_campaign do |kpc|
    kpc.name = "Keyword plan campaign ##{(Time.new.to_f * 1000).to_i}"
    kpc.cpc_bid_micros = 1_000_000
    kpc.keyword_plan_network = :GOOGLE_SEARCH
    kpc.keyword_plan = keyword_plan

    kpc.geo_targets << client.resource.keyword_plan_geo_target do |gt|
      gt.geo_target_constant = client.path.geo_target_constant(2840) # US
    end

    kpc.language_constants << client.path.language_constant(1000) # English
  end

  kp_campaign_service_client = client.service.keyword_plan_campaign
  response = kp_campaign_service_client.mutate_keyword_plan_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Created campaign for keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_ad_group(client, customer_id, plan_campaign)
  operation = client.operation.create_resource.keyword_plan_ad_group do |kpag|
    kpag.name = "Keyword plan ad group ##{(Time.new.to_f * 1000).to_i}"
    kpag.cpc_bid_micros = 2_500_000
    kpag.keyword_plan_campaign = plan_campaign
  end

  kp_ad_group_service = client.service.keyword_plan_ad_group
  response = kp_ad_group_service.mutate_keyword_plan_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Created ad group for keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_keywords(client, customer_id, plan_ad_group)
  kp_keyword1 = client.resource.keyword_plan_keyword do |kpk|
    kpk.text = "mars cruise"
    kpk.cpc_bid_micros = 2_000_000
    kpk.match_type = :BROAD
    kpk.keyword_plan_ad_group = plan_ad_group
  end

  kp_keyword2 = client.resource.keyword_plan_keyword do |kpk|
    kpk.text = "cheap cruise"
    kpk.cpc_bid_micros = 1_500_000
    kpk.match_type = :PHRASE
    kpk.keyword_plan_ad_group = plan_ad_group
  end

  kp_keyword3 = client.resource.keyword_plan_keyword do |kpk|
    kpk.text = "jupiter cruise"
    kpk.cpc_bid_micros = 1_990_000
    kpk.match_type = :EXACT
    kpk.keyword_plan_ad_group = plan_ad_group
  end

  operations = [kp_keyword1, kp_keyword2, kp_keyword3].map do |keyword|
    client.operation.create_resource.keyword_plan_keyword(keyword)
  end

  kp_keyword_service = client.service.keyword_plan_keyword
  response = kp_keyword_service.mutate_keyword_plan_keywords(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Created keyword for keyword plan: #{result.resource_name}"
  end
end

def create_keyword_plan_negative_keywords(client, customer_id, plan_campaign)
  operation = client.operation.create_resource.keyword_plan_negative_keyword do |kpnk|
    kpnk.text = "moon walk"
    kpnk.match_type = :BROAD
    kpnk.keyword_plan_campaign = plan_campaign
  end

  kp_negative_keyword_service = client.service.keyword_plan_negative_keyword
  response = kp_negative_keyword_service.mutate_keyword_plan_negative_keywords(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created negative keyword for keyword plan: " +
      "#{response.results.first.resource_name}"
end

if __FILE__ == $0
  PAGE_SIZE = 1000

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
    add_keyword_plan(options.fetch(:customer_id).tr("-", ""))
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
