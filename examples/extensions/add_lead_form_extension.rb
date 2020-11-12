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
# Creates a lead form and a lead form extension for a campaign.
#
# Run add_campaigns.rb to create a campaign.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_lead_form_extension(customer_id, campaign_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  lead_form_asset = create_lead_form_asset(
    client,
    customer_id,
  )

  create_lead_form_extension(
    client,
    customer_id,
    campaign_id,
    lead_form_asset,
  )
end

def create_lead_form_asset(client, customer_id)
  operation = client.operation.create_resource.asset do |a|
    a.name = "Interplanetary Cruise #{(Time.new.to_f * 1000).to_i} Lead Form"
    a.final_urls << "http://example.com/jupiter"

    a.lead_form_asset = client.resource.lead_form_asset do |lfa|
      lfa.call_to_action_type = :BOOK_NOW
      lfa.call_to_action_description = "Latest trip to Jupiter!"

      lfa.business_name = "Interplanetary Cruise"
      lfa.headline = "Trip to Jupiter"
      lfa.description = "Our latest trip to Jupiter is now open for booking."
      lfa.privacy_policy_url = "http://example.com/privacy"

      lfa.fields << client.resource.lead_form_field do |lff|
        lff.input_type = :FULL_NAME
      end
      lfa.fields << client.resource.lead_form_field do |lff|
        lff.input_type = :EMAIL
      end
      lfa.fields << client.resource.lead_form_field do |lff|
        lff.input_type = :PHONE_NUMBER
      end
      lfa.fields << client.resource.lead_form_field do |lff|
        lff.input_type = :PREFERRED_CONTACT_TIME
        lff.single_choice_answers = client.resource.lead_form_single_choice_answers do |sca|
          sca.answers += ["Before 9 AM", "Anytime", "After 5 PM"]
        end
      end

      # Optional: You can also specify a background image asset.
      # To upload an asset, see misc/upload_image_asset.rb.
      # lfa.background_image_asset = "INSERT_IMAGE_ASSET_HERE"

      # Optional: Define the response page after the user signs up on the form.
      lfa.post_submit_headline = "Thanks for signing up!"
      lfa.post_submit_description = "We will reach out to you shortly. " \
        "Visit our website to see past trip details."
      lfa.post_submit_call_to_action_type = :VISIT_SITE

      # Optional
      # lfa.custom_disclosure = "Trip may get cancelled due to meteor shower."

      # Optional: Define a delivery method for the form response. See
      # https://developers.google.com/google-ads/webhook/docs/overview for more
      # details on how to define a webhook.
      lfa.delivery_methods << client.resource.lead_form_delivery_method do |lfdm|
        lfdm.webhook = client.resource.webhook_delivery do |wd|
          wd.advertiser_webhook_url = "http://example.com/webhook"
          wd.google_secret = "interplanetary google secret"
          wd.payload_schema_version = 3
        end
      end
    end
  end

  response = client.service.asset.mutate_assets(
    customer_id: customer_id,
    operations: [operation],
  )
  asset_name = response.results.first.resource_name

  puts "Asset with resource name #{asset_name} was created."
  asset_name
end

def create_lead_form_extension(client, customer_id, campaign_id, lead_form_asset)
  operation = client.operation.create_resource.campaign_asset do |ca|
    ca.asset = lead_form_asset
    ca.field_type = :LEAD_FORM
    ca.campaign = client.path.campaign(customer_id, campaign_id)
  end

  response = client.service.campaign_asset.mutate_campaign_assets(
    customer_id: customer_id,
    operations: [operation],
  )

  puts "Created campaign asset #{response.results.first.resource_name} for " \
    "campaign #{campaign_id}."
end

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
  options[:campaign_id] = 'INSERT_CAMPAIGN_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--campaign-id CAMPAIGN-ID', String, 'Campaign ID') do |v|
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
    add_lead_form_extension(
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
