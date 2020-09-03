# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This code example shows how to deal with partial failures

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_ad_groups(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  ad_groups = []
  # This ad group should be created successfully.
  ad_groups << client.resource.ad_group do |ag|
    ag.campaign = client.path.campaign(customer_id, campaign_id)
    ag.name = "Valid ad group: #{(Time.new.to_f * 1000).to_i}"
  end
  # This ad group should fail to create because it references an invalid campaign.
  ad_groups << client.resource.ad_group do |ag|
    ag.campaign = client.path.campaign(customer_id, 0)
    ag.name = "Invalid ad group: #{(Time.new.to_f * 1000).to_i}"
  end
  # This ad group should fail to create because it duplicates the name from the first one.
  ad_groups << client.resource.ad_group do |ag|
    ag.campaign = client.path.campaign(customer_id, campaign_id)
    ag.name = ad_groups.first.name
  end

  operations = ad_groups.map do |ag|
    client.operation.create_resource.ad_group(ag)
  end

  response = client.service.ad_group.mutate_ad_groups(
    customer_id: customer_id,
    operations: operations,
    partial_failure: true,
  )

  response.results.each_with_index do |ad_group, i|
    if ad_group.resource_name != ""
      puts("operations[#{i}] succeeded: Created ad group with id #{ad_group.resource_name}")
    end
  end

  failures = client.decode_partial_failure_error(response.partial_failure_error)
  failures.each do |failure|
    failure.errors.each do |error|
      human_readable_error_path = error
        .location
        .field_path_elements
        .map { |location_info|
          if location_info.index
            "#{location_info.field_name}[#{location_info.index}]"
          else
            "#{location_info.field_name}"
          end
        }.join(" > ")

      errmsg =  "error occured creating ad group #{human_readable_error_path}" \
        " with value: #{error.trigger.string_value}" \
        " because #{error.message.downcase}"
      puts errmsg
    end
  end
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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Ad Group ID') do |v|
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
    add_ad_groups(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
