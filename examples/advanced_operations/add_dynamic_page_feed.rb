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
  feed_attribute_url = client.resource(:FeedAttribute)
  feed_attribute_url.type = :URL_LIST
  feed_attribute_url.name = client.wrapper.string("Page URL")

  feed_attribute_label = client.resource(:FeedAttribute)
  feed_attribute_label.type = :STRING_LIST
  feed_attribute_label.name = client.wrapper.string("Label")

  feed = client.resource(:Feed)
  feed.name = client.wrapper.string("DSA Feed #{(Time.now.to_f * 1000).to_i}")
  feed.attributes << feed_attribute_url
  feed.attributes << feed_attribute_label
  feed.origin = :USER

  operation = client.operation(:Feed)
  operation["create"] = feed

  feed_service = client.service(:Feed)

  response = feed_service.mutate_feeds(customer_id, [operation])
  feed_id = response.results.first.resource_name

  # We need to look up the attribute name and IDs for the feed we just created
  # so that we can give them back to the API for construction of feed mappings
  # in the next function.
  ga_service = client.service(:GoogleAds)
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
  response = ga_service.search(customer_id, query)

  # Hash.[] takes an aray of pairs and turns them in to a hash with keys
  # equal to the first item, and values equal to the second item, we get two
  # items back one with ["Page URL", id_for_url] and another with
  # ["Label", id_for_label], so this expression gives us a convenient way to
  # look them back up
  attribute_lookup = Hash[
    response.first.feed.attributes.map { |attribute|
      [attribute.name.value, attribute.id.value]
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
  url_field_mapping = client.resource(:AttributeFieldMapping)
  url_field_mapping.feed_attribute_id = client.wrapper.int64(
    feed_details.url_attribute_id
  )
  url_field_mapping.dsa_page_feed_field = :PAGE_URL

  label_field_mapping = client.resource(:AttributeFieldMapping)
  label_field_mapping.feed_attribute_id = client.wrapper.int64(
    feed_details.label_attribute_id
  )
  label_field_mapping.dsa_page_feed_field = :LABEL

  feed_mapping = client.resource(:FeedMapping)
  feed_mapping.criterion_type = :DSA_PAGE_FEED
  feed_mapping.feed = client.wrapper.string(feed_details.resource_name)
  feed_mapping.attribute_field_mappings << url_field_mapping
  feed_mapping.attribute_field_mappings << label_field_mapping

  operation = client.operation(:FeedMapping)
  operation['create'] = feed_mapping

  feed_mapping_service = client.service(:FeedMapping)
  response = feed_mapping_service.mutate_feed_mappings(customer_id, [operation])
  puts("Feed mapping created with id #{response.results.first.resource_name}")
end

def create_feed_items(client, customer_id, feed_details, label)
  urls = [
    "http://www.example.com/discounts/rental-cars",
    "http://www.example.com/discounts/hotel-deals",
    "http://www.example.com/discounts/flight-deals",
  ]

  feed_items = urls.map { |url|
    feed_item = client.resource(:FeedItem)

    url_attribute_value = client.resource(:FeedItemAttributeValue)
    url_attribute_value.feed_attribute_id = client.wrapper.int64(
      feed_details.url_attribute_id
    )
    url_attribute_value.string_values << client.wrapper.string(url)

    label_attribute_value = client.resource(:FeedItemAttributeValue)
    label_attribute_value.feed_attribute_id = client.wrapper.int64(
      feed_details.label_attribute_id
    )
    label_attribute_value.string_values << client.wrapper.string(label)

    feed_item.feed = client.wrapper.string(feed_details.resource_name)
    feed_item.attribute_values << url_attribute_value
    feed_item.attribute_values << label_attribute_value
    feed_item
  }

  ops = feed_items.map { |fi|
    op = client.operation(:FeedItem)
    op["create"] = fi
    op
  }

  feed_item_service = client.service(:FeedItem)
  response = feed_item_service.mutate_feed_items(customer_id, ops)

  response.results.each do |result|
    puts("Created feed item with id #{result.resource_name}")
  end
end

def update_campaign_dsa_setting(client, customer_id, campaign_id, feed_details)
  query = <<~EOD
    SELECT
      campaign.id, campaign.name, campaign.dynamic_search_ads_setting.domain_name
    FROM
      campaign
    WHERE
      campaign.id = #{campaign_id}
    LIMIT 1000
  EOD
  ga_service = client.service(:GoogleAds)
  response = ga_service.search(customer_id, query)

  campaign = response.first
  if campaign.nil?
    raise "Campaign with id #{id} not found"
  end

  campaign = campaign.campaign

  if !campaign.dynamic_search_ads_setting.domain_name \
    || campaign.dynamic_search_ads_setting.domain_name.value == ""
    raise "Campaign id #{campaign_id} is not set up for dynamic search ads"
  end

  mask = client.field_mask.with campaign do
    campaign.dynamic_search_ads_setting.feeds << client.wrapper.string(
      feed_details.resource_name
    )
  end

  op = client.operation(:Campaign)
  op["update"] = campaign
  op["update_mask"] = mask

  campaign_service = client.service(:Campaign)
  response = campaign_service.mutate_campaigns(customer_id, [op])
  puts("Updated campaign #{response.results.first.resource_name}")
end

def add_dsa_targeting(client, customer_id, ad_group_resource_name, label)
  webpage_condition_info = client.resource(:WebpageConditionInfo)
  webpage_condition_info.operand = :CUSTOM_LABEL
  webpage_condition_info.argument = client.wrapper.string(label)

  webpage_criterion = client.resource(:WebpageInfo)
  webpage_criterion.criterion_name = client.wrapper.string(
    "Test criterion"
  )
  webpage_criterion.conditions << webpage_condition_info

  ad_group_criterion = client.resource(:AdGroupCriterion)
  ad_group_criterion.ad_group = client.wrapper.string(ad_group_resource_name)
  ad_group_criterion.webpage = webpage_criterion
  ad_group_criterion.cpc_bid_micros = client.wrapper.int64(1_500_000)

  op = client.operation(:AdGroupCriterion)
  op["create"] = ad_group_criterion

  ad_group_criterion_service = client.service(:AdGroupCriterion)
  response = ad_group_criterion_service.mutate_ad_group_criteria(customer_id, [op])

  puts(
    "Created ad group criterion with id: #{response.results.first.resource_name}"
  )
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
