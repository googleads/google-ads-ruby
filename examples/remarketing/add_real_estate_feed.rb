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
# This code example adds a real estate feed, creates the feed mapping,
# and adds items to the feed.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_real_estate_feed(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a new real estate feed.
  feed_resource_name = create_feed(client, customer_id)

  # Gets the newly created feed's attributes and packages them into a map.
  # This read operation is required to retrieve the attribute IDs.
  placeholders_to_feed_attribute_map = real_estate_placeholder_fields_map_for(
    client, customer_id, feed_resource_name)

  # Creates the feed mapping.
  create_feed_mapping(
    client,
    customer_id,
    feed_resource_name,
    placeholders_to_feed_attribute_map,
  )

  # Creates a feed item.
  create_feed_item(
    client,
    customer_id,
    feed_resource_name,
    placeholders_to_feed_attribute_map,
  )
end

# Creates a feed that will be used as a real estate feed.
def create_feed(client, customer_id)
  # Creates the feed operation.
  operation = client.operation.create_resource.feed do |feed|
    feed.name = "Real Estate Feed ##{(Time.new.to_f * 1000).to_i}"
    feed.attributes << client.resource.feed_attribute do |fa|
      fa.type = :STRING
      fa.name = "Listing ID"
    end
    feed.attributes << client.resource.feed_attribute do |fa|
      fa.type = :STRING
      fa.name = "Listing Name"
    end
    feed.attributes << client.resource.feed_attribute do |fa|
      fa.type = :URL_LIST
      fa.name = "Final URLs"
    end
    feed.attributes << client.resource.feed_attribute do |fa|
      fa.type = :URL
      fa.name = "Image URL"
    end
    feed.attributes << client.resource.feed_attribute do |fa|
      fa.type = :STRING_LIST
      fa.name = "Contextual Keywords"
    end
  end

  # Issues a mutate request to add the feed and print some information.
  response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )
  feed_resource_name = response.results.first.resource_name
  puts "Feed with resource name #{feed_resource_name} was created."

  feed_resource_name
end

# Retrieves the place holder fields to feed attributes map for a real estate feed.
# [START add_real_estate_feed]
def real_estate_placeholder_fields_map_for(
  client,
  customer_id,
  feed_resource_name
)
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

  # Real estate feed attribute names map.
  feed_attribute_names_map = {
    :'Listing ID' => :LISTING_ID,
    :'Listing Name' => :LISTING_NAME,
    :'Final URLs' => :FINAL_URLS,
    :'Image URL' => :IMAGE_URL,
    :'Contextual Keywords' => :CONTEXTUAL_KEYWORDS,
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
# [END add_real_estate_feed]

# Creates a feed mapping for a given feed.
def create_feed_mapping(
  client,
  customer_id,
  feed_resource_name,
  placeholders_to_feed_attribute_map
)
  # Creates the feed mapping operation.
  operation = client.operation.create_resource.feed_mapping do |fm|
    fm.placeholder_type = :DYNAMIC_REAL_ESTATE
    fm.feed = feed_resource_name
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = placeholders_to_feed_attribute_map[:LISTING_ID].id
      afm.real_estate_field = :LISTING_ID
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = placeholders_to_feed_attribute_map[:LISTING_NAME].id
      afm.real_estate_field = :LISTING_NAME
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = placeholders_to_feed_attribute_map[:FINAL_URLS].id
      afm.real_estate_field = :FINAL_URLS
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = placeholders_to_feed_attribute_map[:IMAGE_URL].id
      afm.real_estate_field = :IMAGE_URL
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = placeholders_to_feed_attribute_map[:CONTEXTUAL_KEYWORDS].id
      afm.real_estate_field = :CONTEXTUAL_KEYWORDS
    end
  end

  # Issues a mutate request to add the feed mapping and print some information.
  response = client.service.feed_mapping.mutate_feed_mappings(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Feed mapping with resource name " \
    "#{response.results.first.resource_name} was created."
end

# Adds a new item to the feed.
# [START add_real_estate_feed_1]
def create_feed_item(
  client,
  customer_id,
  feed_resource_name,
  placeholders_to_feed_attribute_map
)
  # Creates the feed item operation.
  operation = client.operation.create_resource.feed_item do |fi|
    fi.feed = feed_resource_name
    fi.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = placeholders_to_feed_attribute_map[:LISTING_ID].id
      v.string_value = "ABC123DEF"
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = placeholders_to_feed_attribute_map[:LISTING_NAME].id
      v.string_value = "Two bedroom with magnificent views"
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = placeholders_to_feed_attribute_map[:FINAL_URLS].id
      v.string_values << "http://www.example.com/listings/"
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = placeholders_to_feed_attribute_map[:IMAGE_URL].id
      v.string_value = "http://www.example.com/listings/images?listing_id=ABC123DEF"
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = placeholders_to_feed_attribute_map[:CONTEXTUAL_KEYWORDS].id
      v.string_values += ["beach community", "ocean view", "two bedroom"]
    end
  end

  # Issues a mutate request to add the feed item and print some information.
  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Feed item with resource name " \
    "#{response.results.first.resource_name} was created."
end
# [END add_real_estate_feed_1]

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
    add_real_estate_feed(options.fetch(:customer_id).tr("-", ""))
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
