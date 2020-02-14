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
# Tests the Errors class.

require 'minitest/autorun'

require 'google/ads/google_ads'
require 'google/ads/google_ads/errors'

class TestErrors < Minitest::Test

  def test_error_index
    error = build_error
    index = Google::Ads::GoogleAds::Errors.index(error)

    assert_equal(1, index)
  end

  def test_message
    error = build_error
    message = Google::Ads::GoogleAds::Errors.message(error)

    assert_equal('amount_micros - Too low.', message)
  end

  def test_code
    error = build_error
    error_code = Google::Ads::GoogleAds::Errors.code(error)

    assert_equal({
      name: 'range_error',
      value: :TOO_LOW
    }, error_code)
  end

  def test_blank_code
    error = build_error
    error.error_code = Google::Ads::GoogleAds::V3::Errors::ErrorCode.new
    error_code = Google::Ads::GoogleAds::Errors.code(error)

    assert_equal({}, error_code)
  end

  def test_inspect
    error = build_error
    error_code = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(error)

    expected = "#<#{error_code.class.name}: #{error_code.object_id} #{error.inspect}>"
    assert_equal(expected, error_code.inspect)
  end

  def build_error
    Google::Ads::GoogleAds::V3::Errors::GoogleAdsError.new.tap do |error|
      location = Google::Ads::GoogleAds::V3::Errors::ErrorLocation.new
      path1 = Google::Ads::GoogleAds::V3::Errors::ErrorLocation::FieldPathElement.new
      path1.field_name = 'operations'
      path1.index = Google::Protobuf::Int64Value.new(value: 1)
      path2 = Google::Ads::GoogleAds::V3::Errors::ErrorLocation::FieldPathElement.new
      path2.field_name = 'create'
      path3 = Google::Ads::GoogleAds::V3::Errors::ErrorLocation::FieldPathElement.new
      path3.field_name = 'amount_micros'
      error_code = Google::Ads::GoogleAds::V3::Errors::ErrorCode.new
      error_code.range_error = :TOO_LOW
      location.field_path_elements.push path1
      location.field_path_elements.push path2
      location.field_path_elements.push path3
      error.location = location
      error.error_code = error_code
      error.message = "Too low."
    end
  end
end
