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
# Requests an exemption for policy violations of an expanded text ad.
#
# If the request somehow fails with exceptions that are not policy finding
# errors, the example will stop instead of trying to send an exemption request.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def handle_expanded_text_ad_policy_violations(customer_id, ad_group_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  ad_group_ad_service = client.service.ad_group_ad

  ad_group_ad_operation, ignorable_policy_topics = create_expanded_text_ad(
    client,
    ad_group_ad_service,
    customer_id,
    ad_group_id,
  )

  request_exemption(
    client,
    customer_id,
    ad_group_ad_service,
    ad_group_ad_operation,
    ignorable_policy_topics,
  )
end

def create_expanded_text_ad(client, ad_group_ad_service, customer_id, ad_group_id)
  ad_group_ad_operation = client.operation.create_resource.ad_group_ad do |aga|
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)
    aga.status = :PAUSED

    aga.ad = client.resource.ad do |ad|
      ad.final_urls << "http://www.example.com"
      ad.expanded_text_ad = client.resource.expanded_text_ad_info do |eta|
        eta.headline_part1 = "Cruise to Mars ##{(Time.new.to_f * 1000).to_i}"
        eta.headline_part2 = "Best space cruise line"
        eta.description = "Buy your tickets now!!!!!!!"
      end
    end
  end

  ignorable_policy_topics = []
  begin
    ad_group_ad_service.mutate_ad_group_ads(
      customer_id: customer_id,
      operations: [ad_group_ad_operation],
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    ignorable_policy_topics = fetch_ignorable_policy_topics(e)
  end

  return ad_group_ad_operation, ignorable_policy_topics
end

# [START handle_expanded_text_ad_policy_violations]
def fetch_ignorable_policy_topics(exception)
  ignorable_policy_topics = []

  exception.failure.errors.each do |error|
    if error.error_code.policy_finding_error != :POLICY_FINDING
      puts "Non-policy finding error found. Aborting."
      raise exception
    end
    puts "#{error.error_code.policy_finding_error}: #{error.message}"

    error&.details&.policy_finding_details&.policy_topic_entries.each do |entry|
      ignorable_policy_topics << entry.topic
      puts "\tPolicy topic name: #{entry.topic}"
      puts "\tPolicy topic entry type: #{entry.type}"
    end
  end

  ignorable_policy_topics
end
# [END handle_expanded_text_ad_policy_violations]

# [START handle_expanded_text_ad_policy_violations_1]
def request_exemption(
    client, customer_id, ad_group_ad_service, ad_group_ad_operation, ignorable_policy_topics)
  # Add all the found ignorable policy topics to the operation.
  ad_group_ad_operation.policy_validation_parameter =
      client.resource.policy_validation_parameter do |pvp|
    pvp.ignorable_policy_topics.push(
      *ignorable_policy_topics
    )
  end
  response = ad_group_ad_service.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [ad_group_ad_operation],
  )
  puts "Successfully added an expanded text ad with resource name " \
    "#{response.results.first.resource_name} for policy violation exception."
end
# [END handle_expanded_text_ad_policy_violations_1]

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
    handle_expanded_text_ad_policy_violations(
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
