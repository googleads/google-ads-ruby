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
# This example gets the account hierarchy of the specified manager account.
# If you don't specify manager customer ID, the example will instead print the
# hierarchies of all accessible customer accounts for your authenticated
# Google account.
# Note that if the list of accessible customers for your authenticated Google
# account includes accounts within the same hierarchy, this example will
# retrieve and print the overlapping portions of the hierarchy for each
# accessible customer.

require 'google/ads/google_ads'
require 'thread'
require_relative 'argument_parser'
require_relative 'error_handler'

def get_account_hierarchy(manager_customer_id, login_customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Set the specified login customer ID.
  client.configure do |config|
    if login_customer_id
      config.login_customer_id = login_customer_id.to_i
    elsif manager_customer_id
      config.login_customer_id = manager_customer_id.to_i
    end
  end

  google_ads_service = client.service.google_ads

  seed_customer_ids = []

  if manager_customer_id
    seed_customer_ids << manager_customer_id
  else
    puts 'No manager customer ID is specified. The example will print the hierarchies of all accessible customer IDs:'
    customer_resource_names = client.service.customer.list_accessible_customers.resource_names
    customer_resource_names.each do |res|
      seed_customer_ids << res.split('/')[1]
    end
  end

  search_query = <<~QUERY
    SELECT
        customer_client.client_customer,
        customer_client.level,
        customer_client.manager,
        customer_client.descriptive_name,
        customer_client.currency_code,
        customer_client.time_zone,
        customer_client.id
    FROM customer_client
    WHERE customer_client.level <= 1
  QUERY

  seed_customer_ids.each do |seed_cid|
    # Performs a breadth-first search to build a dictionary that maps managers
    # to their child accounts (cid_to_children).
    unprocessed_customer_ids = Queue.new
    unprocessed_customer_ids << seed_cid
    cid_to_children = Hash.new { |h, k| h[k] = [] }
    root_customer_client = nil

    while unprocessed_customer_ids.size > 0
      cid = unprocessed_customer_ids.pop
      response = google_ads_service.search(
        customer_id: cid,
        query: search_query,
      )

      # Iterates over all rows in all pages to get all customer clients under
      # the specified customer's hierarchy.
      response.each do |row|
        customer_client = row.customer_client

        # The customer client that with level 0 is the specified customer
        if customer_client.level == 0
          if root_customer_client.nil?
            root_customer_client = customer_client
          end
          next
        end

        # For all level-1 (direct child) accounts that are a manager account,
        # the above query will be run against them to create a dictionary of
        # managers mapped to their child accounts for printing the hierarchy
        # afterwards.
        cid_to_children[cid] << customer_client

        unless customer_client.manager.nil?
          if !cid_to_children.key?(customer_client.id.to_s) &&
              customer_client.level == 1
            unprocessed_customer_ids << customer_client.id.to_s
          end
        end
      end
    end

    if root_customer_client
      puts "The hierarychy of customer ID #{root_customer_client.id} is printed below:"
      print_account_hierarchy(root_customer_client, cid_to_children, 0)
    else
      # Note: manager_customer_id is already a string here from arguments.
      puts "Customer ID #{manager_customer_id} is likely a test account, so " \
        "its customer client information cannot be retrieved."
    end
  end
end

def print_account_hierarchy(customer_client, cid_to_children, depth)
  if depth == 0
    puts 'Customer ID (Descriptive Name, Currency Code, Time Zone)'
  end

  customer_id = customer_client.id
  # customer_id is an integer, descriptive_name, currency_code, and time_zone are strings.
  # Interpolation handles .to_s for customer_id.
  puts "#{''.ljust(depth * 2, '-')}#{customer_id} #{customer_client.descriptive_name} " \
      "#{customer_client.currency_code} #{customer_client.time_zone}"

  # Recursively call this function for all child accounts of customer_client
  if cid_to_children.key?(customer_id.to_s)
    cid_to_children[customer_id.to_s].each do |child|
      print_account_hierarchy(child, cid_to_children, depth + 1)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  options = ArgumentParser.parse_arguments(ARGV)

  # This script requires a login_customer_id (parsed as customer_id) if no
  # manager_customer_id is provided for the purpose of listing all accessible accounts.
  # If a manager_customer_id is provided, it can be used as the login_customer_id.
  # The GoogleAdsClient library will use manager_customer_id as login_customer_id
  # if login_customer_id is not set in the config.
  # However, the script's logic for client.configure specifically uses
  # options[:customer_id] (login_customer_id) first if available.

  if options[:customer_id].nil? && options[:manager_customer_id].nil?
    puts "Usage: #{$0} -c LOGIN_CUSTOMER_ID [-m MANAGER_CUSTOMER_ID]"
    puts "  OR #{$0} -m MANAGER_CUSTOMER_ID (MANAGER_CUSTOMER_ID will be used as login)"
    puts "Please provide at least a login customer ID (-c) or a manager customer ID (-m)."
    exit 1
  end

  begin
    get_account_hierarchy(
      options[:manager_customer_id], # This can be nil, script handles it
      options[:customer_id]          # This can be nil if manager_customer_id is present
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ErrorHandler.handle_google_ads_error(e)
    raise
  rescue StandardError => e
    STDERR.puts "An unexpected error occurred: #{e.message}"
    STDERR.puts e.backtrace
    raise
  end
end
