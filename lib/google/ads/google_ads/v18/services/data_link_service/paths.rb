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
          module DataLinkService
            # Path helper methods for the DataLinkService API.
            module Paths
              ##
              # Create a fully-qualified DataLink resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/dataLinks/{product_link_id}~{data_link_id}`
              #
              # @param customer_id [String]
              # @param product_link_id [String]
              # @param data_link_id [String]
              #
              # @return [::String]
              def data_link_path customer_id:, product_link_id:, data_link_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "product_link_id cannot contain /" if product_link_id.to_s.include? "/"

                "customers/#{customer_id}/dataLinks/#{product_link_id}~#{data_link_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
