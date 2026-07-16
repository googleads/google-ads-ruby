# frozen_string_literal: true

# Copyright 2026 Google LLC
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

# This example applies an incentive to a user's account.
#
# This example is a no-op if the user already has an accepted incentive. If the user attempts to
# apply a new incentive, the response will simply return the existing incentive that has already
# been applied to the account.

require 'google/ads/google_ads'
require 'optparse'

# [START apply_incentive]
def apply_incentive(customer_id, incentive_id, country_code)
  # GoogleAdsClient will read a config file from a default location
  # if no path is passed.
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Issues the request.
  request_args = {
    customer_id: customer_id,
    selected_incentive_id: incentive_id
  }
  request_args[:country_code] = country_code if country_code

  response = client.service.incentive.apply_incentive(request_args)

  # Processes the response.
  puts "Incentive was created at '#{response.creation_time}'."
  puts "Applied incentive with coupon code '#{response.coupon_code}'."
end
# [END apply_incentive]

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

  # The country code defaults to US.
  options[:country_code] = 'US'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v.tr('-', '')
    end

    opts.on('-I', '--incentive-id INCENTIVE-ID', Integer, 'Incentive ID') do |v|
      options[:incentive_id] = v
    end

    opts.on('-K', '--country-code COUNTRY-CODE', String, 'Country Code') do |v|
      options[:country_code] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  # Check if required parameters are present.
  if options[:customer_id].nil?
    || options[:customer_id] == 'INSERT_CUSTOMER_ID_HERE'
    || options[:incentive_id].nil?
    puts "Missing required arguments. See usage:"
    puts "Customer ID and Incentive ID are required."
    exit 1
  end

  begin
    apply_incentive(options[:customer_id], options[:incentive_id], options[:country_code])
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
