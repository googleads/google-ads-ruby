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
    keyword_plan
  )
  plan_ad_group = create_keyword_plan_ad_group(
    client,
    customer_id,
    plan_campaign
  )
  create_keyword_plan_keywords(client, customer_id, plan_ad_group)
  create_keyword_plan_negative_keywords(client, customer_id, plan_campaign)
end

def create_keyword_plan(client, customer_id)
  keyword_plan = client.resource(:KeywordPlan)
  keyword_plan.name = client.wrapper.string(
    "Keyword plan for traffic estimate ##{(Time.new.to_f * 1000).to_i}"
  )
  forecast_period = client.resource(:KeywordPlanForecastPeriod)
  forecast_period.date_interval =
      client.enum(:KeywordPlanForecastInterval)::NEXT_QUARTER
  keyword_plan.forecast_period = forecast_period

  operation = client.operation(:KeywordPlan)
  operation['create'] = keyword_plan

  keyword_plan_service = client.service(:KeywordPlan)
  response = keyword_plan_service.mutate_keyword_plans(customer_id, [operation])

  resource_name = response.results.first.resource_name
  puts "Created keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_campaign(client, customer_id, keyword_plan)
  kp_campaign = client.resource(:KeywordPlanCampaign)
  kp_campaign.name = client.wrapper.string(
    "Keyword plan campaign ##{(Time.new.to_f * 1000).to_i}"
  )
  kp_campaign.cpc_bid_micros = client.wrapper.int64(1_000_000)
  kp_campaign.keyword_plan_network =
      client.enum(:KeywordPlanNetwork)::GOOGLE_SEARCH
  kp_campaign.keyword_plan = client.wrapper.string(keyword_plan)

  geo_target = client.resource(:KeywordPlanGeoTarget)
  geo_target.geo_target_constant = client.wrapper.string(
    client.path.geo_target_constant(2840) # US
  )
  kp_campaign.geo_targets << geo_target

  kp_campaign.language_constants << client.wrapper.string(
    client.path.language_constant(1000) # English
  )

  operation = client.operation(:KeywordPlanCampaign)
  operation['create'] = kp_campaign

  kp_campaign_service_client = client.service(:KeywordPlanCampaign)
  response = kp_campaign_service_client.mutate_keyword_plan_campaigns(
    customer_id,
    [operation]
  )

  resource_name = response.results.first.resource_name
  puts "Created campaign for keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_ad_group(client, customer_id, plan_campaign)
  kp_ad_group = client.resource(:KeywordPlanAdGroup)
  kp_ad_group.name = client.wrapper.string(
    "Keyword plan ad group ##{(Time.new.to_f * 1000).to_i}"
  )
  kp_ad_group.cpc_bid_micros = client.wrapper.int64(2_500_000)
  kp_ad_group.keyword_plan_campaign = client.wrapper.string(plan_campaign)

  operation = client.operation(:KeywordPlanAdGroup)
  operation['create'] = kp_ad_group

  kp_ad_group_service = client.service(:KeywordPlanAdGroup)
  response = kp_ad_group_service.mutate_keyword_plan_ad_groups(
    customer_id,
    [operation]
  )

  resource_name = response.results.first.resource_name
  puts "Created ad group for keyword plan: #{resource_name}"

  resource_name
end

def create_keyword_plan_keywords(client, customer_id, plan_ad_group)
  kp_keyword1 = client.resource(:KeywordPlanKeyword)
  kp_keyword1.text = client.wrapper.string('mars cruise')
  kp_keyword1.cpc_bid_micros = client.wrapper.int64(2_000_000)
  kp_keyword1.match_type = client.enum(:KeywordMatchType)::BROAD
  kp_keyword1.keyword_plan_ad_group = client.wrapper.string(plan_ad_group)

  kp_keyword2 = client.resource(:KeywordPlanKeyword)
  kp_keyword2.text = client.wrapper.string('cheap cruise')
  kp_keyword2.cpc_bid_micros = client.wrapper.int64(1_500_000)
  kp_keyword2.match_type = client.enum(:KeywordMatchType)::PHRASE
  kp_keyword2.keyword_plan_ad_group = client.wrapper.string(plan_ad_group)

  kp_keyword3 = client.resource(:KeywordPlanKeyword)
  kp_keyword3.text = client.wrapper.string('jupiter cruise')
  kp_keyword3.cpc_bid_micros = client.wrapper.int64(1_990_000)
  kp_keyword3.match_type = client.enum(:KeywordMatchType)::EXACT
  kp_keyword3.keyword_plan_ad_group = client.wrapper.string(plan_ad_group)

  operations = [kp_keyword1, kp_keyword2, kp_keyword3].map do |keyword|
    operation = client.operation(:KeywordPlanKeyword)
    operation['create'] = keyword
    operation
  end

  kp_keyword_service = client.service(:KeywordPlanKeyword)
  response = kp_keyword_service.mutate_keyword_plan_keywords(
    customer_id,
    operations
  )

  response.results.each do |result|
    puts "Created keyword for keyword plan: #{result.resource_name}"
  end
end

def create_keyword_plan_negative_keywords(client, customer_id, plan_campaign)
  kp_negative_keyword = client.resource(:KeywordPlanNegativeKeyword)
  kp_negative_keyword.text = client.wrapper.string('moon walk')
  kp_negative_keyword.match_type = client.enum(:KeywordMatchType)::BROAD
  kp_negative_keyword.keyword_plan_campaign =
      client.wrapper.string(plan_campaign)

  operation = client.operation(:KeywordPlanNegativeKeyword)
  operation['create'] = kp_negative_keyword

  kp_negative_keyword_service = client.service(:KeywordPlanNegativeKeyword)
  response = kp_negative_keyword_service.mutate_keyword_plan_negative_keywords(
    customer_id,
    [operation]
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
