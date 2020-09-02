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
# This code example retrieves all the disapproved ads in a given campaign.

require 'optparse'
require 'google/ads/google_ads'

def get_all_disapproved_ads(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service.google_ads

  search_query = <<~QUERY
    SELECT
        ad_group_ad.ad.id,
        ad_group_ad.ad.type,
        ad_group_ad.policy_summary.approval_status,
        ad_group_ad.policy_summary.policy_topic_entries
    FROM ad_group_ad
    WHERE campaign.id = #{campaign_id}
    AND ad_group_ad.policy_summary.approval_status = DISAPPROVED
  QUERY

  # Issue the search request.
  response = ga_service.search(
    customer_id: customer_id,
    query: search_query,
    page_size: PAGE_SIZE,
  )

  disapproved_ads_count = 0;

  # Iterate over all ads in all rows returned and count disapproved Ads
  response.each do |row|
    ad_group_ad = row.ad_group_ad
    ad = ad_group_ad.ad

    disapproved_ads_count += 1

    puts sprintf('Ad with ID %s and type %s was disapproved with the ' \
        'following policy topic entries',
      ad.id, ad.type)

    # Display the policy topic entries related to the ad disapproval.
    policy_summary.policy_topic_entries.each do |entry|
      puts sprintf('  topic: %s, type: %s', entry.topic, entry.type)

      # Display the attributes and values that triggered the policy topic.
      unless entry.evidences.nil?
        entry.evidences.each do |evidence|
          if (evidence.text_list != nil)
            evidence.text_list.texts.each do |text, index|
              puts sprintf('    evidence text[%s]: %s', i, text)
            end
          end
        end
      end
    end
  end

  puts sprintf('Number of disapproved ads found: %d', disapproved_ads_count)
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String,
        'Campaign ID') do |v|
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
    get_all_disapproved_ads(options.fetch(:customer_id).tr("-", ""), options[:campaign_id])
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
