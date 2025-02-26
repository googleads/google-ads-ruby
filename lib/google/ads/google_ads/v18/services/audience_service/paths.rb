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
      module V18
        module Services
          module AudienceService
            # Path helper methods for the AudienceService API.
            module Paths
              ##
              # Create a fully-qualified AssetGroup resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/assetGroups/{asset_group_id}`
              #
              # @param customer_id [String]
              # @param asset_group_id [String]
              #
              # @return [::String]
              def asset_group_path customer_id:, asset_group_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/assetGroups/#{asset_group_id}"
              end

              ##
              # Create a fully-qualified Audience resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/audiences/{audience_id}`
              #
              # @param customer_id [String]
              # @param audience_id [String]
              #
              # @return [::String]
              def audience_path customer_id:, audience_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/audiences/#{audience_id}"
              end

              ##
              # Create a fully-qualified DetailedDemographic resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/detailedDemographics/{detailed_demographic_id}`
              #
              # @param customer_id [String]
              # @param detailed_demographic_id [String]
              #
              # @return [::String]
              def detailed_demographic_path customer_id:, detailed_demographic_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/detailedDemographics/#{detailed_demographic_id}"
              end

              ##
              # Create a fully-qualified LifeEvent resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/lifeEvents/{life_event_id}`
              #
              # @param customer_id [String]
              # @param life_event_id [String]
              #
              # @return [::String]
              def life_event_path customer_id:, life_event_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/lifeEvents/#{life_event_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
