# frozen_string_literal: true

# Copyright 2025 Google LLC
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
      module V17
        module Services
          module CampaignBudgetService
            # Path helper methods for the CampaignBudgetService API.
            module Paths
              ##
              # Create a fully-qualified CampaignBudget resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaignBudgets/{campaign_budget_id}`
              #
              # @param customer_id [String]
              # @param campaign_budget_id [String]
              #
              # @return [::String]
              def campaign_budget_path customer_id:, campaign_budget_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/campaignBudgets/#{campaign_budget_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
