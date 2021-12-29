#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# This code example retrieves the full details of a Promotion Feed-based extension and
# creates a matching Promotion asset-based extension. The new Asset-based extension will
# then be associated with the same campaigns and ad groups as the original Feed-based
# extension.
#
# Once copied, you should remove the Feed-based extension; see
# remove_entire_sitelink_campaign_extension_setting.rb.cs for an example.

require 'optparse'
require 'google/ads/google_ads'

def migrate_promotion_feed_to_asset(customer_id, feed_item_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  resource_name = client.path.extension_feed_item(customer_id, feed_item_id)

  # Get the target extension feed item.
  extension_feed_item = get_extension_feed_item(client, customer_id, feed_item_id)

  # Get all campaign IDs associated with the extension feed item.
  campaign_ids = get_targeted_campaign_ids(client, customer_id, resource_name)

  # Get all ad group IDs associated with the extension feed item.
  ad_group_ids = get_targeted_ad_group_ids(client, customer_id, resource_name)

  # Create a new Promotion asset that matches the target extension feed item.
  promotion_asset_resource_name = create_promotion_asset_from_feed(client, customer_id, extension_feed_item)

  # Associate the new Promotion asset with the same campaigns as the original.
  associate_asset_with_campaigns(client, customer_id, promotion_asset_resource_name, campaign_ids)

  # Associate the new Promotion asset with the same ad groups as the original.
  associate_asset_with_ad_groups(client, customer_id, promotion_asset_resource_name, ad_group_ids)
end

def get_extension_feed_item(client, customer_id, feed_item_id)
  # Gets the requested Promotion-type extension feed item.
  #
  # Note that extension feed items pertain to feeds that were created by Google. Use
  # FeedService to instead retrieve a user-created Feed.

  google_ads_service = client.service.google_ads

  query = <<~QUERY
    SELECT
      extension_feed_item.id,
      extension_feed_item.ad_schedules,
      extension_feed_item.device,
      extension_feed_item.status,
      extension_feed_item.start_date_time,
      extension_feed_item.end_date_time,
      extension_feed_item.targeted_campaign,
      extension_feed_item.targeted_ad_group,
      extension_feed_item.promotion_feed_item.discount_modifier,
      extension_feed_item.promotion_feed_item.final_mobile_urls,
      extension_feed_item.promotion_feed_item.final_url_suffix,
      extension_feed_item.promotion_feed_item.final_urls,
      extension_feed_item.promotion_feed_item.language_code,
      extension_feed_item.promotion_feed_item.money_amount_off.amount_micros,
      extension_feed_item.promotion_feed_item.money_amount_off.currency_code,
      extension_feed_item.promotion_feed_item.occasion,
      extension_feed_item.promotion_feed_item.orders_over_amount.amount_micros,
      extension_feed_item.promotion_feed_item.orders_over_amount.currency_code,
      extension_feed_item.promotion_feed_item.percent_off,
      extension_feed_item.promotion_feed_item.promotion_code,
      extension_feed_item.promotion_feed_item.promotion_end_date,
      extension_feed_item.promotion_feed_item.promotion_start_date,
      extension_feed_item.promotion_feed_item.promotion_target,
      extension_feed_item.promotion_feed_item.tracking_url_template
    FROM extension_feed_item
    WHERE
      extension_feed_item.extension_type = 'PROMOTION'
      AND extension_feed_item.id = #{feed_item_id}
    LIMIT 1
  QUERY

  # Issue a search request to get the extension feed item contents.
  response = google_ads_service.search(customer_id: customer_id, query: query)
  extension_feed_item = response.first&.extension_feed_item

  if extension_feed_item.nil?
    raise "Error: No ExtensionFeedItem found with ID '#{feed_item_id}'."
  end

  puts "Retrieved details for ad extension with ID '#{extension_feed_item.id}'."

  # Create a query to retrieve any URL customer parameters attached to the
  # extension feed item.
  query = <<~QUERY
    SELECT feed_item.url_custom_parameters
    FROM feed_item
    WHERE feed_item.id = #{extension_feed_item.id}
    LIMIT 1
  QUERY

  # Issue a search request to get any URL custom parameters.
  response = google_ads_service.search(customer_id: customer_id, query: query)
  feed_item = response.first&.feed_item

  if feed_item.nil?
    raise "Error: No FeedItem found with ID '#{feed_item_id}'."
  end

  parameters = feed_item.url_custom_parameters

  puts "Retrieved #{parameters.count} attached URL custom parameters."

  extension_feed_item.promotion_feed_item.url_custom_parameters += parameters

  extension_feed_item
end

# [START migrate_promotion_feed_to_asset_1]
def get_targeted_campaign_ids(client, customer_id, resource_name)
  # Finds and returns all of the campaigns that are associated with the specified
  # Promotion extension feed item.

  query = <<~QUERY
    SELECT
      campaign.id,
      campaign_extension_setting.extension_feed_items
    FROM campaign_extension_setting
    WHERE
      campaign_extension_setting.extension_type = 'PROMOTION'
      AND campaign.status != 'REMOVED'
  QUERY

  responses = client.service.google_ads.search_stream(customer_id: customer_id, query: query)

  campaign_ids = []

  responses.each do |response|
    response.results.each do |row|
      feed_items = row.campaign_extension_setting.extension_feed_items
      if feed_items.include?(resource_name)
        puts "Found matching campaign with ID '#{row.campaign.id}'."
        campaign_ids << row.campaign.id
      end
    end
  end

  campaign_ids
end
# [END migrate_promotion_feed_to_asset_1]

def get_targeted_ad_group_ids(client, customer_id, resource_name)
  # Finds and returns all of the ad groups that are associated with the specified
  # Promotion extension feed item.

  query = <<~QUERY
    SELECT
      ad_group.id,
      ad_group_extension_setting.extension_feed_items
    FROM ad_group_extension_setting
    WHERE
      ad_group_extension_setting.extension_type = 'PROMOTION'
      AND ad_group.status != 'REMOVED'
  QUERY

  responses = client.service.google_ads.search_stream(customer_id: customer_id, query: query)

  ad_group_ids = []

  responses.each do |response|
    response.results.each do |row|
      feed_items = row.ad_group_extension_setting.extension_feed_items
      if feed_items.include?(resource_name)
        puts "Found matching ad group with ID: '#{row.ad_group.id}'"
        ad_group_ids << row.ad_group.id
      end
    end
  end

  ad_group_ids
end

# [START migrate_promotion_feed_to_asset]
def create_promotion_asset_from_feed(client, customer_id, extension_feed_item)
  # Create a Promotion asset that copies values from the specified extension feed item.

  asset_service = client.service.asset
  promotion_feed_item = extension_feed_item.promotion_feed_item

  # Create an asset operation to start building the new promotion asset using
  # data from the given extension feed item.
  asset_operation = client.operation.create_resource.asset do |asset|
    asset.name = "Migrated from feed item ID '#{extension_feed_item.id}'"
    asset.tracking_url_template = promotion_feed_item.tracking_url_template
    asset.final_url_suffix = promotion_feed_item.final_url_suffix
    asset.final_urls += promotion_feed_item.final_urls
    asset.final_mobile_urls += promotion_feed_item.final_mobile_urls

    # Create the Promotion asset.
    asset.promotion_asset = client.resource.promotion_asset do |pa|
      pa.promotion_target = promotion_feed_item.promotion_target
      pa.discount_modifier = promotion_feed_item.discount_modifier
      pa.redemption_start_date = promotion_feed_item.promotion_start_date
      pa.redemption_end_date = promotion_feed_item.promotion_end_date
      pa.occasion = promotion_feed_item.occasion
      pa.language_code = promotion_feed_item.language_code
      pa.ad_schedule_targets += extension_feed_item.ad_schedules

      # Either percent_off or money_amount_off must be set.
      if promotion_feed_item.percent_off.positive?
        # Adjust the percent off scale after copying.
        pa.percent_off = int(promotion_feed_item.percent_off / 100)
      else
        # If percent_off is not set then copy money_amount_off. This field is
        # an instance of Money in both cases, so setting the field with
        # copy_from is possible. Using regular assignment is also valid here.
        pa.money_amount_off = promotion_feed_item.money_amount_off
      end

      # Either promotion_code or orders_over_amount must be set.
      if promotion_feed_item.promotion_code.empty?
        pa.orders_over_amount = promotion_feed_item.orders_over_amount
      else
        pa.promotion_code = promotion_feed_item.promotion_code
      end

      # Set the start and end dates if set in the existing extension.
      unless promotion_feed_item.promotion_start_date.empty?
        pa.start_date = promotion_feed_item.promotion_start_date
      end

      unless promotion_feed_item.promotion_end_date.empty?
        pa.end_date = promotion_feed_item.promotion_end_date
      end
    end
  end

  response = asset_service.mutate_assets(customer_id: customer_id, operations: [asset_operation])
  resource_name = response.results.first.resource_name
  puts "Created promotion asset with resource name: '#{resource_name}'"

  resource_name
end
# [END migrate_promotion_feed_to_asset]

# [START migrate_promotion_feed_to_asset_2]
def associate_asset_with_campaigns(client, customer_id, promotion_asset_resource_name, campaign_ids)
  # Associates the specified promotion asset with the specified campaigns.

  if campaign_ids.empty?
    puts 'Asset was not associated with any campaigns.'
    return
  end

  operations = campaign_ids.map do |campaign_id|
    client.operation.create_resource.campaign_asset do |ca|
      ca.asset = promotion_asset_resource_name
      ca.field_type = :PROMOTION
      ca.campaign = client.path.campaign(customer_id, campaign_id)
    end
  end

  response = client.service.campaign_asset.mutate_campaign_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Created campaign asset with resource name '#{result.resource_name}'."
  end
end
# [END migrate_promotion_feed_to_asset_2]

def associate_asset_with_ad_groups(client, customer_id, promotion_asset_resource_name, ad_group_ids)
  # Associates the specified promotion asset with the specified ad groups.

  if ad_group_ids.empty?
    puts 'Asset was not associated with any ad groups.'
    return
  end

  operations = ad_group_ids.map do |ad_group_id|
    client.operation.create_resource.ad_group_asset do |aga|
      aga.asset = promotion_asset_resource_name
      aga.field_type = :PROMOTION
      aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    end
  end

  response = client.service.ad_group_asset.mutate_ad_group_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Created ad group asset with resource name '#{result.resource_name}'."
  end
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
  options[:feed_item_id] = 'INSERT_FEED_ITEM_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-f', '--feed-item-id FEED-ITEM-ID', String, 'Feed Item ID') do |v|
      options[:feed_item_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    migrate_promotion_feed_to_asset(options.fetch(:customer_id).tr('-', ''), options.fetch(:feed_item_id))
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
