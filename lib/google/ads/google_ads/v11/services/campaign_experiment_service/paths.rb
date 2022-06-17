# frozen_string_literal: true

# Copyright 2022 Google LLC
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
      module V11
        module Services
          module CampaignExperimentService
            # Path helper methods for the CampaignExperimentService API.
            module Paths
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
              # Create a fully-qualified CampaignDraft resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaignDrafts/{base_campaign_id}~{draft_id}`
              #
              # @param customer_id [String]
              # @param base_campaign_id [String]
              # @param draft_id [String]
              #
              # @return [::String]
              def campaign_draft_path customer_id:, base_campaign_id:, draft_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "base_campaign_id cannot contain /" if base_campaign_id.to_s.include? "/"

                "customers/#{customer_id}/campaignDrafts/#{base_campaign_id}~#{draft_id}"
              end

              ##
              # Create a fully-qualified CampaignExperiment resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/campaignExperiments/{campaign_experiment_id}`
              #
              # @param customer_id [String]
              # @param campaign_experiment_id [String]
              #
              # @return [::String]
              def campaign_experiment_path customer_id:, campaign_experiment_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/campaignExperiments/#{campaign_experiment_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
