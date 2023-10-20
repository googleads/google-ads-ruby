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
# This example uploads an HTML5 zip file as a media bundle.

# NOTE: This code example uses version v14 of the Google Ads API.
# Google Ads is migrating from individual media files to assets,
# and version v15 of the API removed support for
# MediaFileService as part of this migration.
# See https://ads-developers.googleblog.com/2023/07/image-and-location-auto-migration.html
# for more details.

require 'optparse'
require 'google/ads/google_ads'
require 'open-uri'

def upload_media_bundle(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  url = 'https://gaagl.page.link/ib87'
  bundle_content = URI.open(url) { |f| f.read }

  # Creates a media file containing the bundle content.
  operation = client.operation.v14.create_resource.media_file do |media|
    media.name = 'Ad Media Bundle'
    media.type = :MEDIA_BUNDLE
    media.media_bundle = client.resource.v14.media_bundle do |bundle|
      bundle.data = bundle_content
    end
  end

  # Issues a mutate request to add the media file.
  response = client.service.v14.media_file.mutate_media_files(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "The media bundle with resource name " \
    "#{response.results.first.resource_name} was added."
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
    upload_media_bundle(options.fetch(:customer_id).tr('-', ''))
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
