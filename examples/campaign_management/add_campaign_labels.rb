#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
# This code example adds a campaign label to a list of campaigns

require 'optparse'
require 'google/ads/google_ads'

def add_campaign_label(customer_id, label_id, campaign_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  label_resource_name = client.path.label(customer_id, label_id)

  labels = campaign_ids.map { |campaign_id|
    label = client.resource(:CampaignLabel)
    campaign_resource_name = client.path.campaign(customer_id, campaign_id)
    label.campaign = client.wrapper.string(campaign_resource_name)
    label.label = client.wrapper.string(label_resource_name)
    label
  }

  ops = labels.map { |label|
    op = client.operation(:CampaignLabel)
    op["create"] = label
    op
  }

  campaign_label_service = client.service(:CampaignLabel)
  response = campaign_label_service.mutate_campaign_labels(customer_id, ops)
  response.results.each do |result|
    puts("Created campaign label with id: #{result.resource_name}")
  end
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
  options[:label_id] = 'INSERT_LABEL_ID_HERE'
  options[:campaign_ids] = 'INSERT_CAMPAIGN_IDS_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: #{File.basename(__FILE__)}.rb [options]")

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-ids CAMPAIGN-IDS', String, 'Comma separated list of campaign ids') do |v|
      options[:campaign_ids] = v.split(",").map(&:strip)
    end

    opts.on('-L', '--label-id LABEL-ID', String, 'Label ID') do |v|
      options[:label_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_campaign_label(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:label_id),
      options.fetch(:campaign_ids),
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
