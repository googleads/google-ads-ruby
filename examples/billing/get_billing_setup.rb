#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
#
# This example retrieves all BillingSetup objects available for the specified
# customerId.

require 'optparse'
require 'google/ads/google_ads'

def get_billing_setup(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service.google_ads

  search_query = <<~QUERY
    SELECT billing_setup.id,
      billing_setup.status,
      billing_setup.payments_account,
      billing_setup.payments_account_info.payments_account_id,
      billing_setup.payments_account_info.payments_account_name,
      billing_setup.payments_account_info.payments_profile_id,
      billing_setup.payments_account_info.payments_profile_name,
      billing_setup.payments_account_info.secondary_payments_profile_id
    FROM billing_setup
  QUERY

  response = ga_service.search(
    customer_id: customer_id,
    query: search_query,
    page_size: PAGE_SIZE,
  )

  response.each do |row|
    billing_setup = row.billing_setup
    payments_account_info = billing_setup.payments_account_info

    puts sprintf('Billing setup with ID "%s", status "%s",'\
        ' payments_account "%s", payments_account_id "%s",'\
        ' payments_account_name "%s", payments_profile_id "%s",'\
        ' payments_profile_name "%s", secondary_payments_profile_id "%s"',
        billing_setup.id,
        billing_setup.status,
        billing_setup.payments_account,
        payments_account_info.payments_account_id,
        payments_account_info.payments_account_name,
        payments_account_info.payments_profile_id,
        payments_account_info.payments_profile_name,
        payments_account_info.secondary_payments_profile_id
    )
  end
end

if __FILE__ == $0
  PAGE_SIZE = 1000

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

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_billing_setup(options.fetch(:customer_id).tr("-", ""))
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
