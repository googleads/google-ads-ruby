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
          BiddingStrategy: ['resources', 'bidding_strategy_pb',
              'BiddingStrategy'],
          CampaignBudget: ['resources', 'campaign_budget_pb', 'CampaignBudget'],
          CampaignCriterion: ['resources', 'campaign_criterion_pb',
              'CampaignCriterion'],
          Campaign: ['resources', 'campaign_pb', 'Campaign'],
          NetworkSettings: ['resources', 'campaign_pb',
              'Campaign::NetworkSettings'],
          DynamicSearchAdsSetting: ['resources', 'campaign_pb',
              'Campaign::DynamicSearchAdsSetting'],
          Customer: ['resources', 'customer_pb', 'Customer'],
          GoogleAdsField: ['resources', 'google_ads_field_pb',
              'GoogleAdsField'],
          KeywordView: ['resources', 'keyword_view_pb', 'KeywordView'],
          Ad: ['common', 'ad_pb', 'Ad'],
          TextAdInfo: ['common', 'ad_pb', 'TextAdInfo'],
          ExpandedTextAdInfo: ['common', 'ad_pb', 'ExpandedTextAdInfo'],
          DynamicSearchAdInfo: ['common', 'ad_pb', 'DynamicSearchAdInfo'],
          ResponsiveDisplayAdInfo: ['common', 'ad_pb',
              'ResponsiveDisplayAdInfo'],
          CallOnlyAdInfo: ['common', 'ad_pb', 'CallOnlyAdInfo'],
          ExpandedDynamicSearchAdInfo: ['common', 'ad_pb',
              'ExpandedDynamicSearchAdInfo'],
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
          KeywordInfo: ['common', 'criteria_pb', 'KeywordInfo'],
          CustomParameter: ['common', 'custom_parameter_pb', 'CustomParameter'],
          Metrics: ['common', 'metrics_pb', 'Metrics'],
          PolicyViolationKey: ['common', 'policy_pb', 'PolicyViolationKey'],
          Value: ['common', 'value_pb', 'Value']
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
          BidSource: ['bid_source_pb', 'BidSource'],
          BiddingStrategyType: ['bidding_strategy_type_pb',
              'BiddingStrategyType'],
          BudgetDeliveryMethod: ['budget_delivery_method_pb',
              'BudgetDeliveryMethod'],
          BudgetStatus: ['budget_status_pb', 'BudgetStatus'],
          CampaignServingStatus: ['campaign_serving_status_pb',
              'CampaignServingStatus'],
          CampaignStatus: ['campaign_status_pb', 'CampaignStatus'],
          DayOfWeek: ['day_of_week_pb', 'DayOfWeek'],
          Device: ['device_pb', 'Device'],
          GoogleAdsFieldCategory: ['google_ads_field_category_pb',
              'GoogleAdsFieldCategory'],
          GoogleAdsFieldDataType: ['google_ads_field_data_type_pb',
              'GoogleAdsFieldDataType'],
          KeywordMatchType: ['keyword_match_type_pb', 'KeywordMatchType'],
          PageOnePromotedStrategyGoal: ['page_one_promoted_strategy_goal_pb',
              'PageOnePromotedStrategyGoal'],
          QualityScoreBucket: ['quality_score_bucket_pb', 'QualityScoreBucket'],
          Slot: ['slot_pb', 'Slot']
        }.freeze

        SERVICES = {
          AdGroupAd: ['ad_group_ad_service_client', 'AdGroupAdServiceClient'],
          AdGroupCriterion: ['ad_group_criterion_service_client',
              'AdGroupCriterionServiceClient'],
          AdGroup: ['ad_group_service_client', 'AdGroupServiceClient'],
          BiddingStrategy: ['bidding_strategy_service_client',
              'BiddingStrategyServiceClient'],
          CampaignBudget: ['campaign_budget_service_client',
              'CampaignBudgetServiceClient'],
          CampaignCriterion: ['campaign_criterion_service_client',
              'CampaignCriterionServiceClient'],
          Campaign: ['campaign_service_client', 'CampaignServiceClient'],
          Customer: ['customer_service_client', 'CustomerServiceClient'],
          GoogleAdsField: ['google_ads_field_service_client',
              'GoogleAdsFieldServiceClient'],
          GoogleAds: ['google_ads_service_client', 'GoogleAdsServiceClient'],
          KeywordView: ['keyword_view_service_client',
              'KeywordViewServiceClient']
        }

        OPERATIONS = {
          AdGroupAd: ['ad_group_ad_service_pb', 'AdGroupAdOperation'],
          AdGroupCriterion: ['ad_group_criterion_service_pb',
              'AdGroupCriterionOperation'],
          AdGroup: ['ad_group_service_pb', 'AdGroupOperation'],
          BiddingStrategy: ['bidding_strategy_service_pb',
              'BiddingStrategyOperation'],
          CampaignBudget: ['campaign_budget_service_pb',
              'CampaignBudgetOperation'],
          CampaignCriterion: ['campaign_criterion_service_pb',
              'CampaignCriterionOperation'],
          Campaign: ['campaign_service_pb', 'CampaignOperation'],
        }

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

          class_path = resource_info.first == 'resources' ?
              RESOURCE_CLASS_PATH : COMMON_CLASS_PATH
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
