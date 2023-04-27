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
# Adjusts an existing conversion by supplying user identifiers so Google can
# enhance the conversion value.

require 'optparse'
require 'google/ads/google_ads'
require 'digest'

# [START upload_conversion_enhancement]
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

  # [START create_adjustment]
  enhancement = client.resource.conversion_adjustment do |ca|
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

    # Creates a user identifier using sample values for the user address.
    ca.user_identifiers << client.resource.user_identifier do |ui|
      ui.address_info = client.resource.offline_user_address_info do |info|
        # Certain fields must be hashed using SHA256 in order to handle
        # identifiers in a privacy-safe way, as described at
        # https://support.google.com/google-ads/answer/9888656.
        info.hashed_first_name = normalize_and_hash("Joanna")
        info.hashed_last_name = normalize_and_hash("Smith")
        info.hashed_street_address = normalize_and_hash("1600 Amphitheatre Pkwy")
        info.city = "Mountain View"
        info.state = "CA"
        info.postal_code = "94043"
        info.country_code = "US"
      end
      # Optional: Specifies the user identifier source.
      ui.user_identifier_source = :FIRST_PARTY
    end

    # Creates a user identifier using the hashed email address.
    ca.user_identifiers << client.resource.user_identifier do |ui|
      # Uses the normalize and hash method specifically for email addresses.
      ui.hashed_email = normalize_and_hash_email("joannasmith@example.com")
      ui.user_identifier_source = :FIRST_PARTY
    end

    # Sets optional fields where a value was provided.
    unless user_agent.nil?
      # Sets the user agent. This should match the user agent of the request
      # that sent the original conversion so the conversion and its enhancement
      # are either both attributed as same-device or both attributed as
      # cross-device.
      ca.user_agent = user_agent
    end
  end
  # [END create_adjustment]

  response = client.service.conversion_adjustment_upload.upload_conversion_adjustments(
    customer_id: customer_id,
    conversion_adjustments: [enhancement],
    # Partial failure must be set to true.
    partial_failure: true,
  )

  if response.partial_failure_error
    puts "Partial failure encountered: #{response.partial_failure_error.message}."
  else
    result = response.results.first
    puts "Uploaded conversion adjustment of #{result.conversion_action} for "\
      "order ID #{result.order_id}."
  end
end
# [END upload_conversion_enhancement]

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
