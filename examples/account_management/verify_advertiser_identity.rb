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

require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

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
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id]
    puts "Usage: #{$0} -c CUSTOMER_ID"
    puts "  -c, --customer-id CUSTOMER-ID          The Google Ads customer ID."
    exit 1
  end

  begin
    verify_advertiser_identity(options[:customer_id])
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
