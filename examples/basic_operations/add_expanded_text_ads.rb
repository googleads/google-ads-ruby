#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
# This example adds an expanded text ad. To get expanded text ads,
# run get_expanded_text_ads.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_expanded_text_ads(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  ad_group_ad_service = client.service(:AdGroupAd)

  # Create an ad group ad.
  ad_group_ad = client.resource(:AdGroupAd)
  ad_group_ad.ad_group = client.wrapper.string(
      client.path.ad_group(customer_id, ad_group_id))
  ad_group_ad.status = client.enum(:AdGroupAdStatus)::PAUSED
  ad_group_ad.ad = client.resource(:Ad)
  ad_group_ad.ad.final_urls << client.wrapper.string('http://www.example.com')

  # Set expanded text ad info
  ad_group_ad.ad.expanded_text_ad = client.resource(:ExpandedTextAdInfo)
  eta = ad_group_ad.ad.expanded_text_ad
  eta.description = client.wrapper.string('Buy your tickets now!')
  eta.headline_part1 = client.wrapper.string(
      sprintf('Cruise to Mars %s',(Time.new.to_f * 100).to_i))
  eta.headline_part2 = client.wrapper.string(
      'Best Space Cruise Line')
  eta.path1 = client.wrapper.string('all-inclusive')
  eta.path2 = client.wrapper.string('deals')

  # Create the operation.
  ad_group_ad_operation = client.operation(:AdGroupAd)
  ad_group_ad_operation['create'] = ad_group_ad

  # Add the ad group ad.
  response = ad_group_ad_service.mutate_ad_group_ads(
      customer_id, [ad_group_ad_operation])

  puts sprintf('Created expanded text ad %s.',
      response.results.first.resource_name)
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
    add_expanded_text_ads(options[:customer_id], options[:ad_group_id])
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

