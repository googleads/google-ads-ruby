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
# Recommendations should be applied shortly after they're retrieved. Depending
# on the recommendation type, a recommendation can become obsolete quickly, and
# obsolete recommendations throw an error when applied. For more details, see:
# https://developers.google.com/google-ads/api/docs/recommendations#take_action
#
# As of Google Ads API v15 users can subscribe to certain recommendation types
# to apply them automatically. For more details, see:
# https://developers.google.com/google-ads/api/docs/recommendations#auto-apply
#
# As of Google Ads API v16 users can proactively generate certain recommendation
# types during the campaign construction process. For more details see:
# https://developers.google.com/google-ads/api/docs/recommendations#recommendations-in-campaign-construction

require 'optparse'
require 'google/ads/google_ads'

def detect_and_apply_recommendations(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START detect_keyword_recommendations]
  query = <<~QUERY
    SELECT recommendation.resource_name, recommendation.campaign,
        recommendation.keyword_recommendation
    FROM recommendation
    WHERE recommendation.type = KEYWORD
  QUERY

  google_ads_service = client.service.google_ads

  response = google_ads_service.search(
    customer_id: customer_id,
    query: query,
  )

  operations = response.each do |row|
    recommendation = row.recommendation

    puts "Keyword recommendation ('#{recommendation.resource_name}') was found for "\
      "campaign '#{recommendation.campaign}'."

    if recommendation.keyword_recommendation
      keyword = recommendation.keyword_recommendation.keyword
      puts "\tKeyword = '#{keyword.text}'\n\ttype = '#{keyword.match_type}'"
    end

    build_recommendation_operation(client, recommendation.resource_name)
  end
  # [END detect_keyword_recommendations]

  if operations
    apply_recommendations(client, customer_id, recommendation.resource_name)
  end
end


# [START build_apply_recommendation_operation]
def build_recommendation_operation(client, recommendation)
  # If you have a recommendation_id instead of the resournce_name
  # you can create a resource name from it like this:
  # recommendation_resource =
  #    client.path.recommendation(customer_id, recommendation_id)

  operations = client.operation.apply_recommendation
  operations.resource_name = recommendation_resource

  # Each recommendation type has optional parameters to override the recommended
  # values. This is an example to override a recommended ad when a
  # TextAdRecommendation is applied.
  # For details, please read
  # https://developers.google.com/google-ads/api/reference/rpc/google.ads.google_ads.v1.services#google.ads.google_ads.v1.services.ApplyRecommendationOperation
  #
  # text_ad_parameters = client.resource.text_ad_parameters do |tap|
  #   tap.ad = client.resource.ad do |ad|
  #     ad.id = "INSERT_AD_ID_AS_INTEGER_HERE"
  #   end
  # end
  # operation.text_ad = text_ad_parameters
  #
  # For more details, see:
  # https://developers.google.com/google-ads/api/reference/rpc/latest/ApplyRecommendationOperation#apply_parameters

  return operation
end
# [END build_apply_recommendation_operation]


# [START apply_recommendation]
def apply_recommendations(client, customer_id, operations)
  # Issues a mutate request to apply the recommendation.
  recommendation_service = client.service.recommendation

  response = recommendation_service.apply_recommendation(
    customer_id: customer_id,
    operations: [operations],
  )

  response.results.each do |applied_recommendation|
    puts "Applied recommendation with resource name: '#{applied_recommendation.resource_name}'."
  end
end
# [END apply_recommendation]

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
