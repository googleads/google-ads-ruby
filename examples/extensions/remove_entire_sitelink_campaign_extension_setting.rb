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
# Removes the entire sitelink campaign extension setting by removing both the
# sitelink campaign extension setting itself and its associated sitelink
# extension feed items. This requires two steps, since removing the campaign
# extension setting doesn't automatically remove its extension feed items.
#
# To make this example work with other types of extensions, find
# `ExtensionType::SITELINK` and replace it with the extension type you wish to
# remove.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def remove_entire_sitelink_campaign_extension_setting(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  mutate_operations = []

  # Creates a mutate operation that contains the campaign extension setting
  # operation to remove the specified sitelink campaign extension setting.
  mutate_operations << create_sitelink_campaign_extension_setting_mutate_operation(
    client,
    customer_id,
    campaign_id,
  )

  # Gets all sitelink extension feed items of the specified campaign.
  google_ads_service = client.service.google_ads
  extension_feed_item_resource_names = get_all_sitelink_extension_feed_items(
    client,
    google_ads_service,
    customer_id,
    campaign_id,
  )

  # Creates mutate operations, each of which contains an extension feed item
  # operation to remove the specified extension feed items.
  mutate_operations += create_extension_feed_item_mutate_operations(
    client,
    extension_feed_item_resource_names,
  )

  # Issues a mutate request to remove the campaign extension setting and its
  # extension feed items.
  response = google_ads_service.mutate(
    customer_id: customer_id,
    mutate_operations: mutate_operations,
  )
  mutate_operation_responses = response.mutate_operation_responses

  # Prints the information on the removed campaign extension setting and its
  # extension feed items.
  # Each mutate operation response is returned in the same order as we passed
  # its corresponding operation. Therefore, the first belongs to the campaign
  # setting operation, and the rest belong to the extension feed item operations.
  puts "Removed a campaign extension setting with resource name: " \
    "#{mutate_operation_responses[0].campaign_extension_setting_result.resource_name}"
  for i in 1..mutate_operation_responses.size - 1
    puts "Removed an extension feed item with resource name: " \
      "#{mutate_operation_responses[i].extension_feed_item_result.resource_name}"
  end
end

# Creates a mutate operation for the sitelink campaign extension setting that
# will be removed.
def create_sitelink_campaign_extension_setting_mutate_operation(
  client,
  customer_id,
  campaign_id
)
  # Creates a mutate operation for the campaign extension setting operation.
  mutate_op = client.operation.mutate
  mutate_op.campaign_extension_setting_operation = \
    client.operation.remove_resource.campaign_extension_setting(
        client.path.campaign_extension_setting(
          customer_id, campaign_id, :SITELINK))
  mutate_op
end

# Returns all sitelink extension feed items associated to the specified
# campaign extension setting.
def get_all_sitelink_extension_feed_items(
  client,
  google_ads_service,
  customer_id,
  campaign_id
)
  # Creates a query that retrieves all campaigns.
  query = <<~QUERY
    SELECT campaign_extension_setting.campaign,
           campaign_extension_setting.extension_type,
           campaign_extension_setting.extension_feed_items
    FROM campaign_extension_setting
    WHERE campaign_extension_setting.campaign = '#{client.path.campaign(customer_id, campaign_id)}'
    AND campaign_extension_setting.extension_type = 'SITELINK'
  QUERY

  # Issues a search stream request
  stream = google_ads_service.search_stream(
    customer_id: customer_id,
    query: query,
  )

  extension_feed_item_resource_names = []
  # Iterates over all rows in all messages and prints the requested field values
  # for the campaign extension setting in each row.
  stream.each do |response|
    response.results.each do |row|
      extension_feed_items = row.campaign_extension_setting.extension_feed_items
      extension_feed_items.each do |item|
        extension_feed_item_resource_names << item
        puts "Extension feed item with resource name #{item} was found."
      end
    end
  end
  extension_feed_item_resource_names
end

# Creates mutate operations for the sitelink extension feed items that will be
# removed.
def create_extension_feed_item_mutate_operations(
  client,
  extension_feed_item_resource_names
)
  mutate_operations = []
  extension_feed_item_resource_names.each do |resource_name|
    # Creates a mutate operation to remove the extension feed item.
    mutate_op = client.operation.mutate
    mutate_op.extension_feed_item_operation = \
      client.operation.remove_resource.extension_feed_item(resource_name)
    mutate_operations += mutate_op
  end
  mutate_operations
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

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    remove_entire_sitelink_campaign_extension_setting(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
