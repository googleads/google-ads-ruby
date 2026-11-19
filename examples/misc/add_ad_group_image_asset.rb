#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
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
# This code example adds an image asset to an ad group.
# To upload image assets, run misc/upload_image_asset.rb.

require 'optparse'
require 'google/ads/google_ads'

# [START add_ad_group_image_asset]
def add_ad_group_image_asset(customer_id, ad_group_id, asset_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create an ad group asset operation.
  operation = client.operation.create_resource.ad_group_asset do |aga|
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    aga.asset = client.path.asset(customer_id, asset_id)
    aga.field_type = :AD_IMAGE
  end

  # Issue the mutate request.
  response = client.service.ad_group_asset.mutate_ad_group_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  response.results.each do |result|
    puts "Created ad group asset with resource name: #{result.resource_name}"
  end
end
# [END add_ad_group_image_asset]

if __FILE__ == $0
  options = {}
  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-s', '--asset-id ASSET-ID', String, 'Asset ID') do |v|
      options[:asset_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_ad_group_image_asset(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
      options.fetch(:asset_id),
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
