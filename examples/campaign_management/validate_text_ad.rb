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
# This example shows use of the validate_only header for an expanded text ad.
# No objects will be created, but exceptions will still be thrown.

require 'optparse'
require 'google/ads/google_ads'

def validate_text_ad(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    aga.status = :PAUSED

    aga.ad = client.resource.ad do |ad|
      ad.final_urls << "http://www.example.com"

      ad.expanded_text_ad = client.resource.expanded_text_ad_info do |eta|
        eta.description = "Luxury Cruise to Mars"
        eta.headline_part1 = "Visit the Red Planet in style."
        # Adds a headline that will trigger a policy violation to demonstrate
        # error handling.
        eta.headline_part2 = "Low-gravity fun for everyone!!"
      end
    end
  end

  begin
    response = client.service.ad_group_ad.mutate_ad_group_ads(
      customer_id: customer_id,
      operations: [operation],
      validate_only: true,
    )
    puts "Expanded text ad validated successfully."
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    # This code path will be reached if there is a validation error from the server.
    e.failure.errors.each do |error|
      if error.error_code.policy_finding_error == :POLICY_FINDING
        error.details.policy_finding_details&.
            policy_topic_entries.each_with_index do |entry, i|
          puts "#{i + 1}) #{entry.to_json}"
        end
      else
        puts "Non-policy finding with message: #{error.message}"
        if error.location
          error.location.field_path_elements.each do |field_path_element|
            STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
          end
        end
      end
    end
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A','--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    validate_text_ad(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
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
