#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,

# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# This example shows how to create a Demand Gen campaign with a video ad.
#
# For more information about Demand Gen campaigns, see
# https://developers.google.com/google-ads/api/docs/demand-gen/overview

require 'optparse'
require 'google/ads/google_ads'
require 'date'
require 'open-uri'

# Temporary IDs for resources.
BUDGET_TEMPORARY_ID = -1
CAMPAIGN_TEMPORARY_ID = -2
AD_GROUP_TEMPORARY_ID = -3
VIDEO_ASSET_TEMPORARY_ID = -4
LOGO_ASSET_TEMPORARY_ID = -5

# URLs for assets
DEFAULT_LOGO_IMAGE_URL = "https://gaagl.page.link/bjYi"
DEFAULT_FINAL_URL = "http://example.com"

def add_demand_gen_campaign(customer_id, video_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_resource_name = client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
  campaign_resource_name = client.path.campaign(customer_id, CAMPAIGN_TEMPORARY_ID)
  ad_group_resource_name = client.path.ad_group(customer_id, AD_GROUP_TEMPORARY_ID)
  video_asset_resource_name = client.path.asset(customer_id, VIDEO_ASSET_TEMPORARY_ID)
  logo_asset_resource_name = client.path.asset(customer_id, LOGO_ASSET_TEMPORARY_ID)

  # [START add_demand_gen_campaign_1]
  operations = []

  operations << client.operation.mutate do |m|
    m.campaign_budget_operation = create_campaign_budget_operation(client, budget_resource_name)
  end

  operations << client.operation.mutate do |m|
    m.campaign_operation = create_demand_gen_campaign_operation(client, campaign_resource_name, budget_resource_name)
  end

  operations << client.operation.mutate do |m|
    m.ad_group_operation = create_ad_group_operation(client, ad_group_resource_name, campaign_resource_name)
  end

  operations += create_asset_operations(client, video_asset_resource_name, video_id, logo_asset_resource_name).map do |asset_op|
    client.operation.mutate do |m|
      m.asset_operation = asset_op
    end
  end

  operations << client.operation.mutate do |m|
    m.ad_group_ad_operation = create_demand_gen_ad_operation(client, ad_group_resource_name, video_asset_resource_name, logo_asset_resource_name)
  end

  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: operations,
  )
  # [END add_demand_gen_campaign_1]

  puts "Created campaign with resource name '#{response.mutate_operation_responses.first.campaign_result.resource_name}'"
end

def create_campaign_budget_operation(client, budget_resource_name)
  # Creates a campaign budget.
  client.operation.create_resource.campaign_budget do |cb|
    cb.name = "Demand Gen campaign budget #{Time.now.to_f}"
    # The budget period already defaults to DAILY.
    cb.amount_micros = 50_000_000
    cb.delivery_method = :STANDARD

    # A Demand Gen campaign cannot use a shared campaign budget.
    cb.explicitly_shared = false

    # Set a temporary ID in the budget's resource name so it can be referenced
    # by the campaign in later steps.
    cb.resource_name = budget_resource_name
  end
end

# [START add_demand_gen_campaign_2]
def create_demand_gen_campaign_operation(client, campaign_resource_name, budget_resource_name)
  client.operation.create_resource.campaign do |c|
    c.name = "Demand Gen ##{Time.now.to_f}"
    
    # Recommendation: Set the campaign to PAUSED when creating it to
    # prevent the ads from immediately serving. Set to ENABLED once you've
    # added targeting and the ads are ready to serve.
    c.status = :PAUSED

    # AdvertisingChannelType must be DEMAND_GEN.
    c.advertising_channel_type = :DEMAND_GEN

    # Assign the resource name with a temporary ID.
    c.resource_name = campaign_resource_name

    # Set the budget using the given budget resource name.
    c.campaign_budget = budget_resource_name

    # Use the Target CPA bidding strategy.
    c.bidding_strategy_type = :TARGET_CPA
    c.target_cpa = client.resource.target_cpa do |tc|
      tc.target_cpa_micros = 1_000_000
    end

    # Declare whether or not this campaign serves political ads targeting the EU.
    # Valid values are CONTAINS_EU_POLITICAL_ADVERTISING and
    # DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING.
    c.contains_eu_political_advertising = :DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING

    # Optional fields
    c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
    c.end_date = DateTime.parse(Date.today.next_year.to_s).strftime('%Y%m%d')
  end
end
# [END add_demand_gen_campaign_2]

# [START add_demand_gen_campaign_3]
def create_ad_group_operation(client, ad_group_resource_name, campaign_resource_name)
  # Creates an ad group.
  client.operation.create_resource.ad_group do |ag|
    ag.resource_name = ad_group_resource_name
    ag.name = "Earth to Mars Cruises ##{Time.now.to_f}"
    ag.status = :ENABLED
    ag.campaign = campaign_resource_name

    # [START add_demand_gen_campaign_5]
    # Select the specific channels for the ad group.
    # For further information on Demand Gen channel controls, see
    # https://developers.google.com/google-ads/api/docs/demand-gen/channel-controls
    ag.demand_gen_ad_group_settings = client.resource.demand_gen_ad_group_settings do |dgas|
      dgas.channel_controls = client.resource.demand_gen_channel_controls do |dcc|
        dcc.selected_channels = client.resource.demand_gen_selected_channels do |dsc|
          dsc.gmail = false
          dsc.discover = false
          dsc.display = false
          dsc.youtube_in_feed = true
          dsc.youtube_in_stream = true
          dsc.youtube_shorts = true
        end
      end
    end
    # [END add_demand_gen_campaign_5]
  end
end
# [END add_demand_gen_campaign_3]

def create_asset_operations(client, video_asset_resource_name, video_id, logo_asset_resource_name)
  [
    create_video_asset_operation(client, video_asset_resource_name, video_id, "Video"),
    create_image_asset_operation(client, logo_asset_resource_name, DEFAULT_LOGO_IMAGE_URL, "Square Marketing Image"),
  ]
end

# [START add_demand_gen_campaign_4]
def create_demand_gen_ad_operation(client, ad_group_resource_name, video_asset_resource_name, logo_asset_resource_name)
  client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = ad_group_resource_name
    aga.status = :ENABLED
    aga.ad = client.resource.ad do |ad|
      ad.name = "Demand gen video responsive ad"
      ad.final_urls << DEFAULT_FINAL_URL
      ad.demand_gen_video_responsive_ad = client.resource.demand_gen_video_responsive_ad_info do |dgv|
        dgv.business_name = client.resource.ad_text_asset do |ata|
          ata.text = "Interplanetary Cruises"
        end
        dgv.videos << client.resource.ad_video_asset do |ava|
          ava.asset = video_asset_resource_name
        end
        dgv.logo_images << client.resource.ad_image_asset do |aia|
          aia.asset = logo_asset_resource_name
        end
        dgv.headlines << client.resource.ad_text_asset do |ata|
          ata.text = "Interplanetary cruises"
        end
        dgv.long_headlines << client.resource.ad_text_asset do |ata|
          ata.text = "Travel the World"
        end
        dgv.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = "Book now for an extra discount"
        end
      end
    end
  end
end
# [END add_demand_gen_campaign_4]

def create_image_asset_operation(client, asset_resource_name, url, asset_name)
  client.operation.create_resource.asset do |a|
    a.resource_name = asset_resource_name
    a.name = asset_name
    a.type = :IMAGE
    a.image_asset = client.resource.image_asset do |ia|
      ia.data = URI.open(url) { |f| f.read }
    end
  end
end

def create_video_asset_operation(client, asset_resource_name, video_id, asset_name)
  client.operation.create_resource.asset do |a|
    a.resource_name = asset_resource_name
    a.name = asset_name
    a.type = :YOUTUBE_VIDEO
    a.youtube_video_asset = client.resource.youtube_video_asset do |yva|
      yva.youtube_video_id = video_id
    end
  end
end

if __FILE__ == $0
  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify them here or provide them as positional arguments when
  # running the code.
  #
  # e.g. ruby add_demand_gen_campaign.rb -C YOUR_CUSTOMER_ID -V YOUR_VIDEO_ID
  OptionParser.new do |opts|
    opts.banner = "Usage: add_demand_gen_campaign.rb [options]"

    opts.on("-C", "--customer_id CUSTOMER-ID", "Customer ID") do |v|
      options[:customer_id] = v
    end

    opts.on("-V", "--video_id VIDEO-ID", "Video ID") do |v|
      options[:video_id] = v
    end
  end.parse!

  begin
    add_demand_gen_campaign(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:video_id),
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
    end
    raise
  end
end

