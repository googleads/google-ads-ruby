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
# This example adds an ad group. To get ad groups, run get_ad_groups.rb.

require 'optparse'
require 'google/ads/googleads'
require 'date'

def add_ad_groups(customer_id, campaign_id)
  # GoogleadsClient will read a config file from ENV['HOME']/googleads_config.rb
  # when called without parameters
  client = Google::Ads::Googleads::GoogleadsClient.new
  ad_group_service = client.service(:AdGroup)

  # Create an ad group, setting an optional CPC value.
  ad_group = client.resource(:AdGroup)
  ad_group.name = client.wrapper.string(
      sprintf('Earth to Mars Cruises %s',(Time.new.to_f * 1000).to_i))
  ad_group.status = client.enum(:AdGroupStatus)::ENABLED
  ad_group.campaign = client.wrapper.string(
      client.path.campaign(customer_id, campaign_id))
  ad_group.type = client.enum(:AdGroupType)::SEARCH_STANDARD
  ad_group.cpc_bid_micros = client.wrapper.int64(10_000_000)

  # Create the operation
  ad_group_operation = client.operation(:AdGroup)
  ad_group_operation['create'] = ad_group

  # Add the ad group.
  response = ad_group_service.mutate_ad_groups(
      customer_id, [ad_group_operation])

  puts sprintf('Created ad group %s.', response.results.first.resource_name)

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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
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
    add_ad_groups(options[:customer_id], options[:campaign_id])
  rescue Google::Ads::Googleads::Errors::GoogleAdsError => e
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

