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
# This code example adds two ad customizer attributes and associates them with
# the ad group.  Then it adds an ad that uses the customizer attributes to
# populate dynamic data.

require 'date'
require 'google/ads/google_ads'
require 'optparse'

def add_ad_customizer(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  string_customizer_name = "Planet_#{(Time.new.to_f * 1000).to_i}"
  price_customizer_name = "Price_#{(Time.new.to_f * 1000).to_i}"

  # Create the customizer attributes.
  text_customizer_attribute_resource_name =
    create_customizer_attribute(
      client,
      customer_id,
      string_customizer_name,
      :TEXT,
    )

  price_customizer_attribute_resource_name =
    create_customizer_attribute(
      client,
      customer_id,
      price_customizer_name,
      :PRICE,
    )

  # Link the customizer attributes to the ad group.
  link_customizer_attributes(
    client,
    customer_id,
    ad_group_id,
    text_customizer_attribute_resource_name,
    price_customizer_attribute_resource_name,
  )

  # Create an ad with the customizations provided by the ad customizer
  # attributes.
  create_ad_with_customizations(
    client,
    customer_id,
    ad_group_id,
    string_customizer_name,
    price_customizer_name,
  )
end

# [START add_ad_customizer]
def create_customizer_attribute(client, customer_id, customizer_name, customizer_type)
  operation = client.operation.create_resource.customizer_attribute do |ca|
    ca.name = customizer_name
    ca.type = customizer_type
  end

  response = client.service.customizer_attribute.mutate_customizer_attributes(
    customer_id: customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Added #{customizer_type} customizer attribute with resource name " +
    "#{resource_name}."

  resource_name
end
# [END add_ad_customizer]

# [START add_ad_customizer_2]
def link_customizer_attributes(client, customer_id, ad_group_id,
                               text_attribute_name, price_attribute_name)
  operations = []

  operations << client.operation.create_resource.ad_group_customizer do |agc|
    agc.customizer_attribute = text_attribute_name
    agc.value = client.resource.customizer_value do |cv|
      cv.type = :TEXT
      cv.string_value = "Mars"
    end
    agc.ad_group = client.path.ad_group(customer_id, ad_group_id)
  end

  operations << client.operation.create_resource.ad_group_customizer do |agc|
    agc.customizer_attribute = price_attribute_name
    agc.value = client.resource.customizer_value do |cv|
      cv.type = :PRICE
      cv.string_value = "100.0€"
    end
    agc.ad_group = client.path.ad_group(customer_id, ad_group_id)
  end

  response = client.service.ad_group_customizer.mutate_ad_group_customizers(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts "Added an ad group customizer with resource name #{result.resource_name}."
  end
end
# [END add_ad_customizer_2]

# [START add_ad_customizer_3]
def create_ad_with_customizations(client, customer_id, ad_group_id,
                                  string_customizer_name, price_customizer_name)
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad = client.resource.ad do |ad|
      ad.responsive_search_ad = client.resource.responsive_search_ad_info do |rsa|
        rsa.headlines += [
          client.resource.ad_text_asset do |ata|
            ata.text = "Luxury cruise to {CUSTOMIZER.#{string_customizer_name}:Venus}"
            pinned_field = :HEADLINE_1
          end,
          client.resource.ad_text_asset do |ata|
            ata.text = "Only {CUSTOMIZER.#{price_customizer_name}:10.0€}"
          end,
          client.resource.ad_text_asset do |ata|
            ata.text = "Cruise to {CUSTOMIZER.#{string_customizer_name}:Venus} for {CUSTOMIZER.#{price_customizer_name}:10.0€}"
          end,
        ]
        rsa.descriptions += [
          client.resource.ad_text_asset do |ata|
            ata.text = "Tickets are only {CUSTOMIZER.#{price_customizer_name}:10.0€}!"
          end,
          client.resource.ad_text_asset do |ata|
            ata.text = "Buy your tickets to {CUSTOMIZER.#{string_customizer_name}:Venus} now!"
          end,
        ]
      end
      ad.final_urls << "https://www.example.com"
    end
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
  end

  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Added an ad with resource name #{response.results.first.resource_name}."
end
# [END add_ad_customizer_3]

if __FILE__ == $0
  # We're doing only searches by resource_name in this example,
  # we can set page size = 1.
  PAGE_SIZE = 1;

  options = {}
  # Running the example with -h will print the command line usage.

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'AdGroup ID') do |v|
      options[:ad_group_id] = v.split(',')
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_ad_customizer(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id],
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
