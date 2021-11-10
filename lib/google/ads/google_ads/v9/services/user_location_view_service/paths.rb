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
          module UserLocationViewService
            # Path helper methods for the UserLocationViewService API.
            module Paths
              ##
              # Create a fully-qualified UserLocationView resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/userLocationViews/{country_criterion_id}~{is_targeting_location}`
              #
              # @param customer_id [String]
              # @param country_criterion_id [String]
              # @param is_targeting_location [String]
              #
              # @return [::String]
              def user_location_view_path customer_id:, country_criterion_id:, is_targeting_location:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "country_criterion_id cannot contain /" if country_criterion_id.to_s.include? "/"

                "customers/#{customer_id}/userLocationViews/#{country_criterion_id}~#{is_targeting_location}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
