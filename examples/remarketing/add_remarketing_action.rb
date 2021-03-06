#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# This example adds a new remarketing action to the customer and then retrieves
# its associated tag snippets.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

# [START add_remarketing_action]
def add_remarketing_action(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Step 1: Create a remarketing action.
  operation = client.operation.create_resource.remarketing_action do |action|
    action.name = "Remarketing action ##{(Time.new.to_f * 100).to_i}"
  end

  response = client.service.remarketing_action.mutate_remarketing_actions(
    customer_id: customer_id,
    operations: [operation],
  )

  remarketing_action_resource_name = response.results.first.resource_name

  # Step 2: Look up the remarketing action we created to get some extra
  # information about it, like its tag snippets.
  # [START add_remarketing_action_1]
  query = <<~EOQUERY
    SELECT
      remarketing_action.id,
      remarketing_action.name,
      remarketing_action.tag_snippets
    FROM
      remarketing_action
    WHERE
      remarketing_action.resource_name = "#{remarketing_action_resource_name}"
  EOQUERY
  # [END add_remarketing_action_1]

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  action = response.first.remarketing_action
  puts "Remarking action has ID #{action.id} and name '#{action.name}.'"
  puts "It has the following generated tag snippets:"
  action.tag_snippets.each do |ts|
    puts "Tag snippet with code type '#{ts.type}' and code page format " \
      "'#{ts.page_format}' has the following global site tag:\n#{ts.global_site_tag}"
    puts "and the following event snippet:\n#{ts.event_snippet}"
  end
end
# [END add_remarketing_action]

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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_remarketing_action(options.fetch(:customer_id).tr("-", ""))
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

