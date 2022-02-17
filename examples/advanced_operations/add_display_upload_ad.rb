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
# This code example adds a display upload ad to a given ad group.
# To get ad groups, run get_ad_groups.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'open-uri'

def add_display_upload_ad(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a new media bundle asset and returns the resource name.
  # There are several types of display upload ads. For this example, we will
  # create an HTML5 upload ad, which requires a media bundle.
  # The display_upload_product_type field lists the available display
  # upload types:
  # https://developers.google.com/google-ads/api/reference/rpc/latest/DisplayUploadAdInfo
  ad_asset_resource_name = create_media_bundle_asset(client, customer_id)

  # Creates a new display upload ad and associates it with the specified
  # ad group.
  create_display_upload_ad_group_ad(
    client,
    customer_id,
    ad_group_id,
    ad_asset_resource_name,
  )
end

# Creates a media bundle from the assets in a zip file. The zip file contains
# the HTML5 components.
def create_media_bundle_asset(client, customer_id)
  # The HTML5 zip file contains all the HTML, CSS, and images needed for the
  # HTML5 ad. For help on creating an HTML5 zip file, check out Google Web
  # Designer (https://www.google.com/webdesigner/).
  html5_zip = open("https://gaagl.page.link/ib87") { |f| f.read }

  # Creates the media bundle asset.
  operation = client.operation.create_resource.asset do |asset|
    asset.type = :MEDIA_BUNDLE
    asset.name = "Ad Media Bundle"
    asset.media_bundle_asset = client.resource.media_bundle_asset do |media|
      media.data = html5_zip
    end
  end

  # Issues a mutate request to add the asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints the resource name of the added media bundle asset.
  ad_asset_resource_name = response.results.first.resource_name
  puts "Uploaded media bundle asset with resource name: " \
    "#{ad_asset_resource_name}"

  ad_asset_resource_name
end

# Creates a new HTML5 display upload ad and adds it to the specified ad group.
def create_display_upload_ad_group_ad(
  client,
  customer_id,
  ad_group_id,
  ad_asset_resource_name)
  # Creates an ad group ad for the new ad.
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad = client.resource.ad do |ad|
      ad.name = "Ad for HTML 5"
      ad.final_urls << "http://example.com/html5"
      # Exactly one ad data field must be included to specify the ad type. See
      # https://developers.google.com/google-ads/api/reference/rpc/latest/Ad
      # for the full list of available types.
      ad.display_upload_ad = client.resource.display_upload_ad_info do |info|
        info.display_upload_product_type = :HTML5_UPLOAD_AD
        info.media_bundle = client.resource.ad_media_bundle_asset do |bundle|
          bundle.asset = ad_asset_resource_name
        end
      end
      aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
      aga.status = :PAUSED
    end
  end

  # Issues a mutate request to add the ad group ad.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints information about the newly created ad group ad.
  puts "Created ad group ad with resource name: " \
    "#{response.results.first.resource_name}"
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'AdGroup ID') do |v|
      options[:ad_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_display_upload_ad(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id],
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
