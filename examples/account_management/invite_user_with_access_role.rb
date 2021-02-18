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

require 'optparse'
require 'google/ads/google_ads'

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
  options[:email_address] = 'INSERT_EMAIL_ADDRESS_HERE'
  options[:access_role] = 'INSERT_ACCESS_ROLE_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-E', '--email-address EMAIL-ADDRESS', String, 'Email Address') do |v|
      options[:email_address] = v
    end

    opts.on('-R', '--access-role ACCESS-ROLE', String, 'Access Role') do |v|
      options[:access_role] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    invite_user_with_access_role(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:email_address),
      options.fetch(:access_role).to_sym,
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
