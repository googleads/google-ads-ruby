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

require 'google/ads/googleads/proto_lookup_util'
require 'google/ads/googleads/path_lookup_util'


class TestPathLookupUtil < Minitest::Test
  def test_path_generation()
    util = Google::Ads::Googleads::PathLookupUtil.new(
        Google::Ads::Googleads::ProtoLookupUtil.new(:V0))

    expected = 'customers/1234/adGroupAds/567_890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupCriteria/567_890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567_890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

    expected = 'googleAdsFields/test_field'
    assert_equal(expected, util.google_ads_field('test_field'))

    expected = 'customers/1234/keywordViews/567_890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))
  end

  def test_malformed_path_input()
    util = Google::Ads::Googleads::PathLookupUtil.new(
        Google::Ads::Googleads::ProtoLookupUtil.new(:V0))

    assert_raises RuntimeError do
      util.campaign(nil, nil)
    end
  end
end
