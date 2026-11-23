#!/usr/bin/env ruby
# Encoding: utf-8
#
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
#
# This example fetches the available incentives for a user.

require 'bigdecimal'
require 'optparse'
require 'google/ads/google_ads'

# [START fetch_incentives]
def fetch_incentives(email, language_code = 'en', country_code = 'US')
  # GoogleAdsClient will read a config file from a default location
  # if no path is passed.
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Issues the request.
  request_args = {
    email: email.to_s.strip,
    language_code: language_code,
    country_code: country_code,
    # Passing :ACQUISITION as the symbol representation of the IncentiveType enum.
    incentive_type: :ACQUISITION,
  }.compact

  response = client.service.incentive.fetch_incentive(**request_args)

  # Processes the response.
  if response.incentive_offer.nil? || response.incentive_offer.offer_type == :NO_INCENTIVE
    puts 'No incentive offer was found.'
    return
  end

  # If the offer type is CHOOSE_YOUR_OWN_INCENTIVE, there will be 3 incentives in the
  # response. At the time this example was written, all incentive offers are CYO incentive offers.
  if response.incentive_offer.cyo_incentives
    cyo = response.incentive_offer.cyo_incentives
    [cyo.low_offer, cyo.medium_offer, cyo.high_offer].compact.each do |incentive|
      print_incentive_details(incentive)
    end
    unless response.incentive_offer.consolidated_terms_and_conditions_url.empty?
      puts "Consolidated terms and conditions: '#{response.incentive_offer.consolidated_terms_and_conditions_url}'"
    end
  else
    puts 'Incentive offer is not a CHOOSE_YOUR_OWN_INCENTIVE type. ' \
      'Non-CYO offers are not supported by this example.'
  end
end

def print_incentive_details(incentive)
  return if incentive.nil?

  puts '=' * 68
  puts "Incentive ID: '#{incentive.incentive_id}'"
  puts "Incentive requirement: '#{format_requirement(incentive.requirement)}'"
  unless incentive.incentive_terms_and_conditions_url.empty?
    puts "Incentive terms and conditions: '#{incentive.incentive_terms_and_conditions_url}'"
  end
  puts '=' * 68
end

def format_requirement(requirement)
  return 'No requirements' if requirement.nil?

  if requirement.spend
    spend = requirement.spend
    required = format_money(spend.required_amount)
    award = format_money(spend.award_amount)
    "Spend #{required} to receive #{award}"
  else
    'Unsupported requirement type'
  end
end

def format_money(money)
  return 'N/A' if money.nil?

  amount = BigDecimal(money.units) + (BigDecimal(money.nanos) / 1_000_000_000)
  currency = money.currency_code.empty? ? '' : " #{money.currency_code}"

  format('%.2f%s', amount, currency)
end
# [END fetch_incentives]

if __FILE__ == $PROGRAM_NAME
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
    opts.banner = "Usage: #{File.basename(__FILE__)} [options]"

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

  begin
    fetch_incentives(
      options.fetch(:email),
      options[:language_code],
      options[:country_code],
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      $stderr.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          $stderr.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        $stderr.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
