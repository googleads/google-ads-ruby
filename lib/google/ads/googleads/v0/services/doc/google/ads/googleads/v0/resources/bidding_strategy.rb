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
          # A bidding strategy.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the bidding strategy.
          #     Bidding strategy resource names have the form:
          #
          #     +customers/{customer_id}/biddingStrategies/{bidding_strategy_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the bidding strategy.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the bidding strategy.
          #     All bidding strategies within an account must be named distinctly.
          #
          #     The length of this string should be between 1 and 255, inclusive,
          #     in UTF-8 bytes, (trimmed).
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingStrategyTypeEnum::BiddingStrategyType]
          #     The type of the bidding strategy.
          #     Create a bidding strategy by setting the bidding scheme.
          #
          #     This field is read-only.
          # @!attribute [rw] enhanced_cpc
          #   @return [Google::Ads::Googleads::V0::Common::EnhancedCpc]
          #     A bidding strategy that raises bids for clicks that seem more likely to
          #     lead to a conversion and lowers them for clicks where they seem less
          #     likely.
          # @!attribute [rw] page_one_promoted
          #   @return [Google::Ads::Googleads::V0::Common::PageOnePromoted]
          #     A bidding strategy that sets max CPC bids to target impressions on
          #     page one or page one promoted slots on google.com.
          # @!attribute [rw] target_cpa
          #   @return [Google::Ads::Googleads::V0::Common::TargetCpa]
          #     A bidding strategy that sets bids to help get as many conversions as
          #     possible at the target cost-per-acquisition (CPA) you set.
          # @!attribute [rw] target_outrank_share
          #   @return [Google::Ads::Googleads::V0::Common::TargetOutrankShare]
          #     A bidding strategy that sets bids based on the target fraction of
          #     auctions where the advertiser should outrank a specific competitor.
          # @!attribute [rw] target_roas
          #   @return [Google::Ads::Googleads::V0::Common::TargetRoas]
          #     A bidding strategy that helps you maximize revenue while averaging a
          #     specific target Return On Ad Spend (ROAS).
          # @!attribute [rw] target_spend
          #   @return [Google::Ads::Googleads::V0::Common::TargetSpend]
          #     A bid strategy that sets your bids to help get as many clicks as
          #     possible within your budget.
          class BiddingStrategy; end
        end
      end
    end
  end
end