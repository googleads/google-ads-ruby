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

require 'google/ads/google_ads/proto_lookup_util'
require 'google/ads/google_ads/path_lookup_util'


class TestPathLookupUtil < Minitest::Test
  def test_path_generation()
    util = Google::Ads::GoogleAds::PathLookupUtil.new(
        Google::Ads::GoogleAds::ProtoLookupUtil.new(:V0))

    expected = 'customers/1234/accountBudgetProposals/5678'
    assert_equal(expected, util.account_budget_proposal(1234, 5678))

    expected = 'customers/1234/accountBudgets/5678'
    assert_equal(expected, util.account_budget(1234, 5678))

    expected = 'customers/1234/adGroupAds/567_890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupAudienceViews/567_890'
    assert_equal(expected, util.ad_group_audience_view(1234, 567, 890))

    expected = 'customers/1234/adGroupBidModifiers/567_890'
    assert_equal(expected, util.ad_group_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/adGroupCriteria/567_890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/ageRangeViews/567_890'
    assert_equal(expected, util.age_range_view(1234, 567, 890))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/billingSetups/5678'
    assert_equal(expected, util.billing_setup(1234, 5678))

    expected = 'customers/1234/campaignBidModifiers/5678'
    assert_equal(expected, util.campaign_bid_modifier(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567_890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaignGroups/5678'
    assert_equal(expected, util.campaign_group(1234, 5678))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'customers/1234/campaignSharedSets/5678'
    assert_equal(expected, util.campaign_shared_set(1234, 5678))

    expected = 'customers/1234/changeStatus/5678'
    assert_equal(expected, util.change_status(1234, 5678))

    expected = 'customers/1234/conversionActions/5678'
    assert_equal(expected, util.conversion_action(1234,5678))

    expected = 'customers/1234/customerClientLinks/567_890'
    assert_equal(expected, util.customer_client_link(1234, 567, 890))

    expected = 'customers/1234/customerManagerLinks/567_890'
    assert_equal(expected, util.customer_manager_link(1234, 567, 890))

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

    expected = 'customers/1234/displayKeywordViews/567_890'
    assert_equal(expected, util.display_keyword_view(1234, 567, 890))

    expected = 'geoTargetConstants/123456'
    assert_equal(expected, util.geo_target_constant(123456))

    expected = 'googleAdsFields/test_field'
    assert_equal(expected, util.google_ads_field('test_field'))

    expected = 'customers/1234/hotelGroupViews/567_890'
    assert_equal(expected, util.hotel_group_view(1234, 567, 890))

    expected = 'customers/1234/keywordViews/567_890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))

    expected = 'customers/1234/managedPlacementViews/567_890'
    assert_equal(expected, util.managed_placement_view(1234, 567, 890))

    expected = 'customers/1234/mediaFiles/5678'
    assert_equal(expected, util.media_file(1234, 5678))

    expected = 'customers/1234/parentalStatusViews/567_890'
    assert_equal(expected, util.parental_status_view(1234, 567, 890))

    expected = 'customers/1234/productGroupViews/567_890'
    assert_equal(expected, util.product_group_view(1234, 567, 890))

    expected = 'customers/1234/recommendations/5678'
    assert_equal(expected, util.recommendation(1234, 5678))

    expected = 'customers/1234/sharedCriteria/567_890'
    assert_equal(expected, util.shared_criterion(1234, 567, 890))

    expected = 'customers/1234/sharedSets/5678'
    assert_equal(expected, util.shared_set(1234, 5678))

    expected = 'topicConstants/123456'
    assert_equal(expected, util.topic_constant(123456))

    expected = 'customers/1234/topicViews/567_890'
    assert_equal(expected, util.topic_view(1234, 567, 890))

    expected = 'customers/1234/videos/5678'
    assert_equal(expected, util.video(1234, 5678))
  end

  def test_malformed_path_input()
    util = Google::Ads::GoogleAds::PathLookupUtil.new(
        Google::Ads::GoogleAds::ProtoLookupUtil.new(:V0))

    assert_raises RuntimeError do
      util.campaign(nil, nil)
    end
  end
end
