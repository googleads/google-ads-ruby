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
# This example adds a campaign draft for a campaign. Make sure you specify a
# campaign that has a budget with explicitly_shared set to false.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_campaign_draft(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  draft_operation = client.operation.create_resource.campaign_draft do |draft|
    draft.base_campaign = client.wrapper.string(
      client.path.campaign(customer_id, campaign_id)
    )
    draft.name = client.wrapper.string(
      "Campaign Draft ##{(Time.new.to_f * 1000).to_i}"
    )
  end

  draft_response = client.service.campaign_draft.mutate_campaign_drafts(
    customer_id,
    [draft_operation],
  )

  draft_resource_name = draft_response.results.first.resource_name
  puts "Campaign Draft #{draft_resource_name} was created."

  # Once the draft is created, you can modify the draft campaign as if it were
  # a real campaign. For example, you may add criteria, adjust bids, or even
  # include additional ads. Adding a criterion is shown here.
  query = <<~EOQUERY
    SELECT campaign_draft.draft_campaign
    FROM campaign_draft
    WHERE campaign_draft.resource_name = "#{draft_resource_name}"
  EOQUERY
  search_response = client.service.google_ads.search(customer_id, query)
  draft_campaign_resource_name = search_response.first.campaign_draft.draft_campaign

  criterion_operation = client.operation.create_resource.campaign_criterion do |cc|
    cc.campaign = draft_campaign_resource_name
    cc.language = client.resource.language_info do |li|
      li.language_constant = client.wrapper.string(
        client.path.language_constant(1003) # Spanish
      )
    end
  end

  criterion_response = client.service.campaign_criterion.mutate_campaign_criteria(
    customer_id,
    [criterion_operation]
  )

  puts "Campaign Criterion #{criterion_response.results.first.resource_name}" \
      " created in campaign #{draft_campaign_resource_name}."
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
  options[:customer_id] = '2055652758'
  options[:campaign_id] = '1953534236'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
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
    add_campaign_draft(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
