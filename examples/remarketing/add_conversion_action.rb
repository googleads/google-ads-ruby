#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
# This code example illustrates adding a conversion action.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_conversion_action(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  conversion_action_service = client.service(:ConversionAction)

  # Create a value settings object.
  value_settings = client.resource(:ValueSettings)
  value_settings.default_value = client.wrapper.double(15)
  value_settings.always_use_default_value = client.wrapper.bool(true)

  # Add a conversion action.
  conversion_action = client.resource(:ConversionAction)
  conversion_action.name = client.wrapper.string(
      sprintf('Earth to Mars Cruises Conversion %s',(Time.new.to_f * 100).to_i))
  conversion_action.type = client.enum(:ConversionActionType)::UPLOAD_CLICKS
  conversion_action.category = client.enum(:ConversionActionCategory)::DEFAULT
  conversion_action.status = client.enum(:ConversionActionStatus)::ENABLED
  conversion_action.view_through_lookback_window_days = client.wrapper.int64(15)
  conversion_action.value_settings = value_settings

  # Create the operation.
  conversion_action_operation = client.operation(:ConversionAction)
  conversion_action_operation['create'] = conversion_action

  # Add the ad group ad.
  response = conversion_action_service.mutate_conversion_actions(
      customer_id, [conversion_action_operation])

  puts sprintf('New conversion action with resource name = %s.',
      response.results.first.resource_name)
end

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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

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
    add_conversion_action(options[:customer_id])
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end

