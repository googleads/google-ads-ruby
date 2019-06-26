#!/usr/bin/ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2018 Google LLC
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
# This code example illustrates how to get metrics about a campaign and 
# serialize the result as a CSV file.

require 'optparse'
require 'time'
require 'csv'
require 'google/ads/google_ads'

PAGE_SIZE = 1000

def result_row_as_csv_hash(result_row)
  {
    "campaign.id": result_row.campaign.id.value,
    "campaign.name": result_row.campaign.name.value,
    "campaign.date": Time.parse(result_row.segments.date.value),
    "metrics.impressions": result_row.metrics.impressions.value,
    "metrics.clicks": result_row.metrics.clicks.value,
    "metrics.cost_micros": result_row.metrics.cost_micros.value,
  }
end

def write_campaign_report_csv(customer_id, target_filepath)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ga_service = client.service.google_ads

  query = <<~QUERY
      SELECT campaign.id,
             campaign.name,
             segments.date,
             metrics.impressions,
             metrics.clicks,
             metrics.cost_micros
      FROM campaign
      WHERE segments.date DURING LAST_7_DAYS
        AND campaign.status = 'ENABLED'
      ORDER BY segments.date DESC
  QUERY

  response = ga_service.search(customer_id, query, page_size: PAGE_SIZE)
  # convert the Google Ads response rows in to CSV ready hash objects
  csv_rows = response.map { |row| result_row_as_csv_hash(row) }

  if csv_rows.empty?
    puts "No results found."
    return
  end

  CSV.open(target_filepath, "wb") do |csv|
    # use the keys of the first csv_row as a header row
    csv << csv_rows.first.keys

    # write all the values as rows of the CSV
    csv_rows.each do |row|
      csv << row.values
    end
  end

  puts "successfully created #{target_filepath} with #{csv_rows.count} entries"
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
  options[:customer_id] = 'INSERT_ADWORDS_CUSTOMER_ID_HERE'
  options[:output_file_path] = __FILE__.gsub(".rb", ".csv")
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-O', '--output-file-path OUTPUT-FILE-PATH', String, 'Output File Path') do |v|
      options[:output_file_path] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    # the GoogleAdsClient only accepts customer IDs without `-` characters,
    # so this removes them if the caller of this script copy pasted a customer
    # id directly from the user interface
    sanitized_customer_id = options.fetch(:customer_id).tr("-", "")

    write_campaign_report_csv(sanitized_customer_id, options.fetch(:output_file_path))
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
