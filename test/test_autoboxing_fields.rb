#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
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

require 'minitest/autorun'

require 'google/ads/google_ads'
require 'google/ads/google_ads/v6/resources/campaign_pb'
require 'google/ads/google_ads/v6/resources/ad_pb'

class TestAutoboxing < Minitest::Test
  def test_initialize
    Google::Ads::GoogleAds::V6::Resources::Campaign.new(name: "hi")

    c = Google::Ads::GoogleAds::V6::Resources::Campaign.new(name: "hi")
    assert_equal "hi", c.name

    c = Google::Ads::GoogleAds::V6::Resources::Campaign.new
    assert_empty '', c.name
  end

  def test_assign
    c = Google::Ads::GoogleAds::V6::Resources::Campaign.new
    c.name = "hi"
    c.id = 3

    c.name = ''
    assert_empty c.name

    c.name = 'hi'
    assert_equal 'hi', c.name

    c.id = 5
    assert_equal 5, c.id
  end

  def test_repeated_fields
    ad = Google::Ads::GoogleAds::V6::Resources::Ad.new
    ad.final_urls << "hi"

    ad = Google::Ads::GoogleAds::V6::Resources::Ad.new(final_urls: ["hi"])
  end

  def test_nested_decoded_fields
    campaign = Google::Ads::GoogleAds::V6::Resources::Campaign.new
    campaign.dynamic_search_ads_setting = Google::Ads::GoogleAds::V6::Resources::Campaign::DynamicSearchAdsSetting.new
    encoded = campaign.class.encode(campaign)
    campaign = campaign.class.decode(encoded)
    campaign.dynamic_search_ads_setting.feeds << "bees"
  end

  def test_new_version_excludes_autoboxing
    campaign = Google::Ads::GoogleAds::V6::Resources::Campaign.new
    assert_nil Google::Ads::GoogleAds::V6::Resources::Campaign
      .instance_variable_get(:@_patched_for_autoboxing_fields)
  end
end
