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
# This code example uploads an image asset.
# To get image assets, run get_all_image_assets.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'open-uri'

# [START upload_image_asset]
def upload_image_asset(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  url = 'https://gaagl.page.link/Eit5'
  image_data = open(url) { |f| f.read }

  # Create the operation for uploading the image asset.
  asset_operation = client.operation.create_resource.asset do |asset|
    asset.type = :IMAGE
    asset.image_asset = client.resource.image_asset do |image_asset|
      image_asset.data = image_data
      image_asset.file_size = image_data.length()
      image_asset.mime_type = :IMAGE_JPEG
      image_asset.full_size = client.resource.image_dimension do |dimension|
        dimension.height_pixels = 315
        dimension.width_pixels = 600
        dimension.url = url
      end
    end
    # Provide a unique friendly name to identify your asset.
    # When there is an existing image asset with the same content but a different
    # name, the new name will be dropped silently.
    asset.name = "Marketing Image"
  end

  # Upload the image asset.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [asset_operation],
  )

  puts "Uploaded image asset #{response.results.first.resource_name}."
end
# [END upload_image_asset]

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

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_image_asset(options.fetch(:customer_id).tr('-', ''))
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf('Error with message: %s\n', error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf('\tOn field: %s\n', field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf('\tType: %s\n\tCode: %s\n', k, v)
      end
    end
    raise
  end
end

