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
# This example shows how to create a Performance Max campaign.
#
# For more information about Performance Max campaigns, see
# https://developers.google.com/google-ads/api/docs/performance-max/overview
#
# Prerequisites:
# - You must have at least one conversion action in the account. For
# more about conversion actions, see
# https://developers.google.com/google-ads/api/docs/conversions/overview#conversion_actions
#
# This example uses the default customer conversion goals. For an example
# of setting campaign-specific conversion goals, see
# shopping_ads/add_performance_max_retail_campaign.rb

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'

# We specify temporary IDs that are specific to a single mutate request.
# Temporary IDs are always negative and unique within one mutate request.
#
# See https://developers.google.com/google-ads/api/docs/mutating/best-practices
# for further details.
#
# These temporary IDs are fixed because they are used in multiple places.
BUDGET_TEMPORARY_ID = "-1"
PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID = "-2"
ASSET_GROUP_TEMPORARY_ID = "-3"

# There are also entities that will be created in the same request but do not
# need to be fixed temporary IDs because they are referenced only once.
def next_temp_id
  @id ||= ASSET_GROUP_TEMPORARY_ID.to_i
  @id -= 1
end

# [START add_performance_max_campaign]
def add_performance_max_campaign(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START add_performance_max_campaign_1]
  # Performance Max campaigns require that repeated assets such as headlines
  # and descriptions be created before the campaign.
  # For the list of required assets for a Performance Max campaign, see
  # https://developers.google.com/google-ads/api/docs/performance-max/assets
  #
  # Create the headlines.
  headline_asset_resource_names = create_multiple_text_assets(
    client,
    customer_id,
    [
      "Travel",
      "Travel Reviews",
      "Book travel",
    ])
  # Create the descriptions.
  description_asset_resource_names = create_multiple_text_assets(
    client,
    customer_id,
    [
      "Take to the air!",
      "Fly to the sky!",
    ])

  # The below methods create and return MutateOperations that we later
  # provide to the GoogleAdsService.Mutate method in order to create the
  # entities in a single request. Since the entities for a Performance Max
  # campaign are closely tied to one-another, it's considered a best practice
  # to create them in a single Mutate request so they all complete
  # successfully or fail entirely, leaving no orphaned entities. See:
  # https://developers.google.com/google-ads/api/docs/mutating/overview
  campaign_budget_operation = create_campaign_budget_operation(
    client,
    customer_id)
  performance_max_campaign_operation = create_performance_max_campaign_operation(
    client,
    customer_id)
  campaign_criterion_operations = create_campaign_criterion_operations(
      client,
      customer_id)
  asset_group_operations = create_asset_group_operation(
      client,
      customer_id,
      headline_asset_resource_names,
      description_asset_resource_names)

  # Send the operations in a single Mutate request.
  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: [
      # It's important to create these entities in this order because
      # they depend on each other.
      campaign_budget_operation,
      performance_max_campaign_operation,
      # Expand the list of multiple operations into the list of
      # other mutate operations
      campaign_criterion_operations,
      asset_group_operations,
    ].flatten)

  print_response_details(response)
end
# [END add_performance_max_campaign_1]

# [START add_performance_max_campaign_2]
# Creates a MutateOperation that creates a new CampaignBudget.
#
# A temporary ID will be assigned to this campaign budget so that it can be
# referenced by other objects being created in the same Mutate request.
def create_campaign_budget_operation(client, customer_id)
  client.operation.mutate do |m|
    m.campaign_budget_operation = client.operation.create_resource.campaign_budget do |cb|
      cb.name = "Performance Max campaign budget #{SecureRandom.uuid}"
      # The budget period already defaults to DAILY.
      cb.amount_micros = 50_000_000
      cb.delivery_method = :STANDARD
        # A Performance Max campaign cannot use a shared campaign budget.
        cb.explicitly_shared = false

      # Set a temporary ID in the budget's resource name so it can be referenced
      # by the campaign in later steps.
      cb.resource_name = client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
    end
  end
end
# [END add_performance_max_campaign_2]

# [START add_performance_max_campaign_3]
# Creates a MutateOperation that creates a new Performance Max campaign.
#
# A temporary ID will be assigned to this campaign so that it can
# be referenced by other objects being created in the same Mutate request.
def create_performance_max_campaign_operation(client, customer_id)
  client.operation.mutate do |m|
    m.campaign_operation = client.operation.create_resource.campaign do |c|
      c.name = "Performance Max campaign #{SecureRandom.uuid}"
      # Set the campaign status as PAUSED. The campaign is the only entity in
      # the mutate request that should have its status set.
      c.status = :PAUSED
      # All Performance Max campaigns have an advertising_channel_type of
      # PERFORMANCE_MAX. The advertising_channel_sub_type should not be set.
      c.advertising_channel_type = :PERFORMANCE_MAX
      # Bidding strategy must be set directly on the campaign.
      # Setting a portfolio bidding strategy by resource name is not supported.
      # Max Conversion and Maximize Conversion Value are the only strategies
      # supported for Performance Max campaigns.
      # An optional ROAS (Return on Advertising Spend) can be set for
      # maximize_conversion_value. The ROAS value must be specified as a ratio in
      # the API. It is calculated by dividing "total value" by "total spend".
      # For more information on Maximize Conversion Value, see the support
      # article: http://support.google.com/google-ads/answer/7684216.
      # A target_roas of 3.5 corresponds to a 350% return on ad spend.
      c.bidding_strategy_type = :MAXIMIZE_CONVERSION_VALUE
      c.maximize_conversion_value = client.resource.maximize_conversion_value do |mcv|
        mcv.target_roas = 3.5
      end
      # Set the Final URL expansion opt out. This flag is specific to
      # Performance Max campaigns. If opted out (true), only the final URLs in
      # the asset group or URLs specified in the advertiser's Google Merchant
      # Center or business data feeds are targeted.
      # If opted in (false), the entire domain will be targeted. For best
      # results, set this value to false to opt in and allow URL expansions. You
      # can optionally add exclusions to limit traffic to parts of your website.
      c.url_expansion_opt_out = false

      # Assign the resource name with a temporary ID.
      c.resource_name = client.path.campaign(customer_id, PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID)
      # Set the budget using the given budget resource name.
      c.campaign_budget = client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)

      # Optional fields
      c.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
      c.end_date = DateTime.parse(Date.today.next_year.to_s).strftime('%Y%m%d')
    end
  end
end
# [END add_performance_max_campaign_3]

# [START add_performance_max_campaign_4]
# Creates a list of MutateOperations that create new campaign criteria.
def create_campaign_criterion_operations(client, customer_id)
  operations = []

  # Set the LOCATION campaign criteria.
  # Target all of New York City except Brooklyn.
  # Location IDs are listed here:
  # https://developers.google.com/google-ads/api/reference/data/geotargets
  # and they can also be retrieved using the GeoTargetConstantService as shown
  # here: https://developers.google.com/google-ads/api/docs/targeting/location-targeting
  #
  # We will add one positive location target for New York City (ID=1023191)
  # and one negative location target for Brooklyn (ID=1022762).
  # First, add the positive (negative = false) for New York City.
  operations << client.operation.mutate do |m|
    m.campaign_criterion_operation =
      client.operation.create_resource.campaign_criterion do |cc|
      cc.campaign = client.path.campaign(
        customer_id, PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID)
      cc.location = client.resource.location_info do  |li|
        li.geo_target_constant = client.path.geo_target_constant("1023191")
      end
      cc.negative = false
    end
  end

  # Next add the negative target for Brooklyn.
  operations << client.operation.mutate do |m|
    m.campaign_criterion_operation =
      client.operation.create_resource.campaign_criterion do |cc|
      cc.campaign = client.path.campaign(
        customer_id, PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID)
      cc.location = client.resource.location_info do  |li|
        li.geo_target_constant = client.path.geo_target_constant("1022762")
      end
      cc.negative = true
    end
  end

  # Set the LANGUAGE campaign criterion.
  operations << client.operation.mutate do |m|
    m.campaign_criterion_operation =
      client.operation.create_resource.campaign_criterion do |cc|
      cc.campaign = client.path.campaign(
        customer_id, PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID)
      # Set the language.
      # For a list of all language codes, see:
      # https://developers.google.com/google-ads/api/reference/data/codes-formats#expandable-7
      cc.language = client.resource.language_info do |li|
        li.language_constant = client.path.language_constant("1000")  # English
      end
    end
  end

  operations
end
# [END add_performance_max_campaign_4]

# [START add_performance_max_campaign_5]
# Creates multiple text assets and returns the list of resource names.
def create_multiple_text_assets(client, customer_id, texts)
  operations = texts.map do |text|
    client.operation.mutate do |m|
      m.asset_operation = client.operation.create_resource.asset do |asset|
        asset.text_asset = client.resource.text_asset do |text_asset|
          text_asset.text = text
        end
      end
    end
  end

  # Send the operations in a single Mutate request.
  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: operations,
  )

  asset_resource_names = []
  response.mutate_operation_responses.each do |result|
    if result.asset_result
      asset_resource_names.append(result.asset_result.resource_name)
    end
  end
  print_response_details(response)
  asset_resource_names
end
# [END add_performance_max_campaign_5]

# [START add_performance_max_campaign_6]
# Creates a list of MutateOperations that create a new asset_group.
#
# A temporary ID will be assigned to this asset group so that it can
# be referenced by other objects being created in the same Mutate request.
def create_asset_group_operation(
    client,
    customer_id,
    headline_asset_resource_names,
    description_asset_resource_names)
  operations = []

  # Create the AssetGroup
  operations << client.operation.mutate do |m|
    m.asset_group_operation = client.operation.create_resource.asset_group do |ag|
      ag.name = "Performance Max asset group #{SecureRandom.uuid}"
      ag.campaign = client.path.campaign(
        customer_id,
        PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID)
      ag.final_urls << "http://www.example.com"
      ag.final_mobile_urls << "http://www.example.com"
      ag.status = :PAUSED
      ag.resource_name = client.path.asset_group(
        customer_id,
        ASSET_GROUP_TEMPORARY_ID)
    end
  end

  # For the list of required assets for a Performance Max campaign, see
  # https://developers.google.com/google-ads/api/docs/performance-max/assets
  #
  # An AssetGroup is linked to an Asset by creating a new AssetGroupAsset
  # and providing:
  #   the resource name of the AssetGroup
  #   the resource name of the Asset
  #   the field_type of the Asset in this AssetGroup.
  #
  # To learn more about AssetGroups, see
  # https://developers.google.com/google-ads/api/docs/performance-max/asset-groups

  # Link the previously created multiple text assets.

  # Link the headline assets.
  headline_asset_resource_names.each do |resource_name|
    operations << client.operation.mutate do |m|
      m.asset_group_asset_operation = client.operation.create_resource
          .asset_group_asset do |aga|
        aga.field_type = :HEADLINE
        aga.asset_group = client.path.asset_group(
          customer_id,
          ASSET_GROUP_TEMPORARY_ID)
        aga.asset = resource_name
      end
    end
  end

  #  Link the description assets.
  description_asset_resource_names.each do |resource_name|
    operations << client.operation.mutate do |m|
      m.asset_group_asset_operation = client.operation.create_resource
          .asset_group_asset do |aga|
        aga.field_type = :DESCRIPTION
        aga.asset_group = client.path.asset_group(
          customer_id,
          ASSET_GROUP_TEMPORARY_ID)
        aga.asset = resource_name
      end
    end
  end

  # Create and link the long headline text asset.
  operations += create_and_link_text_asset(
    client,
    customer_id,
    "Travel the World",
    :LONG_HEADLINE)

  # Create and link the business name text asset.
  operations += create_and_link_text_asset(
    client,
    customer_id,
    "Interplanetary Cruises",
    :BUSINESS_NAME)

  # Create and link the image assets.

  # Create and link the Logo Asset.
  operations += create_and_link_image_asset(
    client,
    customer_id,
    "https://gaagl.page.link/bjYi",
    :LOGO,
    "Marketing Logo")

  # Create and link the Marketing Image Asset.
  operations += create_and_link_image_asset(
    client,
    customer_id,
    "https://gaagl.page.link/Eit5",
    :MARKETING_IMAGE,
    "Marketing Image")

  # Create and link the Square Marketing Image Asset.
  operations += create_and_link_image_asset(
    client,
    customer_id,
    "https://gaagl.page.link/bjYi",
    :SQUARE_MARKETING_IMAGE,
    "Square Marketing Image")

  operations
end
# [END add_performance_max_campaign_6]

# [START add_performance_max_campaign_7]
# Creates a list of MutateOperations that create a new linked text asset.
def create_and_link_text_asset(client, customer_id, text, field_type)
  operations = []
  temp_id = next_temp_id

  # Create the Text Asset.
  operations << client.operation.mutate do |m|
    m.asset_operation = client.operation.create_resource.asset do |a|
      a.resource_name = client.path.asset(customer_id, temp_id)
      a.text_asset = client.resource.text_asset do |text_asset|
        text_asset.text = text
      end
    end
  end

  # Create an AssetGroupAsset to link the Asset to the AssetGroup.
  operations << client.operation.mutate do |m|
    m.asset_group_asset_operation = client.operation.create_resource
        .asset_group_asset do |aga|
      aga.field_type = field_type
      aga.asset_group = client.path.asset_group(
        customer_id,
        ASSET_GROUP_TEMPORARY_ID)
      aga.asset = client.path.asset(customer_id, temp_id)
    end
  end

  operations
end
# [END add_performance_max_campaign_7]

# [START add_performance_max_campaign_8]
# Creates a list of MutateOperations that create a new linked image asset.
def create_and_link_image_asset(client, customer_id, url, field_type, asset_name)
  operations = []
  temp_id = next_temp_id

  # Create the Image Asset.
  operations << client.operation.mutate do |m|
    m.asset_operation = client.operation.create_resource.asset do |a|
      a.resource_name = client.path.asset(customer_id, temp_id)
      # Provide a unique friendly name to identify your asset.
      # When there is an existing image asset with the same content but a different
      # name, the new name will be dropped silently.
      a.name = asset_name
      a.type = :IMAGE
      a.image_asset = client.resource.image_asset do |image_asset|
        image_asset.data = get_image_bytes(url)
      end
    end
  end

  # Create an AssetGroupAsset to link the Asset to the AssetGroup.
  operations << client.operation.mutate do |m|
    m.asset_group_asset_operation = client.operation.create_resource
        .asset_group_asset do |aga|
      aga.field_type = field_type
      aga.asset_group = client.path.asset_group(
        customer_id,
        ASSET_GROUP_TEMPORARY_ID)
      aga.asset = client.path.asset(customer_id, temp_id)
    end
  end

  operations
end
# [END add_performance_max_campaign_8]

# Loads image data from a URL.
def get_image_bytes(url)
  URI.open(url).read
end

# Prints the details of a MutateGoogleAdsResponse.
def print_response_details(response)
  # Parse the mutate response to print details about the entities that
  # were created by the request.
  suffix = "_result"
  response.mutate_operation_responses.each do |result|
    result.to_h.select {|k, v| v }.each do |name, value|
      if name.to_s.end_with?(suffix)
        name = name.to_s.delete_suffix(suffix)
      end

      puts "Created a(n) #{::Google::Ads::GoogleAds::Utils.camelize(name)} " \
        "with #{value.to_s.strip}."
    end
  end
end
# [END add_performance_max_campaign]

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
    add_performance_max_campaign(options.fetch(:customer_id).tr("-", ""))
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
