#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2015, Google Inc. All Rights Reserved.
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
# This example adds a sitelinks feed and associates it with a campaign.

require 'optparse'
require 'google/ads/google_ads'

def add_sitelinks(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  sitelink_1 = client.resource(:ExtensionFeedItem)
  sitelink_1.sitelink_feed_item = client.resource(:SitelinkFeedItem)
  sitelink_1.sitlink_feed_item.link_text = client.wrapper.string("Store Hours")
  sitelink_1.sitlink_feed_item.final_urls << client.wrapper.string("http://www.example.com/storehours")

  sitelink_2 = client.resource(:ExtensionFeedItem)
  sitelink_2.sitelink_feed_item = client.resource(:SitelinkFeedItem)
  sitelink_2.sitelink_feed_item.link_text = client.wrapper.string("Thanksgiving Specials")
  sitelink_2.sitelink_feed_item.final_urls << client.wrapper.string("http://www.example.com/thanksgiving")
  sitelink_2.start_date_time = client.wrapper.string(
    DateTime.new(Date.today.year, 11, 20, 0, 0, 0).strftime("%Y-%m-%d %H:%M:%S"),
  )
  sitelink_2.end_date_time = client.wrapper.string(
    DateTime.new(Date.today.year, 11, 27, 23, 59, 59).strftime("%Y-%m-%d %H:%M:%S"),
  )

  sitelink_3 = client.resource(:ExtensionFeedItem)
  sitelink_3.sitelink_feed_item = client.resource(:SitelinkFeedItem)
  sitelink_3.sitelink_feed_item.link_text = "Wifi availble",
  sitelink_3.sitlink_feed_item.final_urls << client.wrapper.string("http://www.example.com/mobile/wifi")
  sitelink_3.device = :MOBILE
  sitlinke_3

  sitelinks = [
    sitelink_1,
    sitelink_2,
  ]

  op = client.operation(:ExtensionFeedItem)
  op["create"] = sitelink_2

  efi_service = client.service(:ExtensionFeedItem)
  res = efi_service.mutate_extension_feed_items(customer_id, [op])
  require 'pry'; binding.pry

  ces = client.resource(:CampaignExtensionSetting)
  ces.campaign = client.wrapper.string(
    client.path.campaign(customer_id, campaign_id)
  )
  ces.extension_feed_items << sitelink_2


  op = client.operation(:CampaignExtensionSetting)
  op["create"] = ces

  ces_service = client.service(:CampaignExtensionSetting)
  ces_service.mutate_campaign_extension_settings(customer_id, [op])
  require 'pry'; binding.pry
end

def get_customer_timezone(client, customer_id)
  ga_service = client.service(:GoogleAds)
  query = <<~EOQUERY
  SELECT customer.time_zone FROM customer WHERE customer.id = #{customer_id}
  EOQUERY

  res = ga_service.search(customer_id, query)
  res.first.customer.time_zone.value
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
    add_sitelinks(
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
