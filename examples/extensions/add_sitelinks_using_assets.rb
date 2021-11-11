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

def add_sitelinks_using_assets(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  resource_names = create_sitelink_assets(client, customer_id)

  link_sitelinks_to_campaign(client, resource_names, customer_id, campaign_id)
end

def create_sitelink_assets(client, customer_id)
  assets = [
    client.resource.asset do |asset|
      asset.sitelink_asset = client.resource.sitelink_asset do |sitelink|
        sitelink.description1 = "Get in touch"
        sitelink.description2 = "Find your local store"
        sitelink.link_text = "Store locator"
      end
      asset.final_urls << "http://example.com/contact/store-finder"
      asset.final_mobile_urls << "http://example.com/mobile/contact/store-finder"
    end,
    client.resource.asset do |asset|
      asset.sitelink_asset = client.resource.sitelink_asset do |sitelink|
        sitelink.description1 = "But some stuff"
        sitelink.description2 = "It's really good"
        sitelink.link_text = "Store"
      end
      asset.final_urls << "http://example.com/store"
      asset.final_mobile_urls << "http://example.com/mobile/store"
    end,
    client.resource.asset do |asset|
      asset.sitelink_asset = client.resource.sitelink_asset do |sitelink|
        sitelink.description1 = "Even more stuff"
        sitelink.description2 = "There's never enough"
        sitelink.link_text = "Store for more"
      end
      asset.final_urls << "http://example.com/store/more"
      asset.final_mobile_urls << "http://example.com/mobile/store/more"
    end,
  ]

  operations = assets.map do |asset|
    client.operation.create_resource.asset(asset)
  end

  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.map do |result|
    puts "Created sitelink asset with resource name #{result.resource_name}"
    result.resource_name
  end
end

def link_sitelinks_to_campaign(client, resource_names, customer_id, campaign_id)
  operations = resource_names.map do |resource_name|
    client.operation.create_resource.campaign_asset do |ca|
      ca.asset = resource_name
      ca.campaign = client.path.campaign(customer_id, campaign_id)
      ca.field_type = :SITELINK
    end
  end

  response = client.service.campaign_asset.mutate_campaign_assets(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Created campaign asset with resource name #{result.resource_name}."
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
    add_sitelinks_using_assets(options.fetch(:customer_id).tr("-", ""), options.fetch(:campaign_id))
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
