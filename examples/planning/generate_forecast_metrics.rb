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


# This example generates forecast metrics for keyword planning.
#
# For more details see this guide:
# https://developers.google.com/google-ads/api/docs/keyword-planning/generate-forecast-metrics

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START generate_forecast_metrics]
def generate_forecast_metrics(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  campaign_to_forecast = create_campaign_to_forecast(client)

  # Generates forecast metrics and prints the results.
  keyword_plan_idea_service = client.service.keyword_plan_idea

  # Set the forecast range. Repeat forecasts with different horizons to get a
  # holistic picture.

  forecast_period = client.resource.date_range do |p|
    tomorrow = Date.today + 1
    p.start_date = tomorrow.strftime("%Y-%m-%d")

    # Set the forecast end date to 30 days from today.
    thirty_days_from_now = Date.today + 30
    p.end_date = thirty_days_from_now.strftime("%Y-%m-%d")
  end

  response = keyword_plan_idea_service.generate_keyword_forecast_metrics(
    customer_id: customer_id,
    campaign: campaign_to_forecast,
    forecast_period: forecast_period,
  )

  metrics = response.campaign_forecast_metrics
  puts "Estimated daily clicks: #{metrics.clicks}"
  puts "Estimated daily impressions: #{metrics.impressions}"
  puts "Estimated daily average CPC: #{metrics.average_cpc_micros}"
end

def create_campaign_to_forecast(client)
    campaign_to_forecast = client.resource.campaign_to_forecast do |c|
        c.keyword_plan_network = :GOOGLE_SEARCH

        c.bidding_strategy = client.resource.campaign_bidding_strategy do |bs|
            bs.manual_cpc_bidding_strategy = client.resource.manual_cpc_bidding_strategy do |mbs|
                mbs.max_cpc_bid_micros = 1000000
            end
        end

        criterion_bid_modifier = client.resource.criterion_bid_modifier

        # For the list of geo target IDs, see:
        # https://developers.google.com/google-ads/api/reference/data/geotargets
        # Geo target constant 2840 is for USA.
        criterion_bid_modifier.geo_target_constant = client.path.geo_target_constant("2840")

        c.geo_modifiers << criterion_bid_modifier

        # For the list of language criteria IDs, see:
        # https://developers.google.com/google-ads/api/reference/data/codes-formats#languages
        # Language criteria 1000 is for English.
        language_constant = client.path.language_constant("1000")  # English
        c.language_constants << language_constant

        # Create forecast ad groups based on themes such as creative relevance,
        # product category, or cost per click.
        forecast_ad_group = client.resource.forecast_ad_group

        biddable_keyword_1 = client.resource.biddable_keyword do |bk|
            bk.max_cpc_bid_micros = 1500000
            bk.keyword = client.resource.keyword_info do |k|
                k.text = "mars cruise"
                k.match_type = :BROAD
              end
        end

        biddable_keyword_2 = client.resource.biddable_keyword do |bk|
            bk.max_cpc_bid_micros = 2500000
            bk.keyword = client.resource.keyword_info do |k|
                k.text = "cheap cruise"
                k.match_type = :PHRASE
              end
        end

        biddable_keyword_3 = client.resource.biddable_keyword do |bk|
            bk.max_cpc_bid_micros = 1990000
            bk.keyword = client.resource.keyword_info do |k|
                k.text = "cheap cruise"
                k.match_type = :EXACT
              end
        end

        forecast_ad_group.biddable_keywords << biddable_keyword_1
        forecast_ad_group.biddable_keywords << biddable_keyword_2
        forecast_ad_group.biddable_keywords << biddable_keyword_3

        # Create and configure a negative keyword, then add it to the forecast ad
        # group.
        negative_keyword = client.resource.keyword_info do |k|
            k.text = "moon walk"
            k.match_type = :BROAD
          end
        forecast_ad_group.negative_keywords << negative_keyword

        c.ad_groups << forecast_ad_group
    end

    return campaign_to_forecast
end
# [END generate_forecast_metrics]


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
