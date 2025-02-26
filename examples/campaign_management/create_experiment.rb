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
# This example creates a new experiment, experiment arms, and demonstrates
# how to modify the draft campaign as well as begin the experiment.

require 'optparse'
require 'google/ads/google_ads'

def create_experiment(customer_id, base_campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  experiment = create_experiment_resource(client, customer_id)
  draft_campaign = create_experiment_arms(client, customer_id, base_campaign_id, experiment)

  modify_draft_campaign(client, customer_id, draft_campaign)

  # When you're done setting up the experiment and arms and modifying the draft
  # campaign, this will begin the experiment.
  response = client.service.experiment.schedule_experiment(
    # This is from the very first step above.
    resource_name: experiment,
  )
end

# [START create_experiment_1]
def create_experiment_resource(client, customer_id)
  operation = client.operation.create_resource.experiment do |e|
    # Name must be unique.
    e.name = "Example Experiment #{(Time.new.to_f * 1000).to_i}"
    e.type = :SEARCH_CUSTOM
    e.suffix = '[experiment]'
    e.status = :SETUP
  end

  response = client.service.experiment.mutate_experiments(
    customer_id: customer_id,
    operations: [operation],
  )

  experiment = response.results.first.resource_name
  puts "Created experiment with resource name #{experiment}."

  experiment
end
# [END create_experiment_1]

  # [START create_experiment_2]
def create_experiment_arms(client, customer_id, base_campaign_id, experiment)
  operations = []
  operations << client.operation.create_resource.experiment_arm do |ea|
    # The "control" arm references an already-existing campaign.
    ea.control = true
    ea.campaigns << client.path.campaign(customer_id, base_campaign_id)
    ea.experiment = experiment
    ea.name = 'control arm'
    ea.traffic_split = 40
  end
  operations << client.operation.create_resource.experiment_arm do |ea|
    # The non-"control" arm, also called a "treatment" arm, will automatically
    # generate draft campaigns that you can modify before starting the
    # experiment.
    ea.control = false
    ea.experiment = experiment
    ea.name = 'experiment arm'
    ea.traffic_split = 60
  end

  response = client.service.experiment_arm.mutate_experiment_arms(
    customer_id: customer_id,
    operations: operations,
    # We want to fetch the draft campaign IDs from the treatment arm, so the
    # easiest way to do that is to have the response return the newly created
    # entities.
    response_content_type: :MUTABLE_RESOURCE,
  )

  # Results always return in the order that you specify them in the request.
  # Since we created the treatment arm last, it will be the last result.
  control_arm_result = response.results.first
  treatment_arm_result = response.results.last

  puts "Created control arm with resource name #{control_arm_result.resource_name}."
  puts "Created treatment arm with resource name #{treatment_arm_result.resource_name}."

  treatment_arm_result.experiment_arm.in_design_campaigns.first
end
# [END create_experiment_2]

def modify_draft_campaign(client, customer_id, draft_campaign)
  operation = client.operation.update_resource.campaign(draft_campaign) do |c|
    # In this block you can change anything you like about the campaign. These
    # are the changes you're testing by doing this experiment. Here we just
    # change the name for illustrative purposes, but generally you may want to
    # change more meaningful parts of the campaign.
    #
    # You can also change underlying resources, such as ad groups and keywords,
    # just as you would for any other campaign. When searching with the
    # GoogleAdsService, be sure to include a PARAMETERS clause with
    # `include_drafts = true` when searching for these draft entities.
    c.name = "Modified Campaign Name #{(Time.new.to_f * 1000).to_i}"
  end

  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Updated the name for campaign #{draft_campaign}."
end

if __FILE__ == $0
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--base-campaign-id BASE-CAMPAIGN', String, 'Base Campaign ID') do |v|
      options[:base_campaign_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    create_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:base_campaign_id),
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
