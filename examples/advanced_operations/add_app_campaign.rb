#!/usr/bin/env ruby

#
# Copyright 2020 Google LLC
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
# This example adds an App campaign.
#
# For guidance regarding App Campaigns, see:
# https://developers.google.com/google-ads/api/docs/app-campaigns/overview
#
# To get campaigns, run basic_operations/get_campaigns.rb.
# To upload image assets for this campaign, run misc/upload_image_asset.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_app_campaign(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates the budget for the campaign.
  budget_resource_name = create_budget(client, customer_id)

  # Creates the campaign.
  campaign_resource_name = create_campaign(client, customer_id, budget_resource_name)

  # Creates campaign targeting.
  create_campaign_targeting_criteria(client, customer_id, campaign_resource_name)

  # Creates an Ad Group.
  ad_group_resource_name = create_ad_group(client, customer_id, campaign_resource_name)

  # Creates an App Ad.
  create_app_ad(client, customer_id, ad_group_resource_name)
end

def create_budget(client, customer_id)
  # Creates a campaign budget.
  campaign_budget = client.resource.campaign_budget do |b|
    b.name = "Interplanetary Cruise #{(Time.now.to_f * 1000).to_i}"
    b.amount_micros = 50_000_000
    b.delivery_method = :STANDARD
    # An App campaign cannot use a shared campaign budget.
    # explicitly_shared must be set to false.
    b.explicitly_shared = false
  end

  # Submits the campaign budget operation to add the campaign budget.
  operation = client.operation.create_resource.campaign_budget(campaign_budget)
  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation]
  )
  puts "Created campaign budget: #{response.results.first.resource_name}"
  response.results.first.resource_name
end

def create_campaign(client, customer_id, budget_resource_name)
  campaign = client.resource.campaign do |c|
    c.name = "Interplanetary Cruise App #{(Time.now.to_f * 1000).to_i}"
    c.campaign_budget = budget_resource_name

    # Recommendation: Set the campaign to PAUSED when creating it to
    # prevent the ads from immediately serving. Set to ENABLED once you've
    # added targeting and the ads are ready to serve.
    c.status = :PAUSED

    # All App campaigns have an advertising_channel_type of
    # MULTI_CHANNEL to reflect the fact that ads from these campaigns are
    # eligible to appear on multiple channels.
    c.advertising_channel_type = :MULTI_CHANNEL
    c.advertising_channel_sub_type = :APP_CAMPAIGN

    # Sets the target CPA to $1 / app install.
    #
    # campaign_bidding_strategy is a 'oneof' message so setting target_cpa
    # is mutually exclusive with other bidding strategies such as
    # manual_cpc, commission, maximize_conversions, etc.
    # See https://developers.google.com/google-ads/api/reference/rpc
    # under current version / resources / Campaign
    c.target_cpa = client.resource.target_cpa do |tcpa|
      tcpa.target_cpa_micros = 1_000_000
    end

    # Sets the App Campaign Settings.
    c.app_campaign_setting = client.resource.app_campaign_setting do |acs|
      acs.app_id = 'com.google.android.apps.adwords'
      acs.app_store = :GOOGLE_APP_STORE
      # Optimize this campaign for getting new users for your app.
      acs.bidding_strategy_goal_type = :OPTIMIZE_INSTALLS_TARGET_INSTALL_COST
    end

    # Declare whether or not this campaign serves political ads targeting the EU.
    # Valid values are CONTAINS_EU_POLITICAL_ADVERTISING and
    # DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING.
    c.contains_eu_political_advertising = :DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING

    # Optional fields
    c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
    c.end_date = DateTime.parse(Date.today.next_year.to_s).strftime('%Y%m%d')
  end

  operation = client.operation.create_resource.campaign(campaign)
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation]
  )
  puts "Created campaign: #{response.results.first.resource_name}"
  response.results.first.resource_name
end

def create_campaign_targeting_criteria(client, customer_id, campaign_resource_name)
  # Besides using location_id, you can also search by location names from
  # GeoTargetConstantService.suggest_geo_target_constants() and directly
  # apply GeoTargetConstant.resource_name here. An example can be found
  # in targeting/get_geo_target_constant_by_names.rb.
  location_ops = [
    '21137', # California
    '2484', # Mexico
  ].map do |location_id|
    client.operation.create_resource.campaign_criterion do |cc|
      cc.campaign = campaign_resource_name
      cc.location = client.resource.location_info do |li|
        li.geo_target_constant = client.path.geo_target_constant(location_id)
      end
    end
  end

  # Creates the language campaign criteria.
  language_ops = [
    '1000', # English
    '1003', # Spanish
  ].map do |language_id|
    client.operation.create_resource.campaign_criterion do |cc|
      cc.campaign = campaign_resource_name
      cc.language = client.resource.language_info do |li|
        li.language_constant = client.path.language_constant(language_id)
      end
    end
  end

  operations = location_ops + language_ops

  # Submits the criteria operations.
  criteria_service = client.service.campaign_criterion
  response = criteria_service.mutate_campaign_criteria(
    customer_id: customer_id,
    operations: operations
  )
  response.results.each do |resource|
    puts "Created campaign criterion: #{resource.resource_name}"
  end
end

def create_ad_group(client, customer_id, campaign_resource_name)
  ad_group = client.resource.ad_group do |ag|
    ag.name = "Earth to Mars Cruises #{(Time.now.to_f * 1000).to_i}"
    ag.status = :ENABLED
    ag.campaign = campaign_resource_name
  end

  operation = client.operation.create_resource.ad_group(ad_group)
  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation]
  )

  puts "Created ad group: #{response.results.first.resource_name}"
  response.results.first.resource_name
end

def create_app_ad(client, customer_id, ad_group_resource_name)
  # Creates the ad group ad.
  ad_group_ad = client.resource.ad_group_ad do |aga|
    aga.status = :ENABLED
    aga.ad_group = ad_group_resource_name
    # ad_data is a 'oneof' message so setting app_ad
    # is mutually exclusive with ad data fields such as
    # text_ad, gmail_ad, etc.
    aga.ad = client.resource.ad do |ad|
      ad.app_ad = client.resource.app_ad_info do |info|
        info.headlines << client.resource.ad_text_asset do |ata|
          ata.text = 'A cool puzzle game'
        end
        info.headlines << client.resource.ad_text_asset do |ata|
          ata.text = 'Remove connected blocks'
        end
        info.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = '3 difficulty levels'
        end
        info.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = '4 colorful fun skins'
        end
        # Optional: You can set up to 20 image assets for your campaign.
        # info.images << client.resource.ad_image_asset do |aia|
        #   ala = "[INSERT_AD_IMAGE_RESOURCE_NAME(s)_HERE]"
        # end
      end
    end
  end

  operation = client.operation.create_resource.ad_group_ad(ad_group_ad)
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation]
  )
  puts "Created ad group ad: #{response.results.first.resource_name}"
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
    opts.banner = sprintf('Usage: add_app_campaigns.rb [options]')

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
    add_app_campaign(options.fetch(:customer_id).tr('-', ''))
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      error.location&.field_path_elements&.each do |field_path_element|
        STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED

        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
