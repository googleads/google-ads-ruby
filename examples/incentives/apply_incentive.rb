#!/usr/bin/env ruby

#
# Copyright 2025 Google LLC
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
# This example applies an incentive to a user's account.
#
# This example is a no-op if the user already has an accepted incentive. If the
# user attempts to apply a new incentive, the response will simply return the
# existing incentive that has already been applied to the account. Use the
# fetch_incentives.rb example to get the available incentives.

require "optparse"
require "google/ads/google_ads"

# [START apply_incentive]
def apply_incentive(customer_id, incentive_id, country_code)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  request_params = {
    customer_id: customer_id,
    selected_incentive_id: incentive_id
  }

  if country_code
    request_params[:country_code] = country_code
  end

  response = client.service.incentive.apply_incentive(request_params)

  puts "Applied incentive."
  puts "Coupon Code: #{response.coupon_code}"
  puts "Creation Time: #{response.creation_time}"
end
# [END apply_incentive]

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
  options[:customer_id] = "INSERT_CUSTOMER_ID_HERE"
  options[:incentive_id] = "INSERT_INCENTIVE_ID_HERE"

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: %s [options]", File.basename(__FILE__))

    opts.separator ""
    opts.separator "Options:"

    opts.on("-c", "--customer-id CUSTOMER-ID", String, "The Google Ads customer ID") do |v|
      options[:customer_id] = v
    end

    opts.on("-i", "--incentive-id INCENTIVE-ID", Integer, "The incentive ID to select") do |v|
      options[:incentive_id] = v
    end

    opts.on("-k", "--country-code COUNTRY-CODE", String, "The country code of the user (e.g. 'US')") do |v|
      options[:country_code] = v
    end

    opts.separator ""
    opts.separator "Help:"

    opts.on_tail("-h", "--help", "Show this message") do
      puts opts
      exit
    end
  end.parse!

  begin
    apply_incentive(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:incentive_id),
      options[:country_code]
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      $stderr.printf("Error with message: %s\n", error.message)
      error.location&.field_path_elements&.each do |field_path_element|
        $stderr.printf("\tOn field: %s\n", field_path_element.field_name)
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        $stderr.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
