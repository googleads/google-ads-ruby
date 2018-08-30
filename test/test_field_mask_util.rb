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
require 'google/ads/googleads'
require 'google/ads/googleads/field_mask_util'
require 'google/ads/googleads/v0/resources/campaign_pb'
require 'google/ads/googleads/v0/resources/ad_pb'

class TestFieldMaskUtil < Minitest::Test
  def test_change_from_previous_value()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new
    test_object.name = Google::Protobuf::StringValue.new(value: 'test name')
    test_object.id = Google::Protobuf::Int64Value.new(value: 1234)

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.name = Google::Protobuf::StringValue.new(value: 'new string')
      test_object.id = Google::Protobuf::Int64Value.new(value: 5678)
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_from_client()
    client = Google::Ads::Googleads::GoogleadsClient.new() do |config|
      # No setup.
    end

    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new
    test_object.name = Google::Protobuf::StringValue.new(value: 'test name')
    test_object.id = Google::Protobuf::Int64Value.new(value: 1234)

    mask = client.field_mask.with test_object do
      test_object.name = Google::Protobuf::StringValue.new(value: 'new string')
      test_object.id = Google::Protobuf::Int64Value.new(value: 5678)
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_from_no_value()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.name = Google::Protobuf::StringValue.new(value: 'new string')
      test_object.id = Google::Protobuf::Int64Value.new(value: 5678)
    end

    assert_includes(mask.paths, 'id')
    assert_includes(mask.paths, 'name')
  end

  def test_change_to_null_value()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new

    test_object.name = Google::Protobuf::StringValue.new(value: 'test name')

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.name = nil
    end

    assert_includes(mask.paths, 'name')
  end

  def test_no_change_to_value()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new

    test_name = 'test name'
    test_object.name = Google::Protobuf::StringValue.new(value: test_name)

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.name = Google::Protobuf::StringValue.new(value: test_name)
    end

    assert(!mask.paths.include?('name'))
  end

  def test_repeated_field_addition()
    test_object = Google::Ads::Googleads::V0::Resources::Ad.new

    test_object.final_urls << Google::Protobuf::StringValue.new(value: 'url 1')

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.final_urls <<
          Google::Protobuf::StringValue.new(value: 'url 2')
    end

    assert_includes(mask.paths, 'final_urls')
  end

  def test_repeated_field_removal()
    test_object = Google::Ads::Googleads::V0::Resources::Ad.new

    test_object.final_urls << Google::Protobuf::StringValue.new(value: 'url 1')

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.final_urls.pop
    end

    assert_includes(mask.paths, 'final_urls')
  end

  def test_nested_field_changed()
    test_object = Google::Ads::Googleads::V0::Resources::Ad.new

    text_ad = Google::Ads::Googleads::V0::Common::TextAdInfo.new
    text_ad.headline = Google::Protobuf::StringValue.new(value: 'headline')
    test_object.text_ad = text_ad

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      new_text_ad = Google::Ads::Googleads::V0::Common::TextAdInfo.new
      new_text_ad.headline =
          Google::Protobuf::StringValue.new(value: 'new headline')
      test_object.text_ad = new_text_ad
    end

    assert_includes(mask.paths, 'text_ad.headline')
  end

  def test_nested_field_unchanged()
    test_object = Google::Ads::Googleads::V0::Resources::Ad.new

    text_ad = Google::Ads::Googleads::V0::Common::TextAdInfo.new
    text_ad.headline = Google::Protobuf::StringValue.new(value: 'headline')
    test_object.text_ad = text_ad

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      new_text_ad = Google::Ads::Googleads::V0::Common::TextAdInfo.new
      new_text_ad.headline =
          Google::Protobuf::StringValue.new(value: 'headline')
      test_object.text_ad = new_text_ad
    end

    assert(!mask.paths.include?('text_ad.headline'))
  end

  def test_nested_fields_for_update_from_nil()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new
    test_object.name = Google::Protobuf::StringValue.new(value: 'Name')

    nested_object =
        Google::Ads::Googleads::V0::Resources::Campaign::NetworkSettings.new
    nested_object.target_search_network =
        Google::Protobuf::BoolValue.new(value: true)
    test_object.network_settings = nested_object

    mask = Google::Ads::Googleads::FieldMaskUtil.all_set_fields_of(test_object)

    assert_equal(
      ['name', 'network_settings.target_search_network'],
      mask.paths
    )
  end

  def test_nested_fields_for_update()
    test_object = Google::Ads::Googleads::V0::Resources::Campaign.new

    mask = Google::Ads::Googleads::FieldMaskUtil.with test_object do
      test_object.name = Google::Protobuf::StringValue.new(value: 'Name')

      nested_object =
          Google::Ads::Googleads::V0::Resources::Campaign::NetworkSettings.new
      nested_object.target_search_network =
          Google::Protobuf::BoolValue.new(value: true)
      test_object.network_settings = nested_object
    end

    assert_equal(
      ['name', 'network_settings.target_search_network'],
      mask.paths
    )
  end
end
