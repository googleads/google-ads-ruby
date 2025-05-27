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
# This code example sends an invitation email to a user to manage a customer
# account with a desired access role.

require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

# ACCESS_ROLE_ENUM is now defined in ArgumentParser module.

def invite_user_with_access_role(customer_id, email_address, access_role)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START invite_user_with_access_role]
  operation = client.operation.create_resource.customer_user_access_invitation do |inv|
    inv.email_address = email_address
    inv.access_role = access_role
  end

  # Issues a mutate request to get the response.
  response = client.service.customer_user_access_invitation.mutate_customer_user_access_invitation(
    customer_id: customer_id,
    operation: operation,
  )

  # Prints out information of the created invitation.
  puts "Customer user access invitation was sent for customerId = #{customer_id} " \
    "email address = '#{email_address}', " \
    "access role = '#{access_role}'."
  # [END invite_user_with_access_role]
end

if __FILE__ == $PROGRAM_NAME
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id] && options[:email_address] && options[:access_role]
    puts "Usage: #{$0} -c CUSTOMER_ID -e EMAIL_ADDRESS -a ACCESS_ROLE"
    puts "  -c, --customer-id CUSTOMER-ID          The Google Ads customer ID."
    puts "  -e, --email-address EMAIL-ADDRESS      Email address of the user to invite."
    puts "  -a, --access-role ACCESS-ROLE          Access role for the user. Must be one of: #{ArgumentParser::ACCESS_ROLE_ENUM.keys.join(', ')}"
    exit 1
  end

  access_role_sym = options[:access_role].upcase.to_sym
  unless ArgumentParser::ACCESS_ROLE_ENUM.key?(access_role_sym)
    puts "Invalid access role: '#{options[:access_role]}'. Must be one of: #{ArgumentParser::ACCESS_ROLE_ENUM.keys.join(', ')}"
    exit 1
  end

  begin
    invite_user_with_access_role(
      options[:customer_id],
      options[:email_address],
      access_role_sym
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
