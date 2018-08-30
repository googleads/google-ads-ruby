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
# This example demonstrates how to find shared sets, shared set criteria, and
# how to remove them.

require 'optparse'
require 'google/ads/googleads'

def find_and_remove_criteria_from_shared_set(customer_id, campaign_id)
  # GoogleadsClient will read a config file from ENV['HOME']/googleads_config.rb
  # when called without parameters

  client = Google::Ads::Googleads::GoogleadsClient.new

  ga_service = client.service(:GoogleAds)
  shared_criterion_service = client.service(:SharedCriterion)

  shared_set_ids = []
  criterion_ids = []

  # First, retrieve all shared sets associated with the campaign.
  query = <<~QUERY
    SELECT shared_set.id, shared_set.name
    FROM campaign_shared_set
    WHERE campaign.id = #{campaign_id}
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)

  response.each do |row|
    shared_set = row.shared_set
    puts sprintf("Campaign shared set ID %d and name '%s' was found.",
        shared_set.id, shared_set.name)

    shared_set_ids << shared_set.id
  end

  # Next, retrieve shared criteria for all found shared sets.
  query = <<~QUERY
    SELECT shared_criterion.type, shared_criterion.keyword.text,
        shared_criterion.keyword.match_type, shared_set.id
    FROM shared_criterion
    WHERE shared_set.id IN (#{shared_set_ids.join(',')})
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)

  response.each do |row|
    shared_criterion = row.shared_criterion
    if shared_criterion.type == :KEYWORD
      puts sprintf(
          "Shared criterion with resource name '%s' for negative keyword " +
          "with text '%s' and match type '%s' was found.",
          shared_criterion.resource_name,
          shared_criterion.keyword.text,
          shared_criterion.keyword.match_type)
    else
      puts sprintf("Shared criterion with resource name '%s' was found.",
          shared_criterion.resource_name)
    end

    criterion_ids << shared_criterion.resource_name
  end

  # Finally, remove the criteria.
  operations = criterion_ids.map do |criterion|
    operation = client.operation(:SharedCriterion)
    operation.remove = criterion

    operation
  end

  response = shared_criterion_service.mutate_shared_criteria(customer_id,
      operations)
  response.results.each do |result|
    puts sprintf("Removed shared criterion %s", result.resource_name)
  end
end

if __FILE__ == $PROGRAM_NAME
  PAGE_SIZE = 1000

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
    find_and_remove_criteria_from_shared_set(options[:customer_id],
        options[:campaign_id])
  rescue Google::Ads::Googleads::Errors::GoogleAdsError => e
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
