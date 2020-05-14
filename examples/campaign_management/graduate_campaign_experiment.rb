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
# This example illustrates how to graduate a campaign experiment.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def graduate_campaign_experiment(customer_id, experiment_resource_name)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Graduating a campaign experiment requires a new budget. Since the budget
  # for the base campaign has explicitly_shared set to false, the budget cannot
  # be shared with the campaign after it is made independent by graduation.
  budget_operation = client.operation.create_resource.campaign_budget do |b|
    b.name = "Budget ##{(Time.new.to_f * 1000).to_i}"
    b.amount_micros = 50_000_000
    b.delivery_method = :STANDARD
  end

  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id,
    [budget_operation]
  )
  budget_resource_name = response.results.first.resource_name

  puts "Created new budget #{budget_resource_name} to add to experiment during graudation."

  # Graduate the campaign using the budget created above.
  response = client.service.campaign_experiment.graduate_campaign_experiment(
    experiment_resource_name,
    budget_resource_name
  )

  puts "Campaign #{response.graduated_campaign} is now graduated."
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
  options[:experiment_resource_name] = 'INSERT_CAMPAIGN_EXPERIMENT_RESOURCE_NAME_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-e', '--experiment-resource-name EXPERIMENT-RESOURCE-NAME', String,
            'Experiment Resource Name') do |v|
      options[:experiment_resource_name] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    graduate_campaign_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:experiment_resource_name),
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
    raise
  end
end
