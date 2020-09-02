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
# This code example gets all image assets.

require 'optparse'
require 'google/ads/google_ads'

def get_all_image_assets(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~EOQUERY
    SELECT asset.name, asset.image_asset.file_size,
    asset.image_asset.full_size.width_pixels,
    asset.image_asset.full_size.height_pixels,
    asset.image_asset.full_size.url FROM asset
    WHERE asset.type = IMAGE
  EOQUERY

  ga_service = client.service.google_ads
  response = ga_service.search(customer_id: customer_id, query: query)

  count = 0
  response.each do |row|
    asset = row.asset
    image_asset = asset.image_asset
    count += 1
    puts(
      "Image with name #{asset.name} found:\n"\
      "\tfile size #{image_asset.file_size} bytes\n"\
      "\twidth #{image_asset.full_size.width_pixels}px\n"\
      "\theight #{image_asset.full_size.height_pixels}px\n"\
      "\turl '#{image_asset.full_size.url}'"
    )
  end
  puts("Total of #{count} image asset#{if count > 1 then 's' else '' end} found")
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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

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
    get_all_image_assets(options.fetch(:customer_id).tr('-', ''))
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
