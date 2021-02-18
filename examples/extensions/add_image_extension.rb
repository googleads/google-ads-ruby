#!/usr/bin/env ruby Encoding: utf-8
#
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.  You may obtain a copy
# of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.
#
# Adds an image extension to a campaign. To create a campaign, run
# basic_operations/add_campaigns.rb. To create an image asset, run
# misc/upload_image_asset.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_image_extension(customer_id, campaign_id, image_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # First, create the image feed item.
  operation = client.operation.create_resource.extension_feed_item do |efi|
    efi.image_feed_item = client.resource.image_feed_item do |ifi|
      ifi.image_asset = client.path.asset(customer_id, image_id)
    end
  end

  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )

  image_resource_name = response.results.first.resource_name
  puts "Created an image extension with resource name '#{image_resource_name}'."

  # Then, create a campaign extension setting using the created image feed item.
  operation = client.operation.create_resource.campaign_extension_setting do |ces|
    ces.campaign = client.path.campaign(customer_id, campaign_id)
    ces.extension_type = :IMAGE
    ces.extension_feed_items << image_resource_name
  end

  response = client.service.campaign_extension_setting.mutate_campaign_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created a campaign extension setting with resource name '#{response.results.first.resource_name}'"
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:image_asset_id] = 'INSERT_IMAGE_ASSET_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-I', '--image-asset-id IMAGE-ASSET-ID', String, 'Image Asset ID') do |v|
      options[:image_asset_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_image_extension(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
      options.fetch(:image_asset_id),
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
