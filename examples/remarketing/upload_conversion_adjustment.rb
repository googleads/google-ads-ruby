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

# [START upload_conversion_adjustment]
def upload_conversion_adjustment(
  customer_id,
  conversion_action_id,
  order_id,
  adjustment_type,
  adjustment_date_time,
  restatement_value
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Applies the conversion adjustment to the existing conversion.
  conversion_adjustment = client.resource.conversion_adjustment do |ca|
    ca.conversion_action = client.path.conversion_action(customer_id, conversion_action_id)
    ca.adjustment_type = adjustment_type
    ca.order_id = order_id
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
      puts "Uploaded conversion adjustment for conversion action #{result.conversion_action} "\
        "and order ID #{result.order_id}."
    end
  else
    # Print any partial errors returned.
    failures = client.decode_partial_failure_error(response.partial_failure_error)
    puts 'Request failed. Failure details:'
    failures.each do |failure|
      failure.errors.each do |error|
        index = error.location.field_path_elements.first.index
        puts "\toperation[#{index}] #{error.error_code.error_code}: #{error.message}"
      end
    end
  end
end
# [END upload_conversion_adjustment]

if __FILE__ == $0
  options = {}
  # Running the example with -h will print the command line usage.

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

    opts.on('-O', '--order-id ORDER-ID', String,
            'The transaction ID of the conversion to adjust. Required if the conversion being '\
            'adjusted meets the criteria described at '\
            'https://developers.google.com/google-ads/api/docs/conversions/upload-adjustments#requirements.'
        ) do |v|
      options[:order_id] = v
    end

    opts.on('-a', '--adjustment-type ADJUSTMENT-TYPE', String,
            'RETRACTION negates a conversion, and RESTATEMENT changes the value of a conversion.') do |v|
      options[:adjustment_type] = v
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
      options.fetch(:order_id),
      options.fetch(:adjustment_type).to_sym,
      options.fetch(:adjustment_date_time),
      options[:restatement_value]
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
