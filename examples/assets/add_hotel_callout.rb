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
# This example adds a hotel callout asset to a specific account.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_hotel_callout(customer_id, language_code)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a hotel callout asset.
  asset_resource_names = add_hotel_callout_assets(client, customer_id, language_code)

  # Adds the asset at the account level, so it will serve in all eligible campaigns.
  link_assets_to_account(client, customer_id, asset_resource_names)

end

# Creates a new asset.
def add_hotel_callout_assets(client, customer_id, language_code)
  operations = [
    client.resource.hotel_callout_asset do |hca|
      hca.text = 'Activities'
      hca.language_code = language_code
    end,
    client.resource.hotel_callout_asset do |hca|
      hca.text = 'Facilities'
      hca.language_code = language_code
    end
  ].map do |hca|
    client.operation.create_resource.asset do |asset|
      asset.hotel_callout_asset = hca
    end
  end

  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.map do |result|
    puts "Created hotel callout asset with resource name #{result.resource_name}"
    result.resource_name
  end
end

# Adds the asset to the customer account.
def link_assets_to_account(client, customer_id, asset_resource_names)
  operations = asset_resource_names.map do |asset_resource_name|
    client.operation.create_resource.customer_asset do |ca|
      ca.asset = asset_resource_name
      ca.field_type = :HOTEL_CALLOUT
    end
  end

  response = client.service.customer_asset.mutate_customer_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Created customer asset link with resource name #{result.resource_name}"
  end
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
  options[:language_code] = 'INSERT_LANGUAGE_CODE_HERE'

  # See supported languages at:
  # https://developers.google.com/hotels/hotel-ads/api-reference/language-codes.
  options[:language_code] = 'INSERT_LANGUAGE_CODE_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))
    opts.separator ''
    opts.separator 'Options:'
    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-L', '--language-code LANGUAGE-CODE', String, 'Language Code') do |v|
      options[:language_code] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_hotel_callout(
      options.fetch(:customer_id).tr("-", ""),
      options[:language_code],
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
