#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2022 Google LLC
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
# GoogleAdsService.Search results are paginated but they can only be retrieved
# in sequence starting by the first page. More details at
# https://developers.google.com/google-ads/api/docs/reporting/paging.
#
# This example searches campaigns illustrating how GoogleAdsService.Search
# result page tokens can be cached and reused to retrieve previous pages. This
# is useful when you need to request pages that were already requested in the
# past without starting over from the first page. For example, it can be used
# to implement an interactive application that displays a page of results at a
# time without caching all the results first.
#
# To add campaigns, run add_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'

def navigate_search_result_pages_caching_tokens(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # The cache of page tokens. The key is the 0-indexed page number.
  # The first page's token is always the empty string.
  page_tokens = {
    0 => ''
  }

  puts "Fetching page 1 to get metadata"
  query = "SELECT campaign.id, campaign.name FROM campaign ORDER BY campaign.name LIMIT #{RESULTS_LIMIT}"
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    page_size: PAGE_SIZE,
    return_total_results_count: true,
  )

  cache_next_page_token(page_tokens, response.page, 1)

  # The total results count does not take into consideration the LIMIT clause
  # of the query so we need to find the minimal value between the limit and the
  # total results count.
  total_results = [
    RESULTS_LIMIT,
    response.page.response.total_results_count,
  ].min
  puts "Found ${total_results} campaigns."

  total_pages = (total_results.to_f / PAGE_SIZE).ceil
  raise "Could not find any campaigns." if total_pages == 0

  middle_page = (total_pages / 2.0).ceil
  puts "Printing results from page #{middle_page}."
  fetch_and_print_page_results(
    client,
    customer_id,
    query,
    PAGE_SIZE,
    true,
    middle_page,
    page_tokens,
  )

  puts 'Print all pages, starting at the last page and moving to the first.'
  (1..total_pages).reverse_each do |page_number|
    fetch_and_print_page_results(
      client,
      customer_id,
      query,
      PAGE_SIZE,
      true,
      page_number,
      page_tokens,
    )
  end
end

# [START navigate_search_result_pages_caching_tokens]
def fetch_and_print_page_results(client, customer_id, query, page_size,
                                 return_total_results_count, page_number, page_tokens)
  if page_tokens.has_key?(page_number)
    puts 'The page token for the request page was cached. Reusing it.'
    current_page = page_number
  else
    puts "The token for the requested page has not been cached yet. We will start " \
      "at page #{page_tokens.size} and request and cache pages until we find it."
    current_page = page_tokens.size
  end

  while current_page <= page_number
    puts "Fetching page #{current_page}."
    response = client.service.google_ads.search(
      customer_id: customer_id,
      query: query,
      page_size: page_size,
      return_total_results_count: return_total_results_count,
      page_token: page_tokens[current_page - 1],
    )
    cache_next_page_token(page_tokens, response.page, current_page)
    current_page += 1
  end

  puts "Printing results found for page #{page_number}."
  response.page.response.results.each do |result|
    puts "- Campaign with ID #{result.campaign.id} and name #{result.campaign.name}."
  end
end
# [END navigate_search_result_pages_caching_tokens]

def cache_next_page_token(page_tokens, page, page_number)
  if !page.next_page_token.nil? && page_tokens[page_number].nil?
    page_tokens[page_number] = page.next_page_token
    puts "Caching token for page #{page_number + 1}."
  end
end

if __FILE__ == $0
  # These limits are set low for demonstrative purposes.
  RESULTS_LIMIT = 10
  PAGE_SIZE = 3

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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    navigate_search_result_pages_caching_tokens(options.fetch(:customer_id).tr('-', ''))
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf('Error with message: %s\n', error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf('\tOn field: %s\n', field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf('\tType: %s\n\tCode: %s\n', k, v)
      end
    end
    raise
  end
end

