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
# This example retrieves keywords for a customer or for a specific Ad Group and
# demonstrates how to use the omit_unselected_resource_names option in GAQL to
# reduce payload size.

require 'optparse'
require 'google/ads/google_ads'

def get_keywords(customer_id, ad_group_id=nil, omit_unselected_resource_names=false)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  search_query = <<~QUERY
    SELECT ad_group.id,
           ad_group_criterion.type,
           ad_group_criterion.criterion_id,
           ad_group_criterion.keyword.text,
           ad_group_criterion.keyword.match_type
    FROM ad_group_criterion
    WHERE ad_group_criterion.type = KEYWORD
  QUERY

  if ad_group_id
    search_query << " AND ad_group.id = #{ad_group_id}"
  end

  # Adds omit_unselected_resource_names=true to the PARAMETERS clause of the
  # Google Ads Query Language (GAQL) query, which excludes the resource names of
  # all resources that aren't explicitly requested in the SELECT clause.
  # Enabling this option reduces payload size, but if you plan to use a returned
  # object in subsequent mutate operations, make sure you explicitly request its
  # "resource_name" field in the SELECT clause.
  #
  # Read more about PARAMETERS:
  # https://developers.google.com/google-ads/api/docs/query/structure#parameters
  if omit_unselected_resource_names
    search_query << ' PARAMETERS omit_unselected_resource_names=true'
  end

  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: search_query,
    page_size: PAGE_SIZE,
  )

  response.each do |row|
      ad_group = row.ad_group
      ad_group_criterion = row.ad_group_criterion
      keyword_info = ad_group_criterion.keyword
      if omit_unselected_resource_names
        and_resource_name = ''
      else
        and_resource_name = " and resource name #{ad_group.resource_name}"
      end

      puts "Keyword with text '#{keyword_info.text}', match type #{keyword_info.match_type}, " \
          "criteria type #{ad_group_criterion.type}, and ID #{ad_group_criterion.criterion_id} " \
          "was found in ad group with ID #{ad_group.id}#{and_resource_name}."
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
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'
  options[:ad_group_id] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String,
        '(Optional) Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.on('-o', '--omit-unselected-resource-names OMIT-UNSELECTED-RESOURCE-NAMES', TrueClass,
    '(Optional) Omit unselected resource names') do |v|
      options[:omit_unselected_resource_names] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    get_keywords(
      options.fetch(:customer_id).tr("-", ""),
      options[:ad_group_id],
      options[:omit_unselected_resource_names])
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
