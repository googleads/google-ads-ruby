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
# This example creates a billing setup for a customer. A billing setup is a link
# between a payments account and a customer. The new billing setup can either
# reuse an existing payments account, or create a new payments account with a
# given payments profile.
# Billing setups are applicable for clients on monthly invoicing only. See here
# for details about applying for monthly invoicing:
# https://support.google.com/google-ads/answer/2375377.
# In the case of consolidated billing, a payments account is linked to the
# manager account and is linked to a customer account via a billing setup.

require 'optparse'
require 'google/ads/google_ads'

def add_billing_setup(customer_id, payments_account_id, payments_profile_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  billing_setup = create_billing_setup(
    client, customer_id, payments_account_id, payments_profile_id)

  set_billing_setup_date_times(client, customer_id, billing_setup)

  # Issues a mutate request to add the billing setup.
  response = client.service.billing_setup.mutate_billing_setup(
    customer_id: customer_id,
    operation: billing_setup
  )

  puts "Added new billing setup with resource name #{response.result.resource_name}"
end

def create_billing_setup(
  client,
  customer_id,
  payments_account_id,
  payments_profile_id)
  billing_setup = client.operation.create_resource.billing_setup do |b|
    # Sets the appropriate payments account field.
    if payments_account_id
      # If a payments account ID has been provided, set the resource name.
      # You can list available payments accounts via the PaymentsAccountService's
      # ListPaymentsAccounts method.
      b.payments_account = client.path.payments_account(customer_id, payments_account_id)
    elsif payments_profile_id
      # Otherwise, create a new payments account by setting the payments account info.
      # See https://support.google.com/google-ads/answer/7268503 for more information about
      # payments profiles.
      b.payments_account_info = client.resource.payments_account_info do |pai|
        pai.payments_account_name = "Payment Account #{(Time.new.to_f * 1000).to_i}"
        pai.payments_profile_id = payments_profile_id
      end
    else
      raise "No payments account ID or payments profile ID is provided."
    end
  end
end

def set_billing_setup_date_times(client, customer_id, billing_setup)
  # The query to search existing approved billing setups in the end date time
  # descending order.
  # See get_billing_setup.rb for a more detailed example of how to retrieve
  # billing setups.
  query = <<~QUERY
    SELECT billing_setup.end_date_time
    FROM billing_setup
    WHERE billing_setup.status = APPROVED
    ORDER BY billing_setup.end_date_time DESC
  QUERY

  # Issues a search stream request.
  stream = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  start_date = DateTime.parse(Date.today.strftime("%Y%m%d"))

  # Retrieves the ending date time of the last billing setup.
  row = stream.first.results.first
  if row
    last_ending_date_time_string = row.billing_setup.end_date_time
    if last_ending_date_time_string.nil?
      raise "Cannot set starting and ending date times for the new billing setup." \
        "The latest existing billing setup is set to run indefinitely."
    end
    # Sets the new billing setup to start one day after the ending date time.
    start_date = DateTime.parse(last_ending_date_time_string) + 1
  end

  # Sets the new billing setup start date and end date.
  billing_setup.start_date_time = start_date.strftime("%Y-%m-%d")
  billing_setup.end_date_time = (start_date + 1).strftime("%Y-%m-%d")
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

    opts.on('-p', '--payments-account-id PAYMENTS-ACCOUNT-ID', String, 'Payments Account ID') do |v|
      options[:payments_account_id] = v
    end

    opts.on('-P', '--payments-profile-id PAYMENTS-PROFILE-ID', String, 'Payments Profile ID') do |v|
      options[:payments_profile_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_billing_setup(
      options.fetch(:customer_id).tr("-", ""),
      options[:payments_account_id],
      options[:payments_profile_id],
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
