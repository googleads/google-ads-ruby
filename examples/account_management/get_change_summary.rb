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

require 'optparse'
require 'google/ads/google_ads'

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
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

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
    get_change_summary(options.fetch(:customer_id).tr("-", ""))
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
