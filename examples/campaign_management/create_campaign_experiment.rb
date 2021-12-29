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
# This example illustrates how to begin creation of a campaign experiment from
# a draft and wait for it to complete.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def create_campaign_experiment(customer_id, campaign_id, draft_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  campaign_draft_resource_name = client.path.campaign_draft(
      customer_id, campaign_id, draft_id)

  experiment = client.resource.campaign_experiment do |ce|
    ce.campaign_draft = campaign_draft_resource_name
    ce.name = "Campaign Experiment ##{(Time.new.to_f * 1000).to_i}"
    ce.traffic_split_percent = 50
    ce.traffic_split_type = :RANDOM_QUERY
  end

  # A Gapic::Operation is returned from this asynchronous request by the API,
  # and is converted into a Google::Gax::Operation automatically.
  operation = client.service.campaign_experiment.create_campaign_experiment(
    customer_id: customer_id,
    campaign_experiment: experiment,
  )

  puts "Asynchronous request to create campaign experiment with " +
    "resource name #{operation.metadata.campaign_experiment} started."

  puts "Waiting until operation completes."

  # The wait_until_done! method implements a default backoff policy for
  # retrying.
  # You can also use operation.refresh! to make a call to the API to check
  # whether the LRO is finished, and operation.done? after refreshing to check
  # the status, if you'd rather implement your own backoff logic.
  operation.wait_until_done! do |op|
    raise op.results.message if operation.error?
  end

  query = <<~EOQUERY
    SELECT campaign_experiment.experiment_campaign
    FROM campaign_experiment
    WHERE campaign_experiment.resource_name = "#{operation.metadata.campaign_experiment}"
  EOQUERY

  response = client.service.google_ads.search(customer_id: customer_id, query: query)
  puts "Experiment campaign #{response.first.campaign_experiment.experiment_campaign}" \
      " finished creating."
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
  # You can get these values by extracting them from the resource name
  # for a draft:
  # customers/{customer_id}/campaignDrafts/{base_campaign_id}~{draft_id}
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:draft_id] = 'INSERT_DRAFT_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--base-campaign-id CAMPAIGN-ID', String, 'Base Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-d', '--draft-id DRAFT-ID', String, 'Draft ID') do |v|
      options[:draft_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    create_campaign_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
      options.fetch(:draft_id),
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
