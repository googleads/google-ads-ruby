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
          # Request message for {Google::Ads::Googleads::V0::Services::CampaignGroupService::GetCampaignGroup CampaignGroupService::GetCampaignGroup}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign group to fetch.
          class GetCampaignGroupRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::CampaignGroupService::MutateCampaignGroups CampaignGroupService::MutateCampaignGroups}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose campaign groups are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::CampaignGroupOperation>]
          #     The list of operations to perform on individual campaign groups.
          class MutateCampaignGroupsRequest; end

          # A single operation (create, update, remove) on a campaign group.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignGroup]
          #     Create operation: No resource name is expected for the new campaign
          #     group.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignGroup]
          #     Update operation: The campaign group is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed campaign group is
          #     expected, in this format:
          #
          #     +customers/{customer_id}/campaignGroups/{campaign_group_id}+
          class CampaignGroupOperation; end

          # Response message for campaign group mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateCampaignGroupResult>]
          #     All results for the mutate.
          class MutateCampaignGroupsResponse; end

          # The result for the campaign group mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignGroupResult; end
        end
      end
    end
  end
end