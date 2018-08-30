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
          # A campaign budget.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign budget.
          #     Campaign budget resource names have the form:
          #
          #     +customers/{customer_id}/campaignBudgets/{budget_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the campaign budget.
          #
          #     A campaign budget is created using the CampaignBudgetService create
          #     operation and is assigned a budget ID. A budget ID can be shared across
          #     different campaigns; the system will then allocate the campaign budget
          #     among different campaigns to get optimum results.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the campaign budget.
          #
          #     When creating a campaign budget through CampaignBudgetService, every
          #     explicitly shared campaign budget must have a non-null, non-empty name.
          #     Campaign budgets that are not explicitly shared derive their name from the
          #     attached campaign's name.
          #
          #     The length of this string must be between 1 and 255, inclusive,
          #     in UTF-8 bytes, (trimmed).
          # @!attribute [rw] amount_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The amount of the budget, in the local currency for the account.
          #     Amount is specified in micros, where one million is equivalent to one
          #     currency unit.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::BudgetStatusEnum::BudgetStatus]
          #     The status of this campaign budget. This field is read-only.
          # @!attribute [rw] delivery_method
          #   @return [Google::Ads::Googleads::V0::Enums::BudgetDeliveryMethodEnum::BudgetDeliveryMethod]
          #     The delivery method that determines the rate at which the campaign budget
          #     is spent.
          #
          #     Defaults to STANDARD if unspecified in a create operation.
          # @!attribute [rw] explicitly_shared
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the budget is explicitly shared. This field is set to false by
          #     default.
          #
          #     If true, the budget was created with the purpose of sharing
          #     across one or more campaigns.
          #
          #     If false, the budget was created with the intention of only being used
          #     with a single campaign. The budget's name and status will stay in sync
          #     with the campaign's name and status. Attempting to share the budget with a
          #     second campaign will result in an error.
          #
          #     A non-shared budget can become an explicitly shared. The same operation
          #     must
          #     also assign the budget a name.
          #
          #     A shared campaign budget can never become non-shared.
          # @!attribute [rw] reference_count
          #   @return [Google::Protobuf::Int64Value]
          #     The number of campaigns actively using the budget.
          #
          #     This field is read-only.
          class CampaignBudget; end
        end
      end
    end
  end
end