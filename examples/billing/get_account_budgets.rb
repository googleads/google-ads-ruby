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
#
# This example retrieves all account budgets for a Google Ads customer.

require 'optparse'
require 'google/ads/google_ads'

def get_account_budgets(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service.google_ads

  search_query = <<~QUERY
    SELECT
      account_budget.status,
      account_budget.billing_setup,
      account_budget.approved_spending_limit_micros,
      account_budget.approved_spending_limit_type,
      account_budget.proposed_spending_limit_micros,
      account_budget.proposed_spending_limit_type,
      account_budget.approved_start_date_time,
      account_budget.proposed_start_date_time,
      account_budget.approved_end_date_time,
      account_budget.approved_end_time_type,
      account_budget.proposed_end_date_time,
      account_budget.proposed_end_time_type
    FROM account_budget
  QUERY

  response = ga_service.search(
    customer_id,
    search_query,
    page_size: PAGE_SIZE
  )

  # Iterates over all rows in all pages and prints the requested field values
  # for the account budget in each row.
  response.each do |row|
    account_budget = row.account_budget

    total_adjustments_micros = 0
    unless account_budget.total_adjustments_micros.nil?
      total_adjustments_micros =
          account_budget.total_adjustments_micros.value / 1_000_000.0
    end

    amount_served_micros = 0
    unless account_budget.amount_served_micros.nil?
      amount_served_micros =
          account_budget.amount_served_micros.value / 1_000_000.0
    end

    approved_spending_limit_micros = account_budget.approved_spending_limit_type
    unless account_budget.approved_spending_limit_micros.nil?
      approved_spending_limit_micros =
          account_budget.approved_spending_limit_micros.value / 1_000_000.0
    end

    proposed_spending_limit_micros = account_budget.proposed_spending_limit_type
    unless account_budget.proposed_spending_limit_micros.nil?
      proposed_spending_limit_micros =
          account_budget.proposed_spending_limit_micros.value / 1_000_000.0
    end

    approved_end_date_time = account_budget.approved_end_time_type
    unless account_budget.approved_end_date_time.nil?
      approved_end_date_time = account_budget.approved_end_date_time
    end

    proposed_end_date_time = account_budget.proposed_end_time_type
    unless account_budget.proposed_end_date_time.nil?
      proposed_end_date_time = account_budget.proposed_end_date_time
    end

    puts sprintf('Account budget "%s" with status "%s", billing_setup "%s", '\
        'amount served %.2f, total adjustments %.2f, '\
        'approved spending limit "%s" (proposed "%s"), '\
        'approved start time "%s" (proposed "%s"), '\
        'approved end time "%s" (proposed "%s")',
        account_budget.resource_name,
        account_budget.status,
        account_budget.billing_setup,
        amount_served_micros,
        total_adjustments_micros,
        approved_spending_limit_micros,
        proposed_spending_limit_micros,
        account_budget.approved_start_date_time,
        account_budget.proposed_start_date_time,
        approved_end_date_time,
        proposed_end_date_time
    )
  end
end

if __FILE__ == $0
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
    get_account_budgets(options.fetch(:customer_id).tr("-", ""))
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
