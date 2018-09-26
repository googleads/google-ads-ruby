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
# This example gets all TEXT_AD recommendations.

require 'optparse'
require 'google/ads/google_ads'

def get_text_ad_recommendations(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service(:GoogleAds)

  query = <<~QUERY
    SELECT recommendation.type, recommendation.campaign,
        recommendation.text_ad_recommendation
    FROM recommendation
    WHERE recommendation.type = TEXT_AD
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)

  response.each do |row|
    recommendation = row.recommendation
    recommended_ad = recommendation.text_ad_recommendation.ad

    puts sprintf('Recommendation ("%s") was found for campaign "%s".',
        recommendation.resource_name, recommendation.campaign)
    if recommended_ad.expanded_text_ad
      eta = recommended_ad.expanded_text_ad
      puts sprintf("\tHeadline 1 = '%s'\n\tHeadline2 = '%s'\n" +
          "\tDescription = '%s'", eta.headline_part1, eta.headline_part2,
          eta.description)
    end
    if recommended_ad.display_url
      puts sprintf("\tDisplay URL = '%s'", recommended_ad.display_url)
    end
    recommended_ad.final_urls.each do |url|
      puts sprintf("\tFinal Url = '%s'", url)
    end
    recommended_ad.final_mobile_urls.each do |url|
      puts sprintf("\tFinal Mobile Url = '%s'", url)
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
    get_text_ad_recommendations(options[:customer_id])
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
