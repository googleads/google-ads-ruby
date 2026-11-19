#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
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
# This example illustrates how to generate audience insights.

require 'optparse'
require 'google/ads/google_ads'

def generate_audience_insights(customer_id, custom_name)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  location_id = '2840' # US
  product_name = 'Google'
  user_interest_category = '92948' # Technology

  audience_composition_insights(
    client,
    customer_id,
    location_id,
    user_interest_category,
    custom_name,
  )

  generate_suggested_targeting_insights(
    client,
    customer_id,
    location_id,
    custom_name,
  )

  list_audience_insights_attributes(
    client,
    customer_id,
    product_name,
    custom_name,
  )
end

# [START composition_insights]
# Returns a collection of attributes represented in an audience of interest.
# Please refer here for more:
# https://developers.google.com/google-ads/api/data/codes-formats
def audience_composition_insights(client, customer_id, location_id,
                                  user_interest, custom_name)
  audience = client.resource.insights_audience do |a|
    a.country_locations << client.resource.location_info do |loc|
      loc.geo_target_constant = client.path.geo_target_constant(location_id)
    end
    a.topic_audience_combinations << client.resource.insights_audience_attribute_group do |group|
      group.attributes << client.resource.audience_insights_attribute do |attr|
        attr.user_interest = client.resource.user_interest_info do |ui|
          ui.user_interest_category =
            client.path.user_interest(customer_id, user_interest)
        end
      end
    end
  end

  response = client.service.audience_insights.generate_audience_composition_insights(
    customer_id: customer_id,
    customer_insights_group: custom_name,
    dimensions: [
      :AFFINITY_USER_INTEREST,
      :IN_MARKET_USER_INTEREST,
      :YOUTUBE_CHANNEL,
    ],
    audience: audience,
  )

  puts "Audience composition insights response:\n#{response.inspect}"
end
# [END composition_insights]

# [START targeted_insights]
# Returns a collection of targeting insights (e.g. target-able audiences)
# that are relevant to the requested audience.
def generate_suggested_targeting_insights(client, customer_id, location_id, custom_name)
  audience_definition = client.resource.insights_audience_definition do |ad|
    ad.audience = client.resource.insights_audience do |a|
      a.country_locations << client.resource.location_info do |loc|
        loc.geo_target_constant = client.path.geo_target_constant(location_id)
      end
    end
  end

  response = client.service.audience_insights.generate_suggested_targeting_insights(
    customer_id: customer_id,
    customer_insights_group: custom_name,
    audience_definition: audience_definition,
  )

  puts "Suggested targeting insights response:\n#{response.inspect}"
end
# [END targeted_insights]

# [START insights_attributes]
# Searches for audience attributes that can be used to generate insights.
def list_audience_insights_attributes(client, customer_id, product_name, custom_name)
  response = client.service.audience_insights.list_audience_insights_attributes(
    customer_id: customer_id,
    query_text: product_name,
    dimensions: [:CATEGORY, :KNOWLEDGE_GRAPH],
    customer_insights_group: custom_name,
  )

  response.attributes.each do |attribute|
    if attribute.dimension == :KNOWLEDGE_GRAPH
      puts "Knowledge Graph machine ID: #{attribute.attribute.entity.knowledge_graph_machine_id}"
    end
  end
end
# [END insights_attributes]

if __FILE__ == $0
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
  options[:custom_name] = 'INSERT_CUSTOM_NAME_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String,
        'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-n', '--custom-name CUSTOM-NAME', String,
        'Custom name to identify audiences.') do |v|
      options[:custom_name] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    generate_audience_insights(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:custom_name),
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
