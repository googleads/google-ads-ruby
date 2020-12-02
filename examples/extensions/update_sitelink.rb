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
# Updates the sitelink extension feed item with the specified link text.

require 'optparse'
require 'google/ads/google_ads'

def update_sitelink(customer_id, feed_item_id, sitelink_text)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operation = client.operation.update_resource.extension_feed_item(
    client.path.extension_feed_item(customer_id, feed_item_id)
  ) do |efi|
    efi.sitelink_feed_item = client.resource.sitelink_feed_item do |sitelink|
      sitelink.link_text = sitelink_text
    end
  end

  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Updated extension feed item with resource name " \
    "'#{response.results.first.resource_name}'."
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
  options[:feed_item_id] = 'INSERT_FEED_ITEM_ID_HERE'
  options[:sitelink_text] = 'INSERT_SITELINK_TEXT_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-f', '--feed-item-id FEED-ITEM-ID', String, 'Feed Item ID') do |v|
      options[:feed_item_id] = v
    end

    opts.on('-s', '--sitelink-text SITELINK-TEXT', String, 'Sitelink Text') do |v|
      options[:sitelink_text] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    update_sitelink(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:feed_item_id),
      options[:sitelink_text],
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
