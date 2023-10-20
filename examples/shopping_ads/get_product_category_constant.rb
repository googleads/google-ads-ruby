#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This example fetches the set of all ProductCategoryConstants.

require 'optparse'
require 'google/ads/google_ads'

def display_categories(categories, prefix: '')
  categories.each do |c|
    puts "#{prefix}#{c.fetch(:name)} [#{c.fetch(:id)}]"
    unless c.fetch(:children).empty?
      display_categories(
        c.fetch(:children),
        prefix: "#{prefix}#{c.fetch(:name)} > "
      )
    end
  end
end

def get_product_category_constant(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~EOD
    SELECT
      product_category_constant.localizations,
      product_category_constant.product_category_constant_parent
    FROM
      product_category_constant
  EOD

  ga_service = client.service.google_ads
  response = ga_service.search(
      customer_id: customer_id,
      query: query,
      page_size: PAGE_SIZE,
  )

  # Default the values in the hash to have an Array of children, so that
  # we can push children in before we've discovered all the data for the
  # parent category.
  all_categories = Hash.new do |h, k|
    h[k] = {children: []}
  end
  root_categories = Set.new

  response.each do |row|
    product_category = row.product_category_constant

    localized_name = ""
    product_category.localizations.each do |l|
      if l.region_code == "US" && l.language_code == 'en'
        localized_name = l.value
        break
      end
    end

    category = {
      name: localized_name,
      id: product_category.resource_name,
      children: []
    }

    all_categories[category.fetch(:id)] = category
    parent_id = product_category.product_category_constant_parent

    if parent_id
      all_categories[parent_id][:children] << category
    else
      root_categories.add(category)
    end
  end

  display_categories(root_categories)
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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_product_category_constant(
      options.fetch(:customer_id).tr("-", "")
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
