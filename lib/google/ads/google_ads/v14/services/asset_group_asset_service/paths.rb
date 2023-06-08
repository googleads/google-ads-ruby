# frozen_string_literal: true

# Copyright 2023 Google LLC
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
      module V14
        module Services
          module AssetGroupAssetService
            # Path helper methods for the AssetGroupAssetService API.
            module Paths
              ##
              # Create a fully-qualified Asset resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/assets/{asset_id}`
              #
              # @param customer_id [String]
              # @param asset_id [String]
              #
              # @return [::String]
              def asset_path customer_id:, asset_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/assets/#{asset_id}"
              end

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
              # Create a fully-qualified AssetGroupAsset resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/assetGroupAssets/{asset_group_id}~{asset_id}~{field_type}`
              #
              # @param customer_id [String]
              # @param asset_group_id [String]
              # @param asset_id [String]
              # @param field_type [String]
              #
              # @return [::String]
              def asset_group_asset_path customer_id:, asset_group_id:, asset_id:, field_type:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "asset_group_id cannot contain /" if asset_group_id.to_s.include? "/"
                raise ::ArgumentError, "asset_id cannot contain /" if asset_id.to_s.include? "/"

                "customers/#{customer_id}/assetGroupAssets/#{asset_group_id}~#{asset_id}~#{field_type}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
