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
# Demonstrates how to request an exemption for policy violations of a keyword.
#
# Note that the example uses an exemptible policy-violating keyword by default.
# If you use a keyword that contains non-exemptible policy violations, they
# will not be sent for exemption request and you will still fail to create a
# keyword.  If you specify a keyword that doesn't violate any policies, this
# example will just add the keyword as usual, similar to what the AddKeywords
# example does.
#
# Note that once you've requested policy exemption for a keyword, when you send
# a request for adding it again, the request will pass like when you add a
# non-violating keyword.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def handle_keyword_policy_violations(customer_id, ad_group_id, keyword_text)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  ad_group_criterion_service = client.service.ad_group_criterion

  exception, ad_group_criterion_operation = create_keyword_criterion(
    client,
    ad_group_criterion_service,
    customer_id,
    ad_group_id,
    keyword_text,
  )

  unless exception.nil?
    exempt_policy_violation_keys = fetch_exempt_policy_violation_keys(exception)
    request_exemption(
      client,
      customer_id,
      ad_group_criterion_service,
      ad_group_criterion_operation,
      exempt_policy_violation_keys,
    )
  end
end

def create_keyword_criterion(
    client, ad_group_criterion_service, customer_id, ad_group_id, keyword_text)
  ad_group_criterion_operation = client.operation.create_resource.ad_group_criterion do |agc|
    agc.ad_group = client.path.ad_group(customer_id, ad_group_id)
    agc.status = :ENABLED
    agc.keyword = client.resource.keyword_info do |ki|
      ki.match_type = :EXACT
      ki.text = keyword_text
    end
  end

  ignorable_policy_topics = []
  begin
    ad_group_criterion_service.mutate_ad_group_criteria(
      customer_id: customer_id,
      operations: [ad_group_criterion_operation],
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    return e, ad_group_criterion_operation
  end

  return nil, ad_group_criterion_operation
end

def fetch_exempt_policy_violation_keys(exception)
  exempt_policy_violation_keys = []

  exception.failure.errors.each do |error|
    details = error.details.policy_violation_details
    puts "Policy violation details:"
    puts "\tExternal policy name: #{details.external_policy_name}"
    puts "\tExternal policy description:\n#{details.external_policy_description}"
    puts "\tIs exemptible: #{details.is_exemptible}"

    if details.is_exemptible && !details.key.nil?
      exempt_policy_violation_keys << details.key
      puts "Policy violation key:"
      puts "\tPolicy Name: #{details.key.policy_name}"
      puts "\tViolating Text: #{details.key.violating_text}"
    else
      puts "No exemption request will be sent because your keyword contained "\
        "some non-exemptible policy violations."
    end
  end

  exempt_policy_violation_keys
end

def request_exemption(
    client,
    customer_id,
    ad_group_criterion_service,
    ad_group_criterion_operation,
    exempt_policy_violation_keys
)
  # Add all the found ignorable policy topics to the operation.
  ad_group_criterion_operation.exempt_policy_violation_keys.push(
    *exempt_policy_violation_keys
  )
  response = ad_group_criterion_service.mutate_ad_group_criteria(
    customer_id: customer_id,
    operations: [ad_group_criterion_operation],
  )
  puts "Successfully added a keyword with resource name " \
    "#{response.results.first.resource_name} for policy violation exception."
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
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'
  options[:keyword_text] = 'INSERT_KEYWORD_TEXT_HERE'

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

    opts.on('-k', '--keyword-text KEYWORD-TEXT', String, 'Keyword') do |v|
      options[:keyword_text] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    handle_keyword_policy_violations(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:ad_group_id),
      options.fetch(:keyword_text),
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
