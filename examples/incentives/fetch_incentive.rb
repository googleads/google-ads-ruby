# frozen_string_literal: true

# Copyright 2026 Google LLC
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

# This example fetches the available incentives for a user.

require 'google/ads/google_ads'
require 'optparse'

# [START fetch_incentive]
def fetch_incentive(email, language_code, country_code)
  # GoogleAdsClient will read a config file from a default location
  # if no path is passed.
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Issues the request.
  response = client.service.incentive.fetch_incentive(
    email: email,
    language_code: language_code,
    country_code: country_code,
    # Passing :ACQUISITION as the symbol representation of the IncentiveType enum.
    type: :ACQUISITION
  )

  # Processes the response.
  if response.incentive_offer.nil?
    puts "No incentive offer was found"
    return
  end

  # If the offer type is CHOOSE_YOUR_OWN_INCENTIVE, there will be 3 incentives in the
  # response. At the time this example was written, all incentive offers are CYO incentive offers.
  if response.incentive_offer.cyo_incentives
    cyo_incentives = response.incentive_offer.cyo_incentives
    print_incentive_details(cyo_incentives.low_offer)
    print_incentive_details(cyo_incentives.medium_offer)
    print_incentive_details(cyo_incentives.high_offer)
  end
end
# [END fetch_incentive]

def print_incentive_details(incentive)
  return if incentive.nil?

  puts "===================================================================="
  puts "Incentive ID: '#{incentive.incentive_id}'"
  puts "Incentive requirement: '#{format_requirement(incentive.requirement)}'"
  puts "Incentive terms and conditions: '#{incentive.incentive_terms_and_conditions_url}'"
  puts "===================================================================="
end

def format_requirement(requirement)
  return 'No requirements' if requirement.nil?

  if requirement.spend
    spend = requirement.spend
    required = format_money(spend.required_amount)
    award = format_money(spend.award_amount)
    "Spend #{required} to receive #{award}"
  else
    requirement.to_s
  end
end

def format_money(money)
  return 'N/A' if money.nil?

  amount = money.units.to_f + (money.nanos.to_f / 1_000_000_000.0)
  sprintf('%.2f %s', amount, money.currency_code)
end

if __FILE__ == $0
  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the default values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:email] = 'INSERT_EMAIL_HERE'
  options[:language_code] = 'en'
  options[:country_code] = 'US'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-E', '--email EMAIL', String, 'Email') do |v|
      options[:email] = v
    end

    opts.on('-L', '--language-code LANGUAGE-CODE', String, 'Language Code') do |v|
      options[:language_code] = v
    end

    opts.on('-K', '--country-code COUNTRY-CODE', String, 'Country Code') do |v|
      options[:country_code] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  # Check if required parameters are present.
  if options[:email].nil? || options[:email] == 'INSERT_EMAIL_HERE'
    puts "Missing required argument: Email is required."
    exit 1
  end

  begin
    fetch_incentive(options[:email], options[:language_code], options[:country_code])
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
