#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This example illustrates how to create a new customer under a given manager
# account.
#
# Note: This example must be run using the credentials of a Google Ads manager
# account. By default, the new account will only be accessible via the manager
# account.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START create_customer]
def create_customer(manager_customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  customer = client.resource.customer do |c|
    c.descriptive_name = "Account created with CustomerService on #{(Time.new.to_f * 1000).to_i}"

    # For a list of valid currency codes and time zones, see this documentation:
    # https://developers.google.com/google-ads/api/reference/data/codes-formats
    c.currency_code = "USD"
    c.time_zone = "America/New_York"

    # The below values are optional. For more information about URL options, see:
    # https://support.google.com/google-ads/answer/6305348
    c.tracking_url_template = "{lpurl}?device={device}"
    c.final_url_suffix = "keyword={keyword}&matchtype={matchtype}&adgroupid={adgroupid}"
  end

  response = client.service.customer.create_customer_client(
    customer_id: manager_customer_id,
    customer_client: customer
  )

  puts "Created a customer with resource name #{response.resource_name} under" +
      " the manager account with customer ID #{manager_customer_id}."
end
# [END create_customer]

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
  options[:manager_customer_id] = 'INSERT_MANAGER_CUSTOMER_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-M', '--manager-customer-id MANAGEr-CUSTOMER-ID', String,
        'Customer ID') do |v|
      options[:manager_customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    create_customer(options.fetch(:manager_customer_id).tr("-", ""))
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
