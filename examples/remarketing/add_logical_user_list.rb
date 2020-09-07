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
# Creates a combination user list containing users that are present on any one
# of the provided user lists.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_logical_user_list(customer_id, user_list_ids)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Creates the UserListLogicalRuleInfo specifying that a user should be added
  # to the new list if they are present in any of the provided lists.
  user_list_logical_rule_info = client.resource.user_list_logical_rule_info do |info|
    # Using ANY means that a user should be added to the combined list if they
    # are present on any of the lists targeted in the logical_user_list_operand_info.
    # Use ALL to add users present on all of the provided lists or NONE to add
    # users that aren't present on any of the targeted lists.
    info.operator = :ANY
    user_list_ids.each do |list_id|
      info.rule_operands << client.resource.logical_user_list_operand_info do |op|
        op.user_list = client.path.user_list(customer_id, list_id)
      end
    end
  end

  # Creates the new combination user list operation.
  operation = client.operation.create_resource.user_list do |ul|
    ul.name = "My combination list of other user lists #{(Time.new.to_f * 1000).to_i}"
    ul.logical_user_list = client.resource.logical_user_list_info do |info|
      info.rules << user_list_logical_rule_info
    end
  end

  # Issues a mutate request to add the user list and prints some information.
  response = client.service.user_list.mutate_user_lists(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Created combination user list with resource name "\
    "'#{response.results.first.resource_name}'"
end

if __FILE__ == $0
  options = {}

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-U', '--user-list-ids USER-LIST-IDS', String,
        'User List IDs (comma separated)') do |v|
      options[:user_list_ids] = v.split(',')
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_logical_user_list(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:user_list_ids),
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
