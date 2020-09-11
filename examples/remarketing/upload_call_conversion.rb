#!/usr/bin/env ruby
# Encoding: utf-8
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
# This example imports offline call conversion values for calls related to the
# ads in your account.
# To set up a conversion action, run the add_conversion_action.rb example.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def upload_call_conversion(customer_id, conversion_action_id, caller_id,
  call_start_date_time, conversion_date_time, conversion_value)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create a call conversion by specifying currency as USD.
  call_conversion = client.resource.call_conversion do |c|
    c.conversion_action = client.path.conversion_action(
      customer_id, conversion_action_id)
    c.caller_id = caller_id
    c.call_start_date_time = call_start_date_time
    c.conversion_date_time = conversion_date_time
    c.conversion_value = conversion_value
    c.currency_code = "USD"
  end

  # Issues a request to upload the call conversion.
  response = client.service.conversion_upload.upload_call_conversions(
    customer_id: customer_id,
    conversions: [call_conversion],
    partial_failure: true
  )

  # Prints errors if any partial failure error is returned.
  if response.partial_failure_error
    failures = client.decode_partial_failure_error(response.partial_failure_error)
    failures.each do |failure|
      failure.errors.each do |error|
        human_readable_error_path = error
          .location
          .field_path_elements
          .map { |location_info|
            if location_info.index
              "#{location_info.field_name}[#{location_info.index}]"
            else
              "#{location_info.field_name}"
            end
          }.join(" > ")

        errmsg =  "error occured while adding operations " \
          "#{human_readable_error_path}" \
          " with value: #{error.trigger.string_value}" \
          " because #{error.message.downcase}"
        puts errmsg
      end
    end
  else
    # Print the result if valid.
    uploaded_call_conversion = response.results.first
    puts "Uploaded call conversion that occurred at " \
      "#{uploaded_call_conversion.call_start_date_time} " \
      "for caller ID " \
      "#{uploaded_call_conversion.caller_id} " \
      "to the conversion action with resource name " \
      "#{uploaded_call_conversion.conversion_action}"
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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-R', '--conversion-action-id CONVERSION-ACTION-ID', String, 'Conversion Action ID') do |v|
      options[:conversion_action_id] = v
    end

    opts.on('-L', '--caller-id CALLER-ID', String, 'Caller ID') do |v|
      options[:caller_id] = v
    end

    opts.on('-S', '--call-start-date-time CALL-START-DATE-TIME', String, 'Call Start Date Time') do |v|
      options[:call_start_date_time] = v
    end

    opts.on('-D', '--conversion-date-time CONVERSION-DATE-TIME', String, 'Conversion Date Time') do |v|
      options[:conversion_date_time] = v
    end

    opts.on('-V', '--conversion-value CONVERSION-VALUE', String, 'Conversion Value') do |v|
      options[:conversion_value] = v.to_f
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_call_conversion(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:conversion_action_id),
      options.fetch(:caller_id),
      options.fetch(:call_start_date_time),
      options.fetch(:conversion_date_time),
      options.fetch(:conversion_value),
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
