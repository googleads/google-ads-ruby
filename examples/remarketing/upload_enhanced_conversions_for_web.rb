#!/usr/bin/env ruby
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
# Enhances a web conversion by uploading a ConversionAdjustment.
# The conversion adjustment contains hashed user identifiers and an order ID.

require 'optparse'
require 'google/ads/google_ads'
require 'digest'

def upload_conversion_enhancement(
  customer_id,
  conversion_action_id,
  order_id,
  conversion_date_time,
  user_agent
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START add_user_identifiers]
  # Extracts user email, phone, and address info from the raw data, normalizes
  # and hashes it, then wraps it in UserIdentifier objects. Creates a separate
  # UserIdentifier object for each. The data in this example is hardcoded, but
  # in your application you might read the raw data from an input file.

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
      # Address that includes all four required elements: first name, last
      # name, country code, and postal code.
      "first_name" => "Alex",
      "last_name" => "Quinn",
      "country_code" => "US",
      "postal_code" => "94045",
      # Phone number to be converted to E.164 format, with a leading '+' as
      # required.
      "phone" => "+1 800 5550102",
      # This example lets you input conversion details as arguments, but in
      # reality you might store this data alongside other user data, so we
      # include it in this sample user record.
      "order_id" => order_id,
      "conversion_action_id" => conversion_action_id,
      "conversion_date_time" => conversion_date_time,
      "currency_code" => "USD",
      "user_agent" => user_agent,
  }

  enhancement = client.resource.conversion_adjustment do |ca|
    # [START add_conversion_details]
    ca.conversion_action = client.path.conversion_action(customer_id, conversion_action_id)
    ca.adjustment_type = :ENHANCEMENT
    ca.order_id = order_id

    # Sets the conversion date and time if provided. Providing this value is
    # optional but recommended.
    unless conversion_date_time.nil?
      ca.gclid_date_time_pair = client.resource.gclid_date_time_pair do |pair|
        pair.conversion_date_time = conversion_date_time
      end
    end

    # Creates a user identifier using the hashed email address, using the
    # normalize and hash method specifically for email addresses.
    ca.user_identifiers << client.resource.user_identifier do |ui|
      # Uses the normalize and hash method specifically for email addresses.
      ui.hashed_email = normalize_and_hash_email(raw_record["email"])
      # Optional: Specifies the user identifier source.
      ui.user_identifier_source = :FIRST_PARTY
    end

    # Checks if the record has a phone number, and if so, adds a UserIdentifier
    # for it.
    unless raw_record["phone"].nil?
      ca.user_identifiers << client.resource.user_identifier do |ui|
        ui.hashed_phone_number = normalize_and_hash_email(raw_record["phone"])
      end
    end

    # Checks if the record has all the required mailing address elements, and if
    # so, adds a UserIdentifier for the mailing address.
    unless raw_record["first_name"].nil?
      # Checks if the record contains all the other required elements of a
      # mailing address.
      required_keys = ["last_name", "country_code", "postal_code"]
      # Builds a new list of the required keys that are missing from
      # raw_record.
      missing_keys = required_keys - raw_record.keys
      if missing_keys
          puts(
              "Skipping addition of mailing address information because the" \
              "following required keys are missing: #{missing_keys}"
          )
      else
        ca.user_identifiers << client.resource.user_identifier do |ui|
          ui.address_info = client.resource.offline_user_address_info do |info|
            # Certain fields must be hashed using SHA256 in order to handle
            # identifiers in a privacy-safe way, as described at
            # https://support.google.com/google-ads/answer/9888656.
            info.hashed_first_name = normalize_and_hash( raw_record["first_name"])
            info.hashed_last_name = normalize_and_hash( raw_record["last_name"])
            info.postal_code = normalize_and_hash(raw_record["country_code"])
            info.country_code = normalize_and_hash(raw_record["postal_code"])
          end
        end
      end
    end
    # [END add_user_identifiers]

    # Sets optional fields where a value was provided.
    unless user_agent.nil?
      # Sets the user agent. This should match the user agent of the request
      # that sent the original conversion so the conversion and its enhancement
      # are either both attributed as same-device or both attributed as
      # cross-device.
      ca.user_agent = user_agent
    end
    # [END add_conversion_details]
  end

  # [START upload_enhancement]
  response = client.service.conversion_adjustment_upload.upload_conversion_adjustments(
    customer_id: customer_id,
    # NOTE: This request only uploads a single conversion, but if you have
    # multiple conversions to upload, it's still best to upload them in a single
    # request. See the following for per-request limits for reference:
    # https://developers.google.com/google-ads/api/docs/best-practices/quotas#conversion_upload_service
    conversion_adjustments: [enhancement],
    # Partial failure must be set to true.
    partial_failure: true,
  )
  # [END upload_enhancement]

  # Prints any partial errors returned.
  # To review the overall health of your recent uploads, see:
  # https://developers.google.com/google-ads/api/docs/conversions/upload-summaries
  if response.partial_failure_error
    puts "Partial failure encountered: #{response.partial_failure_error.message}."
  else
    result = response.results.first
    puts "Uploaded conversion adjustment of #{result.conversion_action} for "\
      "order ID #{result.order_id}."
  end
end

# [START normalize_and_hash]
# Returns the result of normalizing and then hashing the string using the
# provided digest.  Private customer data must be hashed during upload, as
# described at https://support.google.com/google-ads/answer/9888656.
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
  options[:order_id] = 'INSERT_ORDER_ID_HERE'

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

    opts.on('-o', '--order-id ORDER-ID', String, 'Order ID') do |v|
      options[:order_id] = v
    end

    opts.on('-d', '--conversion-date-time CONVERSION-DATE-TIME', String,
            'The date and time of the conversion (should be after click time).'\
            ' The format is "yyyy-mm-dd hh:mm:ss+|-hh:mm", '\
            'e.g. "2019-01-01 12:32:45-08:00".') do |v|
      options[:conversion_date_time] = v
    end

    opts.on('-u', '--user-agent USER-AGENT', String, 'User Agent') do |v|
      options[:user_agent] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_conversion_enhancement(
      options.fetch(:customer_id).tr('-', ''),
      options.fetch(:conversion_action_id),
      options.fetch(:order_id),
      options[:conversion_date_time],
      options[:user_agent]
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
