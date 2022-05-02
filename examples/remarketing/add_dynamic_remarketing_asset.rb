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
# Adds an asset for use in dynamic remarketing.

require 'optparse'
require 'google/ads/google_ads'

def add_dynamic_remarketing_asset(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates an Asset.
  asset_resource_name = create_asset(client, customer_id)
  # Creates an AssetSet - this is a collection of assets that can be associated with a campaign.
  # Note: do not confuse this with an AssetGroup. An AssetGroup replaces AdGroups in some types
  # of campaigns.
  asset_set_resource_name = create_asset_set(client, customer_id)
  # Adds the Asset to the AssetSet.
  add_assets_to_asset_set(client, asset_resource_name, asset_set_resource_name, customer_id)
  # Finally links the AssetSet to the Campaign.
  link_asset_set_to_campaign(client, asset_set_resource_name, customer_id, campaign_id)
end

# [START add_asset]
def create_asset(client, customer_id)
  # Creates a DynamicEducationAsset.
  # See https://support.google.com/google-ads/answer/6053288?#zippy=%2Ceducation for a
  # detailed explanation of the field format.

  # Creates an operation to add the asset.
  operation = client.operation.create_resource.asset do |asset|
    asset.final_urls << 'https://www.example.com'
    asset.dynamic_education_asset = client.resource.dynamic_education_asset do |dea|
      # Defines meta-information about the school and program.
      dea.school_name = 'The University of Unknown'
      dea.address = 'Building 1, New York, 12345, USA'
      dea.program_name = 'BSc. Computer Science'
      dea.subject = 'Computer Science'
      dea.program_description = 'Slinging code for fun and profit!'
      # Sets up the program ID which is the ID that should be specified in the
      # tracking pixel.
      dea.program_id = 'bsc-cs-uofu'
      # Sets up the location ID which may additionally be specified in the
      # tracking pixel.
      dea.location_id = 'nyc'
      dea.image_url = 'https://gaagl.page.link/Eit5'
      dea.android_app_link = 'android-app://com.example.android/http/example.com/gizmos?1234'
      dea.ios_app_link = 'exampleApp://content/page'
      dea.ios_app_store_id = 123
    end
  end

  # Sends the mutate request.
  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created a dynamic education asset with resource name '#{resource_name}'"

  resource_name
end
# [END add_asset]

# [START add_asset_set]
def create_asset_set(client, customer_id)
  # Creates an AssetSet which will be used to link the dynamic remarketing assets to a campaign.

  # Creates an operation to add the asset set.
  operation = client.operation.create_resource.asset_set do |asset_set|
    asset_set.name = "My dynamic remarketing assets #{Time.now}"
    asset_set.type = :DYNAMIC_EDUCATION
  end

  # Sends the mutate request.
  response = client.service.asset_set.mutate_asset_sets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created asset set with resource name '#{resource_name}'"

  resource_name
end
# [END add_asset_set]

# [START add_asset_set_asset]
def add_assets_to_asset_set(client, asset_resource_name, asset_set_resource_name, customer_id)
  # Creates an operation to add the asset set asset.
  operation = client.operation.create_resource.asset_set_asset do |asa|
    asa.asset = asset_resource_name
    asa.asset_set = asset_set_resource_name
  end

  # Sends the mutate request.
  #
  # Note this is the point that the API will enforce uniqueness of the
  # DynamicEducationAsset.program_id field. You can have any number of assets
  # with the same program ID, however, only one asset is allowed per asset set
  # with the same program ID.
  response = client.service.asset_set_asset.mutate_asset_set_assets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created asset set asset link with resource name '#{resource_name}'"
end
# [END add_asset_set_asset]

# [START add_campaign_asset_set]
def link_asset_set_to_campaign(client, asset_set_resource_name, customer_id, campaign_id)
  # Creates a CampaignAssetSet representing the link between an AssetSet and a Campaign.

  # Creates an operation to add the campaign asset set.
  operation = client.operation.create_resource.campaign_asset_set do |cas|
    cas.campaign = client.path.campaign(customer_id, campaign_id)
    cas.asset_set = asset_set_resource_name
  end

  # Issues the mutate request.
  response = client.service.campaign_asset_set.mutate_campaign_asset_sets(
    customer_id: customer_id,
    operations: [operation],
  )
  resource_name = response.results.first.resource_name
  puts "Created a campaign asset set with resource name '#{resource_name}'"
end
# [END add_campaign_asset_set]


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

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-I', '--campaign-id CAMPAIGN-ID', String,
      'The campaign ID. Specify a campaign type which supports dynamic ' \
      'remarketing, such as Display.') do |v|
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
    add_dynamic_remarketing_asset(options.fetch(:customer_id).tr("-", ""), options[:campaign_id])
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

