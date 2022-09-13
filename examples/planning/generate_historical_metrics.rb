#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2022 Google LLC
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
# This example generates historical metrics for a keyword plan. To create a
# keyword plan, run add_keyword_plan.rb.

require 'optparse'
require 'google/ads/google_ads'

# [START generate_historical_metrics]
def generate_historical_metrics(customer_id, keyword_plan_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  kp_service = client.service.keyword_plan
  response = kp_service.generate_historical_metrics(
    keyword_plan: client.path.keyword_plan(customer_id, keyword_plan_id),
  )

  response.metrics.each do |metric|
    puts "The search query '#{metric.search_query}' (and the following " +
      "variants: #{metric.close_variants.join(', ')}) generated the " +
      "following historical metrics:"

    # Approximate number of monthly searches on this query averaged for
    # the past 12 months.
    puts "\tApproximate monthly searches: #{metric.keyword_metrics.avg_monthly_searches}"

    # The competition level for this search query.
    puts "\tCompetition level: #{metric.keyword_metrics.competition.name}"

    # The competition index for the query in the range [0, 100]. This shows
    # how competitive ad placement is for a keyword. The level of
    # competition from 0-100 is determined by the number of ad slots filled
    # divided by the total number of ad slots available. If not enough data
    # is available, None will be returned.
    puts "\tCompetition index: #{metric.keyword_metrics.competition_index}"

    # Top of page bid low range (20th percentile) in micros for the keyword.
    puts "\tTop of page bid low range: #{metric.keyword_metrics.low_top_of_page_bid_micros}"

    # Top of page bid high range (80th percentile) in micros for the keyword.
    puts "\tTop of page bid high range: #{metric.keyword_metrics.high_top_of_page_bid_micros}"

    # Approximate number of searches on this query for each of the past twelve
    # months.
    metric.keyword_metrics.monthly_search_volumes.each do |month|
      puts "\tApproximately #{month.monthly_searches} searches in #{month.month.name}, #{month.year}"
    end
  end
end
# [END generate_historical_metrics]

if __FILE__ == $0
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-k', '--keyword-plan-id KEYWORD-PLAN-ID', String,
        'Keyword Plan ID') do |v|
      options[:keyword_plan_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    generate_historical_metrics(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:keyword_plan_id)
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
