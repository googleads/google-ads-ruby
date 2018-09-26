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
# This example creates an account budget proposal using the 'CREATE' operation.
# To get account budget proposals, run get_account_budget_proposals.rb.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_account_budget_proposal(customer_id, billing_setup_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  account_budget_proposal_service = client.service(:AccountBudgetProposal)

  proposal = client.resource(:AccountBudgetProposal)
  proposal.billing_setup = client.wrapper.string(
      client.path.billing_setup(customer_id, billing_setup_id))
  proposal.proposal_type = client.enum(:AccountBudgetProposalType)::CREATE
  proposal.proposed_name = client.wrapper.string('Account Budget (example)')

  # Specify the account budget starts immediately
  proposal.proposed_start_time_type = client.enum(:TimeType)::NOW
  # Alternatively you can specify a specific start time. Refer to the
  # AccountBudgetProposal resource documentation for allowed formats.
  #
  # proposal.proposed_start_date_time = client.wrapper
  #     .string('2020-01-02 03:04:05')

  # Specify that the budget runs forever.
  proposal.proposed_end_time_type = client.enum(:TimeType)::FOREVER
  # Alternatively you can specify a specific end time. Allowed formats are as
  # above.
  #
  # proposal.proposed_end_date_time = client.wrapper
  #     .string('2021-01-02 03:04:05')

  # Optional: set notes for the budget. These are free text and do not effect
  # budget delivery.
  #
  # proposal.proposed_notes = client.wrapper
  #     .string('Received prepayment of $0.01')

  # Set the spending limit to 0.01, measured in the Google Ads account currency.
  proposal.proposed_spending_limit_micros = client.wrapper.int64(10_000)

  # Create an operation which will add the new AccountBudgetProposal
  account_budget_proposal_operation = client.operation(:AccountBudgetProposal)
  account_budget_proposal_operation['create'] = proposal

  # Add budget proposal.
  response = account_budget_proposal_service.mutate_account_budget_proposal(
      customer_id, account_budget_proposal_operation)

  puts sprintf("Created budget proposal %s.",
      response.results.first.resource_name)
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
  options[:billing_setup_id] = 'INSERT_BILLING_SETUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: add_campaigns.rb [options]')

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-B', '--billing-setup-id BILLING-SETUP-ID', String,
        'Billing Setup ID') do |v|
      options[:billing_setup_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_account_budget_proposal(options[:customer_id],
        options[:billing_setup_id])
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
  end
end
