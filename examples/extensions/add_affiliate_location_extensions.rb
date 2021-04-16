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
# This code example adds a feed that syncs retail addresses for a given retail
# chain ID and associates the feed with a campaign for serving affiliate
# location extensions.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START add_affiliate_location_extensions]
def add_affiliate_location_extensions(
  customer_id,
  chain_id,
  campaign_id,
  should_delete_existing_feeds)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  if should_delete_existing_feeds
    delete_location_extension_feeds(client, customer_id)
  end

  feed_resource_name = create_affiliate_location_extension_feed(
    client,
    customer_id,
    chain_id,
  )

  # After the completion of the feed creation operation above the added feed
  # will not be available for usage in a campaign feed until the feed mapping
  # is created. We then need to wait for the feed mapping to be created.
  feed_mapping = wait_for_feed_to_be_ready(
    client,
    customer_id,
    feed_resource_name,
  )

  create_campaign_feed(
    client,
    customer_id,
    campaign_id,
    feed_mapping,
    feed_resource_name,
    chain_id,
  )
end
# [END add_affiliate_location_extensions]

# Deletes the existing location extension feeds.
def delete_location_extension_feeds(client, customer_id)
  # To delete a location extension feed, you need to
  # 1. Delete the customer feed so that the location extensions from the feed
  #    stop serving.
  # 2. Delete the feed so that Google Ads will no longer sync from the GMB
  #    account.
  customer_feeds = get_location_extension_customer_feeds(client, customer_id)
  unless customer_feeds.empty?
    # Optional: You may also want to delete the campaign and ad group feeds.
    remove_customer_feeds(client, customer_id, customer_feeds)
  end
  feeds = get_location_extension_feeds(client, customer_id)
  unless feeds.empty?
    remove_feeds(client, customer_id, customer_feeds)
  end
end

# Gets the existing location extension customer feeds.
def get_location_extension_customer_feeds(client, customer_id)
  customer_feeds = []

  # Creates the query. A location extension customer feed can be identified
  # by filtering for placeholder_types as LOCATION (location extension feeds) or
  # placeholder_types as AFFILIATE_LOCATION (affiliate location extension feeds).
  query = <<~QUERY
    SELECT customer_feed.resource_name
    FROM customer_feed
    WHERE customer_feed.placeholder_types CONTAINS ANY(LOCATION, AFFILIATE_LOCATION)
    AND customer_feed.status = ENABLED
  QUERY

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all messages to collect the results.
  responses.each do |response|
    response.results.each do |row|
      customer_feeds << row.customer_feed
    end
  end

  customer_feeds
end

# Removes the customer feeds.
def remove_customer_feeds(client, customer_id, customer_feeds)
  operations = []

  customer_feeds.each do |customer_feed|
    operations << client.operation.remove_resource.customer_feed(
      customer_feed.resource_name)
  end

  # Issues a mutate request to remove the customer feeds.
  client.service.customer_feed.mutate_customer_feeds(customer_id, operations)
end

# Gets the existing location extension feeds.
def get_location_extension_feeds(client, customer_id)
  feeds = []

  # Creates the query.
  query = <<~QUERY
    SELECT feed.resource_name
    FROM feed
    WHERE feed.status = ENABLED
    AND feed.origin = USER
  QUERY

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Iterates over all rows in all messages to collect the results.
  responses.each do |response|
    response.results.each do |row|
      feeds << row.feed
    end
  end

  feeds
end

# Removes the feeds.
def remove_feeds(client, customer_id, feeds)
  operations = []

  feeds.each do |feed|
    operations << client.operation.remove_resource.feed(feed.resource_name)
  end

  # Issues a mutate request to remove the feeds.
  client.service.feed.mutate_feeds(customer_id, operations)
end

# Creates the affiliate location extension feed.
def create_affiliate_location_extension_feed(client, customer_id, chain_id)
  # Creates a feed that will sync to retail addresses for a given retail
  # chain ID.
  # Do not add feed attributes, Google Ads will add them automatically because
  # this will be a system generated feed.
  operation = client.operation.create_resource.feed do |feed|
    feed.name = "Affiliate Location Extension feed ##{(Time.new.to_f * 1000).to_i}"
    feed.affiliate_location_feed_data = client.resource.affiliate_location_feed_data do |data|
      data.chain_ids << chain_id
      data.relationship_type = :GENERAL_RETAILER
    end
    # Since this feed's contents will be managed by Google, you must set its
    # origin to GOOGLE.
    feed.origin = :GOOGLE
  end

  # Issues a mutate request to add the feed and prints some information.
  response = client.service.feed.mutate_feeds(
    customer_id: customer_id,
    operations: [operation],
  )

  feed_resource_name = response.results.first.resource_name
  puts "Affiliate location extension feed created with resource name: #{feed_resource_name}"

  feed_resource_name
end

# Waits for the affiliate location extension feed to be ready. An exponential
# back-off policy with a maximum number of attempts is used to poll the server.
# [START add_affiliate_location_extensions_2]
def wait_for_feed_to_be_ready(client, customer_id, feed_resource_name)
  number_of_attempts = 0

  while number_of_attempts < MAX_FEEDMAPPING_RETRIEVAL_ATTEMPTS
    # Once you create a feed, Google's servers will setup the feed by creating
    # feed attributes and feed mapping. Once the feed mapping is created, it is
    # ready to be used for creating customer feed.
    # This process is asynchronous, so we wait until the feed mapping is
    # created, performing exponential backoff.
    feed_mapping = get_affiliated_location_extension_feed_mapping(
      client, customer_id, feed_resource_name)

    if feed_mapping.nil?
      number_of_attempts += 1
      sleep_seconds = POLL_FREQUENCY_SECONDS * (2 ** number_of_attempts)
      puts "Checked #{number_of_attempts} time(s). Feed is not ready yet. " \
        "Waiting #{sleep_seconds} seconds before trying again."
      sleep sleep_seconds
    else
      puts "Feed #{feed_resource_name} is now ready."
      return feed_mapping
    end
  end

  raise "The affiliate location feed mapping is still not ready after " \
    "#{MAX_FEEDMAPPING_RETRIEVAL_ATTEMPTS} attempt(s)."
end
# [END add_affiliate_location_extensions_2]

# Gets the affiliate location extension feed mapping.
# [START add_affiliate_location_extensions_1]
def get_affiliated_location_extension_feed_mapping(
  client,
  customer_id,
  feed_resource_name)
  # Creates a query that retrieves the feed mapping.
  query = <<~QUERY
    SELECT feed_mapping.resource_name,
           feed_mapping.attribute_field_mappings,
           feed_mapping.status
    FROM feed_mapping
    WHERE feed_mapping.feed = '#{feed_resource_name}'
    AND feed_mapping.status = ENABLED
    AND feed_mapping.placeholder_type = AFFILIATE_LOCATION
    LIMIT 1
  QUERY

  # Issues a search request
  responses = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    return_total_results_count: true,
  )

  response = responses.page.response
  response.total_results_count == 1 ? response.results.first.feed_mapping : nil
end
# [END add_affiliate_location_extensions_1]

# Creates the campaign feed.
# [START add_affiliate_location_extensions_3]
def create_campaign_feed(
  client,
  customer_id,
  campaign_id,
  feed_mapping,
  feed_resource_name,
  chain_id)
  matching_function = "IN(FeedAttribute[#{feed_resource_name.split('/')[3]}, " \
    "#{get_attribute_id_for_chain_id(feed_mapping)}], #{chain_id})"

  # Adds a campaign feed that associates the feed with this campaign for the
  # AFFILIATE_LOCATION placeholder type.
  operation = client.operation.create_resource.campaign_feed do |cf|
    cf.feed = feed_resource_name
    cf.placeholder_types << :AFFILIATE_LOCATION
    cf.matching_function = client.resource.matching_function do |m|
      m.function_string = matching_function
    end
    cf.campaign = client.path.campaign(customer_id, campaign_id)
  end

  # Issues a mutate request to add the campaign feed and prints some information.
  response = client.service.campaign_feed.mutate_campaign_feeds(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Campaign feed created with resource name: " \
    "#{response.results.first.resource_name}"
end
# [END add_affiliate_location_extensions_3]

# Gets the feed attribute ID for the retail chain ID.
# [START add_affiliate_location_extensions_4]
def get_attribute_id_for_chain_id(feed_mapping)
  feed_mapping.attribute_field_mappings.each do |fm|
    if fm.affiliate_location_field == :CHAIN_ID
      return fm.feed_attribute_id
    end
  end

  raise "Affiliate location feed mapping isn't setup correctly."
end
# [END add_affiliate_location_extensions_4]

if __FILE__ == $0
  POLL_FREQUENCY_SECONDS = 5
  MAX_FEEDMAPPING_RETRIEVAL_ATTEMPTS = 10

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
  options[:chain_id] = 'INSERT_CHAIN_ID_HERE'
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:should_delete_existing_feeds] = false

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-N', '--chain-id CHAIN-ID', String, 'Chain ID') do |v|
      options[:chain_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-D', '--should-delete-existing-feeds SHOULD-DELETE-EXISTING-FEEDS',
      TrueClass, 'Should delete existing feeds') do |v|
      options[:should_delete_existing_feeds] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_affiliate_location_extensions(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:chain_id).to_i,
      options.fetch(:campaign_id),
      options[:should_delete_existing_feeds])
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
