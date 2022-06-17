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
          module ConversionValueRuleSetService
            # Path helper methods for the ConversionValueRuleSetService API.
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
              # Create a fully-qualified ConversionValueRule resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/conversionValueRules/{conversion_value_rule_id}`
              #
              # @param customer_id [String]
              # @param conversion_value_rule_id [String]
              #
              # @return [::String]
              def conversion_value_rule_path customer_id:, conversion_value_rule_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/conversionValueRules/#{conversion_value_rule_id}"
              end

              ##
              # Create a fully-qualified ConversionValueRuleSet resource string.
              #
              # The resource will be in the following format:
              #
              # `customers/{customer_id}/conversionValueRuleSets/{conversion_value_rule_set_id}`
              #
              # @param customer_id [String]
              # @param conversion_value_rule_set_id [String]
              #
              # @return [::String]
              def conversion_value_rule_set_path customer_id:, conversion_value_rule_set_id:
                raise ::ArgumentError, "customer_id cannot contain /" if customer_id.to_s.include? "/"

                "customers/#{customer_id}/conversionValueRuleSets/#{conversion_value_rule_set_id}"
              end

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

              extend self
            end
          end
        end
      end
    end
  end
end
