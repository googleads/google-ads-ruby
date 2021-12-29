#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# Adds a customizer attribute, links the customizer attribute to a customer,
# and then adds a responsive search ad with a description using the ad
# customizer to the specified ad group.

require 'google/ads/google_ads'
require 'optparse'

def add_responsive_search_ad_with_ad_customizer(customer_id,
      ad_group_id, customizer_attribute_name)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  customizer_attribute_resource_name = create_customizer_attribute(
    client,
    customer_id,
    customizer_attribute_name,
  )

  link_customizer_attribute_to_customer(
    client,
    customer_id,
    customizer_attribute_resource_name,
  )

  create_responsive_search_ad_with_customization(
    client,
    customer_id,
    ad_group_id,
    customizer_attribute_name,
  )
end

# [START add_responsive_search_ad_with_ad_customizer_1]
def create_customizer_attribute(client, customer_id, attribute_name)
  operation = client.operation.create_resource.customizer_attribute do |ca|
    ca.name = attribute_name
    ca.type = :PRICE
  end

  response = client.service.customizer_attribute.mutate_customizer_attributes(
    customer_id: customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Created a customizer attribute with resource name #{resource_name}."

  resource_name
end
# [END add_responsive_search_ad_with_ad_customizer_1]

# [START add_responsive_search_ad_with_ad_customizer_2]
def link_customizer_attribute_to_customer(client, customer_id, resource_name)
  operation = client.operation.create_resource.customer_customizer do |cc|
    cc.customizer_attribute = resource_name
    cc.value = client.resource.customizer_value do |cv|
      cv.type = :PRICE
      cv.string_value = '100USD'
    end
  end

  response = client.service.customer_customizer.mutate_customer_customizers(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created a customer customizer with resource name #{response.results.first.resource_name}."
end
# [END add_responsive_search_ad_with_ad_customizer_2]

# [START add_responsive_search_ad_with_ad_customizer_3]
def create_responsive_search_ad_with_customization(client, customer_id, ad_group_id, attribute_name)
  operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    aga.status = :PAUSED
    aga.ad = client.resource.ad do |ad|
      ad.responsive_search_ad = client.resource.responsive_search_ad_info do |rsa|
        rsa.headlines << client.resource.ad_text_asset do |asset|
          asset.text = 'Cruise to Mars'
        end
        rsa.headlines << client.resource.ad_text_asset do |asset|
          asset.text = 'Best Space Cruise Line'
        end
        rsa.headlines << client.resource.ad_text_asset do |asset|
          asset.text = 'Experience the Stars'
        end

        rsa.descriptions << client.resource.ad_text_asset do |asset|
          asset.text = 'Buy your tickets now'
        end
        rsa.descriptions << client.resource.ad_text_asset do |asset|
          # Creates this particular description using the ad customizer.  Visit
          # https://developers.google.com/google-ads/api/docs/ads/customize-responsive-search-ads#ad_customizers_in_responsive_search_ads
          # for details about the placeholder format.  The ad customizer
          # replaces the placeholder with the value we previously created and
          # linked to the customer using `CustomerCustomizer`.
          asset.text = "Just {CUSTOMIZER.#{attribute_name}:10USD}"
        end

        rsa.path1 = 'all-inclusive'
        rsa.path2 = 'deals'
      end

      ad.final_urls << 'http://www.example.com'
    end
  end

  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created responsive search ad with resource name #{response.results.first.resource_name}."
end
# [END add_responsive_search_ad_with_ad_customizer_3]

if __FILE__ == $0
  options = {}
  DEFAULT_CUSTOMIZER_ATTRIBUTE_NAME = 'Price'

  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
  options[:customizer_attribute_name] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, "AdGroup ID") do |v|
      options[:ad_group_id] = v
    end

    opts.on('-n', '--customizer-attribute-name CUSTOMIZER-ATTRIBUTE-NAME',
            String, "Customizer Attribute Name") do |v|
      options[:customizer_attribute_name] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!
  if options[:customizer_attribute_name].nil?
    options[:customizer_attribute_name] = DEFAULT_CUSTOMIZER_ATTRIBUTE_NAME
  end

  begin
    add_responsive_search_ad_with_ad_customizer(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id],
      options[:customizer_attribute_name],
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
