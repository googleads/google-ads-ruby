#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2023 Google LLC
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
# This example creates a Things to Do campaign, an ad group and a Things to Do
# ad.
#
# Prerequisite: You need to have an access to the Things to Do Center. The
# integration instructions can be found at:
# https://support.google.com/google-ads/answer/13387362

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_things_to_do_ad(customer_id, things_to_do_center_account_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a budget to be used by the campaign that will be created below.
  budget_resource = add_campaign_budget(client, customer_id)

  # Creates a Things to Do campaign.
  campaign_resource = add_things_to_do_campaign(client, customer_id,
    budget_resource, things_to_do_center_account_id)

  # Create an ad group.
  ad_group_resource = add_ad_group(client, customer_id, campaign_resource)

  # Create an ad group ad.
  add_ad_group_ad(client, customer_id, ad_group_resource)
end


# Creates a new campaign budget in the specified client account.
def add_campaign_budget(client, customer_id)
  # Create the budget and set relevant fields.
  campaign_budget_operation = client.operation.create_resource.campaign_budget do |cb|
    cb.name = generate_random_name_field("Interplanetary Cruise Budget")
    cb.delivery_method = :STANDARD
    cb.amount_micros = 50_000_000
    # Makes the budget explicitly shared. You cannot set it to `false` for
    # Things to Do campaigns.
    cb.explicitly_shared = true
  end

  # Issue a mutate request.
  campaign_budget_service = client.service.campaign_budget
  response = campaign_budget_service.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [campaign_budget_operation],
  )

  # Fetch the new budget's resource name.
  budget_resource = response.results.first.resource_name

  puts "Added budget with resource name '#{budget_resource}'."

  budget_resource
end


# Creates a new Things to Do campaign in the specified customer account.
# [START add_things_to_do_ad]
def add_things_to_do_campaign(client, customer_id, budget_resource,
  things_to_do_center_account_id)

  # [START add_things_to_do_ad_1]
  # Create a campaign.
  campaign_operation = client.operation.create_resource.campaign do |c|
    c.name = generate_random_name_field("Interplanetary Cruise Campaign")

    #  Configures settings related to Things to Do campaigns including
    # advertising channel type, advertising channel sub type and
    # travel campaign settings.
    c.advertising_channel_type = :TRAVEL
    c.advertising_channel_sub_type = :TRAVEL_ACTIVITIES

    c.travel_campaign_settings = client.resource.travel_campaign_settings do |tcs|
      tcs.travel_account_id = things_to_do_center_account_id
    end

    # Recommendation: Set the campaign to PAUSED when creating it to prevent the
    # ads from immediately serving. Set to ENABLED once you've added targeting
    # and the ads are ready to serve.
    c.status = :PAUSED

    # Sets the bidding strategy to MaximizeConversionValue. Only this type can
    # be used for Things to Do campaigns.
    c.maximize_conversion_value = client.resource.maximize_conversion_value

    # Set the budget.
    c.campaign_budget = budget_resource

    # Configures the campaign network options. Only Google Search is allowed for
    # Things to Do campaigns.
    c.network_settings = client.resource.network_settings do |ns|
      ns.target_google_search = true
    end
  end
  # [END add_things_to_do_ad_1]

  # Issue a mutate request to add the campaign.
  campaign_service = client.service.campaign
  response = campaign_service.mutate_campaigns(
    customer_id: customer_id,
    operations: [campaign_operation],
  )

  # Fetch the new campaign's resource name.
  campaign_resource = response.results.first.resource_name

  puts "Added Things To Do campaign with resource name '#{campaign_resource}'."

  campaign_resource
end
# [END add_things_to_do_ad]


# Creates a new ad group in the specified Things to Do campaign.
# [START add_things_to_do_ad_2]
def add_ad_group(client, customer_id, campaign_resource)
  # Create an ad group.
  ad_group_operation = client.operation.create_resource.ad_group do |ag|
    ag.name = generate_random_name_field("Earth to Mars Cruise")

    # Set the campaign.
    ag.campaign = campaign_resource

    # Set the ad group type to TRAVEL_ADS.
    # This cannot be set to other types.
    ag.type = :TRAVEL_ADS
    ag.status = :ENABLED
  end

  # Issue a mutate request to add the ad group.
  ad_group_service = client.service.ad_group
  response = ad_group_service.mutate_ad_groups(
    customer_id: customer_id,
    operations: [ad_group_operation]
  )

  # Fetch the new ad group's resource name.
  ad_group_resource = response.results.first.resource_name

  puts "Added an ad group with resource name '#{ad_group_resource}'."

  ad_group_resource
end
# [END add_things_to_do_ad_2]

# Creates a new ad group ad in the specified ad group
# [START add_things_to_do_ad_3]
def add_ad_group_ad(client, customer_id, ad_group_resource)
  # Creates a new ad group ad and sets a travel ad info.
  ad_group_ad_operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad = client.resource.ad do |ad|
      ad.travel_ad = client.resource.travel_ad_info
    end
    # Set the ad group ad to enabled. Setting this to paused will cause an error
    # for Things to Do campaigns. Pausing should happen at either the ad group
    # or campaign level.
    aga.status = :ENABLED

    # Set the ad group.
    aga.ad_group = ad_group_resource
  end

  # Issue a mutate request to add the ad group ad.
  ad_group_ad_service = client.service.ad_group_ad
  response = ad_group_ad_service.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [ad_group_ad_operation],
  )

  # Fetch the new ad group ad's resource name.
  ad_group_ad_resource = response.results.first.resource_name

  puts "Added an ad group ad with resource name '#{ad_group_ad_resource}'."
end
# [END add_things_to_do_ad_3]


# Appends a random number to the provided description text and returns it as a
# string-wrapped value
def generate_random_name_field(text)
  "#{text} ##{(Time.new.to_f * 100).to_i}"
end


if __FILE__ == $0
  options = {}

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-T', '--things-to-do-center-account-id THINGS-TO-DO-CENTER-ACCOUNT-ID',
      Integer, 'Things to Do Account ID') do |v|
      options[:things_to_do_center_account_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_things_to_do_ad(options.fetch(:customer_id).tr("-", ""), options.fetch(:things_to_do_center_account_id))
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
