#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
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
# Creates an OPTIMIZE_ASSETS experiment.
#
# Asset optimization experiments are used to test different asset combinations
# within Performance Max campaigns.

require 'optparse'
require 'open-uri'
require 'google/ads/google_ads'

def create_asset_optimization_experiment(customer_id, asset_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Query the asset group to find the associated campaign resource name.
  query = <<~QUERY
    SELECT asset_group.campaign
    FROM asset_group
    WHERE asset_group.id = #{asset_group_id}
  QUERY

  search_response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  campaign_resource_name = nil
  search_response.each do |row|
    campaign_resource_name = row.asset_group.campaign
    break
  end

  unless campaign_resource_name
    puts "Asset group with ID #{asset_group_id} not found."
    return
  end

  # Temp IDs
  asset_1_temp_id = "-1"
  experiment_temp_id = "-2"
  asset_2_temp_id = "-3"

  # [START create_asset_optimization_experiment_1]
  # 1. Create Assets with temporary resource names.
  # We create a text asset and an image asset to showcase different types.
  asset_operation_1 = create_text_asset_operation(
    client,
    customer_id,
    asset_1_temp_id,
    "Fly to Mars!",
  )
  asset_operation_2 = create_image_asset_operation(
    client,
    customer_id,
    asset_2_temp_id,
    "https://gaagl.page.link/Eit5",
    "Mars Landscape View",
  )

  # 2. Create an Experiment with a temporary resource name.
  experiment_operation = client.operation.mutate do |m|
    m.experiment_operation = client.operation.create_resource.experiment do |e|
      e.resource_name = client.path.experiment(customer_id, experiment_temp_id)
      e.name = "Interstellar Asset Experiment #{(Time.new.to_f * 1000).to_i}"
      e.type = :OPTIMIZE_ASSETS
      # Set the optimize assets experiment subtype to COMPARE_ASSETS.
      e.optimize_assets_experiment = client.resource.optimize_assets_experiment_info do |oae|
        oae.optimize_assets_experiment_subtype = :COMPARE_ASSETS
      end
    end
  end

  # 3. Create two ExperimentArm resources.
  treatment_assets = [
    [asset_1_temp_id, :HEADLINE],
    [asset_2_temp_id, :MARKETING_IMAGE],
  ]
  arm_operations = create_arms_operations(
    client,
    customer_id,
    experiment_temp_id,
    campaign_resource_name,
    asset_group_id,
    treatment_assets,
  )

  # 4. Create AssetGroupAssets linking the assets to the asset group.
  asset_group_asset_operation_1 = create_asset_group_asset_operation(
    client,
    customer_id,
    asset_group_id,
    asset_1_temp_id,
    :HEADLINE,
  )
  asset_group_asset_operation_2 = create_asset_group_asset_operation(
    client,
    customer_id,
    asset_group_id,
    asset_2_temp_id,
    :MARKETING_IMAGE,
  )

  # Send all operations in a single Mutate request.
  # The operations must be in this specific order.
  mutate_operations = [
    asset_operation_1,
    asset_operation_2,
    experiment_operation,
    *arm_operations,
    asset_group_asset_operation_1,
    asset_group_asset_operation_2,
  ]

  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: mutate_operations,
  )
  # [END create_asset_optimization_experiment_1]

  # Print the results.
  puts "Created headline asset: " \
       "#{response.mutate_operation_responses[0].asset_result.resource_name}"
  puts "Created image asset: " \
       "#{response.mutate_operation_responses[1].asset_result.resource_name}"
  puts "Created experiment: " \
       "#{response.mutate_operation_responses[2].experiment_result.resource_name}"
  puts "Created control arm: " \
       "#{response.mutate_operation_responses[3].experiment_arm_result.resource_name}"
  puts "Created treatment arm: " \
       "#{response.mutate_operation_responses[4].experiment_arm_result.resource_name}"
  puts "Created asset group asset for headline: " \
       "#{response.mutate_operation_responses[5].asset_group_asset_result.resource_name}"
  puts "Created asset group asset for image: " \
       "#{response.mutate_operation_responses[6].asset_group_asset_result.resource_name}"
end

def create_text_asset_operation(client, customer_id, temp_id, text)
  client.operation.mutate do |m|
    m.asset_operation = client.operation.create_resource.asset do |a|
      a.resource_name = client.path.asset(customer_id, temp_id)
      a.text_asset = client.resource.text_asset do |ta|
        ta.text = text
      end
    end
  end
end

def create_image_asset_operation(client, customer_id, temp_id, url, name)
  client.operation.mutate do |m|
    m.asset_operation = client.operation.create_resource.asset do |a|
      a.resource_name = client.path.asset(customer_id, temp_id)
      a.name = name
      a.type = :IMAGE
      a.image_asset = client.resource.image_asset do |ia|
        ia.data = URI.open(url) { |f| f.read }
      end
    end
  end
end

def create_arms_operations(
  client,
  customer_id,
  experiment_temp_id,
  campaign_resource_name,
  asset_group_id,
  treatment_assets
)
  operations = []

  # Control arm
  operations << client.operation.mutate do |m|
    m.experiment_arm_operation = client.operation.create_resource.experiment_arm do |arm|
      arm.experiment = client.path.experiment(customer_id, experiment_temp_id)
      arm.name = "Base Assets (Control)"
      arm.control = true
      arm.traffic_split = 50
      arm.campaigns << campaign_resource_name

      arm.asset_groups << client.resource.experiment_arm_asset_group_info do |info|
        info.asset_group = client.path.asset_group(customer_id, asset_group_id)
      end
    end
  end

  # Treatment arm
  operations << client.operation.mutate do |m|
    m.experiment_arm_operation = client.operation.create_resource.experiment_arm do |arm|
      arm.experiment = client.path.experiment(customer_id, experiment_temp_id)
      arm.name = "New Assets (Treatment)"
      arm.control = false
      arm.traffic_split = 50
      arm.campaigns << campaign_resource_name

      asset_group_info = client.resource.experiment_arm_asset_group_info do |info|
        info.asset_group = client.path.asset_group(customer_id, asset_group_id)
      end
      treatment_assets.each do |asset_temp_id, field_type|
        asset_group_info.asset_group_assets << client.resource.asset_group_asset_info do |agai|
          agai.asset = client.path.asset(customer_id, asset_temp_id)
          agai.field_type = field_type
        end
      end
      arm.asset_groups << asset_group_info
    end
  end

  operations
end

def create_asset_group_asset_operation(
  client,
  customer_id,
  asset_group_id,
  asset_temp_id,
  field_type
)
  client.operation.mutate do |m|
    m.asset_group_asset_operation = client.operation.create_resource.asset_group_asset do |aga|
      aga.asset_group = client.path.asset_group(customer_id, asset_group_id)
      aga.asset = client.path.asset(customer_id, asset_temp_id)
      aga.field_type = field_type
    end
  end
end

if __FILE__ == $0
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-c', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-a', '--asset-group-id ASSET-GROUP-ID', String, 'Asset Group ID') do |v|
      options[:asset_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    create_asset_optimization_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:asset_group_id).tr("-", ""),
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
