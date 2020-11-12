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
# This example shows how to add a hotel listing group tree, which has two
# levels. The first level is partitioned by the hotel class. The second level
# is partitioned by the country region.
#
# Each level is composed of two types of nodes: `UNIT` and `SUBDIVISION`.
# `UNIT` nodes serve as a leaf node in a tree and can have bid amount set.
# `SUBDIVISION` nodes serve as an internal node where a subtree will be built.
# The `SUBDIVISION` node can't have bid amount set.
# See https://developers.google.com/google-ads/api/docs/hotel-ads/overview for
# more information.
#
# Note: Only one listing group tree can be added. Attempting to add another
# listing group tree to an ad group that already has one will fail.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_hotel_listing_group_tree(
  customer_id,
  ad_group_id,
  percent_cpc_bid_micro_amount)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  operations = []

  # Creates the root of the tree as a SUBDIVISION node.
  root_resource_name = add_root_node(
    client,
    customer_id,
    ad_group_id,
    operations,
    percent_cpc_bid_micro_amount,
  )

  # Creates child nodes of level 1, partitioned by the hotel class info.
  other_hotel_resource_name = add_level1_nodes(
    client,
    customer_id,
    ad_group_id,
    root_resource_name,
    operations,
    percent_cpc_bid_micro_amount,
  )

  # Creates child nodes of level 2, partitioned by the hotel country
  # region info.
  add_level2_nodes(
    client,
    customer_id,
    ad_group_id,
    other_hotel_resource_name,
    operations,
    percent_cpc_bid_micro_amount,
  )

  response = client.service.ad_group_criterion.mutate_ad_group_criteria

  puts "Added #{response.results.size} listing group info entities."
  response.results.each do |ad_group_criterion|
    puts "#{ad_group_criterion.resource_name}"
  end
end

# Creates the root node of the listing group tree and adds its create
# operation to the operations list.
def add_root_node(
  client,
  customer_id,
  ad_group_id,
  operations,
  percent_cpc_bid_micro_amount)
  # Creates the root of the tree as a SUBDIVISION node.
  root = create_listing_group_info(client, :SUBDIVISION)
  root_ad_group_criterion = create_ad_group_criterion(
    client,
    customer_id,
    ad_group_id,
    root,
    percent_cpc_bid_micro_amount,
  )
  operations << generate_create_operation(client, root_ad_group_criterion)
  root_ad_group_criterion.resource_name
end

# Creates child nodes of level 1, partitioned by the hotel class info.
def add_level1_nodes(
  client,
  customer_id,
  ad_group_id,
  root_resource_name,
  operations,
  percent_cpc_bid_micro_amount)
  # Creates hotel class info and dimension info for 5-star hotels.
  five_starred_dimension_info = client.resource.listing_dimension_info do |d|
    d.hotel_class = client.resource.hotel_class_info do |c|
      c.value = 5
    end
  end

  # Creates listing group info for 5-star hotels as a UNIT node.
  five_starred_unit = create_listing_group_info(
    client,
    :UNIT,
    root_resource_name,
    five_starred_dimension_info,
  )

  # Creates an ad group criterion for 5-star hotels.
  five_starred_ad_group_criterion = create_ad_group_criterion(
    client,
    customer_id,
    ad_group_id,
    five_starred_unit,
    percent_cpc_bid_micro_amount,
  )

  operations << generate_create_operation(
    client,
    five_starred_ad_group_criterion,
  )

  # You can also create more UNIT nodes for other hotel classes by copying the
  # above code in this method and modifying the value passed to HotelClassInfo()
  # to the value you want.
  # For instance, passing 4 instead of 5 in the above code will create a UNIT
  # node of 4-star hotels instead.

  # Creates hotel class info and dimension info for other hotel classes
  # by *not* specifying any attributes on those object.
  other_hotels_dimention_info = client.resource.listing_dimension_info do |d|
    d.hotel_class = client.resource.hotel_class_info
  end

  # Creates listing group info for other hotel classes as a SUBDIVISION node,
  # which will be used as a parent node for children nodes of the next level.
  other_hotels_subdivision = create_listing_group_info(
    client,
    :SUBDIVISION,
    root_resource_name,
    other_hotels_dimention_info,
  )

  # Creates an ad group criterion for other hotel classes.
  other_hotels_ad_group_criterion = create_ad_group_criterion(
    client,
    customer_id,
    ad_group_id,
    other_hotels_subdivision,
    percent_cpc_bid_micro_amount,
  )

  operations << generate_create_operation(
    client,
    other_hotels_ad_group_criterion,
  )

  other_hotels_ad_group_criterion.resource_name
end

# Creates child nodes of level 2, partitioned by the country region.
def add_level2_nodes(
  client,
  customer_id,
  ad_group_id,
  parent_resource_name,
  operations,
  percent_cpc_bid_micro_amount)
  # The criterion ID for Japan is 2392.
  # See https://developers.google.com/adwords/api/docs/appendix/geotargeting
  # for criteria ID of other countries.
  japan_geo_target_constant_id = 2392
  japan_dimension_info = client.resource.listing_dimension_info do |d|
    # Creates hotel country region info and dimension info for hotels in Japan.
    d.hotel_country_region = client.resource.hotel_country_region_info do |c|
      c.country_region_criterion = client.path.geo_target_constant(
        japan_geo_target_constant_id)
    end
  end

  # Creates listing group info for hotels in Japan as a UNIT node.
  japan_hotels_unit = create_listing_group_info(
    client,
    :UNIT,
    parent_resource_name,
    japan_dimension_info,
  )

  # Creates an ad group criterion for hotels in Japan.
  japan_hotels_ad_group_criterion = create_ad_group_criterion(
    client,
    customer_id,
    ad_group_id,
    japan_hotels_unit,
    percent_cpc_bid_micro_amount,
  )

  operations << generate_create_operation(
    client,
    japan_hotels_ad_group_criterion,
  )

  # Creates hotel class info and dimension info for hotels in other regions.
  other_hotel_regions_dimension_info = client.resource.listing_dimension_info do |d|
    d.hotel_country_region = client.resource.hotel_country_region_info
  end

  # Creates listing group info for hotels in other regions as a UNIT node.
  # The "others" node is always required for every level of the tree.
  other_hotel_regions_unit = create_listing_group_info(
    client,
    :UNIT,
    parent_resource_name,
    other_hotel_regions_dimension_info,
  )

  # Creates an ad group criterion for other hotel country regions.
  other_hotel_regions_ad_group_criterion = create_ad_group_criterion(
    client,
    customer_id,
    ad_group_id,
    other_hotel_regions_unit,
    percent_cpc_bid_micro_amount,
  )

  operations << generate_create_operation(
    client,
    other_hotel_regions_ad_group_criterion,
  )
end

# Creates the listing group info with the provided parameters.
def create_listing_group_info(
  client,
  listing_group_type,
  parent_criterion_resource_name = nil,
  case_value = nil)
  client.resource.listing_group_info do |g|
    g.type = listing_group_type
    unless parent_criterion_resource_name.nil?
      g.parent_ad_group_criterion = parent_criterion_resource_name
      g.case_value = case_value
    end
  end
end

# Creates an ad group criterion from the provided listing group info.
# Bid amount will be set on the created ad group criterion when listing group
# info type is `UNIT`. Setting bid amount for `SUBDIVISION` types is
# not allowed.
def create_ad_group_criterion(
  client,
  customer_id,
  ad_group_id,
  listing_group_info,
  percent_cpc_bid_micro_amount)
  client.resource.ad_group_criterion do |agc|
    agc.status = :ENABLED
    agc.listing_group = listing_group_info
    agc.resource_name = client.path.ad_group_criterion(
      customer_id, ad_group_id, next_temp_id)
    # Bids are valid only for UNIT nodes.
    if listing_group_info.type == :UNIT
      agc.percent_cpc_bid_micros = percent_cpc_bid_micro_amount
    end
  end
end

# Creates an operation for creating the specified ad group criterion.
def generate_create_operation(client, ad_group_criterion)
  client.operation.create_resource.ad_group_criterion(ad_group_criterion)
end

# Specify a decreasing negative number for temporary ad group criteria IDs. The
# ad group criteria will get real IDs when created on the server.
# Returns -1, -2, -3, etc. on subsequent calls.
def next_temp_id
  @id ||= 0
  @id -= 1
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

  # Specify the CPC bid micro amount to be set on a created ad group criterion.
  # For simplicity, each ad group criterion will use the below amount equally.
  # In practice, you probably want to use different values for each ad group
  # criterion.
  options[:percent_cpc_bid_micro_amount] = 1_000_000

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))
    opts.separator ''
    opts.separator 'Options:'
    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', Integer,
        'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-P', '--percent-cpc-bid-micro-amount PERCENT-CPC-BID-MICRO-AMOUNT',
        Integer, 'Percent CPC Bid Micro Amount') do |v|
      options[:percent_cpc_bid_micro_amount] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_hotel_listing_group_tree(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
      options[:percent_cpc_bid_micro_amount],
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
