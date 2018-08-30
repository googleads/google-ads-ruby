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
    module Googleads
      class ProtoLookupUtil
        # Variables: Version, folder (resources/common), filename
        RESOURCE_PATH = 'google/ads/googleads/%s/%s/%s'.freeze
        # Variables: Version, class name
        RESOURCE_CLASS_PATH = 'Google::Ads::Googleads::%s::Resources::%s'.freeze
        # Variables: Version, class name
        COMMON_CLASS_PATH = 'Google::Ads::Googleads::%s::Common::%s'.freeze

        # Variables: Version, filename
        ENUM_PATH = 'google/ads/googleads/%s/enums/%s'.freeze
        # Variables: Version, enum name, enum name (again)
        ENUM_CLASS_PATH = 'Google::Ads::Googleads::%s::Enums::%sEnum::%s'.freeze

        # Variables: Version, filename
        SERVICE_PATH = 'google/ads/googleads/%s/services/%s'.freeze
        # Variables: Version, entity name
        SERVICE_CLASS_PATH =
            'Google::Ads::Googleads::%s::Services::%s'.freeze

        RESOURCES = {
          AdGroupAd: ['resources', 'ad_group_ad_pb', 'AdGroupAd'],
          AdGroupCriterion: ['resources', 'ad_group_criterion_pb',
              'AdGroupCriterion'],
          QualityInfo: ['resources', 'ad_group_criterion_pb',
              'AdGroupCriterion::QualityInfo'],
          PositionEstimates: ['resources', 'ad_group_criterion_pb',
            'AdGroupCriterion::PositionEstimates'],
          AdGroup: ['resources', 'ad_group_pb', 'AdGroup'],
          AdGroupBidModifier: ['resources', 'ad_group_bid_modifier_pb',
              'AdGroupBidModifier'],
          Ad: ['resources', 'ad_pb', 'Ad'],
          BiddingStrategy: ['resources', 'bidding_strategy_pb',
              'BiddingStrategy'],
          CampaignBidModifier: ['resources', 'campaign_bid_modifier_pb',
              'CampaignBidModifier'],
          CampaignBudget: ['resources', 'campaign_budget_pb', 'CampaignBudget'],
          CampaignCriterion: ['resources', 'campaign_criterion_pb',
              'CampaignCriterion'],
          CampaignGroup: ['resources', 'campaign_group_pb', 'CampaignGroup'],
          Campaign: ['resources', 'campaign_pb', 'Campaign'],
          NetworkSettings: ['resources', 'campaign_pb',
              'Campaign::NetworkSettings'],
          HotelSettingInfo: ['resources', 'campaign_pb',
              'Campaign::HotelSettingInfo'],
          DynamicSearchAdsSetting: ['resources', 'campaign_pb',
              'Campaign::DynamicSearchAdsSetting'],
          ShoppingSetting: ['resources', 'campaign_pb',
              'Campaign::ShoppingSetting'],
          CampaignSharedSet: ['resources', 'campaign_shared_set_pb',
              'CampaignSharedSet'],
          Customer: ['resources', 'customer_pb', 'Customer'],
          GeoTargetConstant: ['resources', 'geo_target_constant_pb',
              'GeoTargetConstant'],
          GoogleAdsField: ['resources', 'google_ads_field_pb',
              'GoogleAdsField'],
          KeywordView: ['resources', 'keyword_view_pb', 'KeywordView'],
          Recommendation: ['resources', 'recommendation_pb', 'Recommendation'],
          RecommendationImpact: ['resources', 'recommendation_pb',
              'Recommendation::RecommendationImpact'],
          RecommendationMetrics: ['resources', 'recommendation_pb',
              'Recommendation::RecommendationMetrics'],
          CampaignBudgetRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::CampaignBudgetRecommendation'],
          CampaignBudgetRecommendationOption: ['resources', 'recommendation_pb',
              'Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption'],
          KeywordRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::KeywordRecommendation'],
          TextAdRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::TextAdRecommendation'],
          TargetCpaOptInRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::TargetCpaOptInRecommendation'],
          TargetCpaOptInRecommendationOption: ['resources', 'recommendation_pb',
              'Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption'],
          MaximizeConversionsOptInRecommendation: ['resources',
              'recommendation_pb',
              'Recommendation::MaximizeConversionsOptInRecommendation'],
          EnhancedCpcOptInRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::EnhancedCpcOptInRecommendation'],
          SearchPartnersOptInRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::SearchPartnersOptInRecommendation'],
          MaximizeClicksOptInRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::MaximizeClicksOptInRecommendation'],
          OptimizeAdRotationRecommendation: ['resources', 'recommendation_pb',
              'Recommendation::OptimizeAdRotationRecommendation'],
          SharedCriterion: ['resources', 'shared_criterion_pb',
              'SharedCriterion'],
          SharedSet: ['resources', 'shared_set_pb', 'SharedSet'],
          TextAdInfo: ['common', 'ad_type_infos_pb', 'TextAdInfo'],
          ExpandedTextAdInfo: ['common', 'ad_type_infos_pb', 'ExpandedTextAdInfo'],
          DynamicSearchAdInfo: ['common', 'ad_type_infos_pb', 'DynamicSearchAdInfo'],
          ResponsiveDisplayAdInfo: ['common', 'ad_type_infos_pb',
              'ResponsiveDisplayAdInfo'],
          CallOnlyAdInfo: ['common', 'ad_type_infos_pb', 'CallOnlyAdInfo'],
          ExpandedDynamicSearchAdInfo: ['common', 'ad_type_infos_pb',
              'ExpandedDynamicSearchAdInfo'],
          HotelAdInfo: ['common', 'ad_type_infos_pb', 'HotelAdInfo'],
          ShoppingSmartAdInfo: ['common', 'ad_type_infos_pb', 'ShoppingSmartAdInfo'],
          EnhancedCpc: ['common', 'bidding_pb', 'EnhancedCpc'],
          ManualCpc: ['common', 'bidding_pb', 'ManualCpc'],
          ManualCpm: ['common', 'bidding_pb', 'ManualCpm'],
          MaximizeConversions: ['common', 'bidding_pb', 'MaximizeConversions'],
          MaximizeConversionValue: ['common', 'bidding_pb',
              'MaximizeConversionValue'],
          PageOnePromoted: ['common', 'bidding_pb', 'PageOnePromoted'],
          TargetCpa: ['common', 'bidding_pb', 'TargetCpa'],
          TargetOutrankShare: ['common', 'bidding_pb', 'TargetOutrankShare'],
          TargetRoas: ['common', 'bidding_pb', 'TargetRoas'],
          TargetSpend: ['common', 'bidding_pb', 'TargetSpend'],
          PercentCpc: ['common', 'bidding_pb', 'PercentCpc'],
          KeywordInfo: ['common', 'criteria_pb', 'KeywordInfo'],
          LocationInfo: ['common', 'criteria_pb', 'LocationInfo'],
          DeviceInfo: ['common', 'criteria_pb', 'DeviceInfo'],
          ListingGroupInfo: ['common', 'criteria_pb', 'ListingGroupInfo'],
          ListingDimensionInfo: ['common', 'criteria_pb',
              'ListingDimensionInfo'],
          ListingBrandInfo: ['common', 'criteria_pb', 'ListingBrandInfo'],
          HotelIdInfo: ['common', 'criteria_pb', 'HotelIdInfo'],
          HotelClassInfo: ['common', 'criteria_pb', 'HotelClassInfo'],
          HotelCountryRegionInfo: ['common', 'criteria_pb',
              'HotelCountryRegionInfo'],
          HotelStateInfo: ['common', 'criteria_pb', 'HotelStateInfo'],
          HotelCityInfo: ['common', 'criteria_pb', 'HotelCityInfo'],
          ListingCustomAttributeInfo: ['common', 'criteria_pb',
              'ListingCustomAttributeInfo'],
          ProductConditionInfo: ['common', 'criteria_pb',
              'ProductConditionInfo'],
          ProductTypeInfo: ['common', 'criteria_pb', 'ProductTypeInfo'],
          HotelDateSelectionTypeInfo: ['common', 'criteria_pb',
              'HotelDateSelectionTypeInfo'],
          HotelAdvanceBookingWindowInfo: ['common', 'criteria_pb',
              'HotelAdvanceBookingWindowInfo'],
          HotelLengthOfStayInfo: ['common', 'criteria_pb',
              'HotelLengthOfStayInfo'],
          HotelCheckInDayInfo: ['common', 'criteria_pb', 'HotelCheckInDayInfo'],
          InteractionTypeInfo: ['common', 'criteria_pb', 'InteractionTypeInfo'],
          AdScheduleInfo: ['common', 'criteria_pb', 'AdScheduleInfo'],
          CustomParameter: ['common', 'custom_parameter_pb', 'CustomParameter'],
          Metrics: ['common', 'metrics_pb', 'Metrics'],
          PolicyViolationKey: ['common', 'policy_pb', 'PolicyViolationKey'],
          PolicyTopicEntry: ['common', 'policy_pb', 'PolicyTopicEntry'],
          PolicyTopicEvidence: ['common', 'policy_pb', 'PolicyTopicEvidence'],
          TextList: ['common', 'policy_pb', 'PolicyTopicEvidence::TextList'],
          WebsiteList: ['common', 'policy_pb',
              'PolicyTopicEvidence::WebsiteList'],
          DestinationTextList: ['common', 'policy_pb',
              'PolicyTopicEvidence::DestinationTextList'],
          DestinationMismatch: ['common', 'policy_pb',
              'PolicyTopicEvidence::DestinationMismatch'],
          PolicyTopicConstraint: ['common', 'policy_pb',
              'PolicyTopicConstraint'],
          CountryConstraintList: ['common', 'policy_pb',
              'PolicyTopicConstraint::CountryConstraintList'],
          ResellerConstraint: ['common', 'policy_pb',
              'PolicyTopicConstraint::ResellerConstraint'],
          CountryConstraint: ['common', 'policy_pb',
              'PolicyTopicConstraint::CountryConstraint'],
          Value: ['common', 'value_pb', 'Value'],
          CampaignBudgetParameters: ['services', 'recommendation_service_pb',
              'ApplyRecommendationOperation::CampaignBudgetParameters'],
          TextAdParameters: ['services', 'recommendation_service_pb',
              'ApplyRecommendationOperation::TextAdParameters'],
          KeywordParameters: ['services', 'recommendation_service_pb',
              'ApplyRecommendationOperation::KeywordParameters'],
          TargetCpaOptInParameters: ['services', 'recommendation_service_pb',
              'ApplyRecommendationOperation::TargetCpaOptInParameters']
        }.freeze

        ENUMS = {
          AdGroupAdStatus: ['ad_group_ad_status_pb', 'AdGroupAdStatus'],
          AdGroupCriterionStatus: ['ad_group_criterion_status_pb',
              'AdGroupCriterionStatus'],
          AdGroupStatus: ['ad_group_status_pb', 'AdGroupStatus'],
          AdGroupType: ['ad_group_type_pb', 'AdGroupType'],
          AdNetworkType: ['ad_network_type_pb', 'AdNetworkType'],
          AdServingOptimizationStatus: ['ad_serving_optimization_status_pb',
              'AdServingOptimizationStatus'],
          AdType: ['ad_type_pb', 'AdType'],
          AdvertisingChannelSubType: ['advertising_channel_sub_type_pb',
              'AdvertisingChannelSubType'],
          AdvertisingChannelType: ['advertising_channel_type_pb',
              'AdvertisingChannelType'],
          BiddingSource: ['bidding_source_pb', 'BiddingSource'],
          BiddingStrategyType: ['bidding_strategy_type_pb',
              'BiddingStrategyType'],
          BidModifierSource: ['bid_modifier_source_pb', 'BidModifierSource'],
          BudgetDeliveryMethod: ['budget_delivery_method_pb',
              'BudgetDeliveryMethod'],
          BudgetStatus: ['budget_status_pb', 'BudgetStatus'],
          CampaignGroupStatus: ['campaign_group_status_pb',
              'CampaignGroupStatus'],
          CampaignServingStatus: ['campaign_serving_status_pb',
              'CampaignServingStatus'],
          CampaignSharedSetStatus: ['campaign_shared_set_status_pb',
              'CampaignSharedSetStatus'],
          CampaignStatus: ['campaign_status_pb', 'CampaignStatus'],
          DayOfWeek: ['day_of_week_pb', 'DayOfWeek'],
          Device: ['device_pb', 'Device'],
          GoogleAdsFieldCategory: ['google_ads_field_category_pb',
              'GoogleAdsFieldCategory'],
          GoogleAdsFieldDataType: ['google_ads_field_data_type_pb',
              'GoogleAdsFieldDataType'],
          HotelDateSelectionType: ['hotel_date_selection_type_pb',
              'HotelDateSelectionType'],
          InteractionType: ['interaction_type_pb', 'InteractionType'],
          KeywordMatchType: ['keyword_match_type_pb', 'KeywordMatchType'],
          ListingCustomAttributeIndex: ['listing_custom_attribute_index_pb',
              'ListingCustomAttributeIndex'],
          ListingGroupType: ['listing_group_type_pb', 'ListingGroupType'],
          MinuteOfHour: ['minute_of_hour_pb', 'MinuteOfHour'],
          MonthOfYear: ['month_of_year_pb', 'MonthOfYear'],
          PageOnePromotedStrategyGoal: ['page_one_promoted_strategy_goal_pb',
              'PageOnePromotedStrategyGoal'],
          PolicyTopicEntryType: ['policy_topic_entry_type_pb',
              'PolicyTopicEntryType'],
          PolicyTopicEvidenceDestinationMismatchUrlType: [
              'policy_topic_evidence_destination_mismatch_url_type_pb',
              'PolicyTopicEvidenceDestinationMismatchUrlType'],
          ProductCondition: ['product_condition_pb', 'ProductCondition'],
          ProductTypeLevel: ['product_type_level_pb', 'ProductTypeLevel'],
          QualityScoreBucket: ['quality_score_bucket_pb', 'QualityScoreBucket'],
          RecommendationType: ['recommendation_type_pb', 'RecommendationType'],
          SharedSetStatus: ['shared_set_status_pb', 'SharedSetStatus'],
          SharedSetType: ['shared_set_type_pb', 'SharedSetType'],
          Slot: ['slot_pb', 'Slot'],
          TargetCpaOptInRecommendationGoal: [
              'target_cpa_opt_in_recommendation_goal_pb',
              'TargetCpaOptInRecommendationGoal']
        }.freeze

        SERVICES = {
          AdGroupAd: ['ad_group_ad_service_client', 'AdGroupAdServiceClient'],
          AdGroupBidModifier: ['ad_group_bid_modifier_service_client',
              'AdGroupBidModifierServiceClient'],
          AdGroupCriterion: ['ad_group_criterion_service_client',
              'AdGroupCriterionServiceClient'],
          AdGroup: ['ad_group_service_client', 'AdGroupServiceClient'],
          BiddingStrategy: ['bidding_strategy_service_client',
              'BiddingStrategyServiceClient'],
          CampaignBidModifier: ['campaign_bid_modifier_service_client',
              'CampaignBidModifierServiceClient'],
          CampaignBudget: ['campaign_budget_service_client',
              'CampaignBudgetServiceClient'],
          CampaignCriterion: ['campaign_criterion_service_client',
              'CampaignCriterionServiceClient'],
          CampaignGroup: ['campaign_group_service_client',
              'CampaignGroupServiceClient'],
          Campaign: ['campaign_service_client', 'CampaignServiceClient'],
          CampaignSharedSet: ['campaign_shared_set_service_client',
              'CampaignSharedSetServiceClient'],
          Customer: ['customer_service_client', 'CustomerServiceClient'],
          GeoTargetConstant: ['geo_target_constant_service_client',
              'GeoTargetConstantServiceClient'],
          GoogleAdsField: ['google_ads_field_service_client',
              'GoogleAdsFieldServiceClient'],
          GoogleAds: ['google_ads_service_client', 'GoogleAdsServiceClient'],
          KeywordView: ['keyword_view_service_client',
              'KeywordViewServiceClient'],
          Recommendation: ['recommendation_service_client',
              'RecommendationServiceClient'],
          SharedCriterion: ['shared_criterion_service_client',
              'SharedCriterionServiceClient'],
          SharedSet: ['shared_set_service_client', 'SharedSetServiceClient']
        }.freeze

        OPERATIONS = {
          AdGroupAd: ['ad_group_ad_service_pb', 'AdGroupAdOperation'],
          AdGroupBidModifier: ['ad_group_bid_modifier_service_pb',
              'AdGroupBidModifierOperation'],
          AdGroupCriterion: ['ad_group_criterion_service_pb',
              'AdGroupCriterionOperation'],
          AdGroup: ['ad_group_service_pb', 'AdGroupOperation'],
          ApplyRecommendation: ['recommendation_service_pb',
              'ApplyRecommendationOperation'],
          BiddingStrategy: ['bidding_strategy_service_pb',
              'BiddingStrategyOperation'],
          CampaignBidModifier: ['campaign_bid_modifier_service_pb',
              'CampaignBidModifierOperation'],
          CampaignBudget: ['campaign_budget_service_pb',
              'CampaignBudgetOperation'],
          CampaignCriterion: ['campaign_criterion_service_pb',
              'CampaignCriterionOperation'],
          CampaignGroup: ['campaign_group_service_pb',
              'CampaignGroupOperation'],
          Campaign: ['campaign_service_pb', 'CampaignOperation'],
          CampaignSharedSet: ['campaign_shared_set_service_pb',
              'CampaignSharedSetOperation'],
          SharedCriterion: ['shared_criterion_service_pb',
              'SharedCriterionOperation'],
          SharedSet: ['shared_set_service_pb', 'SharedSetOperation']
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
