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
# Adds sitelinks to a campaign using feed services. To create a campaign, run
# add_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_sitelinks_using_feeds(customer_id, campaign_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create a feed, which acts as a table to store data.
  feed_data = create_feed(client, customer_id)

  # Create feed items, which fill out the feed table with data.
  create_feed_items(client, customer_id, feed_data)

  # Create a feed mapping, which tells Google Ads how to interpret this data to
  # display additional sitelink information on ads.
  create_feed_mapping(client, customer_id, feed_data)

  # Create a campaign feed, which tells Google Ads which campaigns to use the
  # provided data with.
  create_campaign_feed(client, customer_id, campaign_id, feed_data)

  # If an ad group is specified, limit targeting only to the given ad group.
  unless ad_group_id.nil?
    create_ad_group_targeting(client, customer_id, feed_data, ad_group_id)
  end
end

def create_feed(client, customer_id)
  feed = client.resource.feed do |f|
    f.name = "Sitelinks Feed ##{(Time.new.to_f * 1000).to_i}"
    f.origin = :USER

    # Specify the column name and data type. This is just raw data at this point,
    # and not yet linked to any particular purpose. The names are used to help us
    # remember what they are intended for later.
    f.attributes << client.resource.feed_attribute do |fa|
      fa.name = "Link Text"
      fa.type = :STRING
    end
    f.attributes << client.resource.feed_attribute do |fa|
      fa.name = "Link Final URL"
      fa.type = :URL_LIST
    end
    f.attributes << client.resource.feed_attribute do |fa|
      fa.name = "Line 1"
      fa.type = :STRING
    end
    f.attributes << client.resource.feed_attribute do |fa|
      fa.name = "Line 2"
      fa.type = :STRING
    end
  end

  operation = client.operation.create_resource.feed(feed)

  response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )

  feed_resource_name = response.results.first.resource_name

  puts "Created feed with resource name '#{feed_resource_name}'"

  # After we create the feed, we need to fetch it so we can determine the
  # attribute IDs, which will be required when populating feed items.
  feed = client.service.google_ads.search(
    customer_id: customer_id,
    query: "SELECT feed.attributes FROM feed WHERE feed.resource_name = '#{feed_resource_name}'"
  ).first.feed

  attribute_ids = feed.attributes.map(&:id)

  {
    feed: feed_resource_name,
    # The attribute IDs come back in the same order that they were added.
    link_text_attribute_id: attribute_ids[0],
    final_url_attribute_id: attribute_ids[1],
    line_1_attribute_id: attribute_ids[2],
    line_2_attribute_id: attribute_ids[3],
  }
end

def new_feed_item_operation(client, data, text, final_url, line_1, line_2)
  feed_item = client.resource.feed_item do |fi|
    fi.feed = data[:feed]

    fi.attribute_values << client.resource.feed_item_attribute_value do |av|
      av.feed_attribute_id = data[:link_text_attribute_id]
      av.string_value = text
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |av|
      av.feed_attribute_id = data[:final_url_attribute_id]
      av.string_values << final_url
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |av|
      av.feed_attribute_id = data[:line_1_attribute_id]
      av.string_value = line_1
    end
    fi.attribute_values << client.resource.feed_item_attribute_value do |av|
      av.feed_attribute_id = data[:line_2_attribute_id]
      av.string_value = line_2
    end
  end

  client.operation.create_resource.feed_item(feed_item)
end

def create_feed_items(client, customer_id, feed_data)
  operations = []
  operations << new_feed_item_operation(
      client, feed_data, "Home", "http://www.example.com",
      "Home line 1", "Home line 2")
  operations << new_feed_item_operation(
      client, feed_data, "Stores", "http://www.example.com/stores",
      "Stores line 1", "Stores line 2")
  operations << new_feed_item_operation(
      client, feed_data, "On Sale", "http://www.example.com/sale",
      "On Sale line 1", "On Sale line 2")
  operations << new_feed_item_operation(
      client, feed_data, "Support", "http://www.example.com/support",
      "Support line 1", "Support line 2")
  operations << new_feed_item_operation(
      client, feed_data, "Products", "http://www.example.com/catalogue",
      "Products line 1", "Products line 2")
  operations << new_feed_item_operation(
      client, feed_data, "About Us", "http://www.example.com/about",
      "About Us line 1", "About Us line 2")

  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: operations,
  )

  feed_items = response.results.map {|result| result.resource_name}
  puts "Created the following feed items:"
  feed_items.each do |feed_item|
    puts "\t#{feed_item}"
  end

  # We will need the resource name of the feed item to use in targeting.
  feed_data[:feed_items] = feed_items
  # We may also need the feed item ID if we are going to use it in a mapping function.
  # For feed items, the ID is the last part of the resource name, after the '~'.
  feed_data[:feed_item_ids] = feed_items.map {|feed_item| feed_item.split('~').last}
end

def create_feed_mapping(client, customer_id, feed_data)
  feed_mapping = client.resource.feed_mapping do |fm|
    fm.placeholder_type = :SITELINK
    fm.feed = feed_data[:feed]

    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = feed_data[:link_text_attribute_id]
      afm.sitelink_field = :TEXT
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = feed_data[:final_url_attribute_id]
      afm.sitelink_field = :FINAL_URLS
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = feed_data[:line_1_attribute_id]
      afm.sitelink_field = :LINE_1
    end
    fm.attribute_field_mappings << client.resource.attribute_field_mapping do |afm|
      afm.feed_attribute_id = feed_data[:line_2_attribute_id]
      afm.sitelink_field = :LINE_2
    end
  end

  operation = client.operation.create_resource.feed_mapping(feed_mapping)

  response = client.service.feed_mapping.mutate_feed_mappings(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created feed mapping '#{response.results.first.resource_name}'"
end

def create_campaign_feed(client, customer_id, campaign_id, feed_data)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  campaign_feed = client.resource.campaign_feed do |cf|
    cf.placeholder_types << :SITELINK
    cf.feed = feed_data[:feed]
    cf.campaign = client.path.campaign(customer_id, campaign_id)

    cf.matching_function = client.resource.matching_function do |mf|
      mf.function_string =
          "AND(IN(FEED_ITEM_ID,{ #{feed_data[:feed_item_ids].join(',')} }),EQUALS(CONTEXT.DEVICE,'Mobile'))"
    end
  end

  operation = client.operation.create_resource.campaign_feed(campaign_feed)

  response = client.service.campaign_feed.mutate_campaign_feeds(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created campaign feed '#{response.results.first.resource_name}'"
end

def create_ad_group_targeting(client, customer_id, feed_data, ad_group_id)
  feed_item = feed_data[:feed_items].first

  feed_item_target = client.resource.feed_item_target do |fit|
    # You must set targeting on a per-feed-item basis. This will restrict the
    # first feed item we added to only serve for the given ad group.
    fit.feed_item = feed_item
    fit.ad_group = client.path.ad_group(customer_id, ad_group_id)
  end

  operation = client.operation.create_resource.feed_item_target(feed_item_target)

  response = client.service.feed_item_target.mutate_feed_item_targets(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created feed item target '#{response.results.first.resource_name}' " \
      "for feed item '#{feed_item}'"
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:ad_group_id] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID (optional)') do |v|
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
    add_sitelinks_using_feeds(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
