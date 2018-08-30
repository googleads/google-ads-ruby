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
          # Request message for {Google::Ads::Googleads::V0::Services::CampaignSharedSetService::GetCampaignSharedSet CampaignSharedSetService::GetCampaignSharedSet}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign shared set to fetch.
          class GetCampaignSharedSetRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::CampaignSharedSetService::MutateCampaignSharedSets CampaignSharedSetService::MutateCampaignSharedSets}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose campaign shared sets are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::CampaignSharedSetOperation>]
          #     The list of operations to perform on individual campaign shared sets.
          class MutateCampaignSharedSetsRequest; end

          # A single operation (create, remove) on an campaign shared set.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignSharedSet]
          #     Create operation: No resource name is expected for the new campaign
          #     shared set.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed campaign shared set is
          #     expected, in this format:
          #
          #
          #     +customers/{customer_id}/campaignSharedSets/{campaign_id}_{shared_set_id}+
          class CampaignSharedSetOperation; end

          # Response message for a campaign shared set mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateCampaignSharedSetResult>]
          #     All results for the mutate.
          class MutateCampaignSharedSetsResponse; end

          # The result for the campaign shared set mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignSharedSetResult; end
        end
      end
    end
  end
end