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

require 'google/ads/google_ads/utils/v1/proto_lookup_util'
require 'google/ads/google_ads/utils/v1/path_lookup_util'


class TestPathLookupUtil < Minitest::Test
  def test_path_generation()
    util = Google::Ads::GoogleAds::Utils::V1::PathLookupUtil.new(
        Google::Ads::GoogleAds::Utils::V1::ProtoLookupUtil.new())

    expected = 'customers/1234/accountBudgetProposals/5678'
    assert_equal(expected, util.account_budget_proposal(1234, 5678))

    expected = 'customers/1234/accountBudgets/5678'
    assert_equal(expected, util.account_budget(1234, 5678))

    expected = 'customers/1234/adGroupAdLabels/56~78~90'
    assert_equal(expected, util.ad_group_ad_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAds/567~890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupAudienceViews/567~890'
    assert_equal(expected, util.ad_group_audience_view(1234, 567, 890))

    expected = 'customers/1234/adGroupBidModifiers/567~890'
    assert_equal(expected, util.ad_group_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionLabels/56~78~90'
    assert_equal(expected, util.ad_group_criterion_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupCriteria/567~890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroupExtensionSettings/567~890'
    assert_equal(expected, util.ad_group_extension_setting(1234, 567, 890))

    expected = 'customers/1234/adGroupFeeds/567~890'
    assert_equal(expected, util.ad_group_feed(1234, 567, 890))

    expected = 'customers/1234/adGroupLabels/567~890'
    assert_equal(expected, util.ad_group_label(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/adParameters/56~78~90'
    assert_equal(expected, util.ad_parameter(1234, 56, 78, 90))

    expected = 'customers/1234/adScheduleViews/567~890'
    assert_equal(expected, util.ad_schedule_view(1234, 567, 890))

    expected = 'customers/1234/ageRangeViews/567~890'
    assert_equal(expected, util.age_range_view(1234, 567, 890))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/billingSetups/5678'
    assert_equal(expected, util.billing_setup(1234, 5678))

    expected = 'customers/1234/campaignAudienceViews/567~890'
    assert_equal(expected, util.campaign_audience_view(1234, 567, 890))

    expected = 'customers/1234/campaignBidModifiers/5678'
    assert_equal(expected, util.campaign_bid_modifier(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567~890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaignExtensionSettings/567~890'
    assert_equal(expected, util.campaign_extension_setting(1234, 567, 890))

    expected = 'customers/1234/campaignFeeds/567~890'
    assert_equal(expected, util.campaign_feed(1234, 567, 890))

    expected = 'customers/1234/campaignLabels/567~890'
    assert_equal(expected, util.campaign_label(1234, 567, 890))

    expected = 'customers/1234/campaignSharedSets/5678'
    assert_equal(expected, util.campaign_shared_set(1234, 5678))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'carrierConstants/123456'
    assert_equal(expected, util.carrier_constant(123456))

    expected = 'customers/1234/changeStatus/5678'
    assert_equal(expected, util.change_status(1234, 5678))

    expected = 'customers/1234/clickViews/567~890'
    assert_equal(expected, util.click_view(1234, 567, 890))

    expected = 'customers/1234/conversionActions/5678'
    assert_equal(expected, util.conversion_action(1234, 5678))

    expected = 'customers/1234/customInterests/5678'
    assert_equal(expected, util.custom_interest(1234, 5678))

    expected = 'customers/1234/customerClientLinks/567~890'
    assert_equal(expected, util.customer_client_link(1234, 567, 890))

    expected = 'customers/1234/customerClients/5678'
    assert_equal(expected, util.customer_client(1234, 5678))

    expected = 'customers/1234/customerExtensionSettings/5678'
    assert_equal(expected, util.customer_extension_setting(1234, 5678))

    expected = 'customers/1234/customerFeeds/5678'
    assert_equal(expected, util.customer_feed(1234, 5678))

    expected = 'customers/1234/customerLabels/5678'
    assert_equal(expected, util.customer_label(1234, 5678))

    expected = 'customers/1234/customerManagerLinks/567~890'
    assert_equal(expected, util.customer_manager_link(1234, 567, 890))

    expected = 'customers/1234/customerNegativeCriteria/5678'
    assert_equal(expected, util.customer_negative_criterion(1234, 5678))

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

    expected = 'customers/1234/detailPlacementViews/567~890'
    assert_equal(expected, util.detail_placement_view(1234, 567, 890))

    expected = 'customers/1234/displayKeywordViews/567~890'
    assert_equal(expected, util.display_keyword_view(1234, 567, 890))

    expected = 'customers/1234/domainCategories/56~78~90'
    assert_equal(expected, util.domain_category(1234, 56, 78, 90))

    expected = 'customers/1234/dynamicSearchAdsSearchTermViews/5~6~7~8~9'
    assert_equal(expected, util.dynamic_search_ads_search_term_view(1234, 5, 6,
        7, 8, 9))

    expected = 'customers/1234/extensionFeedItems/5678'
    assert_equal(expected, util.extension_feed_item(1234, 5678))

    expected = 'customers/1234/feedItems/567~890'
    assert_equal(expected, util.feed_item(1234, 567, 890))

    expected = 'customers/1234/feedItemTargets/5~6~7~8'
    assert_equal(expected, util.feed_item_target(1234, 5, 6, 7, 8))

    expected = 'customers/1234/feedMappings/567~890'
    assert_equal(expected, util.feed_mapping(1234, 567, 890))

    expected = 'customers/1234/feedPlaceholderViews/5678'
    assert_equal(expected, util.feed_placeholder_view(1234, 5678))

    expected = 'customers/1234/feeds/5678'
    assert_equal(expected, util.feed(1234, 5678))

    expected = 'geoTargetConstants/123456'
    assert_equal(expected, util.geo_target_constant(123456))

    expected = 'customers/1234/geographicViews/567~890'
    assert_equal(expected, util.geographic_view(1234, 567, 890))

    expected = 'googleAdsFields/test_field'
    assert_equal(expected, util.google_ads_field('test_field'))

    expected = 'customers/1234/groupPlacementViews/567~890'
    assert_equal(expected, util.group_placement_view(1234, 567, 890))

    expected = 'customers/1234/hotelGroupViews/567~890'
    assert_equal(expected, util.hotel_group_view(1234, 567, 890))

    expected = 'customers/123456/hotelPerformanceView'
    assert_equal(expected, util.hotel_performance_view(123456))

    expected = 'customers/1234/keywordPlanAdGroups/5678'
    assert_equal(expected, util.keyword_plan_ad_group(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaigns/5678'
    assert_equal(expected, util.keyword_plan_campaign(1234, 5678))

    expected = 'customers/1234/keywordPlanKeywords/5678'
    assert_equal(expected, util.keyword_plan_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlanNegativeKeywords/5678'
    assert_equal(expected, util.keyword_plan_negative_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlans/5678'
    assert_equal(expected, util.keyword_plan(1234, 5678))

    expected = 'customers/1234/keywordViews/567~890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))

    expected = 'customers/1234/labels/5678'
    assert_equal(expected, util.label(1234, 5678))

    expected = 'languageConstants/123456'
    assert_equal(expected, util.language_constant(123456))

    expected = 'customers/1234/locationViews/567~890'
    assert_equal(expected, util.location_view(1234, 567, 890))

    expected = 'customers/1234/managedPlacementViews/567~890'
    assert_equal(expected, util.managed_placement_view(1234, 567, 890))

    expected = 'customers/1234/mediaFiles/5678'
    assert_equal(expected, util.media_file(1234, 5678))

    expected = 'customers/1234/merchantCenterLinks/5678'
    assert_equal(expected, util.merchant_center_link(1234, 5678))

    expected = 'mobileAppCategoryConstants/123456'
    assert_equal(expected, util.mobile_app_category_constant(123456))

    expected = 'mobileDeviceConstants/123456'
    assert_equal(expected, util.mobile_device_constant(123456))

    expected = 'customers/1234/mutateJobs/5678'
    assert_equal(expected, util.mutate_job(1234, 5678))

    expected = 'operatingSystemVersionConstants/123456'
    assert_equal(expected, util.operating_system_version_constant(123456))

    expected = 'customers/1234/parentalStatusViews/567~890'
    assert_equal(expected, util.parental_status_view(1234, 567, 890))

    expected = 'productBiddingCategoryConstants/123~456~789'
    assert_equal(expected, util.product_bidding_category_constant(123, 456,
        789))

    expected = 'customers/1234/productGroupViews/567~890'
    assert_equal(expected, util.product_group_view(1234, 567, 890))

    expected = 'customers/1234/recommendations/5678'
    assert_equal(expected, util.recommendation(1234, 5678))

    expected = 'customers/1234/remarketingActions/5678'
    assert_equal(expected, util.remarketing_action(1234, 5678))

    expected = 'customers/1234/searchTermViews/56~78~90'
    assert_equal(expected, util.search_term_view(1234, 56, 78, 90))

    expected = 'customers/1234/sharedCriteria/567~890'
    assert_equal(expected, util.shared_criterion(1234, 567, 890))

    expected = 'customers/1234/sharedSets/5678'
    assert_equal(expected, util.shared_set(1234, 5678))

    expected = 'customers/1234/shoppingPerformanceView'
    assert_equal(expected, util.shopping_performance_view(1234))

    expected = 'topicConstants/123456'
    assert_equal(expected, util.topic_constant(123456))

    expected = 'customers/1234/topicViews/567~890'
    assert_equal(expected, util.topic_view(1234, 567, 890))

    expected = 'customers/1234/userInterests/5678'
    assert_equal(expected, util.user_interest(1234, 5678))

    expected = 'customers/1234/userLists/5678'
    assert_equal(expected, util.user_list(1234, 5678))

    expected = 'customers/1234/videos/5678'
    assert_equal(expected, util.video(1234, 5678))
  end

  def test_malformed_path_input()
    util = Google::Ads::GoogleAds::Utils::V1::PathLookupUtil.new(
        Google::Ads::GoogleAds::Utils::V1::ProtoLookupUtil.new())

    assert_raises RuntimeError do
      util.campaign(nil, nil)
    end
  end
end
