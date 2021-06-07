#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# This example adds a cross-account bidding strategy to a manager account and
# attaches it to a client customer's campaign. Also lists all manager-owned
# and customer accessible bidding strategies.

require "optparse"
require "google/ads/google_ads"

def use_cross_account_bidding_strategy(
  customer_id,
  manager_customer_id,
  campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters

  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  bidding_strategy_resource_name = create_bidding_strategy(
    client,
    manager_customer_id,
  )

  list_manager_owned_bidding_strategies(client, manager_customer_id)

  list_customer_accessible_bidding_strategies(client, customer_id)

  attach_cross_account_bidding_strategy_to_campaign(
    client,
    customer_id,
    campaign_id,
    bidding_strategy_resource_name,
  )
end

# Creates a new TargetSpend (Maximize Clicks) cross-account bidding strategy
# in the manager account.
def create_bidding_strategy(client, manager_customer_id)
  # Constructs an operation that will create a portfolio bidding strategy.
  operation = client.operation.create_resource.bidding_strategy do |b|
    b.name = "Maximize Clicks ##{(Time.new.to_f * 1000).to_i}"
    b.target_spend = Google::Ads::GoogleAds::V8::Common::TargetSpend.new
    # Sets the currency of the new bidding strategy. If not provided, the
    # bidding strategy uses the manager account's default currency.
    b.currency_code = "USD"
  end

  # Sends the operation in a mutate request.
  response = client.service.bidding_strategy.mutate_bidding_strategies(
    customer_id: manager_customer_id,
    operations: [operation],
  )

  resource_name = response.results.first.resource_name
  puts "Created cross-account bidding strategy: `#{resource_name}`"

  resource_name
end

# Lists all cross-account bidding strategies in manager account.
def list_manager_owned_bidding_strategies(client, manager_customer_id)
  query = <<~QUERY
    SELECT bidding_strategy.id,
           bidding_strategy.name,
           bidding_strategy.type,
           bidding_strategy.currency_code
    FROM bidding_strategy
  QUERY

  responses = client.service.google_ads.search_stream(
    customer_id: manager_customer_id,
    query: query,
  )

  puts "Cross-account bid strategies in manager account #{manager_customer_id}:"
  responses.each do |response|
    response.results.each do |row|
      b = row.bidding_strategy
      puts "ID: #{b.id}"
      puts "Name: #{b.name}"
      puts "Strategy type: #{b.type}"
      puts "Currency: #{b.currency_code}"
      puts
    end
  end
end

# Lists all bidding strategies available to account. This includes both
# portfolio bidding strategies owned by account and cross-account bidding
# strategies shared by any of its managers.
def list_customer_accessible_bidding_strategies(client, customer_id)
  query = <<~QUERY
    SELECT accessible_bidding_strategy.id,
           accessible_bidding_strategy.name,
           accessible_bidding_strategy.type,
           accessible_bidding_strategy.owner_customer_id,
           accessible_bidding_strategy.owner_descriptive_name
    FROM accessible_bidding_strategy
  QUERY
  # Add the following WHERE clause to filter results to *only*
  # cross-account bidding strategies shared with the current customer by a
  # manager (and not also include the current customer's portfolio bidding
  # strategies).
  # query += <<~QUERY
  #  WHERE accessible_bidding_strategy.owner_customer_id != #{customer_id}
  # QUERY

  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  puts "All bid strategies accessible by account #{customer_id}:"
  responses.each do |response|
    response.results.each do |row|
      b = row.accessible_bidding_strategy
      puts "ID: #{b.id}"
      puts "Name: #{b.name}"
      puts "Strategy type: #{b.type}"
      puts "Owner customer ID: #{b.owner_customer_id}"
      puts "Owner description: #{b.owner_descriptive_name}"
      puts
    end
  end
end

# Attaches the cross-account bidding strategy to campaign in client account.
def attach_cross_account_bidding_strategy_to_campaign(
  client,
  customer_id,
  campaign_id,
  bidding_strategy_resource_name)
  operation = client.operation.update_resource.campaign(
    client.path.campaign(customer_id, campaign_id)) do |c|
    c.bidding_strategy = bidding_strategy_resource_name
  end

  # Sends the operation in a mutate request.
  response = client.service.campaign.mutate_campaigns(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Updated campaign with resource name: " \
    "`#{response.results.first.resource_name}`"
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
  options[:manager_customer_id] = 'INSERT_MANAGER_CUSTOMER_ID_HERE'
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-M', '--manager-customer-id MANAGER-CUSTOMER-ID', String, 'Manager Customer ID') do |v|
      options[:manager_customer_id] = v
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
    use_cross_account_bidding_strategy(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:manager_customer_id),
      options.fetch(:campaign_id),
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
