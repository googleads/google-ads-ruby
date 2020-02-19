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
# This example adds a Gmail ad to a given ad group. The ad group's campaign
# needs to have an AdvertisingChannelType of DISPLAY and
# AdvertisingChannelSubType of DISPLAY_GMAIL_AD. To get ad groups, run
# get_ad_groups.rb.

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'
require 'google/ads/google_ads/v1/errors/errors_pb'

def add_responsive_search_ad(customer_id, ad_group_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  responsive_ad_info = client.resource.responsive_search_ad_info do |responsive_ad|
    responsive_ad.headlines << client.resource.ad_text_asset do |ata|
      ata.text = "Best Space Cruise Line"
    end

    responsive_ad.headlines << client.resource.ad_text_asset do |ata|
      ata.text = "Experience the Stars"
    end

    responsive_ad.headlines << client.resource.ad_text_asset do |ata|
      ata.text = "Explore the Galaxy"
    end

    responsive_ad.descriptions << client.resource.ad_text_asset do |ata|
      ata.text = "Buy your tickets now"
    end

    responsive_ad.descriptions << client.resource.ad_text_asset do |ata|
      ata.text = "Visit the Red Planet"
    end

    responsive_ad.path1 = "all-inclusive"
    responsive_ad.path2 = "deals"
  end

  ad = client.resource.ad do |ad|
    ad.final_urls << "http://www.example.com"
    ad.responsive_search_ad = responsive_ad_info
  end

  ad_group_ad = client.resource.ad_group_ad do |aga|
    aga.ad = ad
    aga.status = :PAUSED
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
  end

  op = client.operation.create_resource.ad_group_ad(ad_group_ad)

  response = client.service.ad_group_ad.mutate_ad_group_ads(customer_id, [op])
  puts "Created Responsive Search Ad with ID #{response.results.first.resource_name}."
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

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
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
    add_responsive_search_ad(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
