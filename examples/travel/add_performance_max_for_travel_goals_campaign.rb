#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2023 Google LLC
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

# This example shows how to create a Performance Max for travel goals campaign.
# It also uses TravelAssetSuggestionService to fetch suggested assets for
# creating an asset group. In case there are not enough assets for the asset
# group (required by Performance Max), this example will create more assets to
# fulfill the requirements.
#
# For more information about Performance Max campaigns, see
# https://developers.google.com/google-ads/api/docs/performance-max/overview.
#
# Prerequisites:
# - You must have at least one conversion action in the account.
# For more about conversion actions, see
# https://developers.google.com/google-ads/api/docs/conversions/overview#conversion_actions.
#
# Notes:
# - This example uses the default customer conversion goals.
#   For an example of setting campaign-specific conversion goals, see
#   shopping_ads/add_performance_max_retail_campaign.rb
# - To learn how to create asset group signals, see
#   advanced_perations/add_performance_max_campaign.rb

require 'open-uri'
require 'optparse'
require 'google/ads/google_ads'

# We specify temporary IDs that are specific to a single mutate request.
# Temporary IDs are always negative and unique within one mutate request.
#
# See https://developers.google.com/google-ads/api/docs/mutating/best-practices
# for further details.
#
# These temporary IDs are fixed because they are used in multiple places.
BUDGET_TEMPORARY_ID = '-1'
PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID = '-2'
ASSET_GROUP_TEMPORARY_ID = '-3'

# There are also entities that will be created in the same request but do not
# need to be fixed temporary IDs because they are referenced only once.
def next_temp_id
  @id ||= ASSET_GROUP_TEMPORARY_ID.to_i
  @id -= 1
end

# Minimum requirements of assets required in a Performance Max Asset Group.
# See https://developers.google.com/google-ads/api/docs/performance-max/assets
# for details.
MIN_REQUIRED_TEXT_ASSET_COUNTS = {
  HEADLINE: 3,
  LONG_HEADLINE: 1,
  DESCRIPTION: 2,
  BUSINESS_NAME: 1
}
MIN_REQUIRED_IMAGE_ASSET_COUNTS = {
  MARKETING_IMAGE: 1,
  SQUARE_MARKETING_IMAGE: 1,
  LOGO: 1
}

# Texts and URLs used to create text and image assets when the
# TravelAssetSuggestionService doesn't return enough assets required for
# creating an asset group.
DEFAULT_TEXT_ASSETS_INFO = {
  HEADLINE: ['Hotel', 'Travel Reviews', 'Book travel'],
  LONG_HEADLINE: ['Travel the World'],
  DESCRIPTION: ['Great deal for your beloved hotel', 'Best rate guaranteed'],
  BUSINESS_NAME: ['Interplanetary Cruises']
}

DEFAULT_IMAGE_ASSETS_INFO = {
  MARKETING_IMAGE: ['https://gaagl.page.link/Eit5'],
  SQUARE_MARKETING_IMAGE: ['https://gaagl.page.link/bjYi'],
  LOGO: ['https://gaagl.page.link/bjYi']
}

# [START add_performance_max_for_travel_campaign]
def add_performance_max_for_travel_goals(customer_id, place_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates a hotel property asset set, which will be used later to link with a
  # newly created campaign.
  hotel_property_asset_set_resource_name =
    create_hotel_asset_set(client, customer_id)

  # Creates a hotel property asset and link it with the previously created hotel property
  # asset set. This asset will also be linked to an asset group in the later steps.
  # In the real-world scenario, you'd need to create many assets for all your hotel
  # properties. We use one hotel property here for simplicity.
  # Both asset and asset set need to be created before creating a campaign,
  # so we cannot bundle them with other mutate operations below.
  hotel_property_asset_resource_name =
    create_hotel_asset(
      client,
      customer_id,
      place_id,
      hotel_property_asset_set_resource_name
    )

  # The below methods create and return MutateOperations that we later
  # provide to the GoogleAdsService.Mutate method in order to create the
  # entities in a single request. Since the entities for a Performance Max
  # campaign are closely tied to one-another, it's considered a best practice
  # to create them in a single Mutate request so they all complete
  # successfully or fail entirely, leaving no orphaned entities. See:
  # https://developers.google.com/google-ads/api/docs/mutating/overview
  campaign_budget_operation =
    create_campaign_budget_operation(client, customer_id)

  performance_max_campaign_operation =
    create_performance_max_campaign_operation(
      client,
      customer_id,
      hotel_property_asset_set_resource_name
    )

  # Gets hotel asset suggestion using the TravelAssetSuggestionService.
  hotel_asset_suggestion =
    get_hotel_asset_suggestion(client, customer_id, place_id)

  # Creates the headlines using the hotel asset suggestion.
  headline_asset_resource_names =
    create_multiple_text_assets(
      client,
      customer_id,
      :HEADLINE,
      hotel_asset_suggestion
    )

  # Creates the descriptions using the hotel asset suggestion.
  descriptions_asset_resource_names =
    create_multiple_text_assets(
      client,
      customer_id,
      :DESCRIPTION,
      hotel_asset_suggestion
    )

  asset_group_operation =
    create_asset_group_operations(
      client,
      customer_id,
      hotel_property_asset_resource_name,
      headline_asset_resource_names,
      descriptions_asset_resource_names,
      hotel_asset_suggestion
    )

  # Send the operations in a single Mutate request.
  response =
    client.service.google_ads.mutate(
      customer_id: customer_id,
      mutate_operations: [
        # It's important to create these entities in this order because
        # they depend on each other.
        campaign_budget_operation,
        performance_max_campaign_operation,
        asset_group_operation
      ].flatten
    )

  print_response_details(response)
end
# [END add_performance_max_for_travel_campaign]

# [START create_hotel_asset_set]
# Creates a hotel property asset set.
def create_hotel_asset_set(client, customer_id)
  operation =
    client.operation.create_resource.asset_set do |asset_set|
      asset_set.name = "My Hotel propery asset set #{Time.now}"
      asset_set.type = :HOTEL_PROPERTY
    end

  # Sends the mutate request.
  response =
    client.service.asset_set.mutate_asset_sets(
      customer_id: customer_id,
      operations: [operation]
    )

  # Prints some information about the response.
  response.results.first.resource_name
end
# [END create_hotel_asset_set]

# [START create_hotel_asset]
# Creates a hotel property asset using the specified place ID.
# The place ID must belong to a hotel property. Then, links it to the
# specified asset set.
# See https://developers.google.com/places/web-service/place-id to search for a
# hotel place ID.
def create_hotel_asset(
  client,
  customer_id,
  place_id,
  hotel_property_asset_set_resource_name
)
  asset_operation =
    client.operation.create_resource.asset do |asset|
      asset.name = 'Ad Media Bundle'
      asset.hotel_property_asset =
        client.resource.hotel_property_asset do |hotel_asset|
          hotel_asset.place_id = place_id
        end
    end

  # Send the mutate request.
  response =
    client.service.asset.mutate_assets(
      customer_id: customer_id,
      operations: [asset_operation]
    )

  asset_resource_name = response.results.first.resource_name

  # Creates a mutate operation for an asset set asset.
  asset_set_asset_operation =
    client.operation.create_resource.asset_set_asset do |asa|
      asa.asset = asset_resource_name
      asa.asset_set = hotel_property_asset_set_resource_name
    end

  # Sends the mutate request.
  response =
    client.service.asset_set_asset.mutate_asset_set_assets(
      customer_id: customer_id,
      operations: [asset_set_asset_operation]
    )

  asset_resource_name
end
# [END create_hotel_asset]

# [START create_campaign]
# Creates a MutateOperation that creates a new Performance Max campaign.
#
# A temporary ID will be assigned to this campaign so that it can
# be referenced by other objects being created in the same Mutate request.
def create_performance_max_campaign_operation(
  client,
  customer_id,
  hotel_property_asset_set_resource_name
)
  client.operation.mutate do |m|
    m.campaign_operation =
      client.operation.create_resource.campaign do |c|
        c.name = "Performance Max for Travel Goals #{SecureRandom.uuid}"

        # Set the campaign status as PAUSED. The campaign is the only entity in
        # the mutate request that should have its status set.
        c.status = :PAUSED

        # All Performance Max campaigns have an advertising_channel_type of
        # PERFORMANCE_MAX. The advertising_channel_sub_type should not be set.
        c.advertising_channel_type = :PERFORMANCE_MAX

        # Declare whether or not this campaign serves political ads targeting the EU.
        # Valid values are CONTAINS_EU_POLITICAL_ADVERTISING and
        # DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING.
        c.contains_eu_political_advertising = :DOES_NOT_CONTAIN_EU_POLITICAL_ADVERTISING

        # To create a Performance Max for travel goals campaign, you need to set hotel_property_asset_set
        c.hotel_property_asset_set = hotel_property_asset_set_resource_name

        # Bidding strategy must be set directly on the campaign.
        # Setting a portfolio bidding strategy by resource name is not supported.
        # Max Conversion and Maximize Conversion Value are the only strategies
        # supported for Performance Max campaigns.
        # An optional ROAS (Return on Advertising Spend) can be set for
        # maximize_conversion_value. The ROAS value must be specified as a ratio
        # in the API. It is calculated by dividing "total value" by "total spend".
        # For more information on Maximize Conversion Value, see the support
        # article: http://support.google.com/google-ads/answer/7684216.
        # A target_roas of 3.5 corresponds to a 350% return on ad spend.
        c.bidding_strategy_type = :MAXIMIZE_CONVERSION_VALUE
        c.maximize_conversion_value =
          client.resource.maximize_conversion_value do |mcv|
            mcv.target_roas = 3.5
          end

        # Assign the resource name with a temporary ID.
        c.resource_name =
          client.path.campaign(
            customer_id,
            PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID
          )

        # Set the budget using the given budget resource name.
        c.campaign_budget =
          client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
      end
  end
end
# [END create_campaign]

def create_campaign_budget_operation(client, customer_id)
  client.operation.mutate do |m|
    m.campaign_budget_operation =
      client.operation.create_resource.campaign_budget do |cb|
        cb.name = "Performance Max campaign budget #{SecureRandom.uuid}"
        # The budget period already defaults to DAILY.
        cb.amount_micros = 50_000_000
        cb.delivery_method = :STANDARD
        # A Performance Max campaign cannot use a shared campaign budget.
        cb.explicitly_shared = false

        # Set a temporary ID in the budget's resource name so it can be referenced
        # by the campaign in later steps.
        cb.resource_name =
          client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
      end
  end
end

# [START get_hotel_asset_suggestion]
def get_hotel_asset_suggestion(client, customer_id, place_id)
  response =
    client.service.travel_asset_suggestion.suggest_travel_assets(
      customer_id: customer_id,
      language_option: 'en-US',
      place_ids: [place_id]
    )

  response.hotel_asset_suggestions.first
end
# [END get_hotel_asset_suggestion]

# Creates multiple text assets and returns the list of resource names.
# The hotel asset suggestion is used to create a text asset first.
# If the number of created text assets is still fewer than the minimum required
# number of assets of the specified asset field type, adds more text assets to
# fulfill the requirement.
def create_multiple_text_assets(
  client,
  customer_id,
  asset_field_type,
  hotel_asset_suggestion
)
  # Creates the first text asset using the hotel asset suggestions.
  texts = []
  numText = 0
  if hotel_asset_suggestion.status == :SUCCESS
    hotel_asset_suggestion.text_assets.each do |hotel_text_asset|
      if hotel_text_asset.asset_field_type == asset_field_type
        texts.append(hotel_text_asset.text)
        numText += 1
      end
    end
  end

  # If the added assets are still less than the minimum required assets for the
  # asset field type, add more text assets using the default texts.
  if numText < MIN_REQUIRED_TEXT_ASSET_COUNTS[asset_field_type]
    for i in numText..MIN_REQUIRED_TEXT_ASSET_COUNTS[asset_field_type] - 1
      texts.append(DEFAULT_TEXT_ASSETS_INFO[asset_field_type][i])
    end
  end

  # Create the operations with the selected texts.
  operations =
    texts.map do |text|
      client.operation.mutate do |m|
        m.asset_operation =
          client.operation.create_resource.asset do |asset|
            asset.text_asset =
              client.resource.text_asset { |text_asset| text_asset.text = text }
          end
      end
    end

  # Send the operations in a single Mutate request.
  response =
    client.service.google_ads.mutate(
      customer_id: customer_id,
      mutate_operations: operations
    )

  asset_resource_names = []
  response.mutate_operation_responses.each do |result|
    asset_resource_names.append(result.asset_result.resource_name) if result.asset_result
  end
  print_response_details(response)
  asset_resource_names
end

# Creates a list of MutateOperations that create a new asset_group.
#
# A temporary ID will be assigned to this asset group so that it can
# be referenced by other objects being created in the same Mutate request.
def create_asset_group_operations(
  client,
  customer_id,
  hotel_property_asset_resource_name,
  headline_asset_resource_names,
  description_asset_resource_names,
  hotel_asset_suggestion
)
  operations = []

  # Creates a new mutate operation that creates an asset group using suggested
  # information when available.
  asset_group_final_urls =
    (
      if hotel_asset_suggestion.status == :SUCCESS
        hotel_asset_suggestion.final_url
      else
        'http://www.example.com'
      end
    )

  operations << client.operation.mutate do |m|
    m.asset_group_operation =
      client.operation.create_resource.asset_group do |ag|
        ag.name =
          "Performance Max for Travel Goals asset group #{SecureRandom.uuid}"
        ag.campaign =
          client.path.campaign(
            customer_id,
            PERFORMANCE_MAX_CAMPAIGN_TEMPORARY_ID
          )
        ag.final_urls << asset_group_final_urls
        ag.status = :PAUSED
        ag.resource_name =
          client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
      end
  end

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
      m.asset_group_asset_operation =
        client.operation.create_resource.asset_group_asset do |aga|
          aga.field_type = :HEADLINE
          aga.asset_group =
            client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
          aga.asset = resource_name
        end
    end
  end

  #  Link the description assets.
  description_asset_resource_names.each do |resource_name|
    operations << client.operation.mutate do |m|
      m.asset_group_asset_operation =
        client.operation.create_resource.asset_group_asset do |aga|
          aga.field_type = :DESCRIPTION
          aga.asset_group =
            client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
          aga.asset = resource_name
        end
    end
  end

  # [START link_hotel_asset]
  # Link the previously created hotel property asset to the asset group.
  # In the real-world scenario, you'd need to do this step several times for
  # each hotel property asset.
  operations << client.operation.mutate do |m|
    m.asset_group_asset_operation =
      client.operation.create_resource.asset_group_asset do |aga|
        aga.field_type = :HOTEL_PROPERTY
        aga.asset_group =
          client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
        aga.asset = hotel_property_asset_resource_name
      end
  end
  # [END link_hotel_asset]

  # Creates the rest of required text assets and link them to the asset group.
  operations +=
    create_text_assets_for_asset_group(
      client,
      customer_id,
      hotel_asset_suggestion
    )

  # Creates the image assets and link them to the asset group. Some optional
  # image assets suggested by the TravelAssetSuggestionService might be created too.
  operations +=
    create_image_assets_for_asset_group(
      client,
      customer_id,
      hotel_asset_suggestion
    )

  operations
end

# Creates text assets required for an asset group using the suggested hotel text
# assets. It adds more text assets to fulfill the requirements if the suggested
# hotel text assets are not enough.
def create_text_assets_for_asset_group(
  client,
  customer_id,
  hotel_asset_suggestion
)
  operations = []

  required_text_asset_counts = deep_copy(MIN_REQUIRED_TEXT_ASSET_COUNTS)
  required_text_asset_counts.each do |asset_field_type, _count|
    required_text_asset_counts[asset_field_type] = 0
  end

  # Creates mutate operations for the suggested text assets except for headlines
  # and descriptions, which were created previously.
  if hotel_asset_suggestion.status == :SUCCESS
    hotel_asset_suggestion.text_assets.each do |hotel_text_asset|
      if hotel_text_asset.asset_field_type == :HEADLINE ||
         hotel_text_asset.asset_field_type == :DESCRIPTION
        # Headlines and descriptions were already created at the first step of
        # this code example.
        next
      end

      puts "A text asset with text '#{hotel_text_asset.text}' is suggested for the asset field type '#{hotel_text_asset.asset_field_type}'."

      operations +=
        create_and_link_text_asset_operations(
          client,
          customer_id,
          hotel_text_asset.text,
          hotel_text_asset.asset_field_type
        )

      required_text_asset_counts[hotel_text_asset.asset_field_type] += 1
    end
  end

  # Adds more text assets to fulfill the requirements.
  MIN_REQUIRED_TEXT_ASSET_COUNTS.each do |asset_field_type, count|
    if %i[HEADLINE DESCRIPTION].include?(asset_field_type)
      # Headlines and descriptions were already created at the first step of this
      # code example.
      next
    end

    next unless required_text_asset_counts[asset_field_type] < count

    for i in required_text_asset_counts[asset_field_type]...count
      default_text = DEFAULT_TEXT_ASSETS_INFO[asset_field_type][i]
      puts "A default text '#{default_text}' is used to create a text asset for the asset field type '#{asset_field_type}'."

      operations +=
        create_and_link_text_asset_operations(
          client,
          customer_id,
          default_text,
          asset_field_type
        )
    end
  end

  operations
end

# Creates a list of MutateOperations that create a new linked text asset.
def create_and_link_text_asset_operations(client, customer_id, text, field_type)
  operations = []
  temp_id = next_temp_id

  # Create the Text Asset.
  operations << client.operation.mutate do |m|
    m.asset_operation =
      client.operation.create_resource.asset do |a|
        a.resource_name = client.path.asset(customer_id, temp_id)
        a.text_asset =
          client.resource.text_asset { |text_asset| text_asset.text = text }
      end
  end

  # Create an AssetGroupAsset to link the Asset to the AssetGroup.
  operations << client.operation.mutate do |m|
    m.asset_group_asset_operation =
      client.operation.create_resource.asset_group_asset do |aga|
        aga.field_type = field_type
        aga.asset_group =
          client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
        aga.asset = client.path.asset(customer_id, temp_id)
      end
  end

  operations
end

# Creates image assets required for an asset group using the suggested hotel
# image assets. It adds more image assets to fulfill the requirements if the
# suggested hotel image assets are not enough.
def create_image_assets_for_asset_group(
  client,
  customer_id,
  hotel_asset_suggestion
)
  operations = []

  required_image_asset_counts = deep_copy(MIN_REQUIRED_IMAGE_ASSET_COUNTS)
  required_image_asset_counts.each do |asset_field_type, _count|
    required_image_asset_counts[asset_field_type] = 0
  end

  # Creates mutate operations for the suggested image assets.
  if hotel_asset_suggestion.status == :SUCCESS
    hotel_asset_suggestion.image_assets.each do |hotel_image_asset|
      puts "An image asset with URL '#{hotel_image_asset.uri}' is suggested for the asset field type '#{hotel_image_asset.asset_field_type}'."

      operations +=
        create_and_link_image_asset_operations(
          client,
          customer_id,
          hotel_image_asset.uri,
          hotel_image_asset.asset_field_type,
          "Suggested image asset for the asset field type '%s'." %
            hotel_image_asset.asset_field_type
        )

      # Keeps track of only required image assets. The service may sometimes
      # suggest optional image assets.
      unless required_image_asset_counts.has_key?(
        hotel_image_asset.asset_field_type
      )
        next
      end

      required_image_asset_counts[hotel_image_asset.asset_field_type] += 1
    end
  end

  # Adds more image assets to fulfill the requirements.
  MIN_REQUIRED_IMAGE_ASSET_COUNTS.each do |asset_field_type, count|
    next unless required_image_asset_counts[asset_field_type] < count

    for i in required_image_asset_counts[asset_field_type]...count
      default_uri = DEFAULT_IMAGE_ASSETS_INFO[asset_field_type][i]
      puts "A default image URL '#{default_uri}' is used to create an image asset for the asset field type '#{asset_field_type}'."

      operations +=
        create_and_link_image_asset_operations(
          client,
          customer_id,
          default_uri,
          asset_field_type,
          "Default image asset for the asset field type '%s'." %
            asset_field_type
        )
    end
  end

  operations
end

# Creates a list of MutateOperations that create a new linked image asset.
def create_and_link_image_asset_operations(
  client,
  customer_id,
  url,
  field_type,
  asset_name
)
  operations = []
  temp_id = next_temp_id

  # Create the Image Asset.
  operations << client.operation.mutate do |m|
    m.asset_operation =
      client.operation.create_resource.asset do |a|
        a.resource_name = client.path.asset(customer_id, temp_id)
        # Provide a unique friendly name to identify your asset.
        # When there is an existing image asset with the same content but a different
        # name, the new name will be dropped silently.
        a.name = asset_name
        a.type = :IMAGE
        a.image_asset =
          client.resource.image_asset do |image_asset|
            image_asset.data = get_image_bytes(url)
          end
      end
  end

  # Create an AssetGroupAsset to link the Asset to the AssetGroup.
  operations << client.operation.mutate do |m|
    m.asset_group_asset_operation =
      client.operation.create_resource.asset_group_asset do |aga|
        aga.field_type = field_type
        aga.asset_group =
          client.path.asset_group(customer_id, ASSET_GROUP_TEMPORARY_ID)
        aga.asset = client.path.asset(customer_id, temp_id)
      end
  end

  operations
end

# Loads image data from a URL.
def get_image_bytes(url)
  URI.open(url).read
end

# Prints the details of a MutateGoogleAdsResponse.
def print_response_details(response)
  # Parse the mutate response to print details about the entities that
  # were created by the request.
  suffix = '_result'
  response.mutate_operation_responses.each do |result|
    result
      .to_h
      .select { |_k, v| v }
      .each do |name, value|
        name = name.to_s.delete_suffix(suffix) if name.to_s.end_with?(suffix)

        puts "Created a(n) #{::Google::Ads::GoogleAds::Utils.camelize(name)} " \
               "with #{value.to_s.strip}."
      end
  end
end

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

if __FILE__ == $0
  options = {}

  OptionParser
    .new do |opts|
      opts.banner = format('Usage: %s [options]', File.basename(__FILE__))

      opts.separator ''
      opts.separator 'Options:'

      opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
        options[:customer_id] = v
      end

      opts.on('-P', '--place-id PLACE-ID', String, 'Place ID') do |v|
        options[:place_id] = v
      end

      opts.separator ''
      opts.separator 'Help:'

      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end
    end
    .parse!

  begin
    add_performance_max_for_travel_goals(
      options.fetch(:customer_id).tr('-', ''),
      options[:place_id]
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
