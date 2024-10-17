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
# Tests the PathLookupUtil class.

require 'minitest/autorun'

require 'google/ads/google_ads'
require 'google/ads/google_ads/utils/v18/path_lookup_util'

class TestPathLookupUtil < Minitest::Test
  def test_basic_path_lookups
    util = Google::Ads::GoogleAds::Utils::V18::PathLookupUtil.new

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

		expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567~890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))
  end

  def test_malformed_path_input
    util = Google::Ads::GoogleAds::Utils::V18::PathLookupUtil.new

    assert_raises ArgumentError do
      util.campaign(nil, nil)
    end
  end
end
