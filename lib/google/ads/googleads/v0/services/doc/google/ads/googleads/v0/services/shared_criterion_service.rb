# Copyright 2018 Google LLC
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

module Google
  module Ads
    module Googleads
      module V0
        module Services
          # Request message for {Google::Ads::Googleads::V0::Services::SharedCriterionService::GetSharedCriterion SharedCriterionService::GetSharedCriterion}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the shared criterion to fetch.
          class GetSharedCriterionRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::SharedCriterionService::MutateSharedCriteria SharedCriterionService::MutateSharedCriteria}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose shared criteria are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::SharedCriterionOperation>]
          #     The list of operations to perform on individual shared criteria.
          class MutateSharedCriteriaRequest; end

          # A single operation (create, remove) on an shared criterion.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::SharedCriterion]
          #     Create operation: No resource name is expected for the new shared
          #     criterion.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed shared criterion is
          #     expected,
          #     in this format:
          #
          #     +customers/{customer_id}/sharedCriteria/{shared_set_id}_{criterion_id}+
          class SharedCriterionOperation; end

          # Response message for a shared criterion mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateSharedCriterionResult>]
          #     All results for the mutate.
          class MutateSharedCriteriaResponse; end

          # The result for the shared criterion mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateSharedCriterionResult; end
        end
      end
    end
  end
end