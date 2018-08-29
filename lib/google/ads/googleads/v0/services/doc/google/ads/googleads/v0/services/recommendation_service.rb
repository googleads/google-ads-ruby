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
        module Services
          # Request message for {Google::Ads::Googleads::V0::Services::RecommendationService::GetRecommendation RecommendationService::GetRecommendation}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the recommendation to fetch.
          class GetRecommendationRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::RecommendationService::ApplyRecommendation RecommendationService::ApplyRecommendation}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer with the recommendation.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::ApplyRecommendationOperation>]
          #     The list of operations to apply recommendations.
          class ApplyRecommendationRequest; end

          # Information about the operation to apply a recommendation and any parameters
          # to
          # customize it.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the recommendation to apply.
          # @!attribute [rw] campaign_budget
          #   @return [Google::Ads::Googleads::V0::Services::ApplyRecommendationOperation::CampaignBudgetParameters]
          #     Optional parameters to use when applying a campaign budget
          #     recommendation.
          # @!attribute [rw] text_ad
          #   @return [Google::Ads::Googleads::V0::Services::ApplyRecommendationOperation::TextAdParameters]
          #     Optional parameters to use when applying a text ad recommendation.
          # @!attribute [rw] keyword
          #   @return [Google::Ads::Googleads::V0::Services::ApplyRecommendationOperation::KeywordParameters]
          #     Optional parameters to use when applying keyword recommendation.
          # @!attribute [rw] target_cpa_opt_in
          #   @return [Google::Ads::Googleads::V0::Services::ApplyRecommendationOperation::TargetCpaOptInParameters]
          #     Optional parameters to use when applying target CPA opt-in
          #     recommendation.
          class ApplyRecommendationOperation
            # Parameters to use when applying a campaign budget recommendation.
            # @!attribute [rw] new_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     New budget amount to set for target budget resource. This is a required
            #     field.
            class CampaignBudgetParameters; end

            # Parameters to use when applying a text ad recommendation.
            # @!attribute [rw] ad
            #   @return [Google::Ads::Googleads::V0::Resources::Ad]
            #     New ad to add to recommended ad group. All necessary fields need to be
            #     set in this message. This is a required field.
            class TextAdParameters; end

            # Parameters to use when applying keyword recommendation.
            # @!attribute [rw] ad_group
            #   @return [Google::Protobuf::StringValue]
            #     The ad group resource to add keyword to. This is a required field.
            # @!attribute [rw] match_type
            #   @return [Google::Ads::Googleads::V0::Enums::KeywordMatchTypeEnum::KeywordMatchType]
            #     The match type of the keyword. This is a required field.
            # @!attribute [rw] cpc_bid_micros
            #   @return [Google::Protobuf::Int64Value]
            #     Optional, CPC bid to set for the keyword. If not set, keyword will use
            #     bid based on bidding strategy used by target ad group.
            class KeywordParameters; end

            # Parameters to use when applying Target CPA recommendation.
            # @!attribute [rw] target_cpa_micros
            #   @return [Google::Protobuf::Int64Value]
            #     Average CPA to use for Target CPA bidding strategy. This is a required
            #     field.
            # @!attribute [rw] new_campaign_budget_amount_micros
            #   @return [Google::Protobuf::Int64Value]
            #     Optional, budget amount to set for the campaign.
            class TargetCpaOptInParameters; end
          end

          # Response message for {Google::Ads::Googleads::V0::Services::RecommendationService::ApplyRecommendation RecommendationService::ApplyRecommendation}.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::ApplyRecommendationResult>]
          #     Results of operations to apply recommendations.
          class ApplyRecommendationResponse; end

          # The result of applying a recommendation.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful applies.
          # @!attribute [rw] status
          #   @return [Google::Rpc::Status]
          #     Returned for failed operations.
          class ApplyRecommendationResult; end
        end
      end
    end
  end
end