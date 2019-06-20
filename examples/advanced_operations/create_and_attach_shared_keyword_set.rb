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
# This example creates a shared list of negative broad match keywords. It then
# attaches them to a campaign.

require "optparse"
require "google/ads/google_ads"
require "date"

def create_and_attach_shared_keyword_set(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters

  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Keywords to create a shared set of.
  keywords = ["mars cruise", "mars hotels"]

  # Create shared negative keyword set.
  shared_set = client.resource.shared_set do |ss|
    ss.name = "API Negative keyword list - #{(Time.new.to_f * 1000).to_i}"
    ss.type = :NEGATIVE_KEYWORDS
  end

  operation = client.operation.create_resource.shared_set(shared_set)

  response = client.service.shared_set.mutate_shared_sets(customer_id, [operation])

  shared_set_resource_name = response.results.first.resource_name
  puts "Created shared set #{shared_set_resource_name}"

  shared_criteria = keywords.map do |keyword|
    client.resource.shared_criterion do |sc|
      sc.keyword = client.resource.keyword_info do |kw|
        kw.text = keyword
        kw.match_type = :BROAD
      end
      sc.shared_set = shared_set_resource_name
    end
  end

  operations = shared_criteria.map do |criterion|
    op = client.operation.shared_criterion
    op["create"] = criterion
    op
  end

  response = client.service.shared_criterion.mutate_shared_criteria(customer_id, operations)

  response.results.each do |result|
    puts "Created shared criterion #{result.resource_name}"
  end

  campaign_set = client.resource.campaign_shared_set do |css|
    css.campaign = client.path.campaign(customer_id, campaign_id)
    css.shared_set = shared_set_resource_name
  end

  operation = client.operation.campaign_shared_set
  operation["create"] = campaign_set

  response = client.service.campaign_shared_set.mutate_campaign_shared_sets(
      customer_id, [operation])

  puts "Created campaign shared set #{response.results.first.resource_name}"
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

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
    create_and_attach_shared_keyword_set(options.fetch(:customer_id).tr("-", ""),
        options[:campaign_id])
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
