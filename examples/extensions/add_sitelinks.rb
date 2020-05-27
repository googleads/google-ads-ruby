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
# Adds sitelinks to a campaign. To create a campaign, run add_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_sitelinks(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  campaign_resource_name = client.path.campaign(customer_id, campaign_id)

  extension_feed_items =
      create_extension_feed_items(client, customer_id, campaign_resource_name)

  operation = client.operation.create_resource.campaign_extension_setting do |ces|
    ces.campaign = campaign_resource_name
    ces.extension_type = :SITELINK
    extension_feed_items.each do |efi|
      ces.extension_feed_items << efi
    end
  end

  response = client.service.campaign_extension_setting.mutate_campaign_extension_settings(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created a campaign extension setting with resource name '#{response.results.first.resource_name}'"
end

def create_extension_feed_items(client, customer_id, campaign_resource_name)
  extension_feed_items = [
    client.resource.extension_feed_item do |efi|
      efi.extension_type = :SITELINK
      efi.sitelink_feed_item = create_sitelink_feed_item(
          client, 'Store Hours', 'http://www.example.com/storehours')
      efi.targeted_campaign = campaign_resource_name
    end,
    client.resource.extension_feed_item do |efi|
      efi.extension_type = :SITELINK
      efi.sitelink_feed_item = create_sitelink_feed_item(
          client, 'Thanksgiving Specials', 'http://www.example.com/thanksgiving')
      efi.targeted_campaign = campaign_resource_name
      efi.start_date_time =
          DateTime.new(Date.today.year, 11, 20, 0, 0, 0).strftime("%Y-%m-%d %H:%M:%S")
      efi.end_date_time =
          DateTime.new(Date.today.year, 11, 27, 23, 59, 59).strftime("%Y-%m-%d %H:%M:%S")

      # Targets this sitelink for United States only.
      # A list of country codes can be referenced here:
      # https://developers.google.com/adwords/api/docs/appendix/geotargeting
      efi.targeted_geo_target_constant = client.path.geo_target_constant(2840)
    end,
    client.resource.extension_feed_item do |efi|
      efi.extension_type = :SITELINK
      efi.sitelink_feed_item = create_sitelink_feed_item(
          client, 'Wifi available', 'http://www.example.com/wifi')
      efi.targeted_campaign = campaign_resource_name
      efi.device = :MOBILE
      efi.targeted_keyword = client.resource.keyword_info do |ki|
        ki.text = 'free wifi'
        ki.match_type = :BROAD
      end
    end,
    client.resource.extension_feed_item do |efi|
      efi.extension_type = :SITELINK
      efi.sitelink_feed_item = create_sitelink_feed_item(
          client, 'Happy hours', 'http://www.example.com/happyhours')
      efi.targeted_campaign = campaign_resource_name
      efi.ad_schedules << create_ad_schedule(client, :MONDAY,    18, :ZERO, 21, :ZERO)
      efi.ad_schedules << create_ad_schedule(client, :TUESDAY,   18, :ZERO, 21, :ZERO)
      efi.ad_schedules << create_ad_schedule(client, :WEDNESDAY, 18, :ZERO, 21, :ZERO)
      efi.ad_schedules << create_ad_schedule(client, :THURSDAY,  18, :ZERO, 21, :ZERO)
      efi.ad_schedules << create_ad_schedule(client, :FRIDAY,    18, :ZERO, 21, :ZERO)
    end
  ]

  operations = extension_feed_items.map do |efi|
    client.operation.create_resource.extension_feed_item(efi)
  end

  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: operations,
  )

  puts "Created #{response.results.size} extension feed items with the following resource names:"
  response.results.map do |result|
    puts "\t#{result.resource_name}"
    result.resource_name
  end
end

def create_sitelink_feed_item(client, sitelink_text, sitelink_url)
  client.resource.sitelink_feed_item do |sfi|
    sfi.link_text = sitelink_text
    sfi.final_urls << sitelink_url
  end
end

def create_ad_schedule(client, day, start_hour, start_minute, end_hour, end_minute)
  client.resource.ad_schedule_info do |asi|
    asi.day_of_week = day
    asi.start_hour = start_hour
    asi.start_minute = start_minute
    asi.end_hour = end_hour
    asi.end_minute = end_minute
  end
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
    add_sitelinks(options.fetch(:customer_id).tr("-", ""), options.fetch(:campaign_id))
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
