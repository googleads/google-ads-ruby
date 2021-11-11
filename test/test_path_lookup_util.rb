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
require 'google/ads/google_ads/utils/v7/path_lookup_util'
require 'google/ads/google_ads/utils/v8/path_lookup_util'
require 'google/ads/google_ads/utils/v9/path_lookup_util'

class TestPathLookupUtil < Minitest::Test
  def test_path_generation_v7()
    util = Google::Ads::GoogleAds::Utils::V7::PathLookupUtil.new

    expected = 'customers/1234/accountBudgetProposals/5678'
    assert_equal(expected, util.account_budget_proposal(1234, 5678))

    expected = 'customers/1234/accountBudgets/5678'
    assert_equal(expected, util.account_budget(1234, 5678))

    expected = 'customers/1234/accountLinks/5678'
    assert_equal(expected, util.account_link(1234, 5678))

    expected = 'customers/1234/adGroupAdLabels/56~78~90'
    assert_equal(expected, util.ad_group_ad_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAds/567~890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupAssets/56~78~90'
    assert_equal(expected, util.ad_group_asset(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAudienceViews/567~890'
    assert_equal(expected, util.ad_group_audience_view(1234, 567, 890))

    expected = 'customers/1234/adGroupBidModifiers/567~890'
    assert_equal(expected, util.ad_group_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionLabels/56~78~90'
    assert_equal(expected, util.ad_group_criterion_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupCriteria/567~890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.ad_group_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/adGroupExtensionSettings/567~890'
    assert_equal(expected, util.ad_group_extension_setting(1234, 567, 890))

    expected = 'customers/1234/adGroupFeeds/567~890'
    assert_equal(expected, util.ad_group_feed(1234, 567, 890))

    expected = 'customers/1234/adGroupLabels/567~890'
    assert_equal(expected, util.ad_group_label(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/adGroupSimulations/5~6~7~8~9'
    assert_equal(expected, util.ad_group_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/adParameters/56~78~90'
    assert_equal(expected, util.ad_parameter(1234, 56, 78, 90))

    expected = 'customers/1234/adScheduleViews/567~890'
    assert_equal(expected, util.ad_schedule_view(1234, 567, 890))

    expected = 'customers/1234/ageRangeViews/567~890'
    assert_equal(expected, util.age_range_view(1234, 567, 890))

    expected = 'customers/1234/assets/5678'
    assert_equal(expected, util.asset(1234, 5678))

    expected = 'customers/1234/batchJobs/5678'
    assert_equal(expected, util.batch_job(1234, 5678))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/biddingStrategySimulations/5~6~7~8~9'
    assert_equal(expected, util.bidding_strategy_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/billingSetups/5678'
    assert_equal(expected, util.billing_setup(1234, 5678))

    expected = 'customers/1234/campaignAssets/56~78~90'
    assert_equal(expected, util.campaign_asset(1234, 56, 78, 90))

    expected = 'customers/1234/campaignAudienceViews/567~890'
    assert_equal(expected, util.campaign_audience_view(1234, 567, 890))

    expected = 'customers/1234/campaignDrafts/567~890'
    assert_equal(expected, util.campaign_draft(1234, 567, 890))

    expected = 'customers/1234/campaignBidModifiers/567~890'
    assert_equal(expected, util.campaign_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/campaignExperiments/5678'
    assert_equal(expected, util.campaign_experiment(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567~890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaignCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.campaign_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/campaignExtensionSettings/567~890'
    assert_equal(expected, util.campaign_extension_setting(1234, 567, 890))

    expected = 'customers/1234/campaignFeeds/567~890'
    assert_equal(expected, util.campaign_feed(1234, 567, 890))

    expected = 'customers/1234/campaignLabels/567~890'
    assert_equal(expected, util.campaign_label(1234, 567, 890))

    expected = 'customers/1234/campaignSimulations/5~6~7~8~9'
    assert_equal(expected, util.campaign_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/campaignSharedSets/567~890'
    assert_equal(expected, util.campaign_shared_set(1234, 567, 890))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'carrierConstants/123456'
    assert_equal(expected, util.carrier_constant(123456))

    expected = 'customers/1234/changeStatus/5678'
    assert_equal(expected, util.change_status(1234, 5678))

    expected = 'customers/1234/clickViews/567~890'
    assert_equal(expected, util.click_view(1234, 567, 890))

    expected = 'customers/1234/combinedAudiences/5678'
    assert_equal(expected, util.combined_audience(1234, 5678))

    expected = 'customers/1234/conversionActions/5678'
    assert_equal(expected, util.conversion_action(1234, 5678))

    expected = 'customers/1234/conversionCustomVariables/5678'
    assert_equal(expected, util.conversion_custom_variable(1234, 5678))

    expected = 'currencyConstants/123456'
    assert_equal(expected, util.currency_constant(123456))

    expected = 'customers/1234/customAudiences/5678'
    assert_equal(expected, util.custom_audience(1234, 5678))

    expected = 'customers/1234/customInterests/5678'
    assert_equal(expected, util.custom_interest(1234, 5678))

    expected = 'customers/1234/customerAssets/567~890'
    assert_equal(expected, util.customer_asset(1234, 567, 890))

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

    expected = 'customers/1234/customerUserAccesses/5678'
    assert_equal(expected, util.customer_user_access(1234, 5678))

    expected = 'customers/1234/customerUserAccessInvitations/5678'
    assert_equal(expected, util.customer_user_access_invitation(1234, 5678))

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

    expected = 'customers/1234/expandedLandingPageViews/5678'
    assert_equal(expected, util.expanded_landing_page_view(1234, 5678))

    expected = 'customers/1234/extensionFeedItems/5678'
    assert_equal(expected, util.extension_feed_item(1234, 5678))

    expected = 'customers/1234/feedItems/567~890'
    assert_equal(expected, util.feed_item(1234, 567, 890))

    expected = 'customers/1234/feedItemSetLinks/56~78~90'
    assert_equal(expected, util.feed_item_set_link(1234, 56, 78, 90))

    expected = 'customers/1234/feedItemSets/567~890'
    assert_equal(expected, util.feed_item_set(1234, 567, 890))

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

    expected = 'customers/1234/incomeRangeViews/567~890'
    assert_equal(expected, util.income_range_view(1234, 567, 890))

    expected = 'customers/1234/keywordPlanAdGroups/5678'
    assert_equal(expected, util.keyword_plan_ad_group(1234, 5678))

    expected = 'customers/1234/keywordPlanAdGroupKeywords/5678'
    assert_equal(expected, util.keyword_plan_ad_group_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaigns/5678'
    assert_equal(expected, util.keyword_plan_campaign(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaignKeywords/5678'
    assert_equal(expected, util.keyword_plan_campaign_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlans/5678'
    assert_equal(expected, util.keyword_plan(1234, 5678))

    expected = 'customers/1234/keywordViews/567~890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))

    expected = 'customers/1234/labels/5678'
    assert_equal(expected, util.label(1234, 5678))

    expected = 'languageConstants/123456'
    assert_equal(expected, util.language_constant(123456))

    expected = 'customers/1234/lifeEvents/5678'
    assert_equal(expected, util.life_event(1234, 5678))

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

    expected = 'customers/1234/thirdPartyAppAnalyticsLinks/5678'
    assert_equal(expected, util.third_party_app_analytics_link(1234, 5678))

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

    expected = 'customers/1234/webpageViews/567~890'
    assert_equal(expected, util.webpage_view(1234, 567, 890))
  end

  def test_path_generation_v8()
    util = Google::Ads::GoogleAds::Utils::V8::PathLookupUtil.new

    expected = 'customers/1234/accessibleBiddingStrategies/5678'
    assert_equal(expected, util.accessible_bidding_strategy(1234, 5678))

    expected = 'customers/1234/accountBudgetProposals/5678'
    assert_equal(expected, util.account_budget_proposal(1234, 5678))

    expected = 'customers/1234/accountBudgets/5678'
    assert_equal(expected, util.account_budget(1234, 5678))

    expected = 'customers/1234/accountLinks/5678'
    assert_equal(expected, util.account_link(1234, 5678))

    expected = 'customers/1234/adGroupAdLabels/56~78~90'
    assert_equal(expected, util.ad_group_ad_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAds/567~890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupAssets/56~78~90'
    assert_equal(expected, util.ad_group_asset(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAudienceViews/567~890'
    assert_equal(expected, util.ad_group_audience_view(1234, 567, 890))

    expected = 'customers/1234/adGroupBidModifiers/567~890'
    assert_equal(expected, util.ad_group_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionLabels/56~78~90'
    assert_equal(expected, util.ad_group_criterion_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupCriteria/567~890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.ad_group_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/adGroupExtensionSettings/567~890'
    assert_equal(expected, util.ad_group_extension_setting(1234, 567, 890))

    expected = 'customers/1234/adGroupFeeds/567~890'
    assert_equal(expected, util.ad_group_feed(1234, 567, 890))

    expected = 'customers/1234/adGroupLabels/567~890'
    assert_equal(expected, util.ad_group_label(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/adGroupSimulations/5~6~7~8~9'
    assert_equal(expected, util.ad_group_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/adParameters/56~78~90'
    assert_equal(expected, util.ad_parameter(1234, 56, 78, 90))

    expected = 'customers/1234/adScheduleViews/567~890'
    assert_equal(expected, util.ad_schedule_view(1234, 567, 890))

    expected = 'customers/1234/ageRangeViews/567~890'
    assert_equal(expected, util.age_range_view(1234, 567, 890))

    expected = 'customers/1234/assets/5678'
    assert_equal(expected, util.asset(1234, 5678))

    expected = 'customers/1234/assetFieldTypeViews/5678'
    assert_equal(expected, util.asset_field_type_view(1234, 5678))

    expected = 'customers/1234/batchJobs/5678'
    assert_equal(expected, util.batch_job(1234, 5678))

    expected = 'customers/1234/biddingDataExclusions/5678'
    assert_equal(expected, util.bidding_data_exclusion(1234, 5678))

    expected = 'customers/1234/biddingSeasonalityAdjustments/5678'
    assert_equal(expected, util.bidding_seasonality_adjustment(1234, 5678))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/biddingStrategySimulations/5~6~7~8~9'
    assert_equal(expected, util.bidding_strategy_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/billingSetups/5678'
    assert_equal(expected, util.billing_setup(1234, 5678))

    expected = 'customers/1234/campaignAssets/56~78~90'
    assert_equal(expected, util.campaign_asset(1234, 56, 78, 90))

    expected = 'customers/1234/campaignAudienceViews/567~890'
    assert_equal(expected, util.campaign_audience_view(1234, 567, 890))

    expected = 'customers/1234/campaignDrafts/567~890'
    assert_equal(expected, util.campaign_draft(1234, 567, 890))

    expected = 'customers/1234/campaignBidModifiers/567~890'
    assert_equal(expected, util.campaign_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/campaignExperiments/5678'
    assert_equal(expected, util.campaign_experiment(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567~890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaignCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.campaign_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/campaignExtensionSettings/567~890'
    assert_equal(expected, util.campaign_extension_setting(1234, 567, 890))

    expected = 'customers/1234/campaignFeeds/567~890'
    assert_equal(expected, util.campaign_feed(1234, 567, 890))

    expected = 'customers/1234/campaignLabels/567~890'
    assert_equal(expected, util.campaign_label(1234, 567, 890))

    expected = 'customers/1234/campaignSimulations/5~6~7~8~9'
    assert_equal(expected, util.campaign_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/campaignSharedSets/567~890'
    assert_equal(expected, util.campaign_shared_set(1234, 567, 890))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'carrierConstants/123456'
    assert_equal(expected, util.carrier_constant(123456))

    expected = 'customers/1234/changeStatus/5678'
    assert_equal(expected, util.change_status(1234, 5678))

    expected = 'customers/1234/clickViews/567~890'
    assert_equal(expected, util.click_view(1234, 567, 890))

    expected = 'customers/1234/combinedAudiences/5678'
    assert_equal(expected, util.combined_audience(1234, 5678))

    expected = 'customers/1234/conversionActions/5678'
    assert_equal(expected, util.conversion_action(1234, 5678))

    expected = 'customers/1234/conversionCustomVariables/5678'
    assert_equal(expected, util.conversion_custom_variable(1234, 5678))

    expected = 'customers/1234/conversionValueRules/5678'
    assert_equal(expected, util.conversion_value_rule(1234, 5678))

    expected = 'customers/1234/conversionValueRuleSets/5678'
    assert_equal(expected, util.conversion_value_rule_set(1234, 5678))

    expected = 'currencyConstants/123456'
    assert_equal(expected, util.currency_constant(123456))

    expected = 'customers/1234/customAudiences/5678'
    assert_equal(expected, util.custom_audience(1234, 5678))

    expected = 'customers/1234/customInterests/5678'
    assert_equal(expected, util.custom_interest(1234, 5678))

    expected = 'customers/1234/customerAssets/567~890'
    assert_equal(expected, util.customer_asset(1234, 567, 890))

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

    expected = 'customers/1234/customerUserAccesses/5678'
    assert_equal(expected, util.customer_user_access(1234, 5678))

    expected = 'customers/1234/customerUserAccessInvitations/5678'
    assert_equal(expected, util.customer_user_access_invitation(1234, 5678))

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

    expected = 'customers/1234/detailPlacementViews/567~890'
    assert_equal(expected, util.detail_placement_view(1234, 567, 890))

    expected = 'customers/1234/detailedDemographics/5678'
    assert_equal(expected, util.detailed_demographic(1234, 5678))

    expected = 'customers/1234/displayKeywordViews/567~890'
    assert_equal(expected, util.display_keyword_view(1234, 567, 890))

    expected = 'customers/1234/domainCategories/56~78~90'
    assert_equal(expected, util.domain_category(1234, 56, 78, 90))

    expected = 'customers/1234/dynamicSearchAdsSearchTermViews/5~6~7~8~9'
    assert_equal(expected, util.dynamic_search_ads_search_term_view(1234, 5, 6,
        7, 8, 9))

    expected = 'customers/1234/expandedLandingPageViews/5678'
    assert_equal(expected, util.expanded_landing_page_view(1234, 5678))

    expected = 'customers/1234/extensionFeedItems/5678'
    assert_equal(expected, util.extension_feed_item(1234, 5678))

    expected = 'customers/1234/feedItems/567~890'
    assert_equal(expected, util.feed_item(1234, 567, 890))

    expected = 'customers/1234/feedItemSetLinks/56~78~90'
    assert_equal(expected, util.feed_item_set_link(1234, 56, 78, 90))

    expected = 'customers/1234/feedItemSets/567~890'
    assert_equal(expected, util.feed_item_set(1234, 567, 890))

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

    expected = 'customers/1234/incomeRangeViews/567~890'
    assert_equal(expected, util.income_range_view(1234, 567, 890))

    expected = 'customers/1234/keywordPlanAdGroups/5678'
    assert_equal(expected, util.keyword_plan_ad_group(1234, 5678))

    expected = 'customers/1234/keywordPlanAdGroupKeywords/5678'
    assert_equal(expected, util.keyword_plan_ad_group_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaigns/5678'
    assert_equal(expected, util.keyword_plan_campaign(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaignKeywords/5678'
    assert_equal(expected, util.keyword_plan_campaign_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlans/5678'
    assert_equal(expected, util.keyword_plan(1234, 5678))

    expected = 'keywordThemeConstants/123~456'
    assert_equal(expected, util.keyword_theme_constant(123,456))

    expected = 'customers/1234/keywordViews/567~890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))

    expected = 'customers/1234/labels/5678'
    assert_equal(expected, util.label(1234, 5678))

    expected = 'languageConstants/123456'
    assert_equal(expected, util.language_constant(123456))

    expected = 'customers/1234/lifeEvents/5678'
    assert_equal(expected, util.life_event(1234, 5678))

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

    expected = 'customers/1234/smartCampaignSearchTermViews/56~78'
    assert_equal(expected, util.smart_campaign_search_term_view(1234, 56, 78))

    expected = 'customers/1234/smartCampaignSettings/5678'
    assert_equal(expected, util.smart_campaign_setting(1234, 5678))

    expected = 'customers/1234/shoppingPerformanceView'
    assert_equal(expected, util.shopping_performance_view(1234))

    expected = 'customers/1234/thirdPartyAppAnalyticsLinks/5678'
    assert_equal(expected, util.third_party_app_analytics_link(1234, 5678))

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

    expected = 'customers/1234/webpageViews/567~890'
    assert_equal(expected, util.webpage_view(1234, 567, 890))
  end

  def test_path_generation_v9()
    util = Google::Ads::GoogleAds::Utils::V9::PathLookupUtil.new

    expected = 'customers/1234/accessibleBiddingStrategies/5678'
    assert_equal(expected, util.accessible_bidding_strategy(1234, 5678))

    expected = 'customers/1234/accountBudgetProposals/5678'
    assert_equal(expected, util.account_budget_proposal(1234, 5678))

    expected = 'customers/1234/accountBudgets/5678'
    assert_equal(expected, util.account_budget(1234, 5678))

    expected = 'customers/1234/accountLinks/5678'
    assert_equal(expected, util.account_link(1234, 5678))

    expected = 'customers/1234/adGroupAdLabels/56~78~90'
    assert_equal(expected, util.ad_group_ad_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAds/567~890'
    assert_equal(expected, util.ad_group_ad(1234, 567, 890))

    expected = 'customers/1234/adGroupAssets/56~78~90'
    assert_equal(expected, util.ad_group_asset(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupAudienceViews/567~890'
    assert_equal(expected, util.ad_group_audience_view(1234, 567, 890))

    expected = 'customers/1234/adGroupBidModifiers/567~890'
    assert_equal(expected, util.ad_group_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionCustomizers/56~78~90'
    assert_equal(expected, util.ad_group_criterion_customizer(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupCriterionLabels/56~78~90'
    assert_equal(expected, util.ad_group_criterion_label(1234, 56, 78, 90))

    expected = 'customers/1234/adGroupCriteria/567~890'
    assert_equal(expected, util.ad_group_criterion(1234, 567, 890))

    expected = 'customers/1234/adGroupCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.ad_group_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/adGroupCustomizers/567~890'
    assert_equal(expected, util.ad_group_customizer(1234, 567, 890))

    expected = 'customers/1234/adGroupExtensionSettings/567~890'
    assert_equal(expected, util.ad_group_extension_setting(1234, 567, 890))

    expected = 'customers/1234/adGroupFeeds/567~890'
    assert_equal(expected, util.ad_group_feed(1234, 567, 890))

    expected = 'customers/1234/adGroupLabels/567~890'
    assert_equal(expected, util.ad_group_label(1234, 567, 890))

    expected = 'customers/1234/adGroups/5678'
    assert_equal(expected, util.ad_group(1234, 5678))

    expected = 'customers/1234/adGroupSimulations/5~6~7~8~9'
    assert_equal(expected, util.ad_group_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/adParameters/56~78~90'
    assert_equal(expected, util.ad_parameter(1234, 56, 78, 90))

    expected = 'customers/1234/adScheduleViews/567~890'
    assert_equal(expected, util.ad_schedule_view(1234, 567, 890))

    expected = 'customers/1234/ageRangeViews/567~890'
    assert_equal(expected, util.age_range_view(1234, 567, 890))

    expected = 'customers/1234/assets/5678'
    assert_equal(expected, util.asset(1234, 5678))

    expected = 'customers/1234/assetFieldTypeViews/5678'
    assert_equal(expected, util.asset_field_type_view(1234, 5678))

    expected = 'customers/1234/assetGroupAssets/56~78~90'
    assert_equal(expected, util.asset_group_asset(1234, 56, 78, 90))

    expected = 'customers/1234/assetGroupListingGroupFilters/567~890'
    assert_equal(expected, util.asset_group_listing_group_filter(1234, 567, 890))

    expected = 'customers/1234/assetGroups/5678'
    assert_equal(expected, util.asset_group(1234, 5678))

    expected = 'customers/1234/assetSetAssets/567~890'
    assert_equal(expected, util.asset_set_asset(1234, 567, 890))

    expected = 'customers/1234/assetSets/5678'
    assert_equal(expected, util.asset_set(1234, 5678))

    expected = 'customers/1234/batchJobs/5678'
    assert_equal(expected, util.batch_job(1234, 5678))

    expected = 'customers/1234/biddingDataExclusions/5678'
    assert_equal(expected, util.bidding_data_exclusion(1234, 5678))

    expected = 'customers/1234/biddingSeasonalityAdjustments/5678'
    assert_equal(expected, util.bidding_seasonality_adjustment(1234, 5678))

    expected = 'customers/1234/biddingStrategies/5678'
    assert_equal(expected, util.bidding_strategy(1234, 5678))

    expected = 'customers/1234/biddingStrategySimulations/5~6~7~8~9'
    assert_equal(expected, util.bidding_strategy_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/billingSetups/5678'
    assert_equal(expected, util.billing_setup(1234, 5678))

    expected = 'customers/1234/campaignAssetSets/567~890'
    assert_equal(expected, util.campaign_asset_set(1234, 567, 890))

    expected = 'customers/1234/campaignAssets/56~78~90'
    assert_equal(expected, util.campaign_asset(1234, 56, 78, 90))

    expected = 'customers/1234/campaignAudienceViews/567~890'
    assert_equal(expected, util.campaign_audience_view(1234, 567, 890))

    expected = 'customers/1234/campaignConversionGoals/56~78~90'
    assert_equal(expected, util.campaign_conversion_goal(1234, 56, 78, 90))

    expected = 'customers/1234/campaignCustomizers/567~890'
    assert_equal(expected, util.campaign_customizer(1234, 567, 890))

    expected = 'customers/1234/campaignDrafts/567~890'
    assert_equal(expected, util.campaign_draft(1234, 567, 890))

    expected = 'customers/1234/campaignBidModifiers/567~890'
    assert_equal(expected, util.campaign_bid_modifier(1234, 567, 890))

    expected = 'customers/1234/campaignExperiments/5678'
    assert_equal(expected, util.campaign_experiment(1234, 5678))

    expected = 'customers/1234/campaignBudgets/5678'
    assert_equal(expected, util.campaign_budget(1234, 5678))

    expected = 'customers/1234/campaignCriteria/567~890'
    assert_equal(expected, util.campaign_criterion(1234, 567, 890))

    expected = 'customers/1234/campaignCriterionSimulations/5~6~7~8~9~0'
    assert_equal(expected, util.campaign_criterion_simulation(1234, 5, 6, 7, 8, 9, 0))

    expected = 'customers/1234/campaignExtensionSettings/567~890'
    assert_equal(expected, util.campaign_extension_setting(1234, 567, 890))

    expected = 'customers/1234/campaignFeeds/567~890'
    assert_equal(expected, util.campaign_feed(1234, 567, 890))

    expected = 'customers/1234/campaignLabels/567~890'
    assert_equal(expected, util.campaign_label(1234, 567, 890))

    expected = 'customers/1234/campaignSimulations/5~6~7~8~9'
    assert_equal(expected, util.campaign_simulation(1234, 5, 6, 7, 8, 9))

    expected = 'customers/1234/campaignSharedSets/567~890'
    assert_equal(expected, util.campaign_shared_set(1234, 567, 890))

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, util.campaign(1234, 5678))

    expected = 'carrierConstants/123456'
    assert_equal(expected, util.carrier_constant(123456))

    expected = 'customers/1234/conversionGoalCampaignConfigs/5678'
    assert_equal(expected, util.conversion_goal_campaign_config(1234, 5678))

    expected = 'customers/1234/changeStatus/5678'
    assert_equal(expected, util.change_status(1234, 5678))

    expected = 'customers/1234/clickViews/567~890'
    assert_equal(expected, util.click_view(1234, 567, 890))

    expected = 'customers/1234/combinedAudiences/5678'
    assert_equal(expected, util.combined_audience(1234, 5678))

    expected = 'customers/1234/conversionActions/5678'
    assert_equal(expected, util.conversion_action(1234, 5678))

    expected = 'customers/1234/conversionCustomVariables/5678'
    assert_equal(expected, util.conversion_custom_variable(1234, 5678))

    expected = 'customers/1234/conversionValueRules/5678'
    assert_equal(expected, util.conversion_value_rule(1234, 5678))

    expected = 'customers/1234/conversionValueRuleSets/5678'
    assert_equal(expected, util.conversion_value_rule_set(1234, 5678))

    expected = 'currencyConstants/123456'
    assert_equal(expected, util.currency_constant(123456))

    expected = 'customers/1234/customAudiences/5678'
    assert_equal(expected, util.custom_audience(1234, 5678))

    expected = 'customers/1234/customConversionGoals/5678'
    assert_equal(expected, util.custom_conversion_goal(1234, 5678))

    expected = 'customers/1234/customInterests/5678'
    assert_equal(expected, util.custom_interest(1234, 5678))

    expected = 'customers/1234/customerAssets/567~890'
    assert_equal(expected, util.customer_asset(1234, 567, 890))

    expected = 'customers/1234/customerClientLinks/567~890'
    assert_equal(expected, util.customer_client_link(1234, 567, 890))

    expected = 'customers/1234/customerClients/5678'
    assert_equal(expected, util.customer_client(1234, 5678))

    expected = 'customers/1234/customerConversionGoals/567~890'
    assert_equal(expected, util.customer_conversion_goal(1234, 567, 890))

    expected = 'customers/1234/customerCustomizers/5678'
    assert_equal(expected, util.customer_customizer(1234, 5678))

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

    expected = 'customers/1234/customerUserAccesses/5678'
    assert_equal(expected, util.customer_user_access(1234, 5678))

    expected = 'customers/1234/customerUserAccessInvitations/5678'
    assert_equal(expected, util.customer_user_access_invitation(1234, 5678))

    expected = 'customers/123456'
    assert_equal(expected, util.customer(123456))

    expected = 'customers/1234/customizerAttributes/5678'
    assert_equal(expected, util.customizer_attribute(1234, 5678))

    expected = 'customers/1234/detailPlacementViews/567~890'
    assert_equal(expected, util.detail_placement_view(1234, 567, 890))

    expected = 'customers/1234/detailedDemographics/5678'
    assert_equal(expected, util.detailed_demographic(1234, 5678))

    expected = 'customers/1234/displayKeywordViews/567~890'
    assert_equal(expected, util.display_keyword_view(1234, 567, 890))

    expected = 'customers/1234/domainCategories/56~78~90'
    assert_equal(expected, util.domain_category(1234, 56, 78, 90))

    expected = 'customers/1234/dynamicSearchAdsSearchTermViews/5~6~7~8~9'
    assert_equal(expected, util.dynamic_search_ads_search_term_view(1234, 5, 6,
        7, 8, 9))

    expected = 'customers/1234/expandedLandingPageViews/5678'
    assert_equal(expected, util.expanded_landing_page_view(1234, 5678))

    expected = 'customers/1234/extensionFeedItems/5678'
    assert_equal(expected, util.extension_feed_item(1234, 5678))

    expected = 'customers/1234/feedItems/567~890'
    assert_equal(expected, util.feed_item(1234, 567, 890))

    expected = 'customers/1234/feedItemSetLinks/56~78~90'
    assert_equal(expected, util.feed_item_set_link(1234, 56, 78, 90))

    expected = 'customers/1234/feedItemSets/567~890'
    assert_equal(expected, util.feed_item_set(1234, 567, 890))

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

    expected = 'customers/1234/incomeRangeViews/567~890'
    assert_equal(expected, util.income_range_view(1234, 567, 890))

    expected = 'customers/1234/keywordPlanAdGroups/5678'
    assert_equal(expected, util.keyword_plan_ad_group(1234, 5678))

    expected = 'customers/1234/keywordPlanAdGroupKeywords/5678'
    assert_equal(expected, util.keyword_plan_ad_group_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaigns/5678'
    assert_equal(expected, util.keyword_plan_campaign(1234, 5678))

    expected = 'customers/1234/keywordPlanCampaignKeywords/5678'
    assert_equal(expected, util.keyword_plan_campaign_keyword(1234, 5678))

    expected = 'customers/1234/keywordPlans/5678'
    assert_equal(expected, util.keyword_plan(1234, 5678))

    expected = 'keywordThemeConstants/123~456'
    assert_equal(expected, util.keyword_theme_constant(123,456))

    expected = 'customers/1234/keywordViews/567~890'
    assert_equal(expected, util.keyword_view(1234, 567, 890))

    expected = 'customers/1234/labels/5678'
    assert_equal(expected, util.label(1234, 5678))

    expected = 'languageConstants/123456'
    assert_equal(expected, util.language_constant(123456))

    expected = 'customers/1234/lifeEvents/5678'
    assert_equal(expected, util.life_event(1234, 5678))

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

    expected = 'customers/1234/smartCampaignSearchTermViews/56~78'
    assert_equal(expected, util.smart_campaign_search_term_view(1234, 56, 78))

    expected = 'customers/1234/smartCampaignSettings/5678'
    assert_equal(expected, util.smart_campaign_setting(1234, 5678))

    expected = 'customers/1234/shoppingPerformanceView'
    assert_equal(expected, util.shopping_performance_view(1234))

    expected = 'customers/1234/thirdPartyAppAnalyticsLinks/5678'
    assert_equal(expected, util.third_party_app_analytics_link(1234, 5678))

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

    expected = 'customers/1234/webpageViews/567~890'
    assert_equal(expected, util.webpage_view(1234, 567, 890))
  end
  def test_malformed_path_input
    util = Google::Ads::GoogleAds::Utils::V7::PathLookupUtil.new

    assert_raises ArgumentError do
      util.campaign(nil, nil)
    end
  end
end
