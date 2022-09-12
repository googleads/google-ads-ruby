#!/usr/bin/env ruby
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
# This example gets the metadata, such as whether the artifact is selectable,
# filterable and sortable, of an artifact. The artifact can be either a resource
# (such as customer, campaign) or a field (such as metrics.impressions,
# campaign.id). It'll also show the data type and artifacts that are
# selectable with the artifact.

require 'optparse'
require 'google/ads/google_ads'

def search_for_google_ads_fields(name_prefix)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  query = <<~QUERY
    SELECT
      name,
      category,
      selectable,
      filterable,
      sortable,
      selectable_with,
      data_type,
      is_repeated
    WHERE name LIKE '#{name_prefix}%'
  QUERY
  # The % after the name prefix indicates that any series of characters may
  # come after the provided prefix.

  response = client.service.google_ads_field.search_google_ads_fields(query: query)

  if response.response.results.empty?
    puts "No GoogleAdsField found with name that begins with '#{name_prefix}'"
    return
  end

  response.each do |row|
    puts "#{row.name}:"
    puts "\t\tcategory: #{row.category}"
    puts "\t\tdata type: #{row.data_type}"
    puts "\t\tselectable: #{row.selectable}"
    puts "\t\tfilterable: #{row.filterable}"
    puts "\t\tsortable: #{row.sortable}"
    puts "\t\trepeated: #{row.is_repeated}"

    if !row.selectable_with.empty?
      puts "\tselectable with:"
      row.selectable_with.sort_by {|field| field}.each do |field|
        puts "\t\t#{field}"
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  options = {}
  # Running the example with -h will print the command line usage.

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-n', '--name-prefix NAME-PREFIX', String) do |v|
      options[:name_prefix] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    search_for_google_ads_fields(options[:name_prefix])
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf("Error: %s\nDetails: %s\n", k, v)
      end
    end
    raise
  end
end
