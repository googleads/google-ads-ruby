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
# This example adds a Smart Display campaign, an ad group and a
# responsive display ad.
# More information about Smart Display campaigns can be found at
# https://support.google.com/google-ads/answer/7020281.
#
# IMPORTANT: The AssetService requires you to reuse what you've uploaded
# previously. Therefore, you cannot create an image asset with the exactly same
# bytes. In case you want to run this example more than once, note down the
# created assets' resource names and specify them as command-line arguments for
# marketing and square marketing images.
#
# Alternatively, you can modify the image URLs' constants directly to use other
# images. You can find image specifications in the
# responsive_display_ad_info.rb file.

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'

def add_smart_display_ad(
  customer_id,
  marketing_image_asset_resource_name = nil,
  square_marketing_image_asset_resource_name = nil
)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget = create_campaign_budget(client, customer_id)
  campaign = create_smart_display_campaign(client, customer_id, budget)
  ad_group = create_ad_group(client, customer_id, campaign)
  create_responsive_display_ad(
    client,
    customer_id,
    ad_group,
    marketing_image_asset_resource_name,
    square_marketing_image_asset_resource_name,
  )
end

# [START add_smart_display_ad]
def create_campaign_budget(client, customer_id)
  # Creates a campaign budget operation.
  operation = client.operation.create_resource.campaign_budget do |b|
    b.name = "Interplanetary Cruise Budget #{(Time.new.to_f * 1000).to_i}"
    b.delivery_method = :STANDARD
    b.amount_micros = 5_000_000
  end

  # Issues a mutate request to add campaign budgets.
  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out some information about the created campaign budget.
  resource_name = response.results.first.resource_name
  puts "Created campaign budget #{resource_name}"

  resource_name
end
# [END add_smart_display_ad]

# [START add_smart_display_ad_1]
def create_smart_display_campaign(client, customer_id, budget)
  # Creates a campaign operation.
  operation = client.operation.create_resource.campaign do |c|
    c.name = "Smart Display Campaign #{(Time.new.to_f * 1000).to_i}"
    # Smart Display campaign requires the advertising_channel_type as 'DISPLAY'.
    c.advertising_channel_type = :DISPLAY
    # Smart Display campaign requires the advertising_channel_sub_type as
    # 'DISPLAY_SMART_CAMPAIGN'.
    c.advertising_channel_sub_type = :DISPLAY_SMART_CAMPAIGN
    # Smart Display campaign requires the TargetCpa bidding strategy.
    c.target_cpa = Google::Ads::GoogleAds::V8::Common::TargetCpa.new
    c.target_cpa.target_cpa_micros = 5_000_000
    c.campaign_budget = budget
    # Optional: Sets the start and end dates for the campaign, beginning one day
    # from now and ending a month from now.
    c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
    c.end_date = DateTime.parse(Date.today.next_month.to_s).strftime('%Y%m%d')
  end

  # Issues a mutate request to add the campaign.
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out some information about the created campaign.
  resource_name = response.results.first.resource_name
  puts "Added a smart display campaign named #{resource_name}"

  resource_name
end
# [END add_smart_display_ad_1]

# [START add_smart_display_ad_4]
def create_ad_group(client, customer_id, campaign)
  # Creates an ad group operation.
  operation = client.operation.create_resource.ad_group do |ag|
    ag.name = "Earth to Mars Cruises #{(Time.new.to_f * 1000).to_i}"
    ag.campaign = campaign
    ag.status = :PAUSED
  end

  # Issues a mutate request to add the ad group.
  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  # Print out some information about the added ad group.
  resource_name = response.results.first.resource_name
  puts "Added ad group named #{resource_name}"

  resource_name
end
# [END add_smart_display_ad_4]

# [START add_smart_display_ad_2]
def create_responsive_display_ad(
  client,
  customer_id,
  ad_group,
  marketing_image_asset_resource_name,
  square_marketing_image_asset_resource_name
)
  marketing_image_url = 'https://gaagl.page.link/Eit5'
  square_marketing_image_url = 'https://gaagl.page.link/bjYi'

  # Creates a new image asset for marketing image and square marketing image
  # if there are no assets' resource names specified.
  marketing_image_asset_resource_name ||= create_image_asset(
    client,
    customer_id,
    marketing_image_url,
    'Marketing Image',
  )
  square_marketing_image_asset_resource_name ||= create_image_asset(
    client,
    customer_id,
    square_marketing_image_url,
    'Square Marketing Image',
  )

  # Creates an ad group ad operation.
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = ad_group
    aga.status = :PAUSED
    aga.ad = client.resource.ad do |a|
      a.final_urls << "https://www.example.com"
      a.responsive_display_ad = client.resource.responsive_display_ad_info do |rda|
        # Sets some basic required information for the responsive display ad.
        rda.headlines << client.resource.ad_text_asset do |ata|
          ata.text = 'Travel'
        end
        rda.long_headline = client.resource.ad_text_asset do |ata|
          ata.text = 'Travel the World'
        end
        rda.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = 'Take to the air!'
        end
        rda.business_name = 'Google'
        # Sets the marketing image and square marketing image to the previously
        # created image assets.
        rda.marketing_images << client.resource.ad_image_asset do |aia|
          aia.asset = marketing_image_asset_resource_name
        end
        rda.square_marketing_images << client.resource.ad_image_asset do |aia|
          aia.asset = square_marketing_image_asset_resource_name
        end
        # Optional: Sets call to action text, price prefix and promotion text.
        rda.call_to_action_text = 'Shop Now'
        rda.price_prefix = 'as low as'
        rda.promo_text = 'Free shipping!'
      end
    end
  end

  # Issues a mutate request to add the ad group ad.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out some information about the newly created ad.
  resource_name = response.results.first.resource_name
  puts "Added ad group ad named #{resource_name}"

  resource_name
end
# [END add_smart_display_ad_2]

# [START add_smart_display_ad_3]
def create_image_asset(client, customer_id, image_url, image_name)
  # Creates an asset operation.
  operation = client.operation.create_resource.asset do |a|
    a.name = image_name
    a.type = :IMAGE
    a.image_asset = client.resource.image_asset do |image|
      image.data = open(image_url) { |f| f.read }
    end
  end

  # Issues a mutate request to add the asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out information about the newly added asset.
  resource_name = response.results.first.resource_name
  puts "A new image asset has been added with resource name: #{resource_name}"

  resource_name
end
# [END add_smart_display_ad_3]

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
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-m',
      '--marketing_image_asset_resource_name MARKETING_IMAGE_ASSET_RESOURCE_NAME',
      String,
      'Marketing image asset resource name',
    ) do |v|
      options[:marketing_image_asset_resource_name] = v
    end

    opts.on('-s',
      '--square_marketing_image_asset_resource_name SQUARE_MARKETING_IMAGE_ASSET_RESOURCE_NAME',
      String,
      'Square marketing image asset resource name',
    ) do |v|
      options[:square_marketing_image_asset_resource_name] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_smart_display_ad(
      options.fetch(:customer_id).tr("-", ""),
      options[:marketing_image_asset_resource_name],
      options[:square_marketing_image_asset_resource_name])
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
