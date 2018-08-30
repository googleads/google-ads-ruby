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
          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupBidModifierService::GetAdGroupBidModifier AdGroupBidModifierService::GetAdGroupBidModifier}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad group bid modifier to fetch.
          class GetAdGroupBidModifierRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupBidModifierService::MutateAdGroupBidModifiers AdGroupBidModifierService::MutateAdGroupBidModifiers}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     ID of the customer whose ad group bid modifiers are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::AdGroupBidModifierOperation>]
          #     The list of operations to perform on individual ad group bid modifiers.
          class MutateAdGroupBidModifiersRequest; end

          # A single operation (create, remove, update) on an ad group bid modifier.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupBidModifier]
          #     Create operation: No resource name is expected for the new ad group bid
          #     modifier.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupBidModifier]
          #     Update operation: The ad group bid modifier is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed ad group bid modifier
          #     is expected, in this format:
          #
          #
          #     +customers/{customer_id}/adGroupBidModifiers/{ad_group_id}_{criterion_id}+
          class AdGroupBidModifierOperation; end

          # Response message for ad group bid modifiers mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateAdGroupBidModifierResult>]
          #     All results for the mutate.
          class MutateAdGroupBidModifiersResponse; end

          # The result for the criterion mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateAdGroupBidModifierResult; end
        end
      end
    end
  end
end