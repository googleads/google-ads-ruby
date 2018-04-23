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
# This example adds an expanded text ad that uses advanced features of
# upgraded URLs.

require 'optparse'
require 'google/ads/googleads'

def add_expanded_text_ad_with_upgraded_urls(customer_id, ad_group_id)
  # GoogleadsClient will read a config file from ENV['HOME']/googleads_config.rb
  # when called without parameters
  client = Google::Ads::Googleads::GoogleadsClient.new
  ad_group_ad_service = client.service(:AdGroupAd)

  # Create an ad group ad.
  ad_group_ad = client.resource(:AdGroupAd)
  ad_group_ad.ad_group = client.wrapper.string(
      sprintf('customers/%s/adGroups/%s', customer_id, ad_group_id))
  ad_group_ad.status = client.enum(:AdGroupAdStatus)::PAUSED
  ad_group_ad.ad = client.resource(:Ad)
  ad_group_ad.ad.final_urls << client.wrapper.string(
      'http://www.example.com/cruise/space/')
  ad_group_ad.ad.final_urls << client.wrapper.string(
      'http://www.example.com/locations/mars/')

  # Set expanded text ad info
  eta = client.resource(:ExpandedTextAdInfo)
  eta.description = client.wrapper.string('Low-gravity fun for everyone!')
  eta.headline_part1 = client.wrapper.string(
      'Luxury Cruise to Mars')
  eta.headline_part2 = client.wrapper.string(
      'Visit the Red Planet in Style.')
  ad_group_ad.ad.expanded_text_ad = eta

  # Specify a tracking URL for 3rd party tracking provider. You may specify
  # one at customer, campaign, ad group, ad, criterion or feed item levels.
  ad_group_ad.ad.tracking_url_template = client.wrapper.string(
      'http://tracker.example.com/?season={_season}&promocode={_promocode}&'\
      'u={lpurl}')

  # Since your tracking URL has two custom parameters, provide their
  # values too. This can be provided at campaign, ad group, ad, criterion
  # or feed item levels.
  param_1 = client.resource(:CustomParameter)
  param_1.key = client.wrapper.string('season')
  param_1.value = client.wrapper.string('easter123')
  ad_group_ad.ad.url_custom_parameters << param_1

  param_2 = client.resource(:CustomParameter)
  param_2.key = client.wrapper.string('promocode')
  param_2.value = client.wrapper.string('nj123')
  ad_group_ad.ad.url_custom_parameters << param_2

  # Specify a list of final mobile URLs. This field cannot be set if URL field
  # is set, or finalUrls is unset. This may be specified at ad, criterion and
  # feed item levels.
  ad_group_ad.ad.final_mobile_urls << client.wrapper.string(
      'http://mobile.example.com/cruise/space/')
  ad_group_ad.ad.final_mobile_urls << client.wrapper.string(
      'http://mobile.example.com/locations/mars/')

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
    add_expanded_text_ad_with_upgraded_urls(options[:customer_id],
        options[:ad_group_id])
    rescue Google::Ads::Googleads::Errors::GoogleAdsError => e
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
