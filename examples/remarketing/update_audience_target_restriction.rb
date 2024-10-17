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
# This example demonstrates how to update the AUDIENCE target restriction of a
# given ad group to bid only.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def update_audience_target_restriction(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a query that retrieves the targeting settings from a given ad group.
  # [START update_audience_target_restriction]
  query = <<~QUERY
    SELECT ad_group.id, ad_group.name,
           ad_group.targeting_setting.target_restrictions
    FROM ad_group
    WHERE ad_group.id = #{ad_group_id}
  QUERY
  # [END update_audience_target_restriction]

  # Issues a search request.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all pages and prints the requested field values
  # for the ad group in each row.
  # Creates a flag that specifies whether or not we should update the targeting
  # setting. We should only do this if we find an AUDIENCE target restriction
  # with bid_only set to false.
  should_update_targeting_setting = false
  target_restrictions = []
  response.each do |row|
    ad_group = row.ad_group
    # Prints the results.
    puts "Ad group with ID #{ad_group.id} and name #{ad_group.name} was found " \
      "with the following targeting restrictions:"

    # Loops through and prints each of the target restrictions.
    # Builds the updated audience target restriction based on the current
    # because Google will overwrite the entire targeting_setting field of the
    # ad group when the field mask includes targeting_setting in an update
    # operation.
    # [START update_audience_target_restriction_1]
    ad_group.targeting_setting.target_restrictions.each do |r|
      # Prints the results.
      targeting_dimension = r.targeting_dimension
      bid_only = r.bid_only
      puts "- Targeting restriction with targeting dimension " \
        "#{targeting_dimension} and bid only set to #{bid_only}."

      # Adds the target restriction to the TargetingSetting object as is if the
      # targeting dimension has a value other than AUDIENCE because those should
      # not change.
      if targeting_dimension != :AUDIENCE
        target_restrictions << r
      elsif !bid_only
        should_update_targeting_setting = true

        # Adds an AUDIENCE target restriction with bid_only set to true to the
        # targeting setting object. This has the effect of setting the AUDIENCE
        # target restriction to "Observation".
        # For more details about the targeting setting, visit
        # https://support.google.com/google-ads/answer/7365594.
        target_restrictions << client.resource.target_restriction do |tr|
          tr.targeting_dimension = :AUDIENCE
          tr.bid_only = true
        end
      end
    end
    # [END update_audience_target_restriction_1]
  end

  # Only updates the TargetingSetting on the ad group if there is an AUDIENCE
  # TargetRestriction with bid_only set to false.
  if should_update_targeting_setting
    new_targeting_setting = client.resource.targeting_setting do |s|
      target_restrictions.each do |restriction|
        s.target_restrictions << restriction
      end
    end
    update_targeting_setting(
      client,
      customer_id,
      ad_group_id,
      new_targeting_setting,
    )
  else
    puts "No target restrictions to update."
  end
end

# Updates the TargetingSetting of an ad group.
# [START update_audience_target_restriction_2]
def update_targeting_setting(
  client,
  customer_id,
  ad_group_id,
  targeting_setting)
  # Constructs an operation that will update the ad group with the specified
  # resource name.
  ad_group_resource_name = client.path.ad_group(customer_id, ad_group_id)
  operation = client.operation.update_resource.ad_group(ad_group_resource_name) do |ag|
    ag.targeting_setting = targeting_setting
  end

  # Issues a mutate request to update the ad group.
  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints the resource name of the updated ad group.
  puts "Updated targeting setting of ad group with resource name " \
    "#{response.results.first.resource_name}; set the AUDIENCE target " \
    "restriction to 'Observation'."
end
# [END update_audience_target_restriction_2]

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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
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
    update_audience_target_restriction(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
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

