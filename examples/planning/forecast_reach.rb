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
# This example demonstrates how to interact with the ReachPlanService to find
# plannable locations and product codes, build a media plan, and generate a
# video ads reach forecast.

require 'optparse'
require 'google/ads/google_ads'

def forecast_reach(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  reach_plan_service = client.service.reach_plan

  show_plannable_locations(reach_plan_service)

  show_plannable_products(reach_plan_service)

  forecast_manual_mix(client, reach_plan_service, customer_id)

  forecast_suggested_mix(client, reach_plan_service, customer_id)
end

# Shows map of plannable locations to their IDs.
def show_plannable_locations(reach_plan_service)
  response = reach_plan_service.list_plannable_locations()

  puts "Plannable Locations:"
  puts "Name, Id, ParentCountryId"

  response.plannable_locations.each do |location|
    puts "'#{location.name}', #{location.id}, #{location.parent_country_id}"
  end
end

# Lists plannable products for a given location.
def show_plannable_products(reach_plan_service)
  response = reach_plan_service.list_plannable_products(
    plannable_location_id: LOCATION_ID,
  )

  puts "Plannable Products for Location ID #{LOCATION_ID}:"

  response.product_metadata.each do |product|
    puts "#{product.plannable_product_code}:"
    puts "Age Ranges:"
    product.plannable_targeting.age_ranges.each do |age_range|
      puts "\t- #{age_range}"
    end
    puts "Genders:"
    product.plannable_targeting.genders.each do |gender|
      puts "\t- #{gender.type}"
    end
    puts "Devices:"
    product.plannable_targeting.devices.each do |device|
      puts "\t- #{device.type}"
    end
  end
end

# Retrieves and prints the reach curve for a given product mix.
def get_reach_curve(
  client,
  reach_plan_service,
  customer_id,
  product_mix,
  location_id,
  currency_code)
  duration = client.resource.campaign_duration do |d|
    # Valid durations are between 1 and 90 days.
    d.duration_in_days = 28
  end

  targeting = client.resource.targeting do |t|
    t.plannable_location_id = location_id
    t.age_range = :AGE_RANGE_18_65_UP
    t.genders << client.resource.gender_info do |gender|
      gender.type = :FEMALE
    end
    t.genders << client.resource.gender_info do |gender|
      gender.type = :MALE
    end
    t.devices << client.resource.device_info do |device|
      device.type = :DESKTOP
    end
    t.devices << client.resource.device_info do |device|
      device.type = :MOBILE
    end
    t.devices << client.resource.device_info do |device|
      device.type = :TABLET
    end
  end

  # See the docs for defaults and valid ranges:
  # https://developers.google.com/google-ads/api/reference/rpc/latest/GenerateReachForecastRequest
  response = reach_plan_service.generate_reach_forecast(
    customer_id: customer_id,
    campaign_duration: duration,
    planned_products: product_mix,
    currency_code: currency_code,
    targeting: targeting,
  )

  puts "Reach curve output:"
  puts "Currency, Cost Micros, On-Target Reach, On-Target Imprs, " \
    "Total Reach, Total Imprs, Products"

  response.reach_curve.reach_forecasts.each do |point|
    products = ""
    point.planned_product_reach_forecasts.each do |product|
      products += "(Product: #{product.plannable_product_code}, "\
        "Cost Micros: #{product.cost_micros})"
    end
    puts "#{currency_code}, #{point.cost_micros}, " \
      "#{point.forecast.on_target_reach}, " \
      "#{point.forecast.on_target_impressions}, " \
      "#{point.forecast.total_reach}, " \
      "#{point.forecast.total_impressions}, " \
      "#{products}"
  end
end

# Gets a forecast for product mix created manually.
def forecast_manual_mix(client, reach_plan_service, customer_id)
  # Set up a ratio to split the budget between two products.
  trueview_allocation = 0.15
  bumper_allocation = 1 - trueview_allocation

  # See listPlannableProducts on ReachPlanService to retrieve a list
  # of valid PlannableProductCode's for a given location:
  # https://developers.google.com/google-ads/api/reference/rpc/latest/ReachPlanService
  product_mix = []

  product_mix << client.resource.planned_product do |p|
    p.plannable_product_code = 'TRUEVIEW_IN_STREAM'
    p.budget_micros = BUDGET_MICROS * trueview_allocation
  end

  product_mix << client.resource.planned_product do |p|
    p.plannable_product_code = 'BUMPER'
    p.budget_micros = BUDGET_MICROS * bumper_allocation
  end

  get_reach_curve(
    client,
    reach_plan_service,
    customer_id,
    product_mix,
    LOCATION_ID,
    CURRENCY_CODE,
  )
end

# Gets a forecast for a product mix based on your set of preferences.
def forecast_suggested_mix(client, reach_plan_service, customer_id)
  preferences = client.resource.preferences do |p|
    p.has_guaranteed_price = true
    p.starts_with_sound = true
    p.is_skippable = false
    p.top_content_only = true
    p.ad_length = :FIFTEEN_OR_TWENTY_SECONDS
  end

  mix_response = reach_plan_service.generate_product_mix_ideas(
    customer_id: customer_id,
    plannable_location_id: LOCATION_ID,
    currency_code: CURRENCY_CODE,
    budget_micros: BUDGET_MICROS,
    preferences: preferences,
  )

  product_mix = []
  mix_response.product_allocation.each do |product|
    product_mix << client.resource.planned_product do |pp|
      pp.plannable_product_code = product.plannable_product_code
      pp.budget_micros = product.budget_micros
    end
  end

  get_reach_curve(
    client,
    reach_plan_service,
    customer_id,
    product_mix,
    LOCATION_ID,
    CURRENCY_CODE,
  )
end

if __FILE__ == $0
  CUSTOMER_ID = 'INSERT_CUSTOMER_ID_HERE';
  CURRENCY_CODE = 'USD';
  # You can get a valid location ID from
  # https://developers.google.com/adwords/api/docs/appendix/geotargeting
  # or by calling list_plannable_locations on the reach_plan service.
  LOCATION_ID = '2840'; # US
  BUDGET_MICROS = 5_000_000; # 5

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
    forecast_reach(options.fetch(:customer_id).tr("-", ""))
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
