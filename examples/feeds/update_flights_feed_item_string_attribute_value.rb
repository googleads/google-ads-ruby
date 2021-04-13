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
# Updates a feed item attribute value in a flights feed. To create a flights
# feed, run the add_flights_feed example. This example is specific to feeds of
# type DYNAMIC_FLIGHT. The attribute you are updating must be present on the
# feed.
#
# This example is specifically for updating the string attribute of a
# flights feed item, but it can also be changed to work with other data types
# of an attribute and feed types.
#
# To make this work with other data types, replace `string_value` with the type
# of an attribute you wish to update, when creating a feed_item_attribute_value
# instance in this example.
# To make this work with other feed types, replace the
# flight_placeholder_field_name with the equivalent one of your feed type,
# and replace flight_placeholder_fields_map_for() with the method that can
# return a similar value for your feed type. Check the
# flight_placeholder_fields_map_for() method for details.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START update_flights_feed_item_string_attribute_value]
def update_flights_feed_item_string_attribute_value(
  customer_id,
  feed_id,
  feed_item_id,
  flight_placeholder_field_name,
  attribute_value)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Gets a map of the placeholder values to feed attributes.
  placeholders_to_feed_attributes_map = flight_placeholder_fields_map_for(
    client,
    customer_id,
    client.path.feed(customer_id, feed_id),
  )

  # Gets the ID of the feed attribute for the placeholder field. This is
  # needed to specify which feed item attribute value will be updated in the
  # given feed item.
  attribute_id = placeholders_to_feed_attributes_map[
    flight_placeholder_field_name.to_sym].id

  # Retrieves the feed item and its associated attributes based on the resource
  # name.
  feed_item_resource_name = client.path.feed_item(customer_id, feed_id, feed_item_id)
  feed_item = feed_item_for(
    client,
    customer_id,
    feed_item_resource_name,
  )

  # Creates the updated feed item attribute value.
  updated_feed_item_attribute_value = client.resource.feed_item_attribute_value do |v|
    v.feed_attribute_id = attribute_id
    v.string_value = attribute_value
  end

  # Gets the index of the attribute value that will be updated in the feed item.
  attribute_index = attribute_index_for(
    updated_feed_item_attribute_value,
    feed_item,
  )

  # Any feed item attribute values that are not included in the feed item will
  # be removed, which is why you must retain all other feed attribute values
  # here.
  feed_item_attribute_values = feed_item.attribute_values
  puts feed_item_attribute_values
  feed_item_attribute_values[attribute_index] =
    client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = attribute_id
      v.string_value = attribute_value
    end

  # Creates the feed item operation.
  operation = client.operation.update_resource.feed_item(feed_item_resource_name) do |item|
    item.attribute_values.replace(feed_item_attribute_values.to_a)
  end

  # Issues a mutate request to update the feed item and print some information.
  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Feed item with resource name " \
    "'#{response.results.first.resource_name}' was updated."
end
# [END update_flights_feed_item_string_attribute_value]

def flight_placeholder_fields_map_for(
  client,
  customer_id,
  feed_resource_name)
  # Constructs the query to get the feed attributes for the specified feed
  # resource name.
  query = <<~QUERY
    SELECT feed.attributes
    FROM feed
    WHERE feed.resource_name = '#{feed_resource_name}'
  QUERY

  # Issues a search request by specifying page size.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    page_size: PAGE_SIZE,
  )

  # Flight feed attribute names map.
  feed_attribute_names_map = {
    :'Flight Description' => :FLIGHT_DESCRIPTION,
    :'Destination ID' => :DESTINATION_ID,
    :'Flight Price' => :FLIGHT_PRICE,
    :'Flight Sale Price' => :FLIGHT_SALE_PRICE,
    :'Final URLs' => :FINAL_URLS,
  }

  # Gets the attributes list from the feed and creates a map with keys of
  # placeholder fields and values of feed attributes.
  feed_attributes = response.first.feed.attributes
  placeholder_fields = []
  feed_attributes.each do |feed_attribute|
    unless feed_attribute_names_map.has_key?(feed_attribute.name.to_sym)
      raise "Invalid feed attribute name."
    end
    placeholder_fields << feed_attribute_names_map[feed_attribute.name.to_sym]
  end

  fields_map = {}
  placeholder_fields.zip(feed_attributes) {|a, b| fields_map[a.to_sym] = b }

  fields_map
end

def feed_item_for(
  client,
  customer_id,
  feed_item_resource_name)
  # Constructs the query to get the feed item with attribute values.
  query = <<~QUERY
    SELECT feed_item.attribute_values
    FROM feed_item
    WHERE feed_item.resource_name = '#{feed_item_resource_name}'
  QUERY

  # Issues a search request by specifying page size.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    page_size: PAGE_SIZE,
  )

  # Returns the feed item attribute values, which belongs to the first item.
  # We can ensure it belongs to the first one because we specified the feed item
  # resource name in the query.
  response.first.feed_item
end

def attribute_index_for(
  target_feed_item_attribute_value,
  feed_item)
  attribute_index = -1

  # Loops through attribute values to find the index of the feed item attribute
  # value to update.
  feed_item.attribute_values.each do |value|
    attribute_index += 1
    # Checks if the current feedItemAttributeValue is the one we are updating
    if value.feed_attribute_id == target_feed_item_attribute_value.feed_attribute_id
      break
    end
  end

  if attribute_index == -1
    raise "No matching feed attribute for feed item attribute ID: " \
      "#{target_feed_item_attribute_value.feed_attribute_id}"
  end

  attribute_index
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
  options[:feed_id] = 'INSERT_FEED_ID_HERE'
  options[:feed_item_id] = 'INSERT_FEED_ITEM_ID_HERE'
  options[:flight_placeholder_field_name] = 'INSERT_FLIGHT_PLACEHOLDER_FIELD_NAME_HERE'
  options[:attribute_value] = 'INSERT_ATTRIBUTE_VALUE_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-F', '--feed-id FEED-ID', String, 'Feed Item ID') do |v|
      options[:feed_id] = v
    end

    opts.on('-f', '--feed-item-id FEED-ITEM-ID', String, 'Feed Item ID') do |v|
      options[:feed_item_id] = v
    end

    opts.on('-P', '--flight-placeholder-field-name FLIGHT-PLACEHOLDER-FIELD-NAME',
      String, 'Flight Placeholder Field Name') do |v|
      options[:flight_placeholder_field_name] = v
    end

    opts.on('-V', '--attribute-value ATTRIBUTE-VALUE', String, 'Attribute Value') do |v|
      options[:attribute_value] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    update_flights_feed_item_string_attribute_value(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:feed_id),
      options.fetch(:feed_item_id),
      options.fetch(:flight_placeholder_field_name),
      options.fetch(:attribute_value),
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
