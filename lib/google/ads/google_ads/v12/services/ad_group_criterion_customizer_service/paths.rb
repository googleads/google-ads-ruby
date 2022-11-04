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
      module V12
        module Services
          module AdGroupCriterionCustomizerService
            # Path helper methods for the AdGroupCriterionCustomizerService API.
            module Paths
              ##
              # Create a fully-qualified AdGroupCriterion resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/adGroupCriteria/{ad_group_id}~{criterion_id}`
              #
              # @param customer_id [String]
              # @param ad_group_id [String]
              # @param criterion_id [String]
              #
              # @return [::String]
              def ad_group_criterion_path customer_id:, ad_group_id:, criterion_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "ad_group_id cannot contain /" if ad_group_id.to_s.include? "/"

                "customers/#{customer_id}/adGroupCriteria/#{ad_group_id}~#{criterion_id}"
              end

              ##
              # Create a fully-qualified AdGroupCriterionCustomizer resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/adGroupCriterionCustomizers/{ad_group_id}~{criterion_id}~{customizer_attribute_id}`
              #
              # @param customer_id [String]
              # @param ad_group_id [String]
              # @param criterion_id [String]
              # @param customizer_attribute_id [String]
              #
              # @return [::String]
              def ad_group_criterion_customizer_path customer_id:, ad_group_id:, criterion_id:, customizer_attribute_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"
                raise ::ArgumentError, "ad_group_id cannot contain /" if ad_group_id.to_s.include? "/"
                raise ::ArgumentError, "criterion_id cannot contain /" if criterion_id.to_s.include? "/"

                "customers/#{customer_id}/adGroupCriterionCustomizers/#{ad_group_id}~#{criterion_id}~#{customizer_attribute_id}"
              end

              ##
              # Create a fully-qualified CustomizerAttribute resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/customizerAttributes/{customizer_attribute_id}`
              #
              # @param customer_id [String]
              # @param customizer_attribute_id [String]
              #
              # @return [::String]
              def customizer_attribute_path customer_id:, customizer_attribute_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/customizerAttributes/#{customizer_attribute_id}"
              end

              extend self
            end
          end
        end
      end
    end
  end
end
