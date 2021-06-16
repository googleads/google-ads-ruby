#!/usr/bin/env ruby
# Encoding: utf-8
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
# This example adds a Local campaign.
#
# Prerequisite: To create a Local campaign, you need to define the store
# locations you want to promote by linking your Google My Business account or
# selecting affiliate locations. More information about Local campaigns can be
# found at: https://support.google.com/google-ads/answer/9118422.

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'

def add_local_campaign(customer_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_resource_name = create_campaign_budget(client, customer_id)

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

  create_local_ad(client, customer_id, ad_group_resource_name)
end

# [START add_local_campaign]
def create_campaign_budget(client, customer_id)
  # Creates a campaign budget operation.
  operation = client.operation.create_resource.campaign_budget do |cb|
    cb.name = "Interplanetary Cruise Budget ##{(Time.new.to_f * 1000).to_i}"
    cb.delivery_method = :STANDARD
    cb.amount_micros = 50_000_000
    # A Local campaign cannot use a shared campaign budget.
    cb.explicitly_shared = false
  end

  # Issues a mutate request to add campaign budget.
  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )

  budget_resource_name = response.results.first.resource_name
  puts "Created campaign budget with resource name: '#{budget_resource_name}'."

  budget_resource_name
end
# [END add_local_campaign]

# [START add_local_campaign_1]
def create_campaign(client, customer_id, budget_resource_name)
  # Creates a campaign operation.
  operation = client.operation.create_resource.campaign do |c|
    c.name = "Interplanetary Cruise Local ##{(Time.new.to_f * 1000).to_i}"
    c.campaign_budget = budget_resource_name
    # Recommendation: Set the campaign to PAUSED when creating it to prevent
    # the ads from immediately serving. Set to ENABLED once you've added
    # targeting and the ads are ready to serve.
    c.status = :PAUSED
    # All Local campaigns have an advertisingChannelType of LOCAL and
    # advertisingChannelSubType of LOCAL_CAMPAIGN.
    c.advertising_channel_type = :LOCAL
    c.advertising_channel_sub_type = :LOCAL_CAMPAIGN
    # Bidding strategy must be set directly on the campaign.
    # Setting a portfolio bidding strategy by resource name is not supported.
    # Maximize conversion value is the only strategy supported for Local
    # campaigns. An optional ROAS (Return on Advertising Spend) can be set for
    # maximize_conversion_value. The ROAS value must be specified as a ratio in
    # the API. It is calculated by dividing "total value" by "total spend".
    # For more information on maximize conversion value, see the support article:
    # http://support.google.com/google-ads/answer/7684216.
    c.maximize_conversion_value = Google::Ads::GoogleAds::V8::Common::MaximizeConversionValue.new
    c.maximize_conversion_value.target_roas = 3.5
    # Configures the Local campaign setting.
    c.local_campaign_setting = client.resource.local_campaign_setting do |lcs|
      # Use the locations associated with the customer's linked
      # Google My Business account.
      lcs.location_source_type = :GOOGLE_MY_BUSINESS
    end
    # Optimization goal setting is mandatory for Local campaigns. This example
    # selects driving directions and call clicks as goals.
    c.optimization_goal_setting = client.resource.optimization_goal_setting do |ogs|
      ogs.optimization_goal_types += [:CALL_CLICKS, :DRIVING_DIRECTIONS]
    end
  end

  # Issues a mutate request to add campaign.
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  campaign_resource_name = response.results.first.resource_name
  puts "Created Local campaign with resource name: '#{campaign_resource_name}'."

  campaign_resource_name
end
# [END add_local_campaign_1]

# [START add_local_campaign_2]
def create_ad_group(client, customer_id, campaign_resource_name)
  # Creates an ad group operation.
  # Note that the ad group type must not be set.
  # Since the advertising_channel_sub_type is LOCAL_CAMPAIGN:
  #   1. you cannot override bid settings at the ad group level.
  #   2. you cannot add ad group criteria.
  operation = client.operation.create_resource.ad_group do |ag|
    ag.name = "Earth to Mars Cruises ##{(Time.new.to_f * 1000).to_i}"
    ag.campaign = campaign_resource_name
    ag.status = :ENABLED
  end

  # Issues a mutate request to add the ad group.
  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  ad_group_resource_name = response.results.first.resource_name
  puts "Created ad group with resource name: '#{ad_group_resource_name}'."

  ad_group_resource_name
end
# [END add_local_campaign_2]

# [START add_local_campaign_3]
def create_local_ad(client, customer_id, ad_group_resource_name)
  # Creates an ad group ad operation.
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = ad_group_resource_name
    aga.status = :ENABLED
    aga.ad = client.resource.ad do |ad|
      ad.final_urls << "https://www.example.com"
      ad.local_ad = client.resource.local_ad_info do |lai|
        lai.headlines << client.resource.ad_text_asset do |ata|
          ata.text = "Best Space Cruise Line"
        end
        lai.headlines << client.resource.ad_text_asset do |ata|
          ata.text = "Experience the Stars"
        end
        lai.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = "Buy your tickets now"
        end
        lai.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = "Visit the Red Planet"
        end
        lai.call_to_actions << client.resource.ad_text_asset do |ata|
          ata.text = "Shop Now"
        end
        # Sets the marketing image and logo image assets.
        lai.marketing_images << client.resource.ad_image_asset do |aia|
          aia.asset = create_image_asset(
            client, customer_id, MARKETING_IMAGE_URL, "Marketing Image")
        end
        lai.logo_images << client.resource.ad_image_asset do |aia|
          aia.asset = create_image_asset(
            client, customer_id, LOGO_IMAGE_URL, "Square Marketing Image")
        end
        # Sets the video assets.
        lai.videos << client.resource.ad_video_asset do |aia|
          aia.asset = create_youtube_video_asset(
            client, customer_id, YOUTUBE_VIDEO_ID, "Local Campaigns")
        end
      end
    end
  end

  # Issues a mutate request to add the ad group ad.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created ad group ad with resource name: " \
    "'#{response.results.first.resource_name}'."
end
# [END add_local_campaign_3]

# [START add_local_campaign_4]
def create_image_asset(client, customer_id, image_url, image_name)
  # Creates an asset operation.
  operation = client.operation.create_resource.asset do |a|
    a.name = image_name
    a.type = :IMAGE
    a.image_asset = client.resource.image_asset do |ia|
      ia.data = open(image_url) { |f| f.read }
    end
  end

  # Issues a mutate request to add the asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out information about the newly added asset.
  asset_resource_name = response.results.first.resource_name
  puts "A new image asset has been added with resource name: " \
    "'#{asset_resource_name}'."

  asset_resource_name
end
# [END add_local_campaign_4]

# [START add_local_campaign_5]
def create_youtube_video_asset(
  client,
  customer_id,
  youtube_video_id,
  youtube_video_name
)
  # Creates an asset operation.
  operation = client.operation.create_resource.asset do |a|
    a.name = youtube_video_name
    a.type = :YOUTUBE_VIDEO
    a.youtube_video_asset = client.resource.youtube_video_asset do |yva|
      yva.youtube_video_id = youtube_video_id
    end
  end

  # Issues a mutate request to add the asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out information about the newly added asset.
  asset_resource_name = response.results.first.resource_name
  puts "A new YouTube video asset has been added with resource name: " \
    "'#{asset_resource_name}'."

  asset_resource_name
end
# [END add_local_campaign_5]

if __FILE__ == $0
  MARKETING_IMAGE_URL = 'https://goo.gl/3b9Wfh'.freeze
  LOGO_IMAGE_URL = 'https://goo.gl/mtt54n'.freeze
  YOUTUBE_VIDEO_ID = 't1fDo0VyeEo'.freeze

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
    add_local_campaign(options.fetch(:customer_id).tr("-", ""))
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
