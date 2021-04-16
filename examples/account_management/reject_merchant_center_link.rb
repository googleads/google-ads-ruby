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
# Demonstrates how to reject a Merchant Center link request.
#
# Prerequisite: You need to have access to a Merchant Center account. You can
# find instructions to create a Merchant Center account here:
# https://support.google.com/merchants/answer/188924.
#
# To run this example, you must use the Merchant Center UI or the Content API
# for Shopping to send a link request between your Merchant Center and
# Google Ads accounts.

require 'optparse'
require 'google/ads/google_ads'

def reject_merchant_center_links(customer_id, merchant_center_account_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  merchant_center_link_service = client.service.merchant_center_link

  # Rejects a pending link request or unlinks an enabled link for a Google Ads
  # account with customer_id from a Merchant Center account with
  # merchant_center_account_id.
  response = merchant_center_link_service.list_merchant_center_links(
    customer_id: customer_id,
  )

  # Checks if there is a link for the Merchant Center account we are
  # looking for.
  # If the Merchant Center link is pending, reject it by removing the link.
  # If the Merchant Center link is enabled, unlink Merchant Center from
  # Google Ads by removing the link.
  # In both cases, the remove action is the same.
  # There is only one MerchantCenterLink object for a given Google Ads
  # account and Merchant Center account, so we can just detect the first one.
  link_to_remove = response.merchant_center_links.detect {|link| link.id == merchant_center_account_id.to_i}

  if !link_to_remove.nil?
    puts "Found the link to remove:"
    puts "\t Link resource name '#{link_to_remove.resource_name}', " \
      "link status: #{link_to_remove.status}"

    remove_merchant_center_link(
      client,
      merchant_center_link_service,
      customer_id,
      link_to_remove,
    )
  else
    puts "Link between Google Ads account #{customer_id} " \
      "and Merchant Center account #{merchant_center_account_id} not found."
  end
end

# Removes a Merchant Center link from a Google Ads client customer account.
# [START reject_merchant_center_link]
def remove_merchant_center_link(
  client,
  merchant_center_link_service,
  customer_id,
  link)
  # Creates a single remove operation, specifying the Merchant Center link
  # resource name.
  operation = client.operation.remove_resource.merchant_center_link(link.resource_name)

  # Issues a mutate request to remove the link and prints the result info.
  response = merchant_center_link_service.mutate_merchant_center_link(
    customer_id: customer_id,
    operation: operation,
  )
  puts "Removed Merchant Center link with resource name: " \
    "#{response.result.resource_name}"
end
# [END reject_merchant_center_link]

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
  options[:merchant_center_account_id] = 'INSERT_MERCHANT_CENTER_ACCOUNT_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-M', '--merchant-center-account-id MERCHANT-CENTER-ACCOUNT-ID',
      String, 'Merchant Center Accounnt ID') do |v|
      options[:merchant_center_account_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    reject_merchant_center_links(
      options.fetch(:customer_id).tr("-", ""),
      options[:merchant_center_account_id],
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
