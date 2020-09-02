#!/usr/bin/env ruby
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
# This example adds a Gmail ad to a given ad group. The ad group's campaign
# needs to have an AdvertisingChannelType of DISPLAY and
# AdvertisingChannelSubType of DISPLAY_GMAIL_AD. To get ad groups, run
# get_ad_groups.rb.

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'

def add_gmail_ad(customer_id, campaign_id, ad_group_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  logo_image_bytes, logo_image_content_type = get_image(
    "https://goo.gl/mtt54n"
  )
  marketing_image_bytes, marketing_image_content_type = get_image(
    "http://goo.gl/3b9Wfh"
  )

  if logo_image_content_type != "image/png"
    raise "got bad logo image type back"
  end

  if marketing_image_content_type != "image/jpeg"
    raise "got bad marketing image type back"
  end

  media_file_logo = client.resource.media_file do |mf|
    mf.type = :IMAGE
    mf.image = client.resource.media_image do |mi|
      mi.data = logo_image_bytes
    end
    mf.mime_type = :IMAGE_PNG
  end

  media_file_logo_op = client.operation.create_resource.media_file(media_file_logo)

  media_file_marketing = client.resource.media_file do |mf|
    mf.type = :IMAGE
    mf.image = client.resource.media_image do |mi|
    mi.data = marketing_image_bytes
    end
    mf.mime_type = :IMAGE_JPEG
  end

  media_file_marketing_image_op = client.operation.create_resource.media_file(media_file_marketing)

  response = client.service.media_file.mutate_media_files(
    customer_id: customer_id,
    operations: [
      media_file_logo_op,
      media_file_marketing_image_op,
    ]
  )

  logo_id, marketing_image_id = response.results.to_a.map(&:resource_name)

  gmail_ad = client.resource.gmail_ad_info do |gmail_ad|
    gmail_ad.teaser = client.resource.gmail_teaser do |teaser|
      teaser.headline = "Dream"
      teaser.description = "Create your own adventure"

      teaser.business_name = "Interplanetary Ships"
      teaser.logo_image = logo_id
    end

    gmail_ad.marketing_image = marketing_image_id
    gmail_ad.marketing_image_headline = "Travel"
    gmail_ad.marketing_image_description = "Take to the skies!"
  end

  ad = client.resource.ad do |ad|
    ad.final_urls << "http://www.example.com"
    ad.gmail_ad = gmail_ad
    ad.name = "Gmail Ad #{(Time.now.to_f * 1000).to_i}"
  end

  ad_group_ad = client.resource.ad_group_ad do |aga|
    aga.ad = ad
    aga.status = :PAUSED
    aga.ad_group = client.path.ad_group(customer_id, ad_group_id)

  end

  op = client.operation.create_resource.ad_group_ad(ad_group_ad)

  response = client.service.ad_group_ad.mutate_ad_group_ads(
    customer_id: customer_id,
    operations: [op]
  )
  puts "Created Gmail Ad with ID #{response.results.first.resource_name}."
end

def get_image(url)
  open(url) { |f|
    [f.read, f.content_type]
  }
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
  options[:ad_group_id] = 'INSERT_AD_GROUP_ID_HERE'

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
    add_gmail_ad(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:campaign_id),
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
