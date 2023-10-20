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
# This code example accepts all pending invitations from Google Merchant Center
# accounts to your Google Ads account.

# NOTE: This code example uses version v14 of the Google Ads API.
# Version v15 of the Google Ads API replaces MerchantCenterLinkService with
# ProductLinkInvitationService and ProductLinkService. We will add new code
# examples using these services shortly.

require 'optparse'
require 'google/ads/google_ads'

def approve_merchant_center_links(customer_id, merchant_center_account_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient::new

  # [START approve_merchant_center_link]
  # Retrieve all the existing Merchant Center links.
  response = client.service.v14.merchant_center_link.list_merchant_center_links(
    customer_id: customer_id,
  )
  # [END approve_merchant_center_link]

  # [START approve_merchant_center_link_1]
  #  Iterate the results, and filter for links with pending status.
  response.merchant_center_links.each do |link|
    # Enables the pending link.
    if link.status == :PENDING && link.id.to_s == merchant_center_account_id
      # Creates the update operation.
      update_operation = client.operation.v14.update_resource.merchant_center_link(
        link.resource_name) do |updated_link|
        updated_link.status = :ENABLED
      end

      # Updates the link.
      mutate_response = client.service.v14.merchant_center_link.mutate_merchant_center_link(
        customer_id: customer_id,
        operation: update_operation,
      )

      # Display the result.
      puts "Enabled a Merchant Center Link with resource name " \
        "#{mutate_response.result.resource_name} " \
        "to Google Ads account #{customer_id}"
    end
  end
  # [END approve_merchant_center_link_1]
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
  options[:merchant_center_account_id] = 'INSERT_MERCHANT_CENTER_ACCOUNT_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-M', '--merchant-center-account-id MERCHANT-CENTER-ACCOUNT-ID',
      String, 'Merchant Center Account ID') do |v|
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
    approve_merchant_center_links(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:merchant_center_account_id),
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
