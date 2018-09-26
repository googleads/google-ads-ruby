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
#
# This example retrieves expanded text ads.

require 'optparse'
require 'google/ads/google_ads'

def get_expanded_text_ads(customer_id, ad_group_id = nil)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service(:GoogleAds)

  search_query = <<~QUERY
    SELECT ad_group.id,
           ad_group_ad.ad.id,
           ad_group_ad.ad.expanded_text_ad.headline_part1,
           ad_group_ad.ad.expanded_text_ad.headline_part2,
           ad_group_ad.status
   FROM ad_group_ad
   WHERE ad_group_ad.ad.type = EXPANDED_TEXT_AD
  QUERY

  if ad_group_id
    search_query << sprintf(' AND ad_group.id = %s', ad_group_id)
  end

  response = ga_service.search(
    customer_id,
    search_query,
    page_size: PAGE_SIZE
  )

  response.each do |row|
    ad = row.ad_group_ad.ad
    if ad.expanded_text_ad
      expanded_text_ad_info = ad.expanded_text_ad

      puts sprintf('Expanded text ad with ID %s, status %s, '\
          "and headline '%s - %s' was found in ad group with ID %s.",
          ad.id,
          row.ad_group_ad.status,
          expanded_text_ad_info.headline_part1,
          expanded_text_ad_info.headline_part2,
          row.ad_group.id
      )
    end
  end
end

if __FILE__ == $0
  PAGE_SIZE = 1000

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
  options[:ad_group_id] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String,
        '(Optional) Ad Group ID') do |v|
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
    get_expanded_text_ads(options[:customer_id], options[:ad_group_id])
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
