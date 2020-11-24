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
# This example lists the resource names for the customers that the
# authenticating user has access to.
#
# The customer IDs retrieved from the resource names can be used to set the
# login_customer_id configuration. For more information, see this documentation:
# https://developers.google.com/google-ads/api/docs/concepts/call-structure#login-customer-id

require 'optparse'
require 'google/ads/google_ads'

# [START list_accessible_customers]
def list_accessible_customers()
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  accessible_customers = client.service.customer.list_accessible_customers().resource_names

  accessible_customers.each do |resource_name|
    puts "Customer resource name: #{resource_name}"
  end
end
# [END list_accessible_customers]

if __FILE__ == $0
  PAGE_SIZE = 1000

  begin
    list_accessible_customers()
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
