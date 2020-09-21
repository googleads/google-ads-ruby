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
# Adds an ad customizer feed and associates it with the customer. Then it adds
# an ad that uses the feed to populate dynamic data.

require 'date'
require 'google/ads/google_ads'
require 'optparse'

def add_ad_customizer(customer_id, ad_group_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  if ad_group_ids.size != NUMBER_OF_AD_GROUPS
    raise "Please pass exactly #{NUMBER_OF_AD_GROUPS} ad group IDs in the " \
      "ad_group_ids parameter."
  end

  feed_name = "Ad Customizer example feed #{(Time.new.to_f * 1000).to_i}"

  # Create a feed to be used for ad customization
  ad_customizer_feed_resource_name = create_ad_customizer_feed(
    client, customer_id, feed_name)

  # Retrieve the attributes of the feed.
  ad_customizer_feed_attributes = get_feed_attributes(
    client, customer_id, ad_customizer_feed_resource_name)

  # Map the feed to the ad customizer placeholder fields.
  create_ad_customizer_mapping(
    client,
    customer_id,
    ad_customizer_feed_resource_name,
    ad_customizer_feed_attributes,
  )

  # Create feed items to be used to customize ads.
  feed_item_resource_names = create_feed_items(
    client,
    customer_id,
    ad_customizer_feed_resource_name,
    ad_customizer_feed_attributes,
  )

  # Set the feed to be used only with the specified ad groups.
  create_feed_item_targets(
    client,
    customer_id,
    ad_group_ids,
    feed_item_resource_names,
  )

  # Create ads that use the feed for customization.
  create_ads_with_customizations(
    client,
    customer_id,
    ad_group_ids,
    feed_name,
  )
end

# Creates a feed to be used for ad customization.
def create_ad_customizer_feed(
  client, customer_id, feed_name)
  # Creates a feed operation for creating a feed.
  operation = client.operation.create_resource.feed do |feed|
    feed.name = feed_name
    # Creates three feed attributes: a name, a price and a date. The attribute
    # names are arbitrary choices and will be used as placeholders in the ad
    # text fields.
    feed.attributes << client.resource.feed_attribute do |a|
      a.type = :STRING
      a.name = "Name"
    end
    feed.attributes << client.resource.feed_attribute do |a|
      a.type = :STRING
      a.name = "Price"
    end
    feed.attributes << client.resource.feed_attribute do |a|
      a.type = :DATE_TIME
      a.name = "Date"
    end
    feed.origin = :USER
  end

  # Issues a mutate request to add the feed.
  feed_response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )

  feed_resource_name = feed_response.results.first.resource_name
  puts "Added a feed with resource name #{feed_resource_name}."

  feed_resource_name
end

# Retrieves attributes for a feed.
def get_feed_attributes(
  client, customer_id, ad_customizer_feed_resource_name)
  query = <<~QUERY
    SELECT feed.attributes, feed.name
    FROM feed
    WHERE feed.resource_name = "#{ad_customizer_feed_resource_name}"
  QUERY

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    page_size: PAGE_SIZE,
  )

  feed = response.first.feed
  feed_details = {}
  puts "Found the following attributes for feed with name #{feed.name}:"
  feed.attributes.each do |a|
    feed_details[a.name.value] = a.id
    puts "\t#{a.name} with id #{a.id} and type #{a.type}"
  end

  feed_details
end

# Creates a feed mapping for a given feed.
def create_ad_customizer_mapping(
  client,
  customer_id,
  ad_customizer_feed_resource_name,
  ad_customizer_feed_attributes)
  # Creates the operation.
  operation = client.operation.create_resource.feed_mapping do |fm|
    fm.placeholder_type = :AD_CUSTOMIZER
    fm.feed = ad_customizer_feed_resource_name
    # Maps the feed attribute IDs to the field ID constants.
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |af|
      af.feed_attribute_id = ad_customizer_feed_attributes["Name"]
      af.ad_customizer_field = :STRING
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |af|
      af.feed_attribute_id = ad_customizer_feed_attributes["Price"]
      af.ad_customizer_field = :PRICE
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |af|
      af.feed_attribute_id = ad_customizer_feed_attributes["Date"]
      af.ad_customizer_field = :DATE
    end
  end

  # Issues a mutate request to add the feed mapping.
  response = client.service.feed_mapping.mutate_feed_mappings(
    customer_id: customer_id,
    operations: [operation],
  )

  # Displays the results.
  response.results.each do |result|
    puts "Created feed mapping with resource name: #{result.resource_name}"
  end
end

# Creates two different feed items to enable two different ad customizations.
def create_feed_items(
  client,
  customer_id,
  ad_customizer_feed_resource_name,
  ad_customizer_feed_attributes)
  feed_item_operations = []

  feed_item_operations << create_feed_item_operation(
    client,
    "Mars",
    "$1234.56",
    # Set the date to the 1st of the current month.
    DateTime.new(Date.today.year, Date.today.month, 1, 0, 0, 0).strftime("%Y%m%d %H%M%S"),
    ad_customizer_feed_resource_name,
    ad_customizer_feed_attributes,
  )

  feed_item_operations << create_feed_item_operation(
    client,
    "Venus",
    "$6543.21",
    # Set the date to the 15th of the current month.
    DateTime.new(Date.today.year, Date.today.month, 15, 0, 0, 0).strftime("%Y%m%d %H%M%S"),
    ad_customizer_feed_resource_name,
    ad_customizer_feed_attributes,
  )

  # Adds the feed items.
  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: feed_item_operations,
  )

  feed_item_resource_names = []
  response.results.each do |result|
    puts "Created feed item with resource name #{result.resource_name}"
    feed_item_resource_names << result.resource_name
  end

  feed_item_resource_names
end

# Creates a FeedItemOperation.
def create_feed_item_operation(
  client,
  name,
  price,
  date,
  ad_customizer_feed_resource_name,
  ad_customizer_feed_attributes)
  client.operation.create_resource.feed_item do |item|
    item.feed = ad_customizer_feed_resource_name
    item.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = ad_customizer_feed_attributes["Name"]
      v.string_value = name
    end
    item.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = ad_customizer_feed_attributes["Price"]
      v.string_value = price
    end
    item.attribute_values << client.resource.feed_item_attribute_value do |v|
      v.feed_attribute_id = ad_customizer_feed_attributes["Date"]
      v.string_value = date
    end
  end
end

# Restricts the feed items to work only with a specific ad group; this prevents
# the feed items from being used elsewhere and makes sure they are used only for
# customizing a specific ad group.
def create_feed_item_targets(
  client,
  customer_id,
  ad_group_ids,
  feed_item_resource_names)
  # Bind each feed item to a specific ad group to make sure it will only be
  # used to customize ads inside that ad group; using the feed item elsewhere
  # will result in an error.
  for i in 0..(feed_item_resource_names.size - 1)
    feed_item_resource_name = feed_item_resource_names[i]
    ad_group_id = ad_group_ids[i]

    # Creates the operation.
    operation = client.operation.create_resource.feed_item_target do |t|
      t.feed_item = feed_item_resource_name
      t.ad_group = client.path.ad_group(customer_id, ad_group_id)
    end

    # Issues a mutate request to add the feed item target.
    response = client.service.feed_item_target.mutate_feed_item_targets(
      customer_id: customer_id,
      operations: [operation],
    )

    puts "Added feed item target with resource name #{response.results.first.resource_name}."
  end
end

# Creates expanded text ads that use the ad customizer feed to populate the
# placeholders.
def create_ads_with_customizations(
  client,
  customer_id,
  ad_group_ids,
  feed_name)
  operations = []

  ad_group_ids.each do |ad_group_id|
    operations << client.operation.create_resource.ad_group_ad do |aga|
      aga.ad = client.resource.ad do |ad|
        ad.expanded_text_ad = client.resource.expanded_text_ad_info do |eta|
          eta.headline_part1 = "Luxury cruise to {=#{feed_name}.Name}"
          eta.headline_part2 = "Only {=#{feed_name}.Price}"
          eta.description = "Offer ends in {=countdown(#{feed_name}.Date)}!"
        end
        ad.final_urls << "http://www.example.com"
      end
      aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    end
  end

  # Issues a mutate request to add the ads.
  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: operations,
  )

  puts "Added #{response.results.size} ads:"
  response.results.each do |result|
    puts "Added an ad with resource name #{result.resource_name}."
  end
end

if __FILE__ == $0
  # We're creating two different ad groups to be dynamically populated by
  # the same feed.
  NUMBER_OF_AD_GROUPS = 2

  # We're doing only searches by resource_name in this example,
  # we can set page size = 1.
  PAGE_SIZE = 1;

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
  options[:ad_group_ids] = [
    'INSERT_AD_GROUP_ID_1_HERE',
    'INSERT_AD_GORUP_ID_2_HERE',
  ]

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-ids AD-GROUP-IDS', String, "#{NUMBER_OF_AD_GROUPS} AdGroup IDs (comma-separated)") do |v|
      options[:ad_group_ids] = v.split(',')
    end

    opts.on('-B', '--bid-modifier-value BID-MODIFIER-VALUE', String,
        'Bid Modifier Value') do |v|
      options[:bid_modifier_value] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_ad_customizer(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_ids],
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
