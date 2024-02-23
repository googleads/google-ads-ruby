#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2024 Google LLC
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
# This code example illustrates how to retrieve the status of the advertiser
# identity verification program and, if required and not already started, how
# to start the verification process.

require 'optparse'
require 'date'
require 'google/ads/google_ads'

def verify_advertiser_identity(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  client.configure do |config|
    config.login_customer_id = customer_id
  end

  identity_verification = get_identity_verification(client, customer_id)

  if identity_verification.nil?
    puts "Account #{customer_id} is not required to perform mandatory identity verification."
    puts "See https://support.google.com/adspolicy/answer/9703665 for details on how " \
      "and when an account is required to undergo the advertiser identity " \
      "verification program."
  else
    if identity_verification.verification_progress.action_url.nil?
      start_identity_verification(client, customer_id)

      # Call GetIdentityVerification again to retrieve the verification
      # progress after starting an identity verification session.
      get_identity_verification(client, customer_id)
    else
      # If there is an identity verification session in progress, there is no
      # need to start another one by calling start_identity_verification.
      puts "There is an advertiser identity verification session in progress."

      progress = identity_verification.verification_progress
      puts "The URL for the verification process is #{progress.action_url} and " \
        "it will expire at #{progress.invitation_link_expiration_time}."
    end
  end
end

# [START verify_advertiser_identity_1]
def get_identity_verification(client, customer_id)
  response = client.service.identity_verification.get_identity_verification(
    customer_id: customer_id
  )

  return nil if response.nil? || response.identity_verification.empty?

  identity_verification = response.identity_verification.first
  deadline = identity_verification.
    identity_verification_requirement.
    verification_completion_deadline_time
  progress = identity_verification.verification_progress
  puts "Account #{customer_id} has a verification completion deadline " \
    "of #{deadline} and status #{progress.program_status} for advertiser " \
    "identity verification."

  identity_verification
end
# [END verify_advertiser_identity_1]

# [START verify_advertiser_identity_2]
def start_identity_verification(client, customer_id)
  client.service.identity_verification.start_identity_verification(
    customer_id: customer_id,
    verification_program: :ADVERTISER_IDENTITY_VERIFICATION,
  )
end
# [END verify_advertiser_identity_2]

if __FILE__ == $PROGRAM_NAME
  # Running the example with -h will print the command line usage.
  options = {}

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

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
    verify_advertiser_identity(options.fetch(:customer_id).tr("-", ""))
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
