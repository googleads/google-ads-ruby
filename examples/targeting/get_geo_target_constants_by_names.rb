#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2018 Google LLC
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
# This code example illustrates getting GeoTargetConstants by given
# location names

require 'optparse'
require 'google/ads/google_ads'

def get_geo_target_constants_by_names
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  gtc_service = client.service.geo_target_constant

  location_names = client.resource.location_names do |ln|
    ['Paris', 'Quebec', 'Spain', 'Deutschland'].each do |name|
      ln.names << name
    end
  end

  # Locale is using ISO 639-1 format. If an invalid locale is given,
  # 'en' is used by default.
  locale = 'en'

  # A list of country codes can be referenced here:
  # https://developers.google.com/adwords/api/docs/appendix/geotargeting
  country_code = 'FR'

  response = gtc_service.suggest_geo_target_constants(
    locale: locale,
    country_code: country_code,
    location_names: location_names
  )

  response.geo_target_constant_suggestions.each do |suggestion|
    puts sprintf("%s (%s,%s,%s,%s) is found in locale (%s) with reach (%d)" \
        " from search term (%s).", suggestion.geo_target_constant.resource_name,
        suggestion.geo_target_constant.name,
        suggestion.geo_target_constant.country_code,
        suggestion.geo_target_constant.target_type,
        suggestion.geo_target_constant.status,
        suggestion.locale,
        suggestion.reach,
        suggestion.search_term)
  end
end

if __FILE__ == $PROGRAM_NAME
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s ', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_geo_target_constants_by_names
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
