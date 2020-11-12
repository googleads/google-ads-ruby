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

require 'optparse'
require 'google/ads/google_ads'
require 'thread'

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
    puts 'No manager customer ID is specified. The example will print the ' +
        'hierarchies of all accessible customer IDs:'
    customer_resource_names = client.service.customer.
        list_accessible_customers().resource_names
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
        page_size: PAGE_SIZE,
      )

      # Iterates over all rows in all pages to get all customer clients under
      # the specified customer's hierarchy.
      response.each do |row|
        customer_client = row.customer_client

        # The customer client that with level 0 is the specified customer
        if customer_client.level == 0
          if root_customer_client == nil
            root_customer_client = customer_client
          end
          next
        end

        # For all level-1 (direct child) accounts that are a manager account,
        # the above query will be run against them to create a dictionary of
        # managers mapped to their child accounts for printing the hierarchy
        # afterwards.
        cid_to_children[cid.to_s] << customer_client

        unless customer_client.manager.nil?
          if !cid_to_children.key?(customer_client.id.to_s) &&
              customer_client.level == 1
            unprocessed_customer_ids << customer_client.id.to_s
          end
        end
      end
    end

    if root_customer_client
      puts "The hierarychy of customer ID #{root_customer_client.id} " +
          "is printed below:"
      print_account_hierarchy(root_customer_client, cid_to_children, 0)
    else
      puts "Customer ID #{manager_customer_id} is likely a test account, " \
        "so its customer client information cannot be retrieved."
    end
  end
end

def print_account_hierarchy(customer_client, cid_to_children, depth)
  if depth == 0
    puts 'Customer ID (Descriptive Name, Currency Code, Time Zone)'
  end

  customer_id = customer_client.id
  puts '-' * (depth * 2) +
      "#{customer_id} #{customer_client.descriptive_name} " +
      "#{customer_client.currency_code} #{customer_client.time_zone}"

  # Recursively call this function for all child accounts of customer_client
  if cid_to_children.key?(customer_id.to_s)
    cid_to_children[customer_id.to_s].each do |child|
      print_account_hierarchy(child, cid_to_children, depth + 1)
    end
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
  options[:customer_id] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-M', '--manager-customer-id MANAGER-CUSTOMER-ID', String, 'Manager Customer ID (optional)') do |v|
      options[:manager_customer_id] = v.tr("-", "")
    end

    opts.on('-L', '--login-customer-id LOGIN-CUSTOMER-ID', String, 'Login Customer ID (optional)') do |v|
      options[:login_customer_id] = v.tr("-", "")
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_account_hierarchy(
      options[:manager_customer_id],
      options[:login_customer_id],
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
