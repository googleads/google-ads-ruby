#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# This example illustrates the use of custom client timeouts in the context of
# server streaming and unary calls.
#
# For more information about the concepts, see this documentation:
# https://grpc.io/docs/what-is-grpc/core-concepts/#rpc-life-cycle.

require 'optparse'
require 'google/ads/google_ads'
require 'open-uri'

def set_custom_client_timeouts(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  make_server_streaming_call(client, customer_id)
  make_unary_call(client, customer_id)
end

# Makes a server streaming call using a custom client timeout.
def make_server_streaming_call(client, customer_id)
  # Creates a query that retrieves all campaign IDs.
  query = <<~EOQUERY
    SELECT campaign.id FROM campaign
  EOQUERY

  output = ""
  begin
    ga_service = client.service.google_ads
    ga_service.configure do |config|
      # Any server streaming call has a default timeout setting.
      # For this particular call, the default setting can be found in the
      # following file:
      # https://github.com/googleads/google-ads-ruby/blob/master/lib/google/ads/google_ads/v10/services/google_ads_service/client.rb
      #
      # When making a server streaming call, config.rpcs.search_stream.timeout can
      # be used to override the default timeout setting with a given value.
      config.rpcs.search_stream.timeout = CLIENT_TIMEOUT_SECONDS
    end

    # Issues a search stream request using the customized client config.
    stream = ga_service.search_stream(
      customer_id: customer_id,
      query: query,
    )
    # Iterates over all rows in all messages and collects the campaign IDs.
    stream.each do |response|
      response.results.each do |row|
        output += " #{row.campaign.id}"
      end
    end
    puts "The server streaming call completed before the timeout."
  rescue GRPC::DeadlineExceeded => e
    puts "The server streaming call did not complete before the timeout."
  ensure
    puts "All campaign IDs retrieved: #{output.empty? ? "None" : output}"
  end
end

def make_unary_call(client, customer_id)
  # Creates a query that retrieves all campaign IDs.
  query = <<~EOQUERY
    SELECT campaign.id FROM campaign
  EOQUERY

  output = ""
  begin
    ga_service = client.service.google_ads
    ga_service.configure do |config|
      # Any unary call is retryable and has default retry settings.
      # For this particular call, the default setting can be found in the
      # following file:
      # https://github.com/googleads/google-ads-ruby/blob/master/lib/google/ads/google_ads/v10/services/google_ads_service/client.rb
      #
      # When making an unary call, config.retry_policy can
      # be used to override the default retry settings with given values.
      config.rpcs.search.timeout = CLIENT_TIMEOUT_SECONDS
      config.rpcs.search.retry_policy = {
        # Note: This overrides the default value and can lead to
        # RequestError.RPC_DEADLINE_TOO_SHORT errors when too small. We
        # recommend to do it only if necessary.
        'initial_delay' => CLIENT_TIMEOUT_SECONDS / 10.0,
        'max_delay' => CLIENT_TIMEOUT_SECONDS / 5.0,
      }
    end

    # Issues a stream request using the customized client config.
    response = ga_service.search(
      customer_id: customer_id,
      query: query,
    )
    # Iterates over all rows and collects the campaign IDs.
    response.each do |row|
      output += " #{row.campaign.id}"
    end
    puts "The unary call completed before the timeout."
  rescue GRPC::DeadlineExceeded => e
    puts "The unary call did not complete before the timeout."
  ensure
    puts "All campaign IDs retrieved: #{output.empty? ? "None" : output}"
  end
end

if __FILE__ == $0
  CLIENT_TIMEOUT_SECONDS = 5 * 60 # 5 minutes in seconds

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
    set_custom_client_timeouts(options.fetch(:customer_id).tr('-', ''))
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

