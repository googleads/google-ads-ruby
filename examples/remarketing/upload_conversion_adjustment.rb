#!/usr/bin/env ruby

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
# This example imports conversion adjustments for conversions that already exist.
# To set up a conversion action, run add_conversion_action.rb.

require 'optparse'
require 'google/ads/google_ads'

def upload_conversion_adjustment(
  customer_id,
  conversion_action_id,
  gclid,
  adjustment_type,
  conversion_date_time,
  adjustment_date_time,
  restatement_value
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Associate conversion adjustments with the existing conversion action.
  # The GCLID should have been uploaded before with a conversion.
  conversion_adjustment = client.resource.conversion_adjustment do |ca|
    ca.conversion_action = client.path.conversion_action(customer_id, conversion_action_id)
    ca.adjustment_type = adjustment_type
    ca.gclid_date_time_pair = client.resource.gclid_date_time_pair do |gdtp|
      gdtp.gclid = gclid
      gdtp.conversion_date_time = conversion_date_time
    end
    ca.adjustment_date_time = adjustment_date_time

    # Set adjusted value for adjustment type RESTATEMENT.
    if adjustment_type == :RESTATEMENT
      ca.restatement_value = client.resource.restatement_value do |ra|
        ra.adjusted_value = restatement_value.to_f
      end
    end
  end

  # Issue a request to upload the conversion adjustment(s).
  response = client.service.conversion_adjustment_upload.upload_conversion_adjustments(
    customer_id: customer_id,
    # This example shows just one adjustment but you may upload multiple ones.
    conversion_adjustments: [conversion_adjustment],
    partial_failure: true
  )

  if response.partial_failure_error.nil?
    # Process and print all results for multiple adjustments
    response.results.each do |result|
      puts "Uploaded conversion adjustment at #{result.adjustment_date_time} " \
      "for adjustment #{result.adjustment_type} to #{result.conversion_action}."
    end
  else
    # Print any partial errors returned.
    failures = client.decode_partial_failure_error(response.partial_failure_error)
    puts 'Request failed. Failure details:'
    failures.each do |failure|
      failure.errors.each do |error|
        puts "\t#{error.error_code.error_code}: #{error.message}"
      end
    end
  end
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
  options[:conversion_action_id] = 'INSERT_CONVERSION_ACTION_ID_HERE'
  options[:gclid] = 'INSERT_GCLID_HERE'
  # RETRACTION negates a conversion, and RESTATEMENT changes the value of a
  # conversion.
  options[:adjustment_type] = 'INSERT_ADJUSTMENT_TYPE_HERE'
  options[:conversion_date_time] = 'INSERT_CONVERSION_DATE_TIME_HERE'
  options[:adjustment_date_time] = 'INSERT_ADJUSTMENT_DATE_TIME_HERE'
  # Optional: Specify an adjusted value below for adjustment type RESTATEMENT.
  # This value will be ignored if you specify RETRACTION as adjustment type.
  options[:restatement_value] = 'INSERT_RESTATEMENT_VALUE_HERE'

  OptionParser.new do |opts|
    opts.banner = format('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--conversion-action-id CONVERSION-ACTION-ID', String,
            'Conversion Action ID') do |v|
      options[:conversion_action_id] = v
    end

    opts.on('-g', '--gclid GCLID', String,
            'Google Click ID (should be newer than the number of days set on '\
            'the conversion window of the conversion action).') do |v|
      options[:gclid] = v
    end

    opts.on('-a', '--adjustment-type ADJUSTMENT-TYPE', String,
            'Adjustment Type, e.g. RETRACTION, RESTATEMENT') do |v|
      options[:adjustment_type] = v
    end

    opts.on('-o', '--conversion-date-time CONVERSION-DATE-TIME', String,
            'The date and time of the conversion (should be after click time).'\
            ' The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm", '\
            'e.g. "2019-01-01 12:32:45-08:00".') do |v|
      options[:conversion_date_time] = v
    end

    opts.on('-A', '--adjustment-date-time ADJUSTMENT-DATE-TIME', String,
            'The date and time of the adjustment. '\
            'The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm", '\
            'e.g. "2019-01-01 12:32:45-08:00".') do |v|
      options[:adjustment_date_time] = v
    end

    opts.on('-r', '--restatement-value RESTATEMENT-VALUE', String,
            '[optional] The adjusted value for adjustment type RESTATEMENT.') do |v|
      options[:restatement_value] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_conversion_adjustment(
      options.fetch(:customer_id).tr('-', ''),
      options.fetch(:conversion_action_id),
      options.fetch(:gclid),
      options.fetch(:adjustment_type).to_sym,
      options.fetch(:conversion_date_time),
      options.fetch(:adjustment_date_time),
      options.fetch(:restatement_value)
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      error.location&.field_path_elements&.each do |field_path_element|
        STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED

        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
