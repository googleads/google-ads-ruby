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
# Example demonstrating how to add a keyword to an ad group.

require 'optparse'
require 'google/ads/googleads'

def add_keyword(customer_id, ad_group_id, keyword)
  # This will read a config file from ENV['HOME']/googleads_config.rb
  # when called without parameters.
  client = Google::Ads::Googleads::GoogleadsClient.new

  agc_service = client.service(:AdGroupCriterion)
  ag_service = client.service(:AdGroup)

  # Create a keyword
  criterion = client.resource(:AdGroupCriterion)
  criterion.ad_group = client.wrapper.string(
      client.path.ad_group(customer_id, ad_group_id))
  criterion.status = client.enum(:AdGroupCriterionStatus)::ENABLED
  criterion.keyword = client.resource(:KeywordInfo)
  criterion.keyword.text = client.wrapper.string(keyword)
  criterion.keyword.match_type = client.enum(:KeywordMatchType)::EXACT

  # Optional field
  # All fields can be referenced from the protos directly.
  # The protos are located in lib/google/ads/googleads/v0 folders
  # criterion.negative = Google::Protobuf::BoolValue.new(value: true)

  # Optional repeated field
  # criterion.final_urls << Google::Protobuf::StringValue.new(
  #     value: 'https://www.example.com')

  # Add keyword
  operation = {create: criterion}
  response = agc_service.mutate_ad_group_criteria(customer_id, [operation])

  puts sprintf("Created keyword %s", response.results.first.resource_name)
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
  options[:keyword] = 'mars cruise'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-k', '--keyword KEYWORD', String, '(Optional) Keyword') do |v|
      options[:keyword] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_keyword(options[:customer_id], options[:ad_group_id], options[:keyword])
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
