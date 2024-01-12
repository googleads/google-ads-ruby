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
# This example imports offline conversion values for specific clicks.
#
# To get Google Click ID for a click, use the "click_view" resource:
# https://developers.google.com/google-ads/api/fields/latest/click_view.
# To set up a conversion action, run the add_conversion_action.rb example.

require 'optparse'
require 'google/ads/google_ads'

# [START upload_offline_conversion]
def upload_offline_conversion(
  customer_id,
  conversion_action_id,
  gclid,
  gbraid,
  wbraid,
  conversion_date_time,
  conversion_value,
  conversion_custom_variable_id,
  conversion_custom_variable_value,
  ad_user_data_consent)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Verifies that exactly one of gclid, gbraid, and wbraid is specified, as required.
  # See https://developers.google.com/google-ads/api/docs/conversions/upload-clicks for details.
  identifiers_specified = [gclid, gbraid, wbraid].reject {|v| v.nil?}.count
  if identifiers_specified != 1
    raise "Must specify exactly one of GCLID, GBRAID, and WBRAID. " \
      "#{identifiers_specified} values were provided."
  end

  click_conversion = client.resource.click_conversion do |cc|
    cc.conversion_action = client.path.conversion_action(customer_id, conversion_action_id)
    # Sets the single specified ID field.
    if !gclid.nil?
      cc.gclid = gclid
    elsif !gbraid.nil?
      cc.gbraid = gbraid
    else
      cc.wbraid = wbraid
    end
    cc.conversion_value = conversion_value.to_f
    cc.conversion_date_time = conversion_date_time
    cc.currency_code = 'USD'
    if conversion_custom_variable_id && conversion_custom_variable_value
      cc.custom_variables << client.resource.custom_variable do |cv|
        cv.conversion_custom_variable = client.path.conversion_custom_variable(
          customer_id, conversion_custom_variable_id)
        cv.value = conversion_custom_variable_value
      end
    end
    # Sets the consent information, if provided.
    unless ad_user_data_consent.nil?
      c.consent = client.resource.consent do |c|
        # Specifies whether user consent was obtained for the data you are
        # uploading. For more details, see:
        # https://www.google.com/about/company/user-consent-policy
        c.ad_user_data = ad_user_data_consent
      end
    end
  end

  response = client.service.conversion_upload.upload_click_conversions(
    customer_id: customer_id,
    # NOTE: This request contains a single conversion as a demonstration.
    # However, if you have multiple conversions to upload, it's best to upload
    # multiple conversions per request instead of sending a separate request per
    # conversion. See the following for per-request limits:
    # https://developers.google.com/google-ads/api/docs/best-practices/quotas#conversion_upload_service
    conversions: [click_conversion],
    partial_failure: true,
  )
  if response.partial_failure_error.nil?
    result = response.results.first
    puts "Uploaded conversion that occurred at #{result.conversion_date_time} " \
      "from Google Click ID #{result.gclid} to #{result.conversion_action}."
  else
    failures = client.decode_partial_failure_error(response.partial_failure_error)
    puts "Request failed. Failure details:"
    failures.each do |failure|
      failure.errors.each do |error|
        puts "\t#{error.error_code.error_code}: #{error.message}"
      end
    end
  end
end
# [END upload_offline_conversion]

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
  options[:gclid] = nil
  options[:gbraid] = nil
  options[:wbraid] = nil
  options[:conversion_date_time] = 'INSERT_CONVERSION_DATE_TIME_HERE'
  options[:conversion_value] = 'INSERT_CONVERSION_VALUE_HERE'
  # Optional: Specify the conversion custom variable ID and value you want to
  # associate with the click conversion upload.
  options[:conversion_custom_variable_id] = nil;
  options[:conversion_custom_variable_value] = nil;

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--conversion-action-id CONVERSION-ACTION-ID', String, 'Conversion Action ID') do |v|
      options[:conversion_action_id] = v
    end

    opts.on('-g', '--gclid GCLID', String,
            'Google Click ID (should be newer than the number of days set ' \
            'on the conversion window of the conversion action).' \
            'If setting this option, don\'t set GBRAID or WBRAID') do |v|
      options[:gclid] = v
    end

    opts.on('-G', '--gbraid GBRAID', String,
            'The GBRAID identifier for an iOS app conversion. If setting this value, ' \
            'do not set GCLID or WBRAID.') do |v|
      options[:gbraid] = v
    end

    opts.on('w', '--wbraid WBRAID', String,
            'The WBRAID identifier for an iOS app conversion. If setting this value, ' \
            'do not set GCLID or GBRAID.') do |v|
      options[:wbraid] = v
    end

    opts.on('-t', '--conversion-date-time CONVERSION-DATE-TIME', String,
            'The date and time of the conversion (should be after click time). ' \
            'The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm", ' \
            'for example: “2019-01-01 12:32:45-08:00”') do |v|
      options[:conversion_date_time] = v
    end

    opts.on('-v', '--conversion-value CONVERSION-VALUE', String, 'Conversion Value') do |v|
      options[:conversion_value] = v
    end

    opts.on('-d', '--conversion-custom-variable-id CONVERSION-CUSTOM-VARIABLE-ID', \
            String, '(Optional) The ID of the conversion custom variable to ' \
            'associate with the upload') do |v|
      options[:conversion_custom_variable_id] = v
    end

    opts.on('-u', '--conversion-custom-variable-value CONVERSION-CUSTOM-VARIABLE-VALUE', \
            String, '(Optional) The value of the conversion custom ' \
            'variable to associate with the upload') do |v|
      options[:conversion_custom_variable_value] = v
    end

    opts.on('-a', '--ad-user-data-consent CONSENT', String, \
            '(Optional) The ad user data consent for the click.') do |v|
      options[:ad_user_data_consent] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_offline_conversion(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:conversion_action_id),
      options[:gclid],
      options[:gbraid],
      options[:wbraid],
      options.fetch(:conversion_date_time),
      options.fetch(:conversion_value),
      options[:conversion_custom_variable_id],
      options[:conversion_custom_variable_value],
      options[:ad_user_data_consent],
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
  end
end
