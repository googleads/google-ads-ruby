#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# This example gets specific details about the most recent changes in your
# account, including which field changed and the old and new values.

require 'date'
require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

# [START get_change_details]
def get_change_details(customer_id, start_date_str, end_date_str)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Format dates from YYYYMMDD to YYYY-MM-DD for the GAQL query.
  # The API expects dates in 'YYYY-MM-DD' format.
  start_date_formatted = Date.strptime(start_date_str, '%Y%m%d').strftime('%Y-%m-%d')
  end_date_formatted = Date.strptime(end_date_str, '%Y%m%d').strftime('%Y-%m-%d')

  # Construct a query to find details for recent changes in your account.
  # The LIMIT clause is required for the change_event resource.
  # The maximum size is 10000, but a low limit was set here for demonstrative
  # purposes.
  # The WHERE clause on change_date_time is also required. It must specify a
  # window of at most 30 days within the past 30 days.
  query = <<~QUERY
    SELECT
      change_event.resource_name,
      change_event.change_date_time,
      change_event.change_resource_name,
      change_event.user_email,
      change_event.client_type,
      change_event.change_resource_type,
      change_event.old_resource,
      change_event.new_resource,
      change_event.resource_change_operation,
      change_event.changed_fields
    FROM
      change_event
    WHERE
      change_event.change_date_time <= '#{end_date_formatted}'
      AND change_event.change_date_time >= '#{start_date_formatted}'
    ORDER BY
      change_event.change_date_time DESC
    LIMIT 5
  QUERY

  # Execute the query to fetch results from the API.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  # Process the results and output changes.
  response.each do |row|
    event = row.change_event
    old_resource, new_resource = case event.change_resource_type
    when :AD
      [event.old_resource.ad, event.new_resource.ad]
    when :AD_GROUP
      [event.old_resource.ad_group, event.new_resource.ad_group]
    when :AD_GROUP_AD
      [event.old_resource.ad_group_ad, event.new_resource.ad_group_ad]
    when :AD_GROUP_ASSET
      [event.old_resource.ad_group_asset, event.new_resource.ad_group_asset]
    when :AD_GROUP_CRITERION
      [event.old_resource.ad_group_criterion, event.new_resource.ad_group_criterion]
    when :AD_GROUP_BID_MODIFIER
      [event.old_resource.ad_group_bid_modifier, event.new_resource.ad_group_bid_modifier]
    when :ASSET
      [event.old_resource.asset, event.new_resource.asset]
    when :ASSET_SET
      [event.old_resource.asset_set, event.new_resource.asset_set]
    when :ASSET_SET_ASSET
      [event.old_resource.asset_set_asset, event.new_resource.asset_set_asset]
    when :CAMPAIGN
      [event.old_resource.campaign, event.new_resource.campaign]
    when :CAMPAIGN_ASSET
      [event.old_resource.campaign_asset, event.new_resource.campaign_asset]
    when :CAMPAIGN_ASSET_SET
      [event.old_resource.campaign_asset_set, event.new_resource.campaign_asset_set]
    when :CAMPAIGN_BUDGET
      [event.old_resource.campaign_budget, event.new_resource.campaign_budget]
    when :CAMPAIGN_CRITERION
      [event.old_resource.campaign_criterion, event.new_resource.campaign_criterion]
    # :ASSET is already listed above, this one is a duplicate.
    # when :ASSET
    #   [event.old_resource.asset, event.new_resource.asset]
    when :CUSTOMER_ASSET
      [event.old_resource.customer_asset, event.new_resource.customer_asset]
    else
      puts "Unknown change_resource_type #{event.change_resource_type}."
      next
    end
    puts "On #{event.change_date_time}, user #{event.user_email} used interface " \
      "#{event.client_type} to perform a(n) #{event.resource_change_operation} " \
      "operation on a #{event.change_resource_type} with resource name " \
      "#{event.change_resource_name}."
    if [:UPDATE, :CREATE].include? event.resource_change_operation
      event.changed_fields.paths.each do |changed_field|
        new_value = get_value_from_path(changed_field, new_resource)
        if :CREATE == event.resource_change_operation
          puts "\t#{changed_field} set to '#{new_value}'."
        else
          old_value = get_value_from_path(changed_field, old_resource)
          puts "\t#{changed_field} changed from '#{old_value}' to '#{new_value}'."
        end
      end
    end
  end
end

# Given the string value of a path from the response, look up the value of the
# field located at that path on the given object.
def get_value_from_path(path, object)
  path.split(".").inject(object) {|obj, key| obj.send(key)}
end
# [END get_change_details]

if __FILE__ == $PROGRAM_NAME
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id] && options[:start_date] && options[:end_date]
    puts "Usage: #{$0} -c CUSTOMER_ID --start-date START_DATE --end-date END_DATE"
    puts "  -c, --customer-id CUSTOMER-ID          The Google Ads customer ID."
    puts "      --start-date START-DATE            Start date for change history (YYYYMMDD)."
    puts "      --end-date END-DATE                End date for change history (YYYYMMDD)."
    exit 1
  end

  begin
    get_change_details(
      options[:customer_id],
      options[:start_date],
      options[:end_date]
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
