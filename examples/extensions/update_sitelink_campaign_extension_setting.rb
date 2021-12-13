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
# Updates the sitelink campaign extension setting.

# Replaces the extension feed items of the sitelink campaign extension setting
# with the given feed item IDs. Note that this doesn't completely remove your
# old extension feed items. See
# https://developers.google.com/google-ads/api/docs/extensions/extension-settings/overview
# for details.

require 'optparse'
require 'google/ads/google_ads'

# [START update_sitelink_campaign_extension_setting]
def update_sitelink_campaign_extension_setting(customer_id, campaign_id, feed_item_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Replace the current extension feed items with the given list
  operation = client.operation.update_resource.campaign_extension_setting(
    client.path.campaign_extension_setting(
      customer_id: customer_id,
      campaign_id: campaign_id,
      extension_type: :SITELINK
    )
  ) do |ces|
    feed_item_ids.each do |feed_item_id|
      # Transforms the specified feed item IDs to resource names as required by the API.
      ces.extension_feed_items << client.path.extension_feed_item(customer_id, feed_item_id)
    end
  end

  # Update the campaign extension settings
  response = client.service.campaign_extension_setting.mutate_campaign_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Updated campaign extension setting with resource name: " \
    "'#{response.results.first.resource_name}'."
end
# [END update_sitelink_campaign_extension_setting]

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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:feed_item_ids] = 'INSERT_FEED_ITEM_IDS_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-s', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-f', '--feed-item-ids FEED-ITEM-IDS', String, 'Comma separated list of Feed Item IDs') do |v|
      options[:feed_item_ids] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    update_sitelink_campaign_extension_setting(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
      options.fetch(:feed_item_ids).split(",").map(&:strip),
    )
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
