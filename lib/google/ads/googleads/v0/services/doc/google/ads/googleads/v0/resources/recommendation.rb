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

module Google
  module Ads
    module Googleads
      module V0
        module Resources
          # A recommendation.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the recommendation.
          #
          #     +customers/{customer_id}/recommendations/{recommendation_id}+
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::RecommendationTypeEnum::RecommendationType]
          #     The type of recommendation.
          # @!attribute [rw] impact
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::RecommendationImpact]
          #     The impact on account performance as a result of applying the
          #     recommendation.
          # @!attribute [rw] campaign_budget
          #   @return [Google::Protobuf::StringValue]
          #     The budget targeted by this recommendation. This will be set only when
          #     the recommendation affects a single campaign budget.
          #
          #     This field must not be used in WHERE clauses.
          #
          #     This field will be set for the following recommendation types:
          #     CAMPAIGN_BUDGET
          # @!attribute [rw] campaign
          #   @return [Google::Protobuf::StringValue]
          #     The campaign targeted by this recommendation. This will be set only when
          #     the recommendation affects a single campaign.
          #
          #     This field must not be used in WHERE clauses.
          #
          #     This field will be set for the following recommendation types:
          #     ENHANCED_CPC_OPT_IN, KEYWORD, MAXIMIZE_CLICKS_OPT_IN,
          #     MAXIMIZE_CONVERSIONS_OPT_IN, OPTIMIZE_AD_ROTATION, SEARCH_PARTNERS_OPT_IN,
          #     TARGET_CPA_OPT_IN, TEXT_AD
          # @!attribute [rw] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     The ad group targeted by this recommendation. This will be set only when
          #     the recommendation affects a single ad group.
          #
          #     This field must not be used in WHERE clauses.
          #
          #     This field will be set for the following recommendation types:
          #     KEYWORD, OPTIMIZE_AD_ROTATION, TEXT_AD
          # @!attribute [rw] dismissed
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the recommendation is dismissed or not.
          # @!attribute [rw] campaign_budget_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::CampaignBudgetRecommendation]
          #     The campaign budget recommendation.
          # @!attribute [rw] keyword_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::KeywordRecommendation]
          #     The keyword recommendation.
          # @!attribute [rw] text_ad_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::TextAdRecommendation]
          #     Add expanded text ad recommendation.
          # @!attribute [rw] target_cpa_opt_in_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::TargetCpaOptInRecommendation]
          #     The TargetCPA opt-in recommendation.
          # @!attribute [rw] maximize_conversions_opt_in_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::MaximizeConversionsOptInRecommendation]
          #     The MaximizeConversions Opt-In recommendation.
          # @!attribute [rw] enhanced_cpc_opt_in_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::EnhancedCpcOptInRecommendation]
          #     The Enhanced Cost-Per-Click Opt-In recommendation.
          # @!attribute [rw] search_partners_opt_in_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::SearchPartnersOptInRecommendation]
          #     The Search Partners Opt-In recommendation.
          # @!attribute [rw] maximize_clicks_opt_in_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::MaximizeClicksOptInRecommendation]
          #     The MaximizeClicks Opt-In recommendation.
          # @!attribute [rw] optimize_ad_rotation_recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::OptimizeAdRotationRecommendation]
          #     The Optimize Ad Rotation recommendation.
          class Recommendation
            # The impact of making the change as described in the recommendation.
            # Some types of recommendations may not have impact information.
            # @!attribute [rw] base_metrics
            #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::RecommendationMetrics]
            #     Base metrics at the time the recommendation was generated.
            # @!attribute [rw] potential_metrics
            #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::RecommendationMetrics]
            #     Estimated metrics if the recommendation is applied.
            class RecommendationImpact; end

            # Weekly account performance metrics. For some recommendation types, these
            # are averaged over the past 90-day period and hence can be fractional.
            # @!attribute [rw] impressions
            #   @return [Google::Protobuf::DoubleValue]
            #     Number of ad impressions.
            # @!attribute [rw] clicks
            #   @return [Google::Protobuf::DoubleValue]
            #     Number of ad clicks.
            # @!attribute [rw] cost_micros
            #   @return [Google::Protobuf::Int64Value]
            #     Cost (in micros) for advertising, in the local currency for the account.
            # @!attribute [rw] conversions
            #   @return [Google::Protobuf::DoubleValue]
            #     Number of conversions.
            # @!attribute [rw] video_views
            #   @return [Google::Protobuf::DoubleValue]
            #     Number of video views for a video ad campaign.
            class RecommendationMetrics; end

            # The budget recommendation for budget constrained campaigns.
            # @!attribute [rw] current_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The current budget amount in micros.
            # @!attribute [rw] recommended_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The recommended budget amount in micros.
            # @!attribute [rw] budget_options
            #   @return [Array<Google::Ads::Googleads::V0::Resources::Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption>]
            #     The budget amounts and associated impact estimates for some values of
            #     possible budget amounts.
            class CampaignBudgetRecommendation
              # The impact estimates for a given budget amount.
              # @!attribute [rw] budget_amount_micros
              #   @return [Google::Protobuf::Int64Value]
              #     The budget amount for this option.
              # @!attribute [rw] impact
              #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::RecommendationImpact]
              #     The impact estimate if budget is changed to amount specified in this
              #     option.
              class CampaignBudgetRecommendationOption; end
            end

            # The keyword recommendation.
            # @!attribute [rw] keyword
            #   @return [Google::Ads::Googleads::V0::Common::KeywordInfo]
            #     The recommended keyword.
            # @!attribute [rw] recommended_cpc_bid_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The recommended CPC (cost-per-click) bid.
            class KeywordRecommendation; end

            # The text ad recommendation.
            # @!attribute [rw] ad
            #   @return [Google::Ads::Googleads::V0::Resources::Ad]
            #     Recommended ad.
            # @!attribute [rw] creation_date
            #   @return [Google::Protobuf::StringValue]
            #     Creation date of the recommended ad.
            #     YYYY-MM-DD format, e.g., 2018-04-17.
            # @!attribute [rw] auto_apply_date
            #   @return [Google::Protobuf::StringValue]
            #     Date, if present, is the earliest when the recommendation will be auto
            #     applied.
            #     YYYY-MM-DD format, e.g., 2018-04-17.
            class TextAdRecommendation; end

            # The Target CPA opt-in recommendation.
            # @!attribute [rw] options
            #   @return [Array<Google::Ads::Googleads::V0::Resources::Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption>]
            #     The available goals and corresponding options for Target CPA strategy.
            # @!attribute [rw] recommended_target_cpa_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The recommended average CPA target. See required budget amount and impact
            #     of using this recommendation in options list.
            class TargetCpaOptInRecommendation
              # The Target CPA opt-in option with impact estimate.
              # @!attribute [rw] goal
              #   @return [Google::Ads::Googleads::V0::Enums::TargetCpaOptInRecommendationGoalEnum::TargetCpaOptInRecommendationGoal]
              #     The goal achieved by this option.
              # @!attribute [rw] target_cpa_micros
              #   @return [Google::Protobuf::Int64Value]
              #     Average CPA target.
              # @!attribute [rw] required_campaign_budget_amount_micros
              #   @return [Google::Protobuf::Int64Value]
              #     The minimum campaign budget, in local currency for the account,
              #     required to achieve the target CPA.
              #     Amount is specified in micros, where one million is equivalent to one
              #     currency unit.
              # @!attribute [rw] impact
              #   @return [Google::Ads::Googleads::V0::Resources::Recommendation::RecommendationImpact]
              #     The impact estimate if this option is selected.
              class TargetCpaOptInRecommendationOption; end
            end

            # The Maximize Conversions Opt-In recommendation.
            # @!attribute [rw] recommended_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The recommended new budget amount.
            class MaximizeConversionsOptInRecommendation; end

            # The Enhanced Cost-Per-Click Opt-In recommendation.
            class EnhancedCpcOptInRecommendation; end

            # The Search Partners Opt-In recommendation.
            class SearchPartnersOptInRecommendation; end

            # The Maximize Clicks opt-in recommendation.
            # @!attribute [rw] recommended_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The recommended new budget amount.
            #     Only set if the current budget is too high.
            class MaximizeClicksOptInRecommendation; end

            # The Optimize Ad Rotation recommendation.
            class OptimizeAdRotationRecommendation; end
          end
        end
      end
    end
  end
end