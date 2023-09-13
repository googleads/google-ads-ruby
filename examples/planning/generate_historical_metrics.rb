#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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


# This example generates historical metrics for keyword planning.
#
# For more details see this guide:
# https://developers.google.com/google-ads/api/docs/keyword-planning/generate-historical-metrics

require 'optparse'
require 'google/ads/google_ads'
require "google/ads/google_ads/v14/services"
require 'date'

# [START generate_forecast_metrics]
def generate_forecast_metrics(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Generates historical metrics and prints the results.
  keyword_plan_idea_service = client.service.keyword_plan_idea

  response = keyword_plan_idea_service.generate_keyword_historical_metrics(
    customer_id: customer_id,
    keywords: ["mars cruise", "cheap cruise", "jupiter cruise"],
    keyword_plan_network: :GOOGLE_SEARCH,

    # For the list of geo target IDs, see:
    # https://developers.google.com/google-ads/api/reference/data/geotargets
    # Geo target constant 2840 is for USA.
    geo_target_constants: [client.path.geo_target_constant("2840")],

    # Language criteria 1000 is for English.
    # For the list of language criteria IDs, see:
    # https://developers.google.com/google-ads/api/reference/data/codes-formats#languages
    language: client.path.language_constant("1000"),
  )

  for result in response.results
    metrics = result.keyword_metrics
    # These metrics include those for both the search query and any variants
    # included in the response.
    puts"The search query '#{result.text}' (and the following variants: " \
        "'#{result.close_variants}'), " \
        "generated the following historical metrics:\n"


    # Approximate number of monthly searches on this query averaged for the
    # past 12 months.
    puts "\tApproximate monthly searches: #{metrics.avg_monthly_searches}"

    # The competition level for this search query.
    puts "\tCompetition level: #{metrics.competition}"

    # The competition index for the query in the range [0, 100]. This shows
    # how competitive ad placement is for a keyword. The level of
    # competition from 0-100 is determined by the number of ad slots filled
    # divided by the total number of ad slots available. If not enough data
    # is available, undef will be returned.
    puts "\tCompetition index: #{metrics.competition_index}"

    # Top of page bid low range (20th percentile) in micros for the keyword.
    puts "\tTop of page bid low range: #{metrics.low_top_of_page_bid_micros}"

    # Top of page bid high range (80th percentile) in micros for the
    # keyword.
    puts"\tTop of page bid high range: "
        "#{metrics.high_top_of_page_bid_micros}"

    # Approximate number of searches on this query for the past twelve
    # months.
    for month in metrics.monthly_search_volumes
      puts "\tApproximately #{month.monthly_searches} searches in "
           "#{month.month.name}, #{month.year}"
    end
  end
end
# [END generate_forecast_metrics]


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
    generate_forecast_metrics(options.fetch(:customer_id).tr("-", ""))
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
