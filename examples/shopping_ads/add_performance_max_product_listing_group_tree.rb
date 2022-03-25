#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2022 Google LLC
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
# This example shows how to add product partitions to a Performance Max retail
# campaign.
#
# For Performance Max campaigns, product partitions are represented using the
# AssetGroupListingGroupFilter resource. This resource can be combined with
# itself to form a hierarchy that creates a product partition tree.
#
# For more information about Performance Max retail campaigns, see the
# add_performance_max_retail_campaign.rb example.

require 'optparse'
require 'google/ads/google_ads'

# We specify temporary IDs that are specific to a single mutate request.
# Temporary IDs are always negative and unique within one mutate request.
#
# See https://developers.google.com/google-ads/api/docs/mutating/best-practices
# for further details.
TEMPORARY_ID_LISTING_GROUP_ROOT = "-1"

# [START add_performance_max_product_listing_group_tree]
def add_performance_max_product_listing_group_tree(
    customer_id,
    asset_group_id,
    replace_existing_tree)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  asset_group_resource_name = client.path.asset_group(
    customer_id,
    asset_group_id,
  )

  # We use a factory to create all the MutateOperations that manipulate a
  # specific AssetGroup for a specific customer. The operations returned by the
  # factory's methods are used to optionally remove all
  # AssetGroupListingGroupFilters from the tree, and then to construct a new
  # tree of filters. These filters can have a parent-child relationship, and
  # also include a special root that includes all children.
  #
  # When creating these filters, we use temporary IDs to create the hierarchy
  # between the root listing group filter, and the subdivisions and leave nodes
  # beneath that.
  #
  # The factory specific to a customerId and assetGroupId is created below.
  create_operation_factory = AssetGroupListingGroupFilterCreateOperationFactory.new(
    customer_id,
    asset_group_id,
    TEMPORARY_ID_LISTING_GROUP_ROOT,
  )

  operations = []

  if replace_existing_tree
    existing_listing_group_filters = get_existing_listing_group_filters_in_asset_group(
      client,
      customer_id,
      asset_group_resource_name,
    )

    if existing_listing_group_filters.length > 0
      # A special factory object that ensures the creation of remove operations
      # in the correct order (child listing group filters must be removed
      # before their parents).
      remove_operation_factory = AssetGroupListingGroupFilterRemoveOperationFactory.new(
        existing_listing_group_filters
      )

      operations += remove_operation_factory.remove_all(client)
    end
  end

  operations << create_operation_factory.create_root(client)

  operations << create_operation_factory.create_unit(
    client,
    TEMPORARY_ID_LISTING_GROUP_ROOT,
    create_operation_factory.next_id,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_condition = client.resource.product_condition do |condition|
        condition.condition = :NEW
      end
    end,
  )
  operations << create_operation_factory.create_unit(
    client,
    TEMPORARY_ID_LISTING_GROUP_ROOT,
    create_operation_factory.next_id,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_condition = client.resource.product_condition do |condition|
        condition.condition = :USED
      end
    end,
  )

  # We save this ID because create child nodes underneath it.
  subdivision_id_condition_other = create_operation_factory.next_id

  operations << create_operation_factory.create_subdivision(
    client,
    TEMPORARY_ID_LISTING_GROUP_ROOT,
    subdivision_id_condition_other,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_condition = client.resource.product_condition do |condition|
        # All sibling nodes must have the same dimension type. We use an empty
        # ProductCondition to indicate that this is an "Other" partition.
      end
    end,
  )

  operations << create_operation_factory.create_unit(
    client,
    subdivision_id_condition_other,
    create_operation_factory.next_id,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_brand = client.resource.product_brand do |brand|
        brand.value = 'CoolBrand'
      end
    end,
  )
  operations << create_operation_factory.create_unit(
    client,
    subdivision_id_condition_other,
    create_operation_factory.next_id,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_brand = client.resource.product_brand do |brand|
        brand.value = 'CheapBrand'
      end
    end,
  )
  operations << create_operation_factory.create_unit(
    client,
    subdivision_id_condition_other,
    create_operation_factory.next_id,
    client.resource.listing_group_filter_dimension do |dimension|
      dimension.product_brand = client.resource.product_brand do |brand|
      end
    end,
  )

  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: operations,
  )

  print_response_details(operations, response)
end
# [END add_performance_max_product_listing_group_tree]

# [START add_performance_max_product_listing_group_tree_7]
# Fetches all of the listing group filters in an asset group.
def get_existing_listing_group_filters_in_asset_group(client, customer_id, asset_group_resource_name)
  query = <<~QUERY
    SELECT
        asset_group_listing_group_filter.resource_name,
        asset_group_listing_group_filter.parent_listing_group_filter
    FROM asset_group_listing_group_filter
    WHERE
        asset_group_listing_group_filter.asset_group = '#{asset_group_resource_name}'
  QUERY
  response = client.service.google_ads.search(
    customer_id: customer_id,
    page_size: 10000,
    query: query,
  )

  response.map { |row| row.asset_group_listing_group_filter }
end
# [END add_performance_max_product_listing_group_tree_7]

def print_response_details(operations, response)
  response.mutate_operation_responses.each_with_index do |row, i|
    resource_name = row.asset_group_listing_group_filter_result.resource_name
    operation_type = operations[i].asset_group_listing_group_filter_operation.operation
    case operation_type
    when :create
      puts "Created AssetGroupListingGroupFilter with resource name '#{resource_name}'."
    when :remove
      puts "Removed AssetGroupListingGroupFilter with resource name '#{resource_name}'."
    else
      puts "Unsupported operation type #{operation_type}."
    end
  end
end

# A factory that creates MutateOperations for removing an existing tree of
# AssetGroupListingGroupFilters.
#
# AssetGroupListingGroupFilters must be removed in a specific order: all of the
# children of a filter must be removed before the filter itself, otherwise the
# API will return an error.
#
# This object is intended to be used with an array of MutateOperations to
# perform a series of related updates to an AssetGroup.
class AssetGroupListingGroupFilterRemoveOperationFactory
  def initialize(resources)
    raise "No listing group filters to remove." if resources.size == 0

    # By default, each node only knows about its parents.
    # However, to remove children first, we need to have a mapping
    # of parents to children, so we build that here.
    @parents_to_children = {}

    resources.each do |filter|
      parent_resource_name = filter.parent_listing_group_filter

      if parent_resource_name.nil? || parent_resource_name.empty?
        if !@root_resource_name.nil?
          raise "More than one root node."
        end

        @root_resource_name = filter.resource_name
        next
      end

      siblings = if @parents_to_children.has_key?(parent_resource_name)
                   @parents_to_children[parent_resource_name]
                 else
                   Set.new
                 end
      siblings.add(filter.resource_name)
      @parents_to_children[parent_resource_name] = siblings
    end
  end

  # [START add_performance_max_product_listing_group_tree_2]
  # Creates a list of MutateOperations that remove all of the resources in the
  # tree originally used to create this factory object.
  def remove_all(client)
    remove_descendents_and_filter(client, @root_resource_name)
  end
  # [END add_performance_max_product_listing_group_tree_2]

  # [START add_performance_max_product_listing_group_tree_3]
  # Creates a list of MutateOperations that remove all the descendents of the
  # specified AssetGroupListingGroupFilter resource name. The order of removal
  # is post-order, where all the children (and their children, recursively) are
  # removed first. Then, the node itself is removed.
  def remove_descendents_and_filter(client, resource_name)
    operations = []

    if @parents_to_children.has_key?(resource_name)
      @parents_to_children[resource_name].each do |child|
        operations += remove_descendents_and_filter(client, child)
      end
    end

    operations << client.operation.mutate do |m|
      m.asset_group_listing_group_filter_operation =
        client.operation.remove_resource.asset_group_listing_group_filter(resource_name)
    end

    operations
  end
  # [END add_performance_max_product_listing_group_tree_3]
end

# A factory that creates MutateOperations wrapping
# AssetGroupListingGroupFilterMutateOperations for a specific customerId and
# assetGroupId.
#
# This object is intended to be used with an array of MutateOperations to
# perform an atomic update to an AssetGroup.
class AssetGroupListingGroupFilterCreateOperationFactory
  def initialize(customer_id, asset_group_id, root_listing_group_id)
    @customer_id = customer_id
    @asset_group_id = asset_group_id
    @root_listing_group_id = root_listing_group_id.to_i
    @next_id = @root_listing_group_id - 1
  end

  # Returns a new temporary ID to be used for a resource name in a
  # MutateOperation. See
  # https://developers.google.com/google-ads/api/docs/mutating/best-practices#temporary_resource_names
  # for details about temporary IDs.
  def next_id
    @next_id -= 1
  end

  # [START add_performance_max_product_listing_group_tree_4]
  # Creates a MutateOperation that creates a root AssetGroupListingGroupFilter
  # for the factory's AssetGroup.
  #
  # The root node or partition is the default, which is displayed as "All
  # Products".
  def create_root(client)
    operation = client.operation.create_resource.asset_group_listing_group_filter do |lgf|
      lgf.resource_name = client.path.asset_group_listing_group_filter(
        @customer_id,
        @asset_group_id,
        @root_listing_group_id,
      )
      lgf.asset_group = client.path.asset_group(
        @customer_id,
        @asset_group_id,
      )

      # Since this is the root node, do not set the ParentListingGroupFilter.
      # For all other nodes, this would refer to the parent listing group
      # filter resource name.
      # lgf.parent_listing_group_filter = "<PARENT FILTER NAME>"

      # Unlike AddPerformanceMaxRetailCampaign, the type for the root node here
      # must be Subdivision because we add child partitions under it.
      lgf.type = :SUBDIVISION

      # Because this is a Performance Max campaign for retail, we need to
      # specify that this is in the shopping vertical.
      lgf.vertical = :SHOPPING
    end

    client.operation.mutate do |m|
      m.asset_group_listing_group_filter_operation = operation
    end
  end
  # [END add_performance_max_product_listing_group_tree_4]

  # [START add_performance_max_product_listing_group_tree_5]
  # Creates a MutateOperation that creates a intermediate
  # AssetGroupListingGroupFilter for the factory's AssetGroup.
  #
  # Use this method if the filter will have child filters. Otherwise, use the
  # create_unit method.
  def create_subdivision(client, parent, id, dimension)
    operation = client.operation.create_resource.asset_group_listing_group_filter do |lgf|
      lgf.resource_name = client.path.asset_group_listing_group_filter(
        @customer_id,
        @asset_group_id,
        id,
      )
      lgf.asset_group = client.path.asset_group(
        @customer_id,
        @asset_group_id,
      )
      lgf.parent_listing_group_filter = client.path.asset_group_listing_group_filter(
        @customer_id,
        @asset_group_id,
        parent,
      )

      # We must use the Subdivision type to indicate that the
      # AssetGroupListingGroupFilter will have children.
      lgf.type = :SUBDIVISION

      # Because this is a Performance Max campaign for retail, we need to
      # specify that this is in the shopping vertical.
      lgf.vertical = :SHOPPING

      lgf.case_value = dimension
    end

    client.operation.mutate do |m|
      m.asset_group_listing_group_filter_operation = operation
    end
  end
  # [END add_performance_max_product_listing_group_tree_5]

  # [START add_performance_max_product_listing_group_tree_6]
  # Creates a MutateOperation that creates a child AssetGroupListingGroupFilter
  # for the factory's AssetGroup.
  #
  # Use this method if the filter won't have child filters. Otherwise, use the
  # create_subdivision method.
  def create_unit(client, parent, id, dimension)
    operation = client.operation.create_resource.asset_group_listing_group_filter do |lgf|
      lgf.resource_name = client.path.asset_group_listing_group_filter(
        @customer_id,
        @asset_group_id,
        id,
      )
      lgf.asset_group = client.path.asset_group(
        @customer_id,
        @asset_group_id,
      )
      lgf.parent_listing_group_filter = client.path.asset_group_listing_group_filter(
        @customer_id,
        @asset_group_id,
        parent,
      )

      # We must use the UnitIncluded type to indicate that the
      # AssetGroupListingGroupFilter won't have children.
      lgf.type = :UNIT_INCLUDED

      # Because this is a Performance Max campaign for retail, we need to
      # specify that this is in the shopping vertical.
      lgf.vertical = :SHOPPING

      lgf.case_value = dimension
    end

    client.operation.mutate do |m|
      m.asset_group_listing_group_filter_operation = operation
    end
  end
  # [END add_performance_max_product_listing_group_tree_6]
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
    options[:asset_group_id] = 'INSERT_ASSET_GROUP_ID_HERE'
    options[:replace_existing_tree] = false

    OptionParser.new do |opts|
      opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

      opts.separator ''
      opts.separator 'Options:'

      opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
        options[:customer_id] = v
      end

      opts.on('-g', '--asset-group-id ASSET-GROUP-ID', String, 'Asset Group ID') do |v|
        options[:asset_group_id] = v
      end

      opts.on('-r', '--replace-existing-tree REPLACE-EXISTING-TREE',
              String, 'Replace existing tree?') do |v|
        options[:replace_existing_tree] = true
      end

      opts.separator ''
      opts.separator 'Help:'

      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end
    end.parse!

    begin
      add_performance_max_product_listing_group_tree(
        options.fetch(:customer_id).tr("-", ""),
        options.fetch(:asset_group_id),
        options.fetch(:replace_existing_tree),
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
