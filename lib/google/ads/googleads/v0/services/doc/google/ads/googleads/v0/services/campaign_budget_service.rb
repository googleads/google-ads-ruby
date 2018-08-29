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
          # Request message for {Google::Ads::Googleads::V0::Services::CampaignBudgetService::GetCampaignBudget CampaignBudgetService::GetCampaignBudget}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign budget to fetch.
          class GetCampaignBudgetRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::CampaignBudgetService::MutateCampaignBudgets CampaignBudgetService::MutateCampaignBudgets}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose campaign budgets are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::CampaignBudgetOperation>]
          #     The list of operations to perform on individual campaign budgets.
          class MutateCampaignBudgetsRequest; end

          # A single operation (create, update, remove) on a campaign budget.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignBudget]
          #     Create operation: No resource name is expected for the new budget.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignBudget]
          #     Update operation: The campaign budget is expected to have a valid
          #     resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed budget is expected, in
          #     this format:
          #
          #     +customers/{customer_id}/campaignBudgets/{budget_id}+
          class CampaignBudgetOperation; end

          # Response message for campaign budget mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateCampaignBudgetResult>]
          #     All results for the mutate.
          class MutateCampaignBudgetsResponse; end

          # The result for the campaign budget mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateCampaignBudgetResult; end
        end
      end
    end
  end
end