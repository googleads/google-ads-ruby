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

require 'optparse'
require 'google/ads/google_ads'

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
  options[:manager_customer_id] = 'INSERT_MANAGER_CUSTOMER_ID_HERE'
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-M', '--manager-customer-id MANAGER-CUSTOMER-ID', String,
        'Manager Customer ID') do |v|
      options[:manager_customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    link_manager_to_client(
      options.fetch(:manager_customer_id).tr("-", ""),
      options.fetch(:customer_id).tr("-", ""),
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
