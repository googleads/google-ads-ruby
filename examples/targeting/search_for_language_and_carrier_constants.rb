#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2020 Google LLC
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
# This example illustrates how to:
# 1. Search for language constants where the name includes a given string.
# 2. Search for all the available mobile carrier constants with a given
# country code.

require 'optparse'
require 'google/ads/google_ads'

def search_for_language_and_carrier_constants(
  customer_id,
  language_name,
  carrier_country_code
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  search_for_language_constants(client, customer_id, language_name)
  search_for_carrier_constants(client, customer_id, carrier_country_code)
end

def search_for_language_constants(client, customer_id, language_name)
  # Creates a query that retrieves the language constants where the name
  # includes a given string.
  query = <<~QUERY
    SELECT language_constant.id, language_constant.code,
           language_constant.name, language_constant.targetable
    FROM language_constant
    WHERE language_constant.name LIKE '%#{language_name}%'
  QUERY

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all messages and prints the requested field
  # values for the language constant in each row.
  responses.each do |response|
    response.results.each do |row|
      c = row.language_constant
      puts "Language with ID #{c.id}, code #{c.code}, name #{c.name} and "\
        "targetable #{c.targetable} was found."
    end
  end
end

def search_for_carrier_constants(client, customer_id, carrier_country_code)
  # Creates a query that retrieves the targetable carrier constants
  # by country code.
  query = <<~QUERY
    SELECT carrier_constant.id, carrier_constant.name,
           carrier_constant.country_code
    FROM carrier_constant
    WHERE carrier_constant.country_code = '#{carrier_country_code}'
  QUERY

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all messages and prints the requested field
  # values for the carrier constant in each row.
  responses.each do |response|
    response.results.each do |row|
      c = row.carrier_constant
      puts "Carrier with ID #{c.id}, name #{c.name} and "\
        "country code #{c.country_code} was found."
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  options = {}

  # Default values for language name and carrier country code
  options[:language_name] = "eng"
  options[:carrier_country_code] = "US"

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-L', '--language-name LANGUAGE-NAME', String, 'Language Name') do |v|
      options[:language_name] = v
    end

    opts.on('-R', '--carrier-country-code CARRIER-COUNTRY-CODE', String, 'Carrier Country Code') do |v|
      options[:carrier_country_code] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    search_for_language_and_carrier_constants(
      options.fetch(:customer_id).tr("-", ""),
      options[:language_name],
      options[:carrier_country_code],
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
