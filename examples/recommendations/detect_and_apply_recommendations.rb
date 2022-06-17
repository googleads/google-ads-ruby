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
# The auto-apply feature, which automatically applies recommendations as they
# become eligible, is currently supported by the Google Ads UI but not by the
# Google Ads API. See https://support.google.com/google-ads/answer/10279006 for
# more information on using auto-apply in the Google Ads UI.
#
# This example demonstrates how an alternative can be implemented with the
# features that are currently supported by the Google Ads API. It periodically
# retrieves and applies `KEYWORD` recommendations with default parameters.

require 'optparse'
require 'google/ads/google_ads'

def detect_and_apply_recommendations(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~QUERY
    SELECT recommendation.resource_name
    FROM recommendation
    WHERE recommendation.type = KEYWORD
    LIMIT #{MAX_RESULT_SIZE}
  QUERY

  reccomendation_service = client.service.recommendation
  google_ads_service = client.service.google_ads
  NUMBER_OF_RUNS.times do |i|
    search_response = google_ads_service.search(
      customer_id: customer_id,
      query: query,
    )
    operations = search_response.map do |row|
      client.operation.apply_recommendation do |aro|
        aro.resource_name = row.recommendation.resource_name
      end
    end

    unless operations.empty?
      response = recommendation_service.apply_recommendation(
        customer_id: customer_id,
        operations: operations,
      )

      response.each do |result|
        puts "Applied recommendation with resource name #{result.resource_name}."
      end
    end

    if i < NUMBER_OF_RUNS - 1
      puts "Waiting #{PERIOD_IN_SECONDS} seconds before applying more recommendations."
      sleep(PERIOD_IN_SECONDS)
    end
  end
end

if __FILE__ == $0
  MAX_RESULT_SIZE = 2
  NUMBER_OF_RUNS = 3
  PERIOD_IN_SECONDS = 5

  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.

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
    detect_and_apply_recommendations(options.fetch(:customer_id).tr("-", ""))
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
