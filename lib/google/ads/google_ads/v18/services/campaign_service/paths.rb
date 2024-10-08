# frozen_string_literal: true

# Copyright 2024 Google LLC
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
      module V18
        module Services
          module CampaignService
            # Path helper methods for the CampaignService API.
            module Paths
              ##
              # Create a fully-qualified AccessibleBiddingStrategy resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/accessibleBiddingStrategies/{bidding_strategy_id}`
              #
              # @param customer_id [String]
              # @param bidding_strategy_id [String]
              #
              # @return [::String]
              def accessible_bidding_strategy_path customer_id:, bidding_strategy_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/accessibleBiddingStrategies/#{bidding_strategy_id}"
              end

              ##
              # Create a fully-qualified AssetSet resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/assetSets/{asset_set_id}`
              #
              # @param customer_id [String]
              # @param asset_set_id [String]
              #
              # @return [::String]
              def asset_set_path customer_id:, asset_set_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/assetSets/#{asset_set_id}"
              end

              ##
              # Create a fully-qualified BiddingStrategy resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/biddingStrategies/{bidding_strategy_id}`
              #
              # @param customer_id [String]
              # @param bidding_strategy_id [String]
              #
              # @return [::String]
              def bidding_strategy_path customer_id:, bidding_strategy_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/biddingStrategies/#{bidding_strategy_id}"
              end

              ##
              # Create a fully-qualified Campaign resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaigns/{campaign_id}`
              #
              # @param customer_id [String]
              # @param campaign_id [String]
              #
              # @return [::String]
              def campaign_path customer_id:, campaign_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/campaigns/#{campaign_id}"
              end

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

              ##
              # Create a fully-qualified CampaignGroup resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaignGroups/{campaign_group_id}`
              #
              # @param customer_id [String]
              # @param campaign_group_id [String]
              #
              # @return [::String]
              def campaign_group_path customer_id:, campaign_group_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/campaignGroups/#{campaign_group_id}"
              end

              ##
              # Create a fully-qualified CampaignLabel resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaignLabels/{campaign_id}~{label_id}`
              #
              # @param customer_id [String]
              # @param campaign_id [String]
              # @param label_id [String]
              #
              # @return [::String]
              def campaign_label_path customer_id:, campaign_id:, label_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "campaign_id cannot contain /" if campaign_id.to_s.include? "/"

                "customers/#{customer_id}/campaignLabels/#{campaign_id}~#{label_id}"
              end

              ##
              # Create a fully-qualified ConversionAction resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/conversionActions/{conversion_action_id}`
              #
              # @param customer_id [String]
              # @param conversion_action_id [String]
              #
              # @return [::String]
              def conversion_action_path customer_id:, conversion_action_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/conversionActions/#{conversion_action_id}"
              end

              ##
              # Create a fully-qualified Feed resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/feeds/{feed_id}`
              #
              # @param customer_id [String]
              # @param feed_id [String]
              #
              # @return [::String]
              def feed_path customer_id:, feed_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/feeds/#{feed_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end