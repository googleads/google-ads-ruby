# frozen_string_literal: true

# Copyright 2021 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Ads
    module GoogleAds
      module V9
        module Services
          module AccountBudgetService
            # Path helper methods for the AccountBudgetService API.
            module Paths
              ##
              # Create a fully-qualified AccountBudget resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/accountBudgets/{account_budget_id}`
              #
              # @param customer_id [String]
              # @param account_budget_id [String]
              #
              # @return [::String]
              def account_budget_path customer_id:, account_budget_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/accountBudgets/#{account_budget_id}"
              end

              ##
              # Create a fully-qualified AccountBudgetProposal resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/accountBudgetProposals/{account_budget_proposal_id}`
              #
              # @param customer_id [String]
              # @param account_budget_proposal_id [String]
              #
              # @return [::String]
              def account_budget_proposal_path customer_id:, account_budget_proposal_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/accountBudgetProposals/#{account_budget_proposal_id}"
              end

              ##
              # Create a fully-qualified BillingSetup resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/billingSetups/{billing_setup_id}`
              #
              # @param customer_id [String]
              # @param billing_setup_id [String]
              #
              # @return [::String]
              def billing_setup_path customer_id:, billing_setup_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/billingSetups/#{billing_setup_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
