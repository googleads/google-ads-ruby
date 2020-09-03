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
# This example creates a shopping campaign associated with an existing merchant
# center account, along with a related ad group and dynamic display ad, and
# targets a user list for remarketing purposes.

require "optparse"
require "date"
require "open-uri"
require "google/ads/google_ads"

def add_merchant_center_dynamic_remarketing_campaign(
  customer_id,
  merchant_center_id,
  campaign_budget_id,
  user_list_id
)
  # GoogleAdsClient will read a config file from
  # ENV["HOME"]/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a shopping campaign associated with a given merchant center account.
  campaign_resource_name = create_campaign(
    client,
    customer_id,
    merchant_center_id,
    campaign_budget_id
  )

  # Creates an ad group for the campaign.
  ad_group_resource_name = create_ad_group(client, customer_id,
                                           campaign_resource_name)

  # Creates a dynamic display ad in the ad group.
  create_ad(client, customer_id, ad_group_resource_name)

  # Targets a specific user list for remarketing.
  attach_user_list(client, customer_id, ad_group_resource_name, user_list_id)
end

# Creates a campaign linked to a Merchant Center product feed.
def create_campaign(client, customer_id, merchant_center_id, campaign_budget_id)
  operation = client.operation.create_resource.campaign do |c|
    c.name = "Shopping campaign ##{(Time.new.to_f * 1000).to_i}"

    # Dynamic remarketing campaigns are only available on the Google Display
    # Network.
    c.advertising_channel_type = :DISPLAY
    c.status = :PAUSED
    c.campaign_budget = client.path.campaign_budget(customer_id,
                                                    campaign_budget_id)
    c.manual_cpc = client.resource.manual_cpc

    # The settings for the shopping campaign.
    # This connects the campaign to the merchant center account.
    c.shopping_setting = client.resource.shopping_setting do |ss|
      ss.campaign_priority = 0
      ss.merchant_id = merchant_center_id

      # Display Network campaigns do not support partition by country. The only
      # supported value is "ZZ". This signals that products from all countries
      # are available in the campaign. The actual products which serve are based
      # on the products tagged in the user list entry.
      ss.sales_country = "ZZ"
      ss.enable_local = true
    end
  end

  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation]
  )

  puts "Created campaign: #{response.results.first.resource_name}"
  response.results.first.resource_name
end

# Creates an ad group for the remarketing campaign.
def create_ad_group(client, customer_id, campaign_resource_name)
  # Creates the ad group.
  ad_group = client.resource.ad_group do |ag|
    ag.name = "Dynamic remarketing ad group #{(Time.now.to_f * 1000).to_i}"
    ag.campaign = campaign_resource_name
    ag.status = :ENABLED
  end

  # Creates the ad group operation.
  operation = client.operation.create_resource.ad_group(ad_group)
  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation]
  )

  puts "Created ad group: #{response.results.first.resource_name}"
  response.results.first.resource_name
end

# Creates the responsive display ad.
def create_ad(client, customer_id, ad_group_resource_name)
  marketing_image_url = "https://goo.gl/3b9Wfh"
  square_marketing_image_url = "https://goo.gl/mtt54n"
  marketing_image_asset_resource_name = upload_asset(
    client, customer_id, marketing_image_url, "Marketing Image"
  )
  square_marketing_image_asset_resource_name = upload_asset(
    client, customer_id, square_marketing_image_url, "Square Marketing Image"
  )

  # Creates an ad group ad operation.
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = ad_group_resource_name
    aga.status = :PAUSED
    aga.ad = client.resource.ad do |a|
      a.final_urls << "https://www.example.com"

      # Creates the responsive display ad info object.
      a.responsive_display_ad = client.resource.responsive_display_ad_info do |rda|
        rda.headlines << client.resource.ad_text_asset do |ata|
          ata.text = "Travel"
        end
        rda.long_headline = client.resource.ad_text_asset do |ata|
          ata.text = "Travel the World"
        end
        rda.descriptions << client.resource.ad_text_asset do |ata|
          ata.text = "Take to the air!"
        end
        rda.business_name = "Interplanetary Cruises"
        rda.marketing_images << client.resource.ad_image_asset do |aia|
          aia.asset = marketing_image_asset_resource_name
        end
        rda.square_marketing_images << client.resource.ad_image_asset do |aia|
          aia.asset = square_marketing_image_asset_resource_name
        end
        # Optional: Call to action text.
        # Valid texts: https://support.google.com/adwords/answer/7005917
        rda.call_to_action_text = "Apply Now"
        # Optional: Sets the ad colors.
        rda.main_color = "#0000ff"
        rda.accent_color = "#ffff00"
        # Optional: Sets to false to strictly render the ad using the colors.
        rda.allow_flexible_color = false
        # Optional: Sets the format setting that the ad will be served in.
        rda.format_setting = :NON_NATIVE
        # Optional: Creates a logo image and sets it to the ad.
        # rda.logo_images << client.resource.ad_image_asset do |aia|
        #   aia.asset = "INSERT_LOGO_IMAGE_RESOURCE_NAME_HERE"
        # end
        # Optional: Creates a square logo image and sets it to the ad.
        # rda.square_logo_images << client.resource.ad_image_asset do |aia|
        #   aia.asset = "INSERT_SQUARE_LOGO_IMAGE_RESOURCE_NAME_HERE"
        # end
      end
    end
  end

  # Issues a mutate request to add the ad group ad.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation]
  )

  # Prints out some information about the newly created ad.
  resource_name = response.results.first.resource_name
  puts "Created ad group ad: #{resource_name}"

  resource_name
end

# Adds an image to the Google Ads account.
def upload_asset(client, customer_id, image_url, image_name)
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
    operations: [operation]
  )

  # Prints out information about the newly added asset.
  resource_name = response.results.first.resource_name
  puts "Created image asset: #{resource_name}"

  resource_name
end

# Targets a user list.
def attach_user_list(client, customer_id, ad_group_resource_name, user_list_id)
  user_list_resource_name = client.path.user_list(customer_id, user_list_id)

  # Creates the ad group criterion that targets the user list.
  ad_group_criterion = client.resource.ad_group_criterion do |agc|
    agc.ad_group = ad_group_resource_name
    agc.user_list = client.resource.user_list_info do |ul|
      ul.user_list = user_list_resource_name
    end
  end

  # Creates the ad group criterion operation.
  op = client.operation.create_resource.ad_group_criterion(ad_group_criterion)

  response = client.service.ad_group_criterion.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [op]
  )

  puts "Created ad group criterion: #{response.results.first.resource_name}"
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
  options[:customer_id] = "INSERT_CUSTOMER_ID_HERE"
  options[:merchant_center_id] = "INSERT_MERCHANT_CENTER_ACCOUNT_ID_HERE"
  options[:campaign_budget_id] = "INSERT_CAMPAIGN_BUDGET_ID_HERE"
  options[:user_list_id] = "INSERT_USER_LIST_ID_HERE"

  OptionParser.new do |opts|
    opts.banner = format("Usage: %s [options]", File.basename(__FILE__))

    opts.separator ""
    opts.separator "Options:"

    opts.on("-C", "--customer-id CUSTOMER-ID", String, "Customer ID") do |v|
      options[:customer_id] = v
    end

    opts.on("-m", "--merchant-center-account-id MERCHANT-CENTER-ACCOUNT-ID",
            String, "Merchant Center Account ID") do |v|
      options[:merchant_center_id] = v
    end

    opts.on("-b", "--campaign-budget-id CAMPAIGN-BUDGET-ID", String,
            "Campaign Budget ID") do |v|
      options[:campaign_budget_id] = v
    end

    opts.on("-u", "--user-list-id USER-LIST-ID", String, "User List ID") do |v|
      options[:user_list_id] = v
    end

    opts.separator ""
    opts.separator "Help:"

    opts.on_tail("-h", "--help", "Show this message") do
      puts opts
      exit
    end
  end.parse!

  begin
    add_merchant_center_dynamic_remarketing_campaign(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:merchant_center_id),
      options.fetch(:campaign_budget_id),
      options.fetch(:user_list_id)
    )
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
