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
# This example adds a geo target to an extension feed item for targeting.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_geo_target(customer_id, feed_item_id, geo_target_constant_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  if geo_target_constant_id.nil?
    geo_target_constant_id = GEO_TARGET_CONSTANT_ID
  end

  resource_name = client.path.extension_feed_item(customer_id, feed_item_id)

  # Creates the update operation for extension feed item using the
  # specified feed item ID and geo target constant ID for targeting.
  operation = client.operation.update_resource.extension_feed_item(resource_name) do |efi|
    efi.targeted_geo_target_constant = client.path.geo_target_constant(geo_target_constant_id)
  end

  # Issues a mutate request to update the extension feed item.
  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: [operation]
  )

  # Prints the resource name of the updated extension feed item.
  puts "Updated extension feed item with resource name: " \
    "'#{response.results.first.resource_name}'"
end

if __FILE__ == $0
  # Geo target constant ID for US.
  GEO_TARGET_CONSTANT_ID = 2840

  options = {}

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

    opts.on('-g', '--geo-target-constant-id GEO-TARGET-CONSTANT-ID', String, 'Geo Target Constant ID') do |v|
      options[:geo_target_constant_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_geo_target(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:feed_item_id),
      options[:geo_target_constant_id],
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
