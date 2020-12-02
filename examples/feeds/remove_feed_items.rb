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
#  Removes feed items from a feed.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def remove_feed_items(customer_id, feed_id, feed_item_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operations = []

  # Creates the remove operations.
  feed_item_ids.each do |feed_item_id|
    operations << client.operation.remove_resource.feed_item(
      # Creates the feed item resource name.
      client.path.feed_item(customer_id, feed_id, feed_item_id)
    )
  end

  # Issues a mutate request to remove the feed items.
  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: operations,
  )

  # Prints the resource names of the removed feed items.
  response.results.each do |result|
    puts "Removed feed item with resource name '#{result.resource_name}'."
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
  options[:feed_id] = 'INSERT_FEED_ID_HERE'
  options[:feed_item_ids] = [
    'INSERT_FEED_ITEM_ID_1_HERE',
    'INSERT_FEED_ITEM_ID_2_HERE',
  ]

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-F', '--feed-id FEED-ID', String, 'Feed ID') do |v|
      options[:feed_id] = v
    end

    opts.on('-f', '--feed-item-ids FEED-ITEM-IDS', String,
      'Feed Item IDs (comma-separated)') do |v|
      options[:feed_item_ids] = v.split(',')
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    remove_feed_items(
      options.fetch(:customer_id).tr("-", ""),
      options[:feed_id],
      options[:feed_item_ids],
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
