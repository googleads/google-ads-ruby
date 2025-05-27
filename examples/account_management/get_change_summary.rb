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
# This example gets a list of which resources have been changed in your account.

require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

# [START get_change_summary]
def get_change_summary(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Construct a query to find information about changed resources in your
  # account.
  query = <<~QUERY
    SELECT
      change_status.resource_name,
      change_status.last_change_date_time,
      change_status.resource_type,
      change_status.campaign,
      change_status.ad_group,
      change_status.resource_status,
      change_status.ad_group_ad,
      change_status.ad_group_criterion,
      change_status.campaign_criterion
    FROM
      change_status
    WHERE change_status.last_change_date_time DURING LAST_14_DAYS
    ORDER BY
      change_status.last_change_date_time
    LIMIT 10000
  QUERY

  # Execute the query.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  # Process the results.
  response.each do |row|
    cs = row.change_status
    resource_name = case cs.resource_type
    when :AD_GROUP
      cs.ad_group
    when :AD_GROUP_AD
      cs.ad_group_ad
    when :AD_GROUP_CRITERION
      cs.ad_group_criterion
    when :CAMPAIGN
      cs.campaign
    when :CAMPAIGN_CRITERION
      cs.campaign_criterion
    else
      "UNKNOWN"
    end
    puts "On #{cs.last_change_date_time}, change status #{cs.resource_name} " \
         "shows a resource type of #{cs.resource_type} " \
         "with resource name #{resource_name} was #{cs.resource_status}."
  end
end
# [END get_change_summary]

if __FILE__ == $PROGRAM_NAME
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id]
    puts "Usage: #{$0} -c CUSTOMER_ID"
    puts "  -c, --customer-id CUSTOMER-ID          The Google Ads customer ID."
    exit 1
  end

  begin
    get_change_summary(options[:customer_id])
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
