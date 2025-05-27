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
# Updates the access role of a user, given the email address.
#
# This code example should be run as a user who is an Administrator on the
# Google Ads account with the specified customer ID.
#
# See https://support.google.com/google-ads/answer/9978556 to learn more about
# account access levels.

require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

# ACCESS_ROLE_ENUM is now defined in ArgumentParser module.

def update_user_access(customer_id, email_address, access_role_sym)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  user_id = get_user_id(client, customer_id, email_address)

  if user_id
    modify_user_access(client, customer_id, user_id, access_role_sym)
  end
end

def get_user_id(client, customer_id, email_address)
  query = <<~QUERY
    SELECT
      customer_user_access.user_id,
      customer_user_access.email_address,
      customer_user_access.access_role,
      customer_user_access.access_creation_date_time
    FROM customer_user_access
    WHERE customer_user_access.email_address LIKE "#{email_address}"
  QUERY

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  result = response.first.customer_user_access
  if result
    puts "Customer user access with User ID #{result.user_id}, Access Role " \
      "#{result.access_role}, Creation Time #{result.access_creation_date_time}, " \
      "was found in customer ID #{customer_id}."

    result.user_id
  else
    puts "No customer user access found with email address #{email_address}."
    nil
  end
end

def modify_user_access(client, customer_id, user_id, access_role_sym)
  operation = client.operation.update_resource.customer_user_access(
      client.path.customer_user_access(customer_id, user_id)) do |ua|
    ua.access_role = access_role_sym # Already a symbol
  end

  response = client.service.customer_user_access.mutate_customer_user_access(
    customer_id: customer_id,
    operation: operation,
  )

  puts "Successfully updated customer user access with resource name " \
    "#{response.result.resource_name}."
end

if __FILE__ == $0
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id] && options[:email_address] && options[:access_role]
    puts "Usage: #{$0} -c CUSTOMER_ID -e EMAIL_ADDRESS -a ACCESS_ROLE"
    puts "  -c, --customer-id CUSTOMER-ID          The Google Ads customer ID."
    puts "  -e, --email-address EMAIL-ADDRESS      Email address of the user whose access to update."
    puts "  -a, --access-role ACCESS-ROLE          Access role for the user. Must be one of: #{ArgumentParser::ACCESS_ROLE_ENUM.keys.join(', ')}"
    exit 1
  end

  access_role_sym = options[:access_role].upcase.to_sym
  unless ArgumentParser::ACCESS_ROLE_ENUM.key?(access_role_sym)
    puts "Invalid access role: '#{options[:access_role]}'. Must be one of: #{ArgumentParser::ACCESS_ROLE_ENUM.keys.join(', ')}"
    exit 1
  end

  begin
    update_user_access(
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
