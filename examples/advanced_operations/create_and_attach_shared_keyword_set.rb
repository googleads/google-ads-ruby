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
# This example creates a shared list of negative broad match keywords. It then
# attaches them to a campaign.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def create_and_attach_shared_keyword_set(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters

  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  shared_set_service = client.service(:SharedSet)
  shared_criterion_service = client.service(:SharedCriterion)
  campaign_shared_set_service = client.service(:CampaignSharedSet)

  # Keywords to create a shared set of.
  keywords = ['mars cruise', 'mars hotels']

  # Create shared negative keyword set.
  shared_set = client.resource(:SharedSet)
  shared_set.name = client.wrapper.string(
      sprintf('API Negative keyword list - %s', (Time.new.to_f * 1000).to_i))
  shared_set.type = client.enum(:SharedSetType)::NEGATIVE_KEYWORDS

  operation = client.operation(:SharedSet)
  operation.create = shared_set

  response = shared_set_service.mutate_shared_sets(customer_id, [operation])

  shared_set_resource_name = response.results.first.resource_name
  puts sprintf('Created shared set %s', shared_set_resource_name)

  shared_criteria = keywords.map do |keyword|
    shared_criterion = client.resource(:SharedCriterion)
    keyword_info = client.resource(:KeywordInfo)
    keyword_info.text = client.wrapper.string(keyword)
    keyword_info.match_type = client.enum(:KeywordMatchType)::BROAD
    shared_criterion.keyword = keyword_info
    shared_criterion.shared_set =
        client.wrapper.string(shared_set_resource_name)

    shared_criterion
  end

  operations = shared_criteria.map do |criterion|
    operation = client.operation(:SharedCriterion)
    operation.create = criterion

    operation
  end

  response = shared_criterion_service.mutate_shared_criteria(customer_id,
      operations)

  response.results.each do |result|
    puts sprintf('Created shared criterion %s', result.resource_name)
  end

  campaign_set = client.resource(:CampaignSharedSet)
  campaign_set.campaign = client.wrapper.string(
      client.path.campaign(customer_id, campaign_id))
  campaign_set.shared_set = client.wrapper.string(shared_set_resource_name)

  operation = client.operation(:CampaignSharedSet)
  operation.create = campaign_set

  response = campaign_shared_set_service.mutate_campaign_shared_sets(
      customer_id, [operation])

  puts sprintf('Created campaign shared set %s',
      response.results.first.resource_name)
end

if __FILE__ == $PROGRAM_NAME
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
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

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
    create_and_attach_shared_keyword_set(options[:customer_id],
        options[:campaign_id])
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
