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
# This example updates a responsive search ad.
# To get responsive search ads, run get_responsive_search_ads.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START update_responsive_search_ad]
def update_responsive_search_ad(customer_id, ad_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ad_resource_name = client.path.ad(customer_id, ad_id)

  # Create the operation for updating the ad.
  ad_operation = client.operation.update_resource.ad(ad_resource_name) do |ad|
    ad.final_urls << 'http://www.example.com'
    ad.final_mobile_urls << 'http://www.example.com/mobile'
    ad.responsive_search_ad = client.resource.responsive_search_ad_info do |rsa|
      rsa.headlines += [
        client.resource.ad_text_asset do |ata|
          ata.text = "Cruise to Pluto #{(Time.new.to_f * 100).to_i}"
          ata.pinned_field = :HEADLINE_1
        end,
        client.resource.ad_text_asset do |ata|
          ata.text = "Tickets on sale now"
        end,
        client.resource.ad_text_asset do |ata|
          ata.text = "Buy your ticket now"
        end,
      ]
      rsa.descriptions += [
        client.resource.ad_text_asset do |ata|
          ata.text = "Best space cruise ever"
        end,
        client.resource.ad_text_asset do |ata|
          ata.text = "The most wonderful space experience you will ever have"
        end,
      ]
    end
  end

  # Update the ad.
  response = client.service.ad.mutate_ads(
    customer_id: customer_id,
    operations: [ad_operation],
  )

  puts "Updated responsive search ad #{response.results.first.resource_name}."
end
# [END update_responsive_search_ad]

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
  options[:ad_id] = 'INSERT_AD_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-a', '--ad-id AD-ID', String, 'Ad ID') do |v|
      options[:ad_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    update_responsive_search_ad(options.fetch(:customer_id).tr('-', ''), options[:ad_id])
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf('Error with message: %s\n', error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf('\tOn field: %s\n', field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf('\tType: %s\n\tCode: %s\n', k, v)
      end
    end
    raise
  end
end

