#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2019, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# This code example adds a page feed to specify precisely which URLs to use with
# your Dynamic Search Ads campaign. To use a Dynamic Search Ads campaign, run
# add_dynamic_search_ads_campaign.rb. To get campaigns, run get_campaigns.rb.
#
# DEPRECATION WARNING!
# Feed-services based DSA page feeds are deprecated and being replaced with
# assets. See add_dynamic_page_feed_asset.rb.

require 'optparse'
require 'google/ads/google_ads'

FeedDetails = Struct.new(
  :resource_name,
  :url_attribute_id,
  :label_attribute_id
)

def add_dynamic_page_feed(customer_id, campaign_id, ad_group_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  dsa_page_url_label = "discounts"

  feed_details = create_feed(client, customer_id)
  create_feed_mapping(client, customer_id, feed_details)
  create_feed_items(client, customer_id, feed_details, dsa_page_url_label)

  update_campaign_dsa_setting(client, customer_id, campaign_id, feed_details)
  ad_group_resource_name = client.path.ad_group(customer_id, ad_group_id)

  add_dsa_targeting(
    client,
    customer_id,
    ad_group_resource_name,
    dsa_page_url_label
  )
end

def create_feed(client, customer_id)
  feed_attribute_url = client.resource.feed_attribute do |a|
    a.type = :URL_LIST
    a.name = "Page URL"
  end

  feed_attribute_label = client.resource.feed_attribute do |a|
    a.type = :STRING_LIST
    a.name = "Label"
  end

  feed = client.resource.feed do |f|
    f.name = "DSA Feed #{(Time.now.to_f * 1000).to_i}"
    f.attributes << feed_attribute_url
    f.attributes << feed_attribute_label
    f.origin = :USER
  end

  operation = client.operation.create_resource.feed(feed)

  response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )
  feed_id = response.results.first.resource_name

  # We need to look up the attribute name and IDs for the feed we just created
  # so that we can give them back to the API for construction of feed mappings
  # in the next function.
  query = <<~EOD
  SELECT
    feed.attributes
  FROM
    feed
  WHERE
    feed.resource_name = '#{feed_id}'
  LIMIT
    100
  EOD
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  # Hash.[] takes an aray of pairs and turns them in to a hash with keys
  # equal to the first item, and values equal to the second item, we get two
  # items back one with ["Page URL", id_for_url] and another with
  # ["Label", id_for_label], so this expression gives us a convenient way to
  # look them back up
  attribute_lookup = Hash[
    response.first.feed.attributes.map { |attribute|
      [attribute.name, attribute.id]
    }
  ]

  # Finally, construct a FeedDetails object so that we have a nice small
  # wrapper around the details we care about for the next phase.
  FeedDetails.new(
    feed_id,
    attribute_lookup.fetch("Page URL"),
    attribute_lookup.fetch("Label"),
  )
end

def create_feed_mapping(client, customer_id, feed_details)
  url_field_mapping = client.resource.attribute_field_mapping do |mapping|
    mapping.feed_attribute_id = feed_details.url_attribute_id
    mapping.dsa_page_feed_field = :PAGE_URL
  end

  label_field_mapping = client.resource.attribute_field_mapping do |mapping|
    mapping.feed_attribute_id = feed_details.label_attribute_id
    mapping.dsa_page_feed_field = :LABEL
  end

  feed_mapping = client.resource.feed_mapping do |mapping|
    mapping.criterion_type = :DSA_PAGE_FEED
    mapping.feed = feed_details.resource_name
    mapping.attribute_field_mappings << url_field_mapping
    mapping.attribute_field_mappings << label_field_mapping
  end

  operation = client.operation.create_resource.feed_mapping(feed_mapping)

  response = client.service.feed_mapping.mutate_feed_mappings(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Feed mapping created with id #{response.results.first.resource_name}"
end

def create_feed_items(client, customer_id, feed_details, label)
  urls = [
    "http://www.example.com/discounts/rental-cars",
    "http://www.example.com/discounts/hotel-deals",
    "http://www.example.com/discounts/flight-deals",
  ]

  feed_items = urls.map { |url|
    client.resource.feed_item do |fi|
      fi.feed = feed_details.resource_name
      fi.attribute_values << client.resource.feed_item_attribute_value do |val|
        val.feed_attribute_id = feed_details.url_attribute_id
        val.string_values << url
      end

      fi.attribute_values << client.resource.feed_item_attribute_value do |val|
        val.feed_attribute_id = feed_details.label_attribute_id
        val.string_values << label
      end
    end
  }

  ops = feed_items.map { |fi|
    client.operation.create_resource.feed_item(fi)
  }

  response = client.service.feed_item.mutate_feed_items(
    customer_id: customer_id,
    operations: ops,
  )

  response.results.each do |result|
    puts "Created feed item with id #{result.resource_name}"
  end
end

# [START add_dynamic_page_feed]
def update_campaign_dsa_setting(client, customer_id, campaign_id, feed_details)
  query = <<~EOD
    SELECT
      campaign.id,
      campaign.name,
      campaign.dynamic_search_ads_setting.feeds
    FROM
      campaign
    WHERE
      campaign.id = #{campaign_id}
    LIMIT 1000
  EOD
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  result = response.first
  # [END add_dynamic_page_feed]
  if result.nil?
    raise "Campaign with id #{id} not found"
  end

  # [START add_dynamic_page_feed_1]
  campaign = result.campaign

  op = client.operation.update_resource.campaign(campaign) do
    campaign.dynamic_search_ads_setting.feeds << feed_details.resource_name
  end

  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [op],
  )
  puts "Updated campaign #{response.results.first.resource_name}"
  # [END add_dynamic_page_feed_1]
end

# [START add_dynamic_page_feed_2]
def add_dsa_targeting(client, customer_id, ad_group_resource_name, label)
  webpage_condition_info = client.resource.webpage_condition_info do |wci|
    wci.operand = :CUSTOM_LABEL
    wci.argument = label
  end

  webpage_criterion = client.resource.webpage_info do |wi|
    wi.criterion_name = "Test criterion"
    wi.conditions << webpage_condition_info
  end

  ad_group_criterion = client.resource.ad_group_criterion do |agc|
    agc.ad_group = ad_group_resource_name
    agc.webpage = webpage_criterion
    agc.cpc_bid_micros = 1_500_000
  end

  op = client.operation.create_resource.ad_group_criterion(ad_group_criterion)

  response = client.service.ad_group_criterion.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [op],
  )

  puts "Created ad group criterion with id: #{response.results.first.resource_name}"
end
# [END add_dynamic_page_feed_2]

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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

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

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
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
    add_dynamic_page_feed(
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
