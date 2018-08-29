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
          # Request message for {Google::Ads::Googleads::V0::Services::CampaignService::GetCampaign CampaignService::GetCampaign}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign to fetch.
          class GetCampaignRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::CampaignService::MutateCampaigns CampaignService::MutateCampaigns}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose campaigns are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::CampaignOperation>]
          #     The list of operations to perform on individual campaigns.
          class MutateCampaignsRequest; end

          # A single operation (create, update, remove) on a campaign.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign]
          #     Create operation: No resource name is expected for the new campaign.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign]
          #     Update operation: The campaign is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed campaign is
          #     expected, in this format:
          #
          #     +customers/{customer_id}/campaigns/{campaign_id}+
          class CampaignOperation; end

          # Response message for campaign mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateCampaignResult>]
          #     All results for the mutate.
          class MutateCampaignsResponse; end

          # The result for the campaign mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignResult; end
        end
      end
    end
  end
end