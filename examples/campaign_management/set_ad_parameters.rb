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
# This exapmle sets ad parameters for an ad group criterion.
# To get ad group criteria, run get_keywords.rb

require 'optparse'
require 'google/ads/google_ads'

def add_ad_parameters(customer_id, ad_group_id, criterion_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ad_group_criterion_resource_name = client.path.ad_group_criterion(
    customer_id,
    ad_group_id,
    criterion_id,
  )
  op_1 = client.operation.create_resource.ad_parameter do |parameter|
    parameter.ad_group_criterion = ad_group_criterion_resource_name
    parameter.parameter_index = 1

    # String containing a numeric value to insert into the ad text.
    # The following restrictions apply: (a) can use comma or period as a separator,
    # with an optional period or comma (respectively) for fractional values,
    # (b) can be prepended or appended with a currency code, (c) can use plus or minus,
    # (d) can use '/' between two numbers.
    parameter.insertion_text = "100"
  end

  op_2 = client.operation.create_resource.ad_parameter do |parameter|
    parameter.ad_group_criterion = ad_group_criterion_resource_name
    parameter.parameter_index = 2
    parameter.insertion_text = "$40"
  end

  operations = [op_1, op_2]

  ad_parameter_service = client.service.ad_parameter
  response = ad_parameter_service.mutate_ad_parameters(
    customer_id: customer_id,
    operations: operations,
  )

  response.results.each do |result|
    puts("Created ad parameter with id #{result.resource_name}")
  end
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
  options[:criterion_id] = 'INSERT_CRITERION_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'AdGroup ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-r', '--criterion-id CRITERION-ID', String, 'Criterion ID') do |v|
      options[:criterion_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_ad_parameters(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
      options.fetch(:criterion_id),
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
