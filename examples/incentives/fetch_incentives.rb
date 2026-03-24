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
# This example returns incentives for a given user.
#
# To apply an incentive, use apply_incentive.rb.

require "optparse"
require "google/ads/google_ads"

# [START fetch_incentives]
def fetch_incentives(email_address, language_code, country_code)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  response = client.service.incentive.fetch_incentive(
    email: email_address,
    language_code: language_code,
    country_code: country_code
  )

  if response.incentive_offer&.cyo_incentives
    puts "Fetched incentive."
    # If the offer type is CHOOSE_YOUR_OWN_INCENTIVE, there will be three
    # incentives in the response. At the time this example was written, all
    # incentive offers are CYO incentive offers.
    cyo_incentives = response.incentive_offer.cyo_incentives
    puts cyo_incentives.low_offer.inspect
    puts cyo_incentives.medium_offer.inspect
    puts cyo_incentives.high_offer.inspect
  else
    puts "No incentives found."
  end
end
# [END fetch_incentives]

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
  options[:email_address] = "INSERT_EMAIL_ADDRESS_HERE"
  options[:language_code] = "en"
  options[:country_code] = "US"

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: %s [options]", File.basename(__FILE__))

    opts.separator ""
    opts.separator "Options:"

    opts.on("-e", "--email-address EMAIL-ADDRESS", String, "The email of the user to fetch incentives for") do |v|
      options[:email_address] = v
    end

    opts.on("-l", "--language-code LANGUAGE-CODE", String, "The language code of the user (e.g. 'en')") do |v|
      options[:language_code] = v
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
    fetch_incentives(
      options.fetch(:email_address),
      options.fetch(:language_code),
      options.fetch(:country_code)
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
