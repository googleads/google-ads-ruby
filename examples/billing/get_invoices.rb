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
#
# This code example retrieves the invoices issued last month for a given
# billing setup.

require 'optparse'
require 'google/ads/google_ads'

def get_invoices(customer_id, billing_setup_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Gets the date one month before now.
  last_month = Date.today.prev_month

  # Issues a request to list invoices.
  response = client.service.invoice.list_invoices(
    customer_id: customer_id,
    billing_setup: client.path.billing_setup(customer_id, billing_setup_id),
    # The year needs to be 2019 or later.
    issue_year: last_month.year.to_s,
    # '%^B' option returns the uppercased full month name (e.g. 'JANUARY').
    issue_month: last_month.strftime("%^B").to_sym,
  )



  # Iterates over all invoices retrieved and prints their information.
  response.invoices.each do |invoice|
    puts <<~OUTPUT
    - Found the invoice '#{invoice.resource_name}'
      ID (also known as Invoice Number): '#{invoice.id}'
      Type: #{invoice.type}
      Billing Setup ID: '#{invoice.billing_setup}'
      Payments account ID (also known as Billing Account Number): '#{invoice.payments_account_id}'
      Payments profile ID (also known as Billing ID): '#{invoice.payments_profile_id}'
      Issue date (also known as Invoice Date): #{invoice.issue_date}
      Due date: #{invoice.due_date}
      Currency code: #{invoice.currency_code}
      Service date range (inclusive):
        from #{invoice.service_date_range.start_date}
        to #{invoice.service_date_range.end_date}
      Adjustments:
        subtotal '#{micro_to_base(invoice.adjustments_subtotal_amount_micros)}'
        tax '#{micro_to_base(invoice.adjustments_tax_amount_micros)}'
        total '#{micro_to_base(invoice.adjustments_total_amount_micros)}'
      Regulatory costs:
        subtotal '#{micro_to_base(invoice.regulatory_costs_subtotal_amount_micros)}'
        tax '#{micro_to_base(invoice.regulatory_costs_tax_amount_micros)}'
        total '#{micro_to_base(invoice.regulatory_costs_total_amount_micros)}'
      Replaced invoices: '#{invoice.replaced_invoices ? invoice.replaced_invoices.join(", ") : 'none'}'
      Amounts:
        subtotal '#{micro_to_base(invoice.subtotal_amount_micros)}'
        tax '#{micro_to_base(invoice.tax_amount_micros)}'
        total '#{micro_to_base(invoice.total_amount_micros)}'
      Corrected invoice: '#{invoice.corrected_invoices ? invoice.corrected_invoices : 'none'}'
      PDF URL: '#{invoice.pdf_url}'
      Account budgets:
    OUTPUT
    invoice.account_budget_summaries.each do |account_budget_summary|
      puts <<~OUTPUT
      \tAccount budget '#{account_budget_summary.account_budget}':
      \t  Name (also known as Account Budget): '#{account_budget_summary.account_budget_name}'
      \t  Customer (also known as Account ID): '#{account_budget_summary.customer}'
      \t  Customer descriptive name (also known as Account): '#{account_budget_summary.customer_descriptive_name}'
      \t  Purchase order number (also known as Purchase Order): '#{account_budget_summary.purchase_order_number}'
      \t  Billing activity date range (inclusive):
      \t    from #{account_budget_summary.billable_activity_date_range.start_date}
      \t    to #{account_budget_summary.billable_activity_date_range.end_date}
      \t  Amounts:
      \t    subtotal '#{micro_to_base(account_budget_summary.subtotal_amount_micros)}'
      \t    tax '#{micro_to_base(account_budget_summary.tax_amount_micros)}'
      \t    total '#{micro_to_base(account_budget_summary.total_amount_micros)}'
      OUTPUT
    end
  end
end

# Converts an amount from the micro unit to the base unit.
def micro_to_base(amount)
  amount ? (amount / 1000000.0) : 0.0
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
  options[:billing_setup_id] = 'INSERT_BILLING_SETUP_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-B', '--billing-setup-id BILLING-SETUP-ID', String, 'Customer ID') do |v|
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
    get_invoices(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:billing_setup_id),
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
