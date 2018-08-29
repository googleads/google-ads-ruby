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
          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupService::GetAdGroup AdGroupService::GetAdGroup}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad group to fetch.
          class GetAdGroupRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupService::MutateAdGroups AdGroupService::MutateAdGroups}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose ad groups are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::AdGroupOperation>]
          #     The list of operations to perform on individual ad groups.
          class MutateAdGroupsRequest; end

          # A single operation (create, update, remove) on an ad group.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroup]
          #     Create operation: No resource name is expected for the new ad group.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroup]
          #     Update operation: The ad group is expected to have a valid resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed ad group is expected,
          #     in this format:
          #
          #     +customers/{customer_id}/adGroups/{ad_group_id}+
          class AdGroupOperation; end

          # Response message for an ad group mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateAdGroupResult>]
          #     All results for the mutate.
          class MutateAdGroupsResponse; end

          # The result for the ad group mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateAdGroupResult; end
        end
      end
    end
  end
end