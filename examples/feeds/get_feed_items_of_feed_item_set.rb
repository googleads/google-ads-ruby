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
# This example gets all feed items of the specified feed item set by fetching
# all feed item set links. To create a new feed item set, run
# create_feed_item_set.rb. To link a feed item to a feed item set, run
# link_feed_item_set.rb.

require 'optparse'
require 'google/ads/google_ads'

def get_feed_items_of_feed_item_set(customer_id, feed_id, feed_item_set_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~QUERY
    SELECT feed_item_set_link.feed_item
    FROM feed_item_set_link
    WHERE feed_item_set_link.feed_item_set =
        '#{client.path.feed_item_set(customer_id, feed_id, feed_item_set_id)}'
  QUERY

  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  puts "The feed items with the following resource names are linked to feed item " \
    "set with ID #{feed_item_set_id}."
  responses.each do |response|
    response.results.each do |row|
      puts "\t#{row.feed_item_set_link.feed_item}"
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
  options[:feed_id] = 'INSERT_FEED_ID_HERE'
  options[:feed_item_set_id] = 'INSERT_FEED_ITEM_SET_ID_HERE'

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

    opts.on('-s', '--feed-item-set-id FEED-ITEM-SET-ID', String, 'Feed Item Set ID') do |v|
      options[:feed_item_set_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_feed_items_of_feed_item_set(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:feed_id),
      options.fetch(:feed_item_set_id),
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
