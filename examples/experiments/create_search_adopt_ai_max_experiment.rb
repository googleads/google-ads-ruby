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
# Creates an ADOPT_AI_MAX intra-campaign experiment for a Search campaign.
#
# Intra-campaign experiments split traffic *within* the campaign, based on whether
# the feature (in this case, AI Max) is enabled or not.

require 'optparse'
require 'google/ads/google_ads'

def create_search_adopt_ai_max_experiment(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START create_search_adopt_ai_max_experiment_1]
  # Create the experiment resource name using a temporary ID.
  experiment_resource_name = client.path.experiment(customer_id, "-1")

  # Create the experiment.
  experiment_operation = client.operation.mutate do |m|
    m.experiment_operation = client.operation.create_resource.experiment do |e|
      e.resource_name = experiment_resource_name
      e.name = "ADOPT_AI_MAX Experiment #{(Time.new.to_f * 1000).to_i}"
      e.type = :ADOPT_AI_MAX
    end
  end

  # Create the control arm. Both arms in an intra-campaign experiment
  # reference the same base campaign.
  campaign_resource_name = client.path.campaign(customer_id, campaign_id)
  control_arm_operation = client.operation.mutate do |m|
    m.experiment_arm_operation = client.operation.create_resource.experiment_arm do |arm|
      arm.experiment = experiment_resource_name
      arm.name = "Control Arm"
      arm.control = true
      arm.traffic_split = 50
      arm.campaigns << campaign_resource_name
    end
  end

  # Create the treatment arm.
  treatment_arm_operation = client.operation.mutate do |m|
    m.experiment_arm_operation = client.operation.create_resource.experiment_arm do |arm|
      arm.experiment = experiment_resource_name
      arm.name = "Treatment Arm"
      arm.control = false
      arm.traffic_split = 50
      arm.campaigns << campaign_resource_name
    end
  end

  # Create a campaign operation with an update mask to enable AI Max and
  # configure asset automation settings.
  # Note: For intra-campaign experiments, these settings are applied to the
  # base campaign but are only active for the treatment traffic split.
  campaign_operation = client.operation.mutate do |m|
    m.campaign_operation = client.operation.update_resource.campaign(campaign_resource_name) do |c|
      c.ai_max_setting = client.resource.ai_max_setting do |aims|
        aims.enable_ai_max = true
      end

      [:TEXT_ASSET_AUTOMATION, :FINAL_URL_EXPANSION_TEXT_ASSET_AUTOMATION].each do |type|
        c.asset_automation_settings << client.resource.asset_automation_setting do |setting|
          setting.asset_automation_type = type
          setting.asset_automation_status = :OPTED_IN
        end
      end
    end
  end

  # Send all mutate operations in a single Mutate request.
  mutate_operations = [
    experiment_operation,
    control_arm_operation,
    treatment_arm_operation,
    campaign_operation,
  ]

  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: mutate_operations,
  )
  # [END create_search_adopt_ai_max_experiment_1]

  # Print the results.
  # The results will be returned in the same order as the mutate operations.
  experiment_result = response.mutate_operation_responses[0].experiment_result
  control_arm_result = response.mutate_operation_responses[1].experiment_arm_result
  treatment_arm_result = response.mutate_operation_responses[2].experiment_arm_result
  campaign_result = response.mutate_operation_responses[3].campaign_result

  puts "Created experiment: #{experiment_result.resource_name}"
  puts "Created control arm: #{control_arm_result.resource_name}"
  puts "Created treatment arm: #{treatment_arm_result.resource_name}"
  puts "Updated campaign to enable AI Max: #{campaign_result.resource_name}"
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

    opts.on('-i', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
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
    create_search_adopt_ai_max_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id).tr("-", ""),
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
