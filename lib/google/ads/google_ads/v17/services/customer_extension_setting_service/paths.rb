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
          module CustomerExtensionSettingService
            # Path helper methods for the CustomerExtensionSettingService API.
            module Paths
              ##
              # Create a fully-qualified CustomerExtensionSetting resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/customerExtensionSettings/{extension_type}`
              #
              # @param customer_id [String]
              # @param extension_type [String]
              #
              # @return [::String]
              def customer_extension_setting_path customer_id:, extension_type:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/customerExtensionSettings/#{extension_type}"
              end

              ##
              # Create a fully-qualified ExtensionFeedItem resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/extensionFeedItems/{feed_item_id}`
              #
              # @param customer_id [String]
              # @param feed_item_id [String]
              #
              # @return [::String]
              def extension_feed_item_path customer_id:, feed_item_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/extensionFeedItems/#{feed_item_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
