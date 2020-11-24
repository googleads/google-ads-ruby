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
# Handles RateExceededError in an application. This code example runs 5 requests
# sequentially, each request attempting to validate 100 keywords. While it is
# unlikely that running these requests would trigger a rate exceeded error,
# substantially increasing the number of requests may have that effect. Note
# that this example is for illustrative purposes only, and you shouldn't
# intentionally try to trigger a rate exceed error in your application.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def handle_rate_exceeded_error(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Sequentially sends the requests.
  NUM_REQUESTS.times do |i|
    # Creates operations.
    operations = create_ad_group_criterion_operations(
      client, customer_id, ad_group_id, i)

    begin
      retry_count = 0
      retry_seconds = RETRY_SECONDS
      while retry_count < NUM_RETRIES
        begin
          # Sends request.
          request_mutate_and_display_result(client, customer_id, operations)
          break
        rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
          has_rate_exceeded_error = false
          e.failure.errors.each do |error|
            # Checks if any of the errors are QuotaError.RESOURCE_EXHAUSTED or
            # QuotaError.RESOURCE_TEMPORARILY_EXHAUSTED.
            if error.error_code.quota_error == :RESOURCE_EXHAUSTED \
              || error.error_code.quota_error == :RESOURCE_TEMPORARILY_EXHAUSTED
              puts "Received rate exceeded error, retry after " \
                "#{retry_seconds} seconds."
              sleep retry_seconds
              has_rate_exceeded_error = true
              retry_count += 1
              # Uses an exponential back-off policy.
              retry_seconds *= 2
              break
            end
          end
          # Bubbles up when there is not RateExceededError.
          if !has_rate_exceeded_error
            raise
          end
        ensure
          # Bubbles up when the number of retries has already been reached.
          if retry_count == NUM_RETRIES
            raise "Could not recover after making #{retry_count} attempts."
          end
        end
      end
    rescue StandardError => e
      # Prints any unhandled exception and bubbles up.
      puts "Failed to validate keywords. #{e.message}"
      raise
    end
  end
end

def create_ad_group_criterion_operations(
  client,
  customer_id,
  ad_group_id,
  req_index
)
  operations = []
  NUM_KEYWORDS.times do |i|
    # Creates an ad group criterion operation.
    operations << client.operation.create_resource.ad_group_criterion do |agc|
      agc.ad_group = client.path.ad_group(customer_id, ad_group_id)
      agc.status = :ENABLED
      agc.keyword = client.resource.keyword_info do |ki|
        ki.text = "mars cruise req #{req_index} seed #{i}"
        ki.match_type = :EXACT
      end
    end
  end
  operations
end

def request_mutate_and_display_result(client, customer_id, operations)
  # Makes a validate_only mutate request.
  response = client.service.ad_group_criterion.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: operations,
    partial_failure: false,
    validate_only: true,
  )

  # Displays the results.
  puts "Added #{response.results.size} ad group criteria:"
  response.results.each do |result|
    puts "\t#{result.resource_name}"
  end
end

if __FILE__ == $PROGRAM_NAME
  # Number of requests to be run.
  NUM_REQUESTS = 5
  # Number of keywords to be validated in each API call.
  NUM_KEYWORDS = 100
  # Number of retries to be run in case of a RateExceededError.
  NUM_RETRIES = 3
  # Minimum number of seconds to wait before a retry.
  RETRY_SECONDS = 10

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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-A', '--ad-group-id AD-GROUP-ID', String, 'Ad Group ID') do |v|
      options[:ad_group_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    handle_rate_exceeded_error(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
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
