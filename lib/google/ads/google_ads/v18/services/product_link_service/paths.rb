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
          module ProductLinkService
            # Path helper methods for the ProductLinkService API.
            module Paths
              ##
              # Create a fully-qualified Customer resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}`
              #
              # @param customer_id [String]
              #
              # @return [::String]
              def customer_path customer_id:
                "customers/#{customer_id}"
              end

              ##
              # Create a fully-qualified ProductLink resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/productLinks/{product_link_id}`
              #
              # @param customer_id [String]
              # @param product_link_id [String]
              #
              # @return [::String]
              def product_link_path customer_id:, product_link_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/productLinks/#{product_link_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
