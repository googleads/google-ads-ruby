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
# Utility that looks up references to generated classes for proto objects.

module Google
  module Ads
    module GoogleAds
      class ProtoLookupUtil
        # Variables: Version, folder (resources/common), filename
        RESOURCE_PATH = 'google/ads/google_ads/%s/%s/%s'.freeze
        # Variables: Version, class name
        RESOURCE_CLASS_PATH = 'Google::Ads::GoogleAds::%s::Resources::%s'.freeze
        # Variables: Version, class name
        COMMON_CLASS_PATH = 'Google::Ads::GoogleAds::%s::Common::%s'.freeze

        # Variables: Version, filename
        ENUM_PATH = 'google/ads/google_ads/%s/enums/%s'.freeze
        # Variables: Version, enum name, enum name (again)
        ENUM_CLASS_PATH = 'Google::Ads::GoogleAds::%s::Enums::%sEnum::%s'.freeze

        # Variables: Version, filename
        SERVICE_PATH = 'google/ads/google_ads/%s/services/%s'.freeze
        # Variables: Version, entity name
        SERVICE_CLASS_PATH =
            'Google::Ads::GoogleAds::%s::Services::%s'.freeze

        RESOURCES = {
          AccountBudget: ['resources', 'account_budget_pb', 'AccountBudget'],
          PendingAccountBudgetProposal: ['resources', 'account_budget_pb', 'AccountBudget::PendingAccountBudgetProposal'],
          AccountBudgetProposal: ['resources', 'account_budget_proposal_pb', 'AccountBudgetProposal'],
          AdGroupAd: ['resources', 'ad_group_ad_pb', 'AdGroupAd'],
          AdGroupAdPolicySummary: ['resources', 'ad_group_ad_pb', 'AdGroupAdPolicySummary'],
          AdGroupCriterion: ['resources', 'ad_group_criterion_pb', 'AdGroupCriterion'],
          QualityInfo: ['resources', 'ad_group_criterion_pb', 'AdGroupCriterion::QualityInfo'],
          PositionEstimates: ['resources', 'ad_group_criterion_pb', 'AdGroupCriterion::PositionEstimates'],
          AdGroupAudienceView: ['resources', 'ad_group_audience_view_pb', 'AdGroupAudienceView'],
          AdGroupBidModifier: ['resources', 'ad_group_bid_modifier_pb', 'AdGroupBidModifier'],
          AdGroupFeed: ['resources', 'ad_group_feed_pb', 'AdGroupFeed'],
          AdGroup: ['resources', 'ad_group_pb', 'AdGroup'],
          AdParameter: ['resources', 'ad_parameter_pb', 'AdParameter'],
          AdScheduleView: ['resources', 'ad_schedule_view_pb', 'AdScheduleView'],
          Ad: ['resources', 'ad_pb', 'Ad'],
          AgeRangeView: ['resources', 'age_range_view_pb', 'AgeRangeView'],
          BiddingStrategy: ['resources', 'bidding_strategy_pb', 'BiddingStrategy'],
          BillingSetup: ['resources', 'billing_setup_pb', 'BillingSetup'],
          PaymentsAccountInfo: ['resources', 'billing_setup_pb', 'BillingSetup::PaymentsAccountInfo'],
          CampaignAudienceView: ['resources', 'campaign_audience_view_pb', 'CampaignAudienceView'],
          CampaignBidModifier: ['resources', 'campaign_bid_modifier_pb', 'CampaignBidModifier'],
          CampaignBudget: ['resources', 'campaign_budget_pb', 'CampaignBudget'],
          CampaignCriterion: ['resources', 'campaign_criterion_pb', 'CampaignCriterion'],
          CampaignFeed: ['resources', 'campaign_feed_pb', 'CampaignFeed'],
          Campaign: ['resources', 'campaign_pb', 'Campaign'],
          NetworkSettings: ['resources', 'campaign_pb', 'Campaign::NetworkSettings'],
          HotelSettingInfo: ['resources', 'campaign_pb', 'Campaign::HotelSettingInfo'],
          DynamicSearchAdsSetting: ['resources', 'campaign_pb', 'Campaign::DynamicSearchAdsSetting'],
          ShoppingSetting: ['resources', 'campaign_pb', 'Campaign::ShoppingSetting'],
          TrackingSetting: ['resources', 'campaign_pb', 'Campaign::TrackingSetting'],
          VanityPharma: ['resources', 'campaign_pb', 'Campaign::VanityPharma'],
          SelectiveOptimization: ['resources', 'campaign_pb', 'Campaign::SelectiveOptimization'],
          CampaignSharedSet: ['resources', 'campaign_shared_set_pb', 'CampaignSharedSet'],
          CarrierConstant: ['resources', 'carrier_constant_pb', 'CarrierConstant'],
          ChangeStatus: ['resources', 'change_status_pb', 'ChangeStatus'],
          ConversionAction: ['resources', 'conversion_action_pb', 'ConversionAction'],
          AttributionModelSettings: ['resources', 'conversion_action_pb', 'ConversionAction::AttributionModelSettings'],
          ValueSettings: ['resources', 'conversion_action_pb', 'ConversionAction::ValueSettings'],
          CustomerClientLink: ['resources', 'customer_client_link_pb', 'CustomerClientLink'],
          CustomerClient: ['resources', 'customer_client_pb', 'CustomerClient'],
          CustomerFeed: ['resources', 'customer_feed_pb', 'CustomerFeed'],
          CustomerManagerLink: ['resources', 'customer_manager_link_pb', 'CustomerManagerLink'],
          Customer: ['resources', 'customer_pb', 'Customer'],
          CallReportingSetting: ['resources', 'customer_pb', 'CallReportingSetting'],
          ConversionTrackingSetting: ['resources', 'customer_pb', 'ConversionTrackingSetting'],
          DisplayKeywordView: ['resources', 'display_keyword_view_pb', 'DisplayKeywordView'],
          FeedItem: ['resources', 'feed_item_pb', 'FeedItem'],
          FeedItemAttributeValue: ['resources', 'feed_item_pb', 'FeedItemAttributeValue'],
          FeedItemPlaceholderPolicyInfo: ['resources', 'feed_item_pb', 'FeedItemPlaceholderPolicyInfo'],
          FeedItemValidationError: ['resources', 'feed_item_pb', 'FeedItemValidationError'],
          FeedMapping: ['resources', 'feed_mapping_pb', 'FeedMapping'],
          AttributeFieldMapping: ['resources', 'feed_mapping_pb', 'AttributeFieldMapping'],
          Feed: ['resources', 'feed_pb', 'Feed'],
          PlacesLocationFeedData: ['resources', 'feed_pb', 'Feed::PlacesLocationFeedData'],
          OAuthInfo: ['resources', 'feed_pb', 'Feed::PlacesLocationFeedData::OAuthInfo'],
          AffiliateLocationFeedData: ['resources', 'feed_pb', 'Feed::AffiliateLocationFeedData'],
          FeedAttribute: ['resources', 'feed_pb', 'FeedAttribute'],
          FeedAttributeOperation: ['resources', 'feed_pb', 'FeedAttributeOperation'],
          Operator: ['resources', 'feed_pb', 'FeedAttributeOperation::Operator'],
          GenderView: ['resources', 'gender_view_pb', 'GenderView'],
          GeoTargetConstant: ['resources', 'geo_target_constant_pb', 'GeoTargetConstant'],
          GoogleAdsField: ['resources', 'google_ads_field_pb', 'GoogleAdsField'],
          HotelGroupView: ['resources', 'hotel_group_view_pb', 'HotelGroupView'],
          HotelPerformanceView: ['resources', 'hotel_performance_view_pb', 'HotelPerformanceView'],
          KeywordPlanAdGroup: ['resources', 'keyword_plan_ad_group_pb', 'KeywordPlanAdGroup'],
          KeywordPlanCampaign: ['resources', 'keyword_plan_campaign_pb', 'KeywordPlanCampaign'],
          KeywordPlanGeoTarget: ['resources', 'keyword_plan_campaign_pb', 'KeywordPlanGeoTarget'],
          KeywordPlanKeyword: ['resources', 'keyword_plan_keyword_pb', 'KeywordPlanKeyword'],
          KeywordPlanNegativeKeyword: ['resources', 'keyword_plan_negative_keyword_pb', 'KeywordPlanNegativeKeyword'],
          KeywordPlan: ['resources', 'keyword_plan_pb', 'KeywordPlan'],
          KeywordPlanForecastPeriod: ['resources', 'keyword_plan_pb', 'KeywordPlanForecastPeriod'],
          KeywordView: ['resources', 'keyword_view_pb', 'KeywordView'],
          LanguageConstant: ['resources', 'language_constant_pb', 'LanguageConstant'],
          ManagedPlacementView: ['resources', 'managed_placement_view_pb', 'ManagedPlacementView'],
          MediaFile: ['resources', 'media_file_pb', 'MediaFile'],
          MediaImage: ['resources', 'media_file_pb', 'MediaImage'],
          MediaBundle: ['resources', 'media_file_pb', 'MediaBundle'],
          MediaAudio: ['resources', 'media_file_pb', 'MediaAudio'],
          MediaVideo: ['resources', 'media_file_pb', 'MediaVideo'],
          MobileAppCategoryConstant: ['resources', 'mobile_app_category_constant_pb', 'MobileAppCategoryConstant'],
          MobileDeviceConstant: ['resources', 'mobile_device_constant_pb', 'MobileDeviceConstant'],
          OperatingSystemVersionConstant: ['resources', 'operating_system_version_constant_pb', 'OperatingSystemVersionConstant'],
          ParentalStatusView: ['resources', 'parental_status_view_pb', 'ParentalStatusView'],
          PaymentsAccount: ['resources', 'payments_account_pb', 'PaymentsAccount'],
          ProductGroupView: ['resources', 'product_group_view_pb', 'ProductGroupView'],
          Recommendation: ['resources', 'recommendation_pb', 'Recommendation'],
          RecommendationImpact: ['resources', 'recommendation_pb', 'Recommendation::RecommendationImpact'],
          RecommendationMetrics: ['resources', 'recommendation_pb', 'Recommendation::RecommendationMetrics'],
          CampaignBudgetRecommendation: ['resources', 'recommendation_pb', 'Recommendation::CampaignBudgetRecommendation'],
          CampaignBudgetRecommendationOption: ['resources', 'recommendation_pb', 'Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption'],
          KeywordRecommendation: ['resources', 'recommendation_pb', 'Recommendation::KeywordRecommendation'],
          TextAdRecommendation: ['resources', 'recommendation_pb', 'Recommendation::TextAdRecommendation'],
          TargetCpaOptInRecommendation: ['resources', 'recommendation_pb', 'Recommendation::TargetCpaOptInRecommendation'],
          TargetCpaOptInRecommendationOption: ['resources', 'recommendation_pb', 'Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption'],
          MaximizeConversionsOptInRecommendation: ['resources', 'recommendation_pb', 'Recommendation::MaximizeConversionsOptInRecommendation'],
          EnhancedCpcOptInRecommendation: ['resources', 'recommendation_pb', 'Recommendation::EnhancedCpcOptInRecommendation'],
          SearchPartnersOptInRecommendation: ['resources', 'recommendation_pb', 'Recommendation::SearchPartnersOptInRecommendation'],
          MaximizeClicksOptInRecommendation: ['resources', 'recommendation_pb', 'Recommendation::MaximizeClicksOptInRecommendation'],
          OptimizeAdRotationRecommendation: ['resources', 'recommendation_pb', 'Recommendation::OptimizeAdRotationRecommendation'],
          RemarketingAction: ['resources', 'remarketing_action_pb', 'RemarketingAction'],
          SearchTermView: ['resources', 'search_term_view_pb', 'SearchTermView'],
          SharedCriterion: ['resources', 'shared_criterion_pb', 'SharedCriterion'],
          SharedSet: ['resources', 'shared_set_pb', 'SharedSet'],
          TopicConstant: ['resources', 'topic_constant_pb', 'TopicConstant'],
          TopicView: ['resources', 'topic_view_pb', 'TopicView'],
          UserInterest: ['resources', 'user_interest_pb', 'UserInterest'],
          UserList: ['resources', 'user_list_pb', 'UserList'],
          Video: ['resources', 'video_pb', 'Video'],
          TextAdInfo: ['common', 'ad_type_infos_pb', 'TextAdInfo'],
          ExpandedTextAdInfo: ['common', 'ad_type_infos_pb', 'ExpandedTextAdInfo'],
          DynamicSearchAdInfo: ['common', 'ad_type_infos_pb', 'DynamicSearchAdInfo'],
          ResponsiveDisplayAdInfo: ['common', 'ad_type_infos_pb', 'ResponsiveDisplayAdInfo'],
          CallOnlyAdInfo: ['common', 'ad_type_infos_pb', 'CallOnlyAdInfo'],
          ExpandedDynamicSearchAdInfo: ['common', 'ad_type_infos_pb', 'ExpandedDynamicSearchAdInfo'],
          HotelAdInfo: ['common', 'ad_type_infos_pb', 'HotelAdInfo'],
          ShoppingSmartAdInfo: ['common', 'ad_type_infos_pb', 'ShoppingSmartAdInfo'],
          ShoppingProductAdInfo: ['common', 'ad_type_infos_pb', 'ShoppingProductAdInfo'],
          GmailAdInfo: ['common', 'ad_type_infos_pb', 'GmailAdInfo'],
          GmailTeaser: ['common', 'ad_type_infos_pb', 'GmailTeaser'],
          DisplayCallToAction: ['common', 'ad_type_infos_pb', 'DisplayCallToAction'],
          ImageAdInfo: ['common', 'ad_type_infos_pb', 'ImageAdInfo'],
          VideoTrueViewInStreamAdInfo: ['common', 'ad_type_infos_pb', 'VideoTrueViewInStreamAdInfo'],
          VideoAdInfo: ['common', 'ad_type_infos_pb', 'VideoAdInfo'],
          EnhancedCpc: ['common', 'bidding_pb', 'EnhancedCpc'],
          ManualCpc: ['common', 'bidding_pb', 'ManualCpc'],
          ManualCpm: ['common', 'bidding_pb', 'ManualCpm'],
          ManualCpv: ['common', 'bidding_pb', 'ManualCpv'],
          MaximizeConversions: ['common', 'bidding_pb', 'MaximizeConversions'],
          MaximizeConversionValue: ['common', 'bidding_pb', 'MaximizeConversionValue'],
          PageOnePromoted: ['common', 'bidding_pb', 'PageOnePromoted'],
          TargetCpa: ['common', 'bidding_pb', 'TargetCpa'],
          TargetCpm: ['common', 'bidding_pb', 'TargetCpm'],
          TargetOutrankShare: ['common', 'bidding_pb', 'TargetOutrankShare'],
          TargetRoas: ['common', 'bidding_pb', 'TargetRoas'],
          TargetSpend: ['common', 'bidding_pb', 'TargetSpend'],
          PercentCpc: ['common', 'bidding_pb', 'PercentCpc'],
          KeywordInfo: ['common', 'criteria_pb', 'KeywordInfo'],
          PlacementInfo: ['common', 'criteria_pb', 'PlacementInfo'],
          MobileAppCategoryInfo: ['common', 'criteria_pb', 'MobileAppCategoryInfo'],
          LocationInfo: ['common', 'criteria_pb', 'LocationInfo'],
          DeviceInfo: ['common', 'criteria_pb', 'DeviceInfo'],
          ListingGroupInfo: ['common', 'criteria_pb', 'ListingGroupInfo'],
          ListingDimensionInfo: ['common', 'criteria_pb', 'ListingDimensionInfo'],
          ListingBrandInfo: ['common', 'criteria_pb', 'ListingBrandInfo'],
          HotelIdInfo: ['common', 'criteria_pb', 'HotelIdInfo'],
          HotelClassInfo: ['common', 'criteria_pb', 'HotelClassInfo'],
          HotelCountryRegionInfo: ['common', 'criteria_pb', 'HotelCountryRegionInfo'],
          HotelStateInfo: ['common', 'criteria_pb', 'HotelStateInfo'],
          HotelCityInfo: ['common', 'criteria_pb', 'HotelCityInfo'],
          ListingCustomAttributeInfo: ['common', 'criteria_pb', 'ListingCustomAttributeInfo'],
          ProductChannelInfo: ['common', 'criteria_pb', 'ProductChannelInfo'],
          ProductChannelExclusivityInfo: ['common', 'criteria_pb', 'ProductChannelExclusivityInfo'],
          ProductConditionInfo: ['common', 'criteria_pb', 'ProductConditionInfo'],
          ProductOfferIdInfo: ['common', 'criteria_pb', 'ProductOfferIdInfo'],
          ProductTypeInfo: ['common', 'criteria_pb', 'ProductTypeInfo'],
          HotelDateSelectionTypeInfo: ['common', 'criteria_pb', 'HotelDateSelectionTypeInfo'],
          HotelAdvanceBookingWindowInfo: ['common', 'criteria_pb', 'HotelAdvanceBookingWindowInfo'],
          HotelLengthOfStayInfo: ['common', 'criteria_pb', 'HotelLengthOfStayInfo'],
          HotelCheckInDayInfo: ['common', 'criteria_pb', 'HotelCheckInDayInfo'],
          InteractionTypeInfo: ['common', 'criteria_pb', 'InteractionTypeInfo'],
          AdScheduleInfo: ['common', 'criteria_pb', 'AdScheduleInfo'],
          AgeRangeInfo: ['common', 'criteria_pb', 'AgeRangeInfo'],
          GenderInfo: ['common', 'criteria_pb', 'GenderInfo'],
          IncomeRangeInfo: ['common', 'criteria_pb', 'IncomeRangeInfo'],
          ParentalStatusInfo: ['common', 'criteria_pb', 'ParentalStatusInfo'],
          YouTubeVideoInfo: ['common', 'criteria_pb', 'YouTubeVideoInfo'],
          YouTubeChannelInfo: ['common', 'criteria_pb', 'YouTubeChannelInfo'],
          UserListInfo: ['common', 'criteria_pb', 'UserListInfo'],
          ProximityInfo: ['common', 'criteria_pb', 'ProximityInfo'],
          GeoPointInfo: ['common', 'criteria_pb', 'GeoPointInfo'],
          AddressInfo: ['common', 'criteria_pb', 'AddressInfo'],
          TopicInfo: ['common', 'criteria_pb', 'TopicInfo'],
          LanguageInfo: ['common', 'criteria_pb', 'LanguageInfo'],
          IpBlockInfo: ['common', 'criteria_pb', 'IpBlockInfo'],
          ContentLabelInfo: ['common', 'criteria_pb', 'ContentLabelInfo'],
          CarrierInfo: ['common', 'criteria_pb', 'CarrierInfo'],
          UserInterestInfo: ['common', 'criteria_pb', 'UserInterestInfo'],
          WebpageInfo: ['common', 'criteria_pb', 'WebpageInfo'],
          WebpageConditionInfo: ['common', 'criteria_pb', 'WebpageConditionInfo'],
          OperatingSystemVersionInfo: ['common', 'criteria_pb', 'OperatingSystemVersionInfo'],
          AppPaymentModelInfo: ['common', 'criteria_pb', 'AppPaymentModelInfo'],
          CriterionCategoryAvailability: ['common', 'criterion_category_availability_pb', 'CriterionCategoryAvailability'],
          CriterionCategoryChannelAvailability: ['common', 'criterion_category_availability_pb', 'CriterionCategoryChannelAvailability'],
          CriterionCategoryLocaleAvailability: ['common', 'criterion_category_availability_pb', 'CriterionCategoryLocaleAvailability'],
          CustomParameter: ['common', 'custom_parameter_pb', 'CustomParameter'],
          DateRange: ['common', 'dates_pb', 'DateRange'],
          ExplorerAutoOptimizerSetting: ['common', 'explorer_auto_optimizer_setting_pb', 'ExplorerAutoOptimizerSetting'],
          Price: ['common', 'feed_common_pb', 'Price'],
          FrequencyCapEntry: ['common', 'frequency_cap_pb', 'FrequencyCapEntry'],
          FrequencyCapKey: ['common', 'frequency_cap_pb', 'FrequencyCapKey'],
          KeywordPlanHistoricalMetrics: ['common', 'keyword_plan_common_pb', 'KeywordPlanHistoricalMetrics'],
          MatchingFunction: ['common', 'matching_function_pb', 'MatchingFunction'],
          Metrics: ['common', 'metrics_pb', 'Metrics'],
          PolicyViolationKey: ['common', 'policy_pb', 'PolicyViolationKey'],
          PolicyValidationParameter: ['common', 'policy_pb', 'PolicyValidationParameter'],
          PolicyTopicEntry: ['common', 'policy_pb', 'PolicyTopicEntry'],
          PolicyTopicEvidence: ['common', 'policy_pb', 'PolicyTopicEvidence'],
          TextList: ['common', 'policy_pb', 'PolicyTopicEvidence::TextList'],
          WebsiteList: ['common', 'policy_pb', 'PolicyTopicEvidence::WebsiteList'],
          DestinationTextList: ['common', 'policy_pb', 'PolicyTopicEvidence::DestinationTextList'],
          DestinationMismatch: ['common', 'policy_pb', 'PolicyTopicEvidence::DestinationMismatch'],
          PolicyTopicConstraint: ['common', 'policy_pb', 'PolicyTopicConstraint'],
          CountryConstraintList: ['common', 'policy_pb', 'PolicyTopicConstraint::CountryConstraintList'],
          ResellerConstraint: ['common', 'policy_pb', 'PolicyTopicConstraint::ResellerConstraint'],
          CountryConstraint: ['common', 'policy_pb', 'PolicyTopicConstraint::CountryConstraint'],
          RealTimeBiddingSetting: ['common', 'real_time_bidding_setting_pb', 'RealTimeBiddingSetting'],
          Segments: ['common', 'segments_pb', 'Segments'],
          TagSnippet: ['common', 'tag_snippet_pb', 'TagSnippet'],
          TargetingSetting: ['common', 'targeting_setting_pb', 'TargetingSetting'],
          TargetRestriction: ['common', 'targeting_setting_pb', 'TargetRestriction'],
          SimilarUserListInfo: ['common', 'user_lists_pb', 'SimilarUserListInfo'],
          CrmBasedUserListInfo: ['common', 'user_lists_pb', 'CrmBasedUserListInfo'],
          UserListRuleInfo: ['common', 'user_lists_pb', 'UserListRuleInfo'],
          UserListRuleItemGroupInfo: ['common', 'user_lists_pb', 'UserListRuleItemGroupInfo'],
          UserListRuleItemInfo: ['common', 'user_lists_pb', 'UserListRuleItemInfo'],
          UserListDateRuleItemInfo: ['common', 'user_lists_pb', 'UserListDateRuleItemInfo'],
          UserListNumberRuleItemInfo: ['common', 'user_lists_pb', 'UserListNumberRuleItemInfo'],
          UserListStringRuleItemInfo: ['common', 'user_lists_pb', 'UserListStringRuleItemInfo'],
          CombinedRuleUserListInfo: ['common', 'user_lists_pb', 'CombinedRuleUserListInfo'],
          DateSpecificRuleUserListInfo: ['common', 'user_lists_pb', 'DateSpecificRuleUserListInfo'],
          ExpressionRuleUserListInfo: ['common', 'user_lists_pb', 'ExpressionRuleUserListInfo'],
          RuleBasedUserListInfo: ['common', 'user_lists_pb', 'RuleBasedUserListInfo'],
          LogicalUserListInfo: ['common', 'user_lists_pb', 'LogicalUserListInfo'],
          BasicUserListInfo: ['common', 'user_lists_pb', 'BasicUserListInfo'],
          UserListActionInfo: ['common', 'user_lists_pb', 'UserListActionInfo'],
          Value: ['common', 'value_pb', 'Value'],
          CampaignBudgetParameters: ['services', 'recommendation_service_pb', 'ApplyRecommendationOperation::CampaignBudgetParameters'],
          TextAdParameters: ['services', 'recommendation_service_pb', 'ApplyRecommendationOperation::TextAdParameters'],
          KeywordParameters: ['services', 'recommendation_service_pb', 'ApplyRecommendationOperation::KeywordParameters'],
          TargetCpaOptInParameters: ['services', 'recommendation_service_pb', 'ApplyRecommendationOperation::TargetCpaOptInParameters'],
          LocationNames: ['services', 'geo_target_constant_service_pb', 'SuggestGeoTargetConstantsRequest::LocationNames'],
          GeoTargets: ['services', 'geo_target_constant_service_pb', 'SuggestGeoTargetConstantsRequest::GeoTargets']
        }.freeze

        ENUMS = {
          AccessReason: ['access_reason_pb', 'AccessReason'],
          AccountBudgetProposalStatus: ['account_budget_proposal_status_pb', 'AccountBudgetProposalStatus'],
          AccountBudgetProposalType: ['account_budget_proposal_type_pb', 'AccountBudgetProposalType'],
          AccountBudgetStatus: ['account_budget_status_pb', 'AccountBudgetStatus'],
          AdCustomizerPlaceholderField: ['ad_customizer_placeholder_field_pb', 'AdCustomizerPlaceholderField'],
          AdGroupAdRotationMode: ['ad_group_ad_rotation_mode_pb', 'AdGroupAdRotationMode'],
          AdGroupAdStatus: ['ad_group_ad_status_pb', 'AdGroupAdStatus'],
          AdGroupCriterionStatus: ['ad_group_criterion_status_pb', 'AdGroupCriterionStatus'],
          AdGroupStatus: ['ad_group_status_pb', 'AdGroupStatus'],
          AdGroupType: ['ad_group_type_pb', 'AdGroupType'],
          AdNetworkType: ['ad_network_type_pb', 'AdNetworkType'],
          AdServingOptimizationStatus: ['ad_serving_optimization_status_pb', 'AdServingOptimizationStatus'],
          AdType: ['ad_type_pb', 'AdType'],
          AdvertisingChannelSubType: ['advertising_channel_sub_type_pb', 'AdvertisingChannelSubType'],
          AdvertisingChannelType: ['advertising_channel_type_pb', 'AdvertisingChannelType'],
          AffiliateLocationFeedRelationshipType: ['affiliate_location_feed_relationship_type_pb', 'AffiliateLocationFeedRelationshipType'],
          AgeRangeType: ['age_range_type_pb', 'AgeRangeType'],
          AppPaymentModelType: ['app_payment_model_type_pb', 'AppPaymentModelType'],
          AppPlaceholderField: ['app_placeholder_field_pb', 'AppPlaceholderField'],
          AttributionModel: ['attribution_model_pb', 'AttributionModel'],
          BiddingSource: ['bidding_source_pb', 'BiddingSource'],
          BiddingStrategyType: ['bidding_strategy_type_pb', 'BiddingStrategyType'],
          BidModifierSource: ['bid_modifier_source_pb', 'BidModifierSource'],
          BillingSetupStatus: ['billing_setup_status_pb', 'BillingSetupStatus'],
          BrandSafetySuitability: ['brand_safety_suitability_pb', 'BrandSafetySuitability'],
          BudgetDeliveryMethod: ['budget_delivery_method_pb', 'BudgetDeliveryMethod'],
          BudgetPeriod: ['budget_period_pb', 'BudgetPeriod'],
          BudgetStatus: ['budget_status_pb', 'BudgetStatus'],
          CallConversionReportingState: ['call_conversion_reporting_state_pb', 'CallConversionReportingState'],
          CallPlaceholderField: ['call_placeholder_field_pb', 'CallPlaceholderField'],
          CalloutPlaceholderField: ['callout_placeholder_field_pb', 'CalloutPlaceholderField'],
          CampaignServingStatus: ['campaign_serving_status_pb', 'CampaignServingStatus'],
          CampaignSharedSetStatus: ['campaign_shared_set_status_pb', 'CampaignSharedSetStatus'],
          CampaignStatus: ['campaign_status_pb', 'CampaignStatus'],
          ChangeStatusOperation: ['change_status_operation_pb', 'ChangeStatusOperation'],
          ChangeStatusResourceType: ['change_status_resource_type_pb', 'ChangeStatusResourceType'],
          ContentLabelType: ['content_label_type_pb', 'ContentLabelType'],
          ConversionActionCategory: ['conversion_action_category_pb', 'ConversionActionCategory'],
          ConversionActionCountingType: ['conversion_action_counting_type_pb', 'ConversionActionCountingType'],
          ConversionActionStatus: ['conversion_action_status_pb', 'ConversionActionStatus'],
          ConversionActionType: ['conversion_action_type_pb', 'ConversionActionType'],
          ConversionAttributionEventType: ['conversion_attribution_event_type_pb', 'ConversionAttributionEventType'],
          CriterionCategoryChannelAvailabilityMode: ['criterion_category_channel_availability_mode_pb', 'CriterionCategoryChannelAvailabilityMode'],
          CriterionCategoryLocaleAvailabilityMode: ['criterion_category_locale_availability_mode_pb', 'CriterionCategoryLocaleAvailabilityMode'],
          CustomPlaceholderField: ['custom_placeholder_field_pb', 'CustomPlaceholderField'],
          CustomerMatchUploadKeyType: ['customer_match_upload_key_type_pb', 'CustomerMatchUploadKeyType'],
          DataDrivenModelStatus: ['data_driven_model_status_pb', 'DataDrivenModelStatus'],
          DayOfWeek: ['day_of_week_pb', 'DayOfWeek'],
          Device: ['device_pb', 'Device'],
          DisplayAdFormatSetting: ['display_ad_format_setting_pb', 'DisplayAdFormatSetting'],
          EducationPlaceholderField: ['education_placeholder_field_pb', 'EducationPlaceholderField'],
          FeedAttributeType: ['feed_attribute_type_pb', 'FeedAttributeType'],
          FeedItemQualityApprovalStatus: ['feed_item_quality_approval_status_pb', 'FeedItemQualityApprovalStatus'],
          FeedItemQualityDisapprovalReason: ['feed_item_quality_disapproval_reason_pb', 'FeedItemQualityDisapprovalReason'],
          FeedItemStatus: ['feed_item_status_pb', 'FeedItemStatus'],
          FeedItemValidationStatus: ['feed_item_validation_status_pb', 'FeedItemValidationStatus'],
          FeedLinkStatus: ['feed_link_status_pb', 'FeedLinkStatus'],
          FeedMappingCriterionType: ['feed_mapping_criterion_type_pb', 'FeedMappingCriterionType'],
          FeedMappingStatus: ['feed_mapping_status_pb', 'FeedMappingStatus'],
          FeedOrigin: ['feed_origin_pb', 'FeedOrigin'],
          FeedStatus: ['feed_status_pb', 'FeedStatus'],
          FlightPlaceholderField: ['flight_placeholder_field_pb', 'FlightPlaceholderField'],
          FrequencyCapEventType: ['frequency_cap_event_type_pb', 'FrequencyCapEventType'],
          FrequencyCapLevel: ['frequency_cap_level_pb', 'FrequencyCapLevel'],
          FrequencyCapTimeUnit: ['frequency_cap_time_unit_pb', 'FrequencyCapTimeUnit'],
          GenderType: ['gender_type_pb', 'GenderType'],
          GeoTargetingRestriction: ['geo_targeting_restriction_pb', 'GeoTargetingRestriction'],
          GeoTargetConstantStatus: ['geo_target_constant_status_pb', 'GeoTargetConstantStatus'],
          GoogleAdsFieldCategory: ['google_ads_field_category_pb', 'GoogleAdsFieldCategory'],
          GoogleAdsFieldDataType: ['google_ads_field_data_type_pb', 'GoogleAdsFieldDataType'],
          HotelDateSelectionType: ['hotel_date_selection_type_pb', 'HotelDateSelectionType'],
          HotelPlaceholderField: ['hotel_placeholder_field_pb', 'HotelPlaceholderField'],
          IncomeRangeType: ['income_range_type_pb', 'IncomeRangeType'],
          InteractionEventType: ['interaction_event_type_pb', 'InteractionEventType'],
          InteractionType: ['interaction_type_pb', 'InteractionType'],
          JobPlaceholderField: ['job_placeholder_field_pb', 'JobPlaceholderField'],
          KeywordMatchType: ['keyword_match_type_pb', 'KeywordMatchType'],
          KeywordPlanCompetitionLevel: ['keyword_plan_competition_level_pb', 'KeywordPlanCompetitionLevel'],
          KeywordPlanForecastInterval: ['keyword_plan_forecast_interval_pb', 'KeywordPlanForecastInterval'],
          KeywordPlanNetwork: ['keyword_plan_network_pb', 'KeywordPlanNetwork'],
          ListingCustomAttributeIndex: ['listing_custom_attribute_index_pb', 'ListingCustomAttributeIndex'],
          ListingGroupType: ['listing_group_type_pb', 'ListingGroupType'],
          LocalPlaceholderField: ['local_placeholder_field_pb', 'LocalPlaceholderField'],
          ManagerLinkStatus: ['manager_link_status_pb', 'ManagerLinkStatus'],
          MediaType: ['media_type_pb', 'MediaType'],
          MessagePlaceholderField: ['message_placeholder_field_pb', 'MessagePlaceholderField'],
          MimeType: ['mime_type_pb', 'MimeType'],
          MinuteOfHour: ['minute_of_hour_pb', 'MinuteOfHour'],
          MobileDeviceType: ['mobile_device_type_pb', 'MobileDeviceType'],
          MonthOfYear: ['month_of_year_pb', 'MonthOfYear'],
          OperatingSystemVersionOperatorType: ['operating_system_version_operator_type_pb', 'OperatingSystemVersionOperatorType'],
          PageOnePromotedStrategyGoal: ['page_one_promoted_strategy_goal_pb', 'PageOnePromotedStrategyGoal'],
          ParentalStatusType: ['parental_status_type_pb', 'ParentalStatusType'],
          PlaceholderType: ['placeholder_type_pb', 'PlaceholderType'],
          PolicyApprovalStatus: ['policy_approval_status_pb', 'PolicyApprovalStatus'],
          PolicyReviewStatus: ['policy_review_status_pb', 'PolicyReviewStatus'],
          PolicyTopicEntryType: ['policy_topic_entry_type_pb', 'PolicyTopicEntryType'],
          PolicyTopicEvidenceDestinationMismatchUrlType: ['policy_topic_evidence_destination_mismatch_url_type_pb', 'PolicyTopicEvidenceDestinationMismatchUrlType'],
          PreferredContentType: ['preferred_content_type_pb', 'PreferredContentType'],
          PricePlaceholderField: ['price_placeholder_field_pb', 'PricePlaceholderField'],
          ProductChannel: ['product_channel_pb', 'ProductChannel'],
          ProductChannelExclusivity: ['product_channel_exclusivity_pb', 'ProductChannelExclusivity'],
          ProductCondition: ['product_condition_pb', 'ProductCondition'],
          ProductTypeLevel: ['product_type_level_pb', 'ProductTypeLevel'],
          PromotionPlaceholderField: ['promotion_placeholder_field_pb', 'PromotionPlaceholderField'],
          ProximityRadiusUnits: ['proximity_radius_units_pb', 'ProximityRadiusUnits'],
          QualityScoreBucket: ['quality_score_bucket_pb', 'QualityScoreBucket'],
          RealEstatePlaceholderField: ['real_estate_placeholder_field_pb', 'RealEstatePlaceholderField'],
          RecommendationType: ['recommendation_type_pb', 'RecommendationType'],
          SearchTermMatchType: ['search_term_match_type_pb', 'SearchTermMatchType'],
          SearchTermTargetingStatus: ['search_term_targeting_status_pb', 'SearchTermTargetingStatus'],
          SharedSetStatus: ['shared_set_status_pb', 'SharedSetStatus'],
          SharedSetType: ['shared_set_type_pb', 'SharedSetType'],
          SitelinkPlaceholderField: ['sitelink_placeholder_field_pb', 'SitelinkPlaceholderField'],
          Slot: ['slot_pb', 'Slot'],
          SpendingLimitType: ['spending_limit_type_pb', 'SpendingLimitType'],
          StructuredSnippetPlaceholderField: [ 'structured_snippet_placeholder_field_pb', 'StructuredSnippetPlaceholderField'],
          TargetCpaOptInRecommendationGoal: [ 'target_cpa_opt_in_recommendation_goal_pb', 'TargetCpaOptInRecommendationGoal'],
          TargetingDimension: ['targeting_dimension_pb', 'TargetingDimension'],
          TimeType: ['time_type_pb', 'TimeType'],
          TrackingCodePageFormat: ['tracking_code_page_format_pb', 'TrackingCodePageFormat'],
          TrackingCodeType: ['tracking_code_type_pb', 'TrackingCodeType'],
          TravelPlaceholderField: ['travel_placeholder_field_pb', 'TravelPlaceholderField'],
          UserInterestTaxonomyType: ['user_interest_taxonomy_type_pb', 'UserInterestTaxonomyType'],
          UserListAccessStatus: ['user_list_access_status_pb', 'UserListAccessStatus'],
          UserListClosingReason: ['user_list_closing_reason_pb', 'UserListClosingReason'],
          UserListCombinedRuleOperator: ['user_list_combined_rule_operator_pb', 'UserListCombinedRuleOperator'],
          UserListCrmDataSourceType: ['user_list_crm_data_source_type_pb', 'UserListCrmDataSourceType'],
          UserListDateRuleItemOperator: ['user_list_date_rule_item_operator_pb', 'UserListDateRuleItemOperator'],
          UserListLogicalRuleOperator: ['user_list_logical_rule_operator_pb', 'UserListLogicalRuleOperator'],
          UserListMembershipStatus: ['user_list_membership_status_pb', 'UserListMembershipStatus'],
          UserListNumberRuleItemOperator: ['user_list_number_rule_item_operator_pb', 'UserListNumberRuleItemOperator'],
          UserListPrepopulationStatus: ['user_list_prepopulation_status_pb', 'UserListPrepopulationStatus'],
          UserListRuleType: ['user_list_rule_type_pb', 'UserListRuleType'],
          UserListSizeRange: ['user_list_size_range_pb', 'UserListSizeRange'],
          UserListStringRuleItemOperator: ['user_list_string_rule_item_operator_pb', 'UserListStringRuleItemOperator'],
          UserListType: ['user_list_type_pb', 'UserListType'],
          VanityPharmaDisplayUrlMode: ['vanity_pharma_display_url_mode_pb', 'VanityPharmaDisplayUrlMode'],
          VanityPharmaText: ['vanity_pharma_text_pb', 'VanityPharmaText'],
          WebpageConditionOperand: ['webpage_condition_operand_pb', 'WebpageConditionOperand'],
          WebpageConditionOperator: ['webpage_condition_operator_pb', 'WebpageConditionOperator'],
        }.freeze

        SERVICES = {
          AccountBudgetProposal: ['account_budget_proposal_service_client', 'AccountBudgetProposalServiceClient'],
          AccountBudget: ['account_budget_service_client', 'AccountBudgetServiceClient'],
          AdGroupAd: ['ad_group_ad_service_client', 'AdGroupAdServiceClient'],
          AdGroupAudienceView: ['ad_group_audience_view_service_client', 'AdGroupAudienceViewServiceClient'],
          AdGroupBidModifier: ['ad_group_bid_modifier_service_client', 'AdGroupBidModifierServiceClient'],
          AdGroupCriterion: ['ad_group_criterion_service_client', 'AdGroupCriterionServiceClient'],
          AdGroupFeed: ['ad_group_feed_service_client', 'AdGroupFeedServiceClient'],
          AdGroup: ['ad_group_service_client', 'AdGroupServiceClient'],
          AdParameter: ['ad_parameter_service_client', 'AdParameterServiceClient'],
          AdScheduleView: ['ad_schedule_view_service_client', 'AdScheduleViewServiceClient'],
          AgeRangeView: ['age_range_view_service_client', 'AgeRangeViewServiceClient'],
          BiddingStrategy: ['bidding_strategy_service_client', 'BiddingStrategyServiceClient'],
          BillingSetup: ['billing_setup_service_client', 'BillingSetupServiceClient'],
          CampaignAudienceView: ['campaign_audience_view_service_client', 'CampaignAudienceViewServiceClient'],
          CampaignBidModifier: ['campaign_bid_modifier_service_client', 'CampaignBidModifierServiceClient'],
          CampaignBudget: ['campaign_budget_service_client', 'CampaignBudgetServiceClient'],
          CampaignCriterion: ['campaign_criterion_service_client', 'CampaignCriterionServiceClient'],
          CampaignFeed: ['campaign_feed_service_client', 'CampaignFeedServiceClient'],
          Campaign: ['campaign_service_client', 'CampaignServiceClient'],
          CampaignSharedSet: ['campaign_shared_set_service_client', 'CampaignSharedSetServiceClient'],
          CarrierConstant: ['carrier_constant_service_client', 'CarrierConstantServiceClient'],
          ChangeStatus: ['change_status_service_client', 'ChangeStatusServiceClient'],
          ConversionAction: ['conversion_action_service_client', 'ConversionActionServiceClient'],
          CustomerClientLink: ['customer_client_link_service_client', 'CustomerClientLinkServiceClient'],
          CustomerClient: ['customer_client_service_client', 'CustomerClientServiceClient'],
          CustomerFeed: ['customer_feed_service_client', 'CustomerFeedServiceClient'],
          CustomerManagerLink: ['customer_manager_link_service_client', 'CustomerManagerLinkServiceClient'],
          Customer: ['customer_service_client', 'CustomerServiceClient'],
          DisplayKeywordView: ['display_keyword_view_service_client', 'DisplayKeywordViewServiceClient'],
          FeedItem: ['feed_item_service_client', 'FeedItemServiceClient'],
          FeedMapping: ['feed_mapping_service_client', 'FeedMappingServiceClient'],
          Feed: ['feed_service_client', 'FeedServiceClient'],
          GenderView: ['gender_view_service_client', 'GenderViewServiceClient'],
          GeoTargetConstant: ['geo_target_constant_service_client', 'GeoTargetConstantServiceClient'],
          GoogleAdsField: ['google_ads_field_service_client', 'GoogleAdsFieldServiceClient'],
          GoogleAds: ['google_ads_service_client', 'GoogleAdsServiceClient'],
          HotelGroupView: ['hotel_group_view_service_client', 'HotelGroupViewServiceClient'],
          HotelPerformanceView: ['hotel_performance_view_service_client', 'HotelPerformanceViewServiceClient'],
          KeywordPlanAdGroup: ['keyword_plan_ad_group_service_client', 'KeywordPlanAdGroupServiceClient'],
          KeywordPlanCampaign: ['keyword_plan_campaign_service_client', 'KeywordPlanCampaignServiceClient'],
          KeywordPlanIdea: ['keyword_plan_idea_service_client', 'KeywordPlanIdeaServiceClient'],
          KeywordPlanKeyword: ['keyword_plan_keyword_service_client', 'KeywordPlanKeywordServiceClient'],
          KeywordPlanNegativeKeyword: ['keyword_plan_negative_keyword_service_client', 'KeywordPlanNegativeKeywordServiceClient'],
          KeywordPlan: ['keyword_plan_service_client', 'KeywordPlanServiceClient'],
          KeywordView: ['keyword_view_service_client', 'KeywordViewServiceClient'],
          LanguageConstant: ['language_constant_service_client', 'LanguageConstantServiceClient'],
          ManagedPlacementView: ['managed_placement_view_service_client', 'ManagedPlacementViewServiceClient'],
          MediaFile: ['media_file_service_client', 'MediaFileServiceClient'],
          MobileAppCategoryConstant: ['mobile_app_category_constant_service_client', 'MobileAppCategoryConstantServiceClient'],
          MobileDeviceConstant: ['mobile_device_constant_service_client', 'MobileDeviceConstantServiceClient'],
          OperatingSystemVersionConstant: ['operating_system_version_constant_service_client', 'OperatingSystemVersionConstantServiceClient'],
          PaymentsAccount: ['payments_account_service_client', 'PaymentsAccountServiceClient'],
          ParentalStatusView: ['parental_status_view_service_client', 'ParentalStatusViewServiceClient'],
          ProductGroupView: ['product_group_view_service_client', 'ProductGroupViewServiceClient'],
          Recommendation: ['recommendation_service_client', 'RecommendationServiceClient'],
          RemarketingAction: ['remarketing_action_service_client', 'RemarketingActionServiceClient'],
          SearchTermView: ['search_term_view_service_client', 'SearchTermViewServiceClient'],
          SharedCriterion: ['shared_criterion_service_client', 'SharedCriterionServiceClient'],
          SharedSet: ['shared_set_service_client', 'SharedSetServiceClient'],
          TopicConstant: ['topic_constant_service_client', 'TopicConstantServiceClient'],
          TopicView: ['topic_view_service_client', 'TopicViewServiceClient'],
          UserInterest: ['user_interest_service_client', 'UserInterestServiceClient'],
          UserList: ['user_list_service_client', 'UserListServiceClient'],
          Video: ['video_service_client', 'VideoServiceClient']
        }.freeze

        OPERATIONS = {
          AccountBudgetProposal: ['account_budget_proposal_service_pb', 'AccountBudgetProposalOperation'],
          AdGroupAd: ['ad_group_ad_service_pb', 'AdGroupAdOperation'],
          AdGroupBidModifier: ['ad_group_bid_modifier_service_pb', 'AdGroupBidModifierOperation'],
          AdGroupCriterion: ['ad_group_criterion_service_pb', 'AdGroupCriterionOperation'],
          AdGroupFeed: ['ad_group_feed_service_pb', 'AdGroupFeedOperation'],
          AdGroup: ['ad_group_service_pb', 'AdGroupOperation'],
          AdParameter: ['ad_parameter_service_pb', 'AdParameterOperation'],
          ApplyRecommendation: ['recommendation_service_pb', 'ApplyRecommendationOperation'],
          BiddingStrategy: ['bidding_strategy_service_pb', 'BiddingStrategyOperation'],
          BillingSetup: ['billing_setup_service_pb', 'BillingSetupOperation'],
          CampaignBidModifier: ['campaign_bid_modifier_service_pb', 'CampaignBidModifierOperation'],
          CampaignBudget: ['campaign_budget_service_pb', 'CampaignBudgetOperation'],
          CampaignCriterion: ['campaign_criterion_service_pb', 'CampaignCriterionOperation'],
          CampaignFeed: ['campaign_feed_service_pb', 'CampaignFeedOperation'],
          Campaign: ['campaign_service_pb', 'CampaignOperation'],
          CampaignSharedSet: ['campaign_shared_set_service_pb', 'CampaignSharedSetOperation'],
          CustomerFeed: ['customer_feed_service_pb', 'CustomerFeedOperation'],
          Customer: ['customer_service_pb', 'CustomerOperation'],
          ConversionAction: ['conversion_action_service_pb', 'ConversionActionOperation'],
          DismissRecommendation: ['recommendation_service_pb', 'DismissRecommendationRequest::DismissRecommendationOperation'],
          FeedItem: ['feed_item_service_pb', 'FeedItemOperation'],
          FeedMapping: ['feed_mapping_service_pb', 'FeedMappingOperation'],
          Feed: ['feed_service_pb', 'FeedOperation'],
          KeywordPlanAdGroup: ['keyword_plan_ad_group_service_pb', 'KeywordPlanAdGroupOperation'],
          KeywordPlanCampaign: ['keyword_plan_campaign_service_pb', 'KeywordPlanCampaignOperation'],
          KeywordPlanKeyword: ['keyword_plan_keyword_service_pb','KeywordPlanKeywordOperation'],
          KeywordPlanNegativeKeyword: ['keyword_plan_negative_keyword_service_pb', 'KeywordPlanNegativeKeywordOperation'],
          KeywordPlan: ['keyword_plan_service_pb', 'KeywordPlanOperation'],
          MediaFile: ['media_file_service_pb', 'MediaFileOperation'],
          Mutate: ['google_ads_service_pb', 'MutateOperation'],
          RemarketingAction: ['remarketing_action_service_pb', 'RemarketingActionOperation'],
          SharedCriterion: ['shared_criterion_service_pb', 'SharedCriterionOperation'],
          SharedSet: ['shared_set_service_pb', 'SharedSetOperation'],
          UserList: ['user_list_service_pb', 'UserListOperation']
        }.freeze

        def initialize(version)
          @version = version
          @path_version = version.downcase
        end

        # Look up the class for a resource by name.
        def resource(name)
          name = name.to_sym

          resource_info = RESOURCES[name]
          if resource_info.nil?
            raise ArgumentError, sprintf('No resource found with name %s', name)
          end

          require_path = sprintf(RESOURCE_PATH, @path_version, resource_info[0],
              resource_info[1])
          require require_path

          class_path = RESOURCE_CLASS_PATH
          class_path = COMMON_CLASS_PATH if resource_info.first == 'common'
          class_path = SERVICE_CLASS_PATH if resource_info.first == 'services'
          class_path = sprintf(class_path, @version, resource_info[2])
          return class_for_path(class_path)
        end

        # Look up the class for an enum by name.
        def enum(name)
          name = name.to_sym

          enum_info = ENUMS[name]
          if enum_info.nil?
            raise ArgumentError, sprintf('No enum found with name %s', name)
          end

          require_path = sprintf(ENUM_PATH, @path_version, enum_info.first)
          require require_path

          class_path = sprintf(ENUM_CLASS_PATH, @version, enum_info.last,
              enum_info.last)
          return class_for_path(class_path)
        end

        # Look up the class for a service by name.
        def service(name)
          name = name.to_sym

          service_info = SERVICES[name]
          if service_info.nil?
            raise ArgumentError, sprintf('No service found with name %s', name)
          end

          require_path = sprintf(SERVICE_PATH, @path_version,
              service_info.first)
          require require_path

          class_path = sprintf(SERVICE_CLASS_PATH, @version, service_info.last)
          return class_for_path(class_path)
        end

        # Look up the class for an operation by name.
        def operation(name)
          name = name.to_sym

          operation_info = OPERATIONS[name]
          if operation_info.nil?
            raise ArgumentError,
                sprintf('No operation found with name %s', name)
          end

          require_path = sprintf(SERVICE_PATH, @path_version,
              operation_info.first)
          require require_path

          class_path = sprintf(SERVICE_CLASS_PATH, @version,
              operation_info.last)
          return class_for_path(class_path)
        end

        private

        # Converts complete class path into class object.
        def class_for_path(path)
          path.split('::').inject(Kernel) do |scope, const_name|
            scope.const_get(const_name)
          end
        end
      end
    end
  end
end
