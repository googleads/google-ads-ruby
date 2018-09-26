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
# This example creates a hotel campaign, a hotel ad group, and a hotel ad group
# ad.
#
# Prerequisite: You need to have access to the Hotel Ads Center, which can be
# granted during integration with Google Hotels. The integration instructions
# can be found at:
# https://support.google.com/hotelprices/answer/6101897

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_hotel_ads(customer_id, hotel_center_account_id,
    cpc_bid_ceiling_micro_amount)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create a budget to be used by the campaign that will be created below.
  budget_resource = add_campaign_budget(client, customer_id)

  # Create a hotel campaign.
  campaign_resource = add_hotel_campaign(client, customer_id, budget_resource,
      hotel_center_account_id, cpc_bid_ceiling_micro_amount)

  # Create a hotel ad group.
  ad_group_resource = add_hotel_ad_group(client, customer_id, campaign_resource)

  # Create a hotel ad group ad.
  add_hotel_ad_group_ad(client, customer_id, ad_group_resource)
end

# Creates a new campaign budget in the specified client account.
def add_campaign_budget(client, customer_id)
  # Create the budget and set relevant fields.
  budget = client.resource(:CampaignBudget)
  budget.name = generate_random_name_field(client,
      'Interplanetary Cruise Budget')
  budget.delivery_method = client.enum(:BudgetDeliveryMethod)::STANDARD
  budget.amount_micros = client.wrapper.int64(50_000_000)

  # Create the budget operation.
  campaign_budget_operation = client.operation(:CampaignBudget)
  campaign_budget_operation['create'] = budget

  # Issue a mutate request.
  campaign_budget_service = client.service(:CampaignBudget)
  response = campaign_budget_service.mutate_campaign_budgets(customer_id,
      [campaign_budget_operation])

  # Fetch the new budget's resource name.
  budget_resource = response.results.first.resource_name

  puts sprintf('Added budget with resource name "%s".', budget_resource)

  return budget_resource
end

# Creates a new campaign in the specified client account.
def add_hotel_campaign(client, customer_id, budget_resource,
    hotel_center_account_id, cpc_bid_ceiling_micro_amount)
  # Create a campaign.
  campaign = client.resource(:Campaign)
  campaign.name = generate_random_name_field(client,
      'Interplanetary Cruise Campaign')

  # Configure settings related to hotel campaigns.
  campaign.advertising_channel_type =
      client.enum(:AdvertisingChannelType)::HOTEL
  hotel_setting_info = client.resource(:HotelSettingInfo)
  hotel_setting_info.hotel_center_id =
      client.wrapper.int64(hotel_center_account_id)
  campaign.hotel_setting = hotel_setting_info

  # Recommendation: Set the campaign to PAUSED when creating it to prevent the
  # ads from immediately serving. Set to ENABLED once you've added targeting and
  # the ads are ready to serve.
  campaign.status = client.enum(:CampaignStatus)::PAUSED

  # Set the bidding strategy to PercentCpc. Only Manual CPC and Percent CPC can
  # be used for hotel campaigns.
  campaign.percent_cpc = client.resource(:PercentCpc)
  campaign.percent_cpc.cpc_bid_ceiling_micros =
      client.wrapper.int64(cpc_bid_ceiling_micro_amount)

  # Set the budget.
  campaign.campaign_budget = client.wrapper.string(budget_resource)

  # Configures the campaign network options. Only Google Search is allowed for
  # hotel campaigns.
  network_settings = client.resource(:NetworkSettings)
  network_settings.target_google_search = client.wrapper.bool(true)
  campaign.network_settings = network_settings

  # Create a campaign operation.
  campaign_operation = client.operation(:Campaign)
  campaign_operation['create'] = campaign

  # Issue a mutate request to add the campaign.
  campaign_service = client.service(:Campaign)
  response = campaign_service.mutate_campaigns(customer_id,
      [campaign_operation])

  # Fetch the new campaign's resource name.
  campaign_resource = response.results.first.resource_name

  puts sprintf('Added hotel campaign with resource name "%s".',
      campaign_resource)

  return campaign_resource
end

# Creates a new hotel ad group in the specified campaign.
def add_hotel_ad_group(client, customer_id, campaign_resource)
  # Create an ad group.
  ad_group = client.resource(:AdGroup)
  ad_group.name = generate_random_name_field(client,
      'Earth to Mars Cruise')

  # Set the campaign.
  ad_group.campaign = client.wrapper.string(campaign_resource)

  # Optional: Set the ad group type to HOTEL_ADS.
  # This cannot be set to other types.
  ad_group.type = client.enum(:AdGroupType)::HOTEL_ADS
  ad_group.cpc_bid_micros = client.wrapper.int64(10_000_000)
  ad_group.status = client.enum(:AdGroupStatus)::ENABLED

  # Create an ad group operation.
  ad_group_operation = client.operation(:AdGroup)
  ad_group_operation['create'] = ad_group

  # Issue a mutate request to add the ad group.
  ad_group_service = client.service(:AdGroup)
  response = ad_group_service.mutate_ad_groups(customer_id,
      [ad_group_operation])

  # Fetch the new ad group's resource name.
  ad_group_resource = response.results.first.resource_name

  puts sprintf('Added hotel ad group with resource name "%s".',
      ad_group_resource)

  return ad_group_resource
end

# Creates a new hotel ad group ad in the specified ad group.
def add_hotel_ad_group_ad(client, customer_id, ad_group_resource)
  # Create a new hotel ad.
  ad = client.resource(:Ad)
  ad.hotel_ad = client.resource(:HotelAdInfo)

  # Create a new ad group ad and sets the hotel ad to it.
  ad_group_ad = client.resource(:AdGroupAd)
  ad_group_ad.ad = ad
  ad_group_ad.status = client.enum(:AdGroupAdStatus)::PAUSED

  # Set the ad group.
  ad_group_ad.ad_group = client.wrapper.string(ad_group_resource)

  # Create an ad group ad operation.
  ad_group_ad_operation = client.operation(:AdGroupAd)
  ad_group_ad_operation['create'] = ad_group_ad

  # Issue a mutate request to add the ad group ad.
  ad_group_ad_service = client.service(:AdGroupAd)
  response = ad_group_ad_service.mutate_ad_group_ads(customer_id,
      [ad_group_ad_operation])

  # Fetch the new ad group ad's resource name.
  ad_group_ad_resource = response.results.first.resource_name

  puts sprintf('Added hotel ad group ad with resource name "%s".',
      ad_group_ad_resource)
end

# Appends a random number to the provided description text and returns it as a
# string-wrapped value
def generate_random_name_field(client, text)
  random_number = (Time.new.to_f * 100).to_i
  formatted_name = sprintf('%s #%s', text, random_number)
  client.wrapper.string(formatted_name)
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
  options[:hotel_center_account_id] = 'INSERT_HOTEL_CENTER_ACCOUNT_ID_HERE'
  options[:cpc_bid_ceiling_micro_amount] = 20_000_000

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))
    opts.separator ''
    opts.separator 'Options:'
    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-H', '--hotel-center-account-id HOTEL-CENTER-ACCOUNT-ID', Integer,
        'Hotel Center Account ID') do |v|
      options[:hotel_center_account_id] = v
    end

    opts.on('-B', '--cpc-bid-ceiling-micro-amount CPC-BID-CEILING-MICRO_AMOUNT',
        Integer, 'CPC Bid Ceiling Micro Amount') do |v|
      options[:cpc_bid_ceiling_micro_amount] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_hotel_ads(options[:customer_id], options[:hotel_center_account_id],
        options[:cpc_bid_ceiling_micro_amount])
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
