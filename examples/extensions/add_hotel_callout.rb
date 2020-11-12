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
# This example adds a hotel callout extension to a specific account, campaign
# within the account, and ad group within the campaign.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_hotel_callout(
  customer_id,
  campaign_id,
  ad_group_id,
  callout_text,
  language_code)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates an extension feed item as hotel callout.
  extension_feed_item_resource_name = add_extension_feed_item(
    client,
    customer_id,
    callout_text,
    language_code,
  )

  # Adds the extension feed item to the account.
  add_extension_to_account(
    client,
    customer_id,
    extension_feed_item_resource_name,
  )

  # Adds the extension feed item to the campaign.
  add_extension_to_campaign(
    client,
    customer_id,
    campaign_id,
    extension_feed_item_resource_name,
  )

  # Adds the extension feed item to the ad group.
  add_extension_to_ad_group(
    client,
    customer_id,
    ad_group_id,
    extension_feed_item_resource_name,
  )
end

# Creates a new extension feed item for the callout extension.
def add_extension_feed_item(
  client,
  customer_id,
  callout_text,
  language_code)
  # Creates a feed item from the hotel callout extension.
  operation = client.operation.create_resource.extension_feed_item do |efi|
    #  Creates the callout extension with the specified text and language.
    efi.hotel_callout_feed_item = client.resource.hotel_callout_feed_item do |f|
      f.text = callout_text
      f.language_code = language_code
    end
  end

  # Issues a mutate request to add the extension feed item and print its information.
  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )
  extension_feed_item_resource_name = response.results.first.resource_name
  puts "Created an extension feed item with resource name: " \
    "#{extension_feed_item_resource_name}"

  extension_feed_item_resource_name
end

# Adds the extension feed item to the customer account.
def add_extension_to_account(
    client,
    customer_id,
    extension_feed_item_resource_name)
  # Creates a customer extension setting, sets its type to HOTEL_CALLOUT, and
  # attaches the feed item.
  operation = client.operation.create_resource.customer_extension_setting do |s|
    s.extension_type = :HOTEL_CALLOUT
    s.extension_feed_items << extension_feed_item_resource_name
  end

  # Issues a mutate request to add the customer extension setting and prints
  # its information.
  response = client.service.customer_extension_setting.mutate_customer_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Created a customer extension setting with resource name: " \
    "#{response.results.first.resource_name}"
end

# Adds the extension feed item to the specified campaign.
def add_extension_to_campaign(
  client,
  customer_id,
  campaign_id,
  extension_feed_item_resource_name)
  # Creates a campaign extension setting, sets its type to HOTEL_CALLOUT, and
  # attaches the feed item.
  operation = client.operation.create_resource.campaign_extension_setting do |s|
    s.campaign = client.path.campaign(customer_id, campaign_id)
    s.extension_type = :HOTEL_CALLOUT
    s.extension_feed_items << extension_feed_item_resource_name
  end

  # Issues a mutate request to add the campaign extension setting and prints
  # its information.
  response = client.service.campaign_extension_setting.mutate_campaign_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Created a campaign extension setting with resource name: " \
    "#{response.results.first.resource_name}"
end

# Adds the extension feed item to the specified ad group.
def add_extension_to_ad_group(
  client,
  customer_id,
  ad_group_id,
  extension_feed_item_resource_name)
  # Creates a ad group extension setting, sets its type to HOTEL_CALLOUT, and
  # attaches the feed item.
  operation = client.operation.create_resource.ad_group_extension_setting do |s|
    s.ad_group = client.path.ad_group(customer_id, ad_group_id)
    s.extension_type = :HOTEL_CALLOUT
    s.extension_feed_items << extension_feed_item_resource_name
  end

  # Issues a mutate request to add the ad group extension setting and prints
  # its information.
  response = client.service.ad_group_extension_setting.mutate_ad_group_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Created an ad group extension setting with resource name: " \
    "#{response.results.first.resource_name}"
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
  options[:callout_text] = 'INSERT_CALLOUT_TEXT_HERE'

  # See supported languages at:
  # https://developers.google.com/hotels/hotel-ads/api-reference/language-codes.
  options[:language_code] = 'INSERT_LANGUAGE_CODE_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))
    opts.separator ''
    opts.separator 'Options:'
    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', Integer, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', Integer, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-T', '--callout-text CALLOUT-TEXT', String, 'Callout Text') do |v|
      options[:callout_text] = v
    end

    opts.on('-L', '--language-code LANGUAGE-CODE', String, 'Language Code') do |v|
      options[:language_code] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_hotel_callout(
      options.fetch(:customer_id).tr("-", ""),
      options[:campaign_id],
      options[:ad_group_id],
      options[:callout_text],
      options[:language_code],
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
