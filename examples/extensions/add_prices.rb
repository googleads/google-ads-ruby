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
# Adds a price extension and associates it with an account.
# Campaign targeting is also set using the specified campaign ID. To get
# campaigns, run basic_operations/get_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_prices(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # The operation creates a customer extension setting with price feed item.
  # This associates the price extension to your account.
  operation = client.operation.create_resource.extension_feed_item do |efi|
    efi.extension_type = :PRICE
    efi.price_feed_item = client.resource.price_feed_item do |pfi|
      pfi.type = :SERVICES
      # Optional: set price qualifier.
      pfi.price_qualifier = :FROM
      pfi.tracking_url_template = 'http://tracker.example.com/?u={lpurl}'
      pfi.language_code = 'en'

      # To create a price extension, at least three price offerings are needed.
      pfi.price_offerings << create_price_offer(
          client, 'Scrubs', 'Body Scrub, Salt Scrub', 60_000_000, # 60 USD
          'USD', :PER_HOUR, 'http://www.example.com/scrubs',
          'http://m.example.com/scrubs')
      pfi.price_offerings << create_price_offer(
          client, 'Hair Cuts', 'Once a month', 75_000_000, # 75 USD
          'USD', :PER_MONTH, 'http://www.example.com/haircuts',
          'http://m.example.com/haircuts')
      pfi.price_offerings << create_price_offer(
          client, 'Skin Care Package',
          'Four times a month', 250_000_000, # 250 USD
          'USD', :PER_MONTH, 'http://www.example.com/skincarepackage')
    end
    efi.targeted_campaign = client.path.campaign(customer_id, campaign_id)
    efi.ad_schedules << create_ad_schedule_info(
        client, :SUNDAY, 10, :ZERO, 18, :ZERO)
    efi.ad_schedules << create_ad_schedule_info(
        client, :SATURDAY, 10, :ZERO, 22, :ZERO)
  end

  response = client.service.extension_feed_item.mutate_extension_feed_items(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created extension feed with resource name " +
      "'#{response.results.first.resource_name}'"
end

def create_price_offer(
    client, header, description, price_in_micros,
    currency_code, unit, final_url, final_mobile_url=nil)
  client.resource.price_offer do |po|
    po.header = header
    po.description = description
    po.final_urls << final_url
    po.price = client.resource.money do |pr|
      pr.amount_micros = price_in_micros
      pr.currency_code = currency_code
    end
    po.unit = unit
    # Optional: set the final mobile URLs
    unless final_mobile_url.nil?
      po.final_mobile_urls << final_mobile_url
    end
  end
end

def create_ad_schedule_info(
    client, day_of_week, start_hour, start_minute, end_hour, end_minute)
  client.resource.ad_schedule_info do |asi|
    asi.day_of_week = day_of_week
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
    add_prices(options.fetch(:customer_id).tr("-", ""), options.fetch(:campaign_id))
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
