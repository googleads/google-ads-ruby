#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# Uploads an enhanced conversion for leads by uploading a ClickConversion.
# The click conversion has hashed, first-party user-provided data from your
# website lead forms. This includes user identifiers, and optionally, a click ID
# and order ID. With this information, Google can tie the conversion to the ad
# that drove the lead.

require 'optparse'
require 'google/ads/google_ads'

def upload_conversion_with_identifiers(
  customer_id,
  conversion_action_id,
  conversion_date_time,
  conversion_value,
  order_id,
  gclid,
  ad_user_data_consent)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START add_user_identifiers]
  # Extract user email and phone from the raw data, normalize and hash it,
  # then wrap it in UserIdentifier objects. Create a separate UserIdentifier
  # object for each. The data in this example is hardcoded, but in your
  # application you might read the raw data from an input file.

  # IMPORTANT: Since the identifier attribute of UserIdentifier
  # (https://developers.google.com/google-ads/api/reference/rpc/latest/UserIdentifier)
  # is a oneof
  # (https://protobuf.dev/programming-guides/proto3/#oneof-features), you must
  # set only ONE of hashed_email, hashed_phone_number, mobile_id,
  # third_party_user_id, or address_info. Setting more than one of these
  # attributes on the same UserIdentifier will clear all the other members of
  # the oneof. For example, the following code is INCORRECT and will result in
  # a UserIdentifier with ONLY a hashed_phone_number:
  #
  # incorrectly_populated_user_identifier.hashed_email = "...""
  # incorrectly_populated_user_identifier.hashed_phone_number = "...""

  raw_record = {
    # Email address that includes a period (.) before the Gmail domain.
    "email" => "alex.2@example.com",
    # Phone number to be converted to E.164 format, with a leading '+' as
    # required.
    "phone" => "+1 800 5550102",
    # This example lets you input conversion details as arguments,
    # but in reality you might store this data alongside other user data,
    # so we include it in this sample user record.
    "order_id" => order_id,
    "gclid" => gclid,
    "conversion_action_id" => conversion_action_id,
    "conversion_date_time" => conversion_date_time,
    "conversion_value" => conversion_value,
    "currency_code" => "USD",
    "ad_user_data_consent" => ad_user_data_consent,
  }

  click_conversion = client.resource.click_conversion do |cc|
    # [START add_conversion_details]
    cc.conversion_action = client.path.conversion_action(customer_id, conversion_action_id)
    cc.conversion_date_time = conversion_date_time
    cc.conversion_value = conversion_value.to_f
    cc.currency_code = 'USD'

    unless order_id.nil?
      cc.order_id = order_id
    end

    unless raw_record["gclid"].nil?
      cc.gclid = gclid
    end

    # Specifies whether user consent was obtained for the data you are
    # uploading. For more details, see:
    # https://www.google.com/about/company/user-consent-policy
    unless raw_record["ad_user_data_consent"].nil?
      cc.consent = client.resource.consent do |c|
        c.ad_user_data = ad_user_data_consent
      end
    end
    # [END add_conversion_details]

    # Creates a user identifier using the hashed email address, using the
    # normalize and hash method specifically for email addresses.
    # If using a phone number, use the normalize_and_hash method instead.
    cc.user_identifiers << client.resource.user_identifier do |ui|
      ui.hashed_phone_number = normalize_and_hash_email(raw_record["email"])
      # Optional: Specifies the user identifier source.
      ui.user_identifier_source = :FIRST_PARTY
    end

    # Checks if the record has a phone number, and if so, adds a UserIdentifier
    # for it.
    unless raw_record["phone"].nil?
      cc.user_identifiers << client.resource.user_identifier do |ui|
        ui.hashed_phone_number = normalize_and_hash_email(raw_record["phone"])
      end
    end
  end
  # [END add_user_identifiers]

  # [START upload_conversion]
  response = client.service.conversion_upload.upload_click_conversions(
    customer_id: customer_id,
    conversions: [click_conversion],
    # Partial failure must be true.
    partial_failure: true,
  )

  if response.partial_failure_error
    puts "Partial failure encountered: #{response.partial_failure_error.message}"
  else
    result = response.results.first
    puts "Uploaded click conversion that happened at #{result.conversion_date_time} " \
      "to #{result.conversion_action}."
  end
  # [END upload_conversion]
end

# [START normalize_and_hash]
# Returns the result of normalizing and then hashing the string using the
# provided digest.  Private customer data must be hashed during upload, as
# described at https://support.google.com/google-ads/answer/7474263.
def normalize_and_hash(str)
  # Remove leading and trailing whitespace and ensure all letters are lowercase
  # before hasing.
  Digest::SHA256.hexdigest(str.strip.downcase)
end

# Returns the result of normalizing and hashing an email address. For this use
# case, Google Ads requires removal of any '.' characters preceding 'gmail.com'
# or 'googlemail.com'.
def normalize_and_hash_email(email)
  email_parts = email.downcase.split("@")
  # Removes any '.' characters from the portion of the email address before the
  # domain if the domain is gmail.com or googlemail.com.
  if email_parts.last =~ /^(gmail|googlemail)\.com\s*/
    email_parts[0] = email_parts[0].gsub('.', '')
  end
  normalize_and_hash(email_parts.join('@'))
end
# [END normalize_and_hash]

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
  options[:email_address] = 'INSERT_EMAIL_ADDRESS_HERE'
  options[:conversion_date_time] = 'INSERT_CONVERSION_DATE_TIME_HERE'
  options[:conversion_value] = 'INSERT_CONVERSION_VALUE_HERE'
  options[:order_id] = nil
  options[:gclid] = nil
  options[:ad_user_data_consent] = nil

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

    opts.on('-t', '--conversion-date-time CONVERSION-DATE-TIME', String,
            'The date and time of the conversion (should be after click time). ' \
            'The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm", ' \
            'for example: “2019-01-01 12:32:45-08:00”') do |v|
      options[:conversion_date_time] = v
    end

    opts.on('-v', '--conversion-value CONVERSION-VALUE', String, 'Conversion Value') do |v|
      options[:conversion_value] = v
    end

    opts.on('-o', '--order-id ORDER-ID', String, 'Order ID (optional)') do |v|
      options[:order_id] = v
    end

    opts.on('-g', '--gclid GCLID', String, 'The Google click ID (gclid) for the click') do |v|
      options[:gclid] = v
    end

    opts.on('-d', '--ad-user-data-dconsent GCLID', String,
            'The data consent status for ad user data for all members in' \
            'the job.' \
            'e.g. UNKNOWN, GRANTED, DENIED') do |v|
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
    upload_conversion_with_identifiers(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:conversion_action_id),
      options.fetch(:conversion_date_time),
      options.fetch(:conversion_value),
      options[:order_id],
      options[:gclid],
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
