#!/usr/bin/env ruby

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
# This example shows how to add a shopping listing scope to a shopping campaign.
# The example will construct and add a new listing scope which will act as the
# inventory filter for the campaign. The campaign will only advertise products
# that match the following requirements:

# - Brand is "google"
# - Custom label 0 is "top_selling_products"
# - Product type (level 1) is "electronics"
# - Product type (level 2) is "smartphones"
#
# Only one listing scope is allowed per campaign. Remove any existing listing
# scopes before running this example.

require 'optparse'
require 'google/ads/google_ads'

def add_listing_scope(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # A listing scope allows you to filter the products that will be included in
  # a given campaign. You can specify multiple dimensions with conditions that
  # must be met for a product to be included in a campaign.
  # A typical listing scope might only have a few dimensions. This example
  # demonstrates a range of different dimensions you could use.
  operation = client.operation.create_resource.campaign_criterion do |cc|
    cc.campaign = client.path.campaign(customer_id, campaign_id)

    cc.listing_scope = client.resource.listing_scope_info do |lsi|
      # Creates a ProductBrand dimension set to "google".
      lsi.dimensions << client.resource.listing_dimension_info do |ldi|
        ldi.product_brand = client.resource.product_brand_info do |pbi|
          pbi.value = 'google'
        end
      end

      # Creates a ProductCustomAttribute dimension for INDEX0 set to "top_selling_products".
      lsi.dimensions << client.resource.listing_dimension_info do |ldi|
        ldi.product_custom_attribute = client.resource.product_custom_attribute_info do |pcai|
          pcai.value = 'top_selling_products'
          pcai.index = :INDEX0
        end
      end

      # Creates a ProductType dimension for LEVEL1 set to "electronics".
      lsi.dimensions << client.resource.listing_dimension_info do |ldi|
        ldi.product_type = client.resource.product_type_info do |pti|
          pti.value = 'electronics'
          pti.level = :LEVEL1
        end
      end

      # Creates a ProductType dimension for LEVEL2 set to "smartphones".
      lsi.dimensions << client.resource.listing_dimension_info do |ldi|
        ldi.product_type = client.resource.product_type_info do |pti|
          pti.value = 'smartphones'
          pti.level = :LEVEL2
        end
      end
    end
  end

  # Issue the mutate request.
  response = client.service.campaign_criterion.mutate_campaign_criteria(
    customer_id: customer_id,
    operations: [operation]
  )
  puts "Added #{response.results.size} campaign criteria:"
  response.results.each do |resource|
    puts "#{resource.resource_name}"
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
  # Specifying any value for this field on the command line will override this
  # to true.
  options[:should_replace_existing_tree] = false

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: #{File.basename(__FILE__)} [options]")

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
    add_listing_scope(
      options.fetch(:customer_id).tr('-', ''),
      options.fetch(:campaign_id)
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      error.location&.field_path_elements&.each do |field_path_element|
        STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED

        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
