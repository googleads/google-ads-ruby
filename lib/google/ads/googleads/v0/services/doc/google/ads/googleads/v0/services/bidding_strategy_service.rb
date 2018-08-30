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
          # Request message for {Google::Ads::Googleads::V0::Services::BiddingStrategyService::GetBiddingStrategy BiddingStrategyService::GetBiddingStrategy}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the bidding strategy to fetch.
          class GetBiddingStrategyRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::BiddingStrategyService::MutateBiddingStrategies BiddingStrategyService::MutateBiddingStrategies}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose bidding strategies are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::BiddingStrategyOperation>]
          #     The list of operations to perform on individual bidding strategies.
          class MutateBiddingStrategiesRequest; end

          # A single operation (create, update, remove) on a bidding strategy.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::BiddingStrategy]
          #     Create operation: No resource name is expected for the new bidding
          #     strategy.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::BiddingStrategy]
          #     Update operation: The bidding strategy is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed bidding strategy is
          #     expected, in this format:
          #
          #     +customers/{customer_id}/biddingStrategies/{bidding_strategy_id}+
          class BiddingStrategyOperation; end

          # Response message for bidding strategy mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateBiddingStrategyResult>]
          #     All results for the mutate.
          class MutateBiddingStrategiesResponse; end

          # The result for the bidding strategy mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateBiddingStrategyResult; end
        end
      end
    end
  end
end