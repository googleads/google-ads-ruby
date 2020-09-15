#!/usr/bin/ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2020 Google LLC
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
# Shows how to download a set of reports from a list of accounts in parallel.
# If you need to obtain a list of accounts, please see get_account_hierarchy.rb
# or list_accessible_customers.rb examples.";

require 'optparse'
require 'google/ads/google_ads'
require 'thread'

def parallel_report_download(customer_ids, login_customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Optional login customer ID if your access to the CIDs is
  # via a manager account.
  client.configure do |config|
    if login_customer_id
      config.login_customer_id = login_customer_id.tr("-", "").to_i
    end
  end

  ga_service = client.service.google_ads

  query_list = {}
  query_list["Campaign Query"] = <<~QUERY
    SELECT campaign.id, metrics.impressions, metrics.clicks
    FROM campaign
    WHERE segments.date DURING LAST_30_DAYS
  QUERY
  query_list["Ad Group Query"] = <<~QUERY
    SELECT campaign.id, ad_group.id, metrics.impressions, metrics.clicks
    FROM ad_group
    WHERE segments.date DURING LAST_30_DAYS
  QUERY

  reports_succeeded = Queue.new()
  reports_failed = Queue.new()

  # Start all the threads.
  # This is a naive implementation for illustrative purposes. It is possible to
  # optimize the utilization of each customer ID by providing a queue of work
  # (or similar). However, this would complicate the example code and so is
  # omitted here.
  threads = []
  query_list.each do |query_key, query|
    customer_ids.each do |cid|
      cid = cid.tr("-", "")
      # Starts the report download in a background thread.
      threads << Thread.new do
        begin
          puts "Requesting #{query_key} for CID #{cid}"
          responses = ga_service.search_stream(
            customer_id: cid.tr("-", ""),
            query: query,
          )
          # Stores the number of rows for each report for illustrative purposes.
          # Users of this code example can implement other logic here such as
          # storing response to a database/file, pass the response on to
          # another method for further processing, etc.
          num_rows = 0
          responses.each do |response|
            response.results.each do |row|
              num_rows += 1
            end
          end
          reports_succeeded << {
            :cid => cid,
            :query_key => query_key,
            :num_rows => num_rows,
          }
        rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
          error_messages = ""
          e.failure.errors.each do |error|
            error_messages += error.message
          end
          reports_failed << {
            :cid => cid,
            :query_key => query_key,
            :error_messages => error_messages,
          }
        end
      end
    end
  end

  puts "Awaiting results from #{threads.size} report download requests..."

  # Waits for all pending requests to the current set of customer IDs
  # to complete.
  threads.each { |aThread|  aThread.join }

  puts 'Download completed, results:'
  puts 'Successful reports:'
  while !reports_succeeded.empty? do
    result = reports_succeeded.pop()
    puts "Customer ID: #{result[:cid]}, Query Key: #{result[:query_key]}, " \
      "Total rows retrieved: #{result[:num_rows]}"
  end
  puts 'Failed reports:'
  while !reports_failed.empty? do
    result = reports_failed.pop()
    puts "Customer ID: #{result[:cid]}, Query Key: #{result[:query_key]}, " \
      "Error Messages: #{result[:error_messages]}"
  end
  puts 'End of results.'
end

if __FILE__ == $PROGRAM_NAME
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
  options[:customer_ids] = [
    'INSERT_CUSTOMER_ID_1_HERE',
    'INSERT_CUSTOMER_ID_2_HERE',
  ]

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-ids CUSTOMER-IDS', String, 'Customer ID') do |v|
      options[:customer_ids] = v.split(',')
    end

    opts.on('-L', '--login-customer-id LOGIN-CUSTOMER-ID', String, 'Login Customer ID (Optional)') do |v|
      options[:login_customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    parallel_report_download(
      options.fetch(:customer_ids),
      options[:login_customer_id],
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
