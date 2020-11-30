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
# This code example illustrates adding campaign targeting criteria.

require 'optparse'
require 'google/ads/google_ads'

def add_campaign_targeting_criteria(customer_id, campaign_id, keyword, location_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  criteria_service = client.service.campaign_criterion

  negative_keyword = create_negative_keyword(client, customer_id, campaign_id, keyword)
  location = create_location(client, customer_id, campaign_id, location_id)
  proximity = create_proximity(client, customer_id, campaign_id)

  operations = [negative_keyword, location, proximity]

  response = criteria_service.mutate_campaign_criteria(
    customer_id: customer_id,
    operations: operations
  )
  response.results.each do |resource|
    puts sprintf("Added campaign criterion %s", resource.resource_name)
  end
end

# [START add_campaign_targeting_criteria_1]
def create_proximity(client, customer_id, campaign_id)
  client.operation.create_resource.campaign_criterion do |criterion|
    criterion.campaign = client.path.campaign(customer_id, campaign_id)

    criterion.proximity = client.resource.proximity_info do |proximity|
      proximity.address = client.resource.address_info do |address|
        address.street_address = "38 avenue de l'Opéra"
        address.city_name = "Paris"
        address.postal_code = "75002"
        address.country_code = "FR"
      end

      proximity.radius = 10
      proximity.radius_units = :MILES
    end
  end
end
# [END add_campaign_targeting_criteria_1]

# [START add_campaign_targeting_criteria]
def create_location(client, customer_id, campaign_id, location_id)
  client.operation.create_resource.campaign_criterion do |criterion|
    criterion.campaign = client.path.campaign(customer_id, campaign_id)

    criterion.location = client.resource.location_info do  |li|
      # Besides using location_id, you can also search by location names from
      # GeoTargetConstantService.suggest_geo_target_constants() and directly
      # apply GeoTargetConstant.resource_name here. An example can be found
      # in get_geo_target_constant_by_names.rb.
      li.geo_target_constant = client.path.geo_target_constant(location_id)
    end
  end
end
# [END add_campaign_targeting_criteria]

def create_negative_keyword(client, customer_id, campaign_id, keyword)
  client.operation.create_resource.campaign_criterion do |criterion|
    criterion.campaign = client.path.campaign(customer_id, campaign_id)
    criterion.negative = true
    criterion.keyword = client.resource.keyword_info do |ki|
      ki.text = keyword
      ki.match_type = :BROAD
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
  options[:customer_id] = 'INSERT_GOOGLE_ADS_CUSTOMER_ID_HERE'
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'
  options[:keyword] = 'jupiter cruise'
  # For more information on determining location_id value, see:
  # https://developers.google.com/google-ads/api/reference/data/geotargets
  options[:location_id] = '21167' # New York

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
      options[:campaign_id] = v
    end

    opts.on('-k', '--keyword-text KEYWORD-TEXT', String, '(Optional) Keyword') do |v|
      options[:keyword] = v
    end

    opts.on('-l', '--location-id LOCATION-ID', String, '(Optional) Location ID') do |v|
      options[:location_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_campaign_targeting_criteria(options.fetch(:customer_id).tr("-", ""),
        options[:campaign_id], options[:keyword], options[:location_id])
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
