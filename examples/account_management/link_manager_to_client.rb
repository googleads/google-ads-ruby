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
# This example demonstrates how to link an existing Google Ads manager customer
# to an existing Google Ads client customer.

require 'google/ads/google_ads'
require_relative 'argument_parser'
require_relative 'error_handler'

# [START link_manager_to_client]
def link_manager_to_client(manager_customer_id, client_customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # This example assumes that the same credentials will work for both customers,
  # but that may not be the case. If you need to use different credentials
  # for each customer, then you may either update the client configuration or
  # instantiate two clients, one for each set of credentials. Always make sure
  # to update the configuration before fetching any services you need to use.

  # Extend an invitation to the client while authenticating as the manager.
  client.configure do |config|
    config.login_customer_id = manager_customer_id.to_i
  end

  client_link = client.resource.customer_client_link do |link|
    link.client_customer = client.path.customer(client_customer_id)
    link.status = :PENDING
  end

  client_link_operation = client.operation.create_resource.customer_client_link(client_link)

  response = client.service.customer_client_link.mutate_customer_client_link(
    customer_id: manager_customer_id,
    operation: client_link_operation,
  )

  client_link_resource_name = response.result.resource_name
  puts "Extended an invitation from customer #{manager_customer_id} to " \
      "customer #{client_customer_id} with client link resource name " \
      "#{client_link_resource_name}."

  # Find the manager_link_id of the link we just created, so we can construct
  # the resource name for the link from the client side.
  query = <<~QUERY
    SELECT
      customer_client_link.manager_link_id
    FROM
      customer_client_link
    WHERE
      customer_client_link.resource_name = '#{client_link_resource_name}'
  QUERY

  response = client.service.google_ads.search(customer_id: manager_customer_id, query: query)
  manager_link_id = response.first.customer_client_link.manager_link_id

  # Accept the link using the client account.
  client.configure do |config|
    config.login_customer_id = client_customer_id.to_i
  end

  manager_link_resource_name = client.path.customer_manager_link(
    client_customer_id,
    manager_customer_id,
    manager_link_id,
  )

  manager_link_operation =
      client.operation.update_resource.customer_manager_link(manager_link_resource_name) do |link|
    link.status = :ACTIVE
  end

  response = client.service.customer_manager_link.mutate_customer_manager_link(
    customer_id: client_customer_id,
    operations: [manager_link_operation],
  )

  puts "Client accepted invitation with resource name " \
      "#{response.results.first.resource_name}."
end
# [END link_manager_to_client]

if __FILE__ == $0
  options = ArgumentParser.parse_arguments(ARGV)

  unless options[:customer_id] && options[:manager_customer_id]
    puts "Usage: #{$0} -c CLIENT_CUSTOMER_ID -m MANAGER_CUSTOMER_ID"
    puts "  -c, --customer-id CLIENT_CUSTOMER_ID     The Google Ads client customer ID."
    puts "  -m, --manager-customer-id MANAGER_CUSTOMER_ID   The Google Ads manager customer ID."
    exit 1
  end

  begin
    link_manager_to_client(
      options[:manager_customer_id], # This is the manager ID
      options[:customer_id]          # This is the client ID
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
