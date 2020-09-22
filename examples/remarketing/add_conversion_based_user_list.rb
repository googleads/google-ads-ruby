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
# Creates a basic user list consisting of people who triggered one or more
# conversion actions.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_conversion_based_user_list(customer_id, conversion_action_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates the basic user list.
  operation = client.operation.create_resource.user_list do |u|
    u.name = "Example BasicUserList ##{(Time.new.to_f * 100).to_i}"
    u.description = "A list of people who have triggered one or more conversion actions"
    u.membership_status = :OPEN
    u.membership_life_span = 365
    # Creates a basic user list info object with all of the conversion actions.
    u.basic_user_list = client.resource.basic_user_list_info do |info|
      conversion_action_ids.each do |conversion_action_id|
        # Creates the UserListActionInfo object for a given conversion action.
        # This specifies the conversion action that, when triggered, will cause a
        # user to be added to a user_list.
        info.actions << client.resource.user_list_action_info do |action|
          action.conversion_action =
            client.path.conversion_action(customer_id, conversion_action_id)
        end
      end
    end
  end

  # Issues a mutate request to add the user list and prints some information.
  response = client.service.user_list.mutate_user_lists(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created basic user list with resource name " \
    "#{response.results.first.resource_name}"
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
  options[:conversion_action_ids] = [
    'INSERT_CONVERSION_ACTION_ID_1_HERE',
    'INSERT_CONVERSION_ACTION_ID_2_HERE',
  ]

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--conversion-action-ids CONVERSION-ACTION-IDS', String,
      'Conversion Action IDs (comma-separated)') do |v|
      options[:conversion_action_ids] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_conversion_based_user_list(
      options.fetch(:customer_id).tr("-", ""),
      options[:conversion_action_ids].split(','),
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
