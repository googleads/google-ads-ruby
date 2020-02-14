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
# This example shows how to add a shopping listing group tree to a shopping ad
# group. The example will optionally clear an existing listing group tree and
# rebuild it to include the following tree structure:
#
# ProductCanonicalCondition NEW $0.20
# ProductCanonicalCondition USED $0.10
# ProductCanonicalCondition null (everything else)
#   ProductBrand CoolBrand $0.90
#   ProductBrand CheapBrand $0.01
#   ProductBrand null (everything else) $0.50

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_shopping_product_listing_group_tree(
  customer_id,
  ad_group_id,
  should_replace_existing_tree
)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # 1) Optional: Remove the existing listing group tree, if it already exists
  # on the ad group.
  if should_replace_existing_tree
    remove_listing_group_tree(client, customer_id, ad_group_id)
  end

  # 2) Construct the listing group tree "root" node.

  # Subdivision node: (Root node)
  ad_group_criterion_root = create_listing_group_subdivision(
    client,
    customer_id,
    ad_group_id,
  )
  # This resource has not been created yet and will include the temporary ID as
  # part of the criterion ID.
  ad_group_criterion_root_resource_name = ad_group_criterion_root.resource_name
  operations = [client.operation.create_resource.ad_group_criterion(ad_group_criterion_root)]

  # 3) Construct the listing group unit nodes for NEW, USED, and other.

  # Biddable Unit node: (Condition NEW node)
  # * Product Condition: NEW
  # * CPC bid: $0.20
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    ldi.product_condition = client.resource.product_condition_info do |pci|
      pci.condition = :NEW
    end
  end

  ad_group_criterion_condition_new = create_listing_group_unit_biddable(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_root_resource_name,
    listing_dimension_info,
    200_000,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_condition_new
  )
  operations << operation

  # Biddable Unit node: (Condition USED node)
  # * Product Condition: USED
  # * CPC bid: $0.10
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    ldi.product_condition = client.resource.product_condition_info do |pci|
      pci.condition = :USED
    end
  end
  ad_group_criterion_condition_used = create_listing_group_unit_biddable(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_root_resource_name,
    listing_dimension_info,
    100_000,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_condition_used
  )
  operations << operation

  # Sub-division node: (Condition "other" node)
  # * Product Condition: (not specified)
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    ldi.product_condition = client.resource.product_condition_info
  end
  ad_group_criterion_condition_other = create_listing_group_subdivision(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_root_resource_name,
    listing_dimension_info,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_condition_other
  )
  operations << operation

  ad_group_criterion_condition_other_resource_name =
    ad_group_criterion_condition_other.resource_name

  # 4) Construct the listing group unit nodes for CoolBrand, CheapBrand, and
  # other.

  # Biddable Unit node: (Brand CoolBrand node)
  # * Brand: CoolBrand
  # * CPC bid: $0.90
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    listing_dimension_info.product_brand = client.resource.product_brand_info do |product_brand_info|
      product_brand_info.value = client.wrapper.string("CoolBrand")
    end
  end

  ad_group_criterion_brand_cool_brand = create_listing_group_unit_biddable(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_condition_other_resource_name,
    listing_dimension_info,
    900_000,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_brand_cool_brand
  )
  operations << operation

  # Biddable Unit node: (Brand CheapBrand node)
  # * Brand: CheapBrand
  # * CPC bid: $0.01
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    listing_dimension_info.product_brand = client.resource.product_brand_info do |product_brand_info|
      product_brand_info.value = client.wrapper.string("CheapBrand")
    end
  end
  ad_group_criterion_brand_cheap_brand = create_listing_group_unit_biddable(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_condition_other_resource_name,
    listing_dimension_info,
    10_000,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_brand_cheap_brand
  )
  operations << operation

  # Biddable Unit node: (Brand other node)
  # * CPC bid: $0.05
  listing_dimension_info = client.resource.listing_dimension_info do |ldi|
    listing_dimension_info.product_brand = client.resource.product_brand_info
  end
  ad_group_criterion_brand_other_brand = create_listing_group_unit_biddable(
    client,
    customer_id,
    ad_group_id,
    ad_group_criterion_condition_other_resource_name,
    listing_dimension_info,
    50_000,
  )
  operation = client.operation.create_resource.ad_group_criterion(
    ad_group_criterion_brand_other_brand
  )
  operations << operation

  # Issue the mutate request.
  agc_service = client.service.ad_group_criterion
  response = agc_service.mutate_ad_group_criteria(customer_id, operations)

  total_count = 0
  response.results.each do |added_criterion|
    puts "Added ad group criterion with name: #{added_criterion.resource_name}"
    total_count += 1
  end
  puts "#{total_count} criteria added in total."
end

def remove_listing_group_tree(client, customer_id, ad_group_id)
  ga_service = client.service.google_ads

  query = <<~QUERY
    SELECT
      ad_group_criterion.resource_name
    FROM
      ad_group_criterion
    WHERE
      ad_group_criterion.type = LISTING_GROUP
    AND
      ad_group_criterion.listing_group.parent_ad_group_criterion IS NULL
    AND
      ad_group.id = #{ad_group_id}
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)

  operations = response.map do |row|
    criterion = row.ad_group_criterion
    puts "Found an ad group criterion with resource name: #{criterion.resource_name}"

    client.operation.remove_resource.ad_group_criterion(criterion.resource_name)
  end

  if operations.any?
    agc_service = client.service.ad_group_criterion
    response = agc_service.mutate_ad_group_criteria(customer_id, operations)
    puts "Removed #{response.results.count} ad group criteria."
  end
end

# Specify a decreasing negative number for temporary ad group criteria IDs. The
# ad group criteria will get real IDs when created on the server.
# Returns -1, -2, -3, etc. on subsequent calls.
def next_id
  @id ||= 0
  @id -= 1
end

def create_listing_group_subdivision(
  client,
  customer_id,
  ad_group_id,
  parent_ad_group_criterion_name = nil,
  listing_dimension_info = nil
)
  client.resource.ad_group_criterion do |criterion|
    criterion.resource_name = client.path.ad_group_criterion(
      customer_id,
      ad_group_id,
      next_id,
    )

    criterion.status = :ENABLED
    criterion.listing_group = client.resource.listing_group_info do |listing_group_info|
      listing_group_info.type = :SUBDIVISION

      if parent_ad_group_criterion_name && listing_dimension_info
        listing_group_info.parent_ad_group_criterion = parent_ad_group_criterion_name
        listing_group_info.case_value = listing_dimension_info
      end
    end
  end
end

def create_listing_group_unit_biddable(client, customer_id, ad_group_id,
                                       parent_ad_group_criterion_name, listing_dimension_info, cpc_bid_micros)
  # Note: There are two approaches for creating new unit nodes:
  # (1) Set the ad group resource name on the criterion (no temporary ID
  # required).
  # (2) Use a temporary ID to construct the criterion resource name and set it
  # using the client.path utility.
  # In both cases you must set the parent ad group criterion's resource name on
  # the listing group for non-root nodes.
  # This example demonstrates method (1).
  client.resource.ad_group_criterion do |criterion|
    criterion.ad_group = client.path.ad_group(customer_id, ad_group_id)
    criterion.status = :ENABLED
    criterion.cpc_bid_micros = cpc_bid_micros

    criterion.listing_group = client.resource.listing_group_info do |listing_group|
      # The type UNIT allows the group to be biddable.
      listing_group.type = :UNIT
      listing_group.parent_ad_group_criterion = parent_ad_group_criterion_name
      listing_group.case_value = listing_dimension_info
    end
  end
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
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

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-r', '--should-replace-existing-tree SHOULD-REPLACE-EXISTING-TREE',
            String, 'Create Default Listing Group') do |v|
      options[:should_replace_existing_tree] = true if v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_shopping_product_listing_group_tree(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
      options.fetch(:should_replace_existing_tree),
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
