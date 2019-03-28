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
#
# This example generates forecast metrics for a keyword plan. To create a
# keyword plan, run add_keyword_plan.rb.

require 'optparse'
require 'google/ads/google_ads'

def generate_forecast_metrics(customer_id, keyword_plan_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  kp_service = client.service(:KeywordPlan)
  response = kp_service.generate_forecast_metrics(
    client.path.keyword_plan(customer_id, keyword_plan_id)
  )

  response.keyword_forecasts.each_with_index do |forecast, i|
    metrics = forecast.keyword_forecast
    puts "#{i + 1}) Keyword ID: #{forecast.keyword_plan_ad_group_keyword}"
    clicks = if metrics.clicks.nil?
               "unspecified"
             else
               format("%.2f", metrics.clicks)
             end
    puts "Estimated daily clicks: #{clicks}"
    impressions = if metrics.impressions.nil?
                    "unspecified"
                  else
                    format("%.2f", metrics.impressions)
                  end
    puts "Estimated daily impressions: #{impressions}"
    cpc = if metrics.average_cpc.nil?
            "unspecified"
          else
            metrics.average_cpc
          end
    puts "Estimated average cpc (micros): #{cpc}"
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
  options[:keyword_plan_id] = 'INSERT_KEYWORD_PLAN_ID_HERE'

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
    generate_forecast_metrics(
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
