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
# Tests the WrapperUtil class.

require 'minitest/autorun'

require 'google/ads/google_ads'
require 'google/ads/google_ads/wrapper_util'

class TestGoogleAdsClient < Minitest::Test
  def test_protobuf_shortcuts()
    string = Google::Ads::GoogleAds::WrapperUtil.string('test string')
    assert_instance_of(Google::Protobuf::StringValue, string)
    assert_equal('test string', string.value)

    int32 = Google::Ads::GoogleAds::WrapperUtil.int32(12)
    assert_instance_of(Google::Protobuf::Int32Value, int32)
    assert_equal(12, int32.value)

    int64 = Google::Ads::GoogleAds::WrapperUtil.int64(9876543210)
    assert_instance_of(Google::Protobuf::Int64Value, int64)
    assert_equal(9876543210, int64.value)

    bool = Google::Ads::GoogleAds::WrapperUtil.bool(false)
    assert_instance_of(Google::Protobuf::BoolValue, bool)
    assert_equal(false, bool.value)

    double = Google::Ads::GoogleAds::WrapperUtil.double(3.1415)
    assert_instance_of(Google::Protobuf::DoubleValue, double)
    assert_equal(3.1415, double.value)
  end

  def test_from_client()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    string = client.wrapper.string('test string')
    assert_instance_of(Google::Protobuf::StringValue, string)
    assert_equal('test string', string.value)
  end
end
