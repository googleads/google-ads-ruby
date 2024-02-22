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
#
# Tests the FieldMaskUtil class.

require 'minitest/autorun'

require 'google/protobuf/wrappers_pb'
require 'google/ads/google_ads'
require 'google/ads/google_ads/field_mask_util'
require 'google/ads/google_ads/v16/resources/campaign_pb'
require 'google/ads/google_ads/v16/resources/ad_pb'

class TestFieldMaskUtil < Minitest::Test
  def test_change_from_previous_value()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new
    test_object.name = 'test name'
    test_object.id = 1234

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.name = 'new string'
      test_object.id = 5678
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_from_client()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      # No setup.
    end

    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new
    test_object.name = 'test name'
    test_object.id = 1234

    mask = client.field_mask.with test_object do
      test_object.name = 'new string'
      test_object.id = 5678
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_from_no_value()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.name = 'new string'
      test_object.id = 5678
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_to_null_value()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new

    test_object.network_settings = Google::Ads::GoogleAds::V16::Resources::Campaign::NetworkSettings.new

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.network_settings = nil
    end

    assert_includes(mask.paths, 'network_settings')
  end

  def test_no_change_to_value()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new

    test_name = 'test name'
    test_object.name = test_name

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.name = test_name
    end

    assert(!mask.paths.include?('name'))
  end

  def test_repeated_field_addition()
    test_object = Google::Ads::GoogleAds::V16::Resources::Ad.new

    test_object.final_urls << 'url 1'

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.final_urls << 'url 2'
    end

    assert_includes(mask.paths, 'final_urls')
  end

  def test_repeated_field_removal()
    test_object = Google::Ads::GoogleAds::V16::Resources::Ad.new

    test_object.final_urls << 'url 1'

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.final_urls.pop
    end

    assert_includes(mask.paths, 'final_urls')
  end

  def test_nested_field_changed()
    test_object = Google::Ads::GoogleAds::V16::Resources::Ad.new

    text_ad = Google::Ads::GoogleAds::V16::Common::TextAdInfo.new
    text_ad.headline = 'headline'
    test_object.text_ad = text_ad

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      new_text_ad = Google::Ads::GoogleAds::V16::Common::TextAdInfo.new
      new_text_ad.headline = 'new headline'
      test_object.text_ad = new_text_ad
    end

    assert_includes(mask.paths, 'text_ad.headline')
  end

  def test_nested_field_unchanged()
    test_object = Google::Ads::GoogleAds::V16::Resources::Ad.new

    text_ad = Google::Ads::GoogleAds::V16::Common::TextAdInfo.new
    text_ad.headline = 'headline'
    test_object.text_ad = text_ad

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      new_text_ad = Google::Ads::GoogleAds::V16::Common::TextAdInfo.new
      new_text_ad.headline = 'headline'
      test_object.text_ad = new_text_ad
    end

    assert(!mask.paths.include?('text_ad.headline'))
  end

  def test_nested_fields_for_update_from_nil()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new
    test_object.name = 'Name'

    nested_object =
        Google::Ads::GoogleAds::V16::Resources::Campaign::NetworkSettings.new
    nested_object.target_search_network = true
    test_object.network_settings = nested_object

    mask = Google::Ads::GoogleAds::FieldMaskUtil.all_set_fields_of(test_object)

    assert_equal(
      ['name', 'network_settings.target_search_network'],
      mask.paths.sort
    )
  end

  def test_nested_fields_for_update()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.name = 'Name'

      nested_object =
          Google::Ads::GoogleAds::V16::Resources::Campaign::NetworkSettings.new
      nested_object.target_search_network = true
      test_object.network_settings = nested_object
    end

    assert_equal(
      ['name', 'network_settings.target_search_network'],
      mask.paths.sort
    )
  end

  def test_empty_top_level_field()
    test_object = Google::Ads::GoogleAds::V16::Resources::Campaign.new

    mask = Google::Ads::GoogleAds::FieldMaskUtil.with test_object do
      test_object.maximize_conversions = Google::Ads::GoogleAds::V16::Common::MaximizeConversions.new
    end

    assert_equal(
      ['maximize_conversions'],
      mask.paths
    )
  end
end
