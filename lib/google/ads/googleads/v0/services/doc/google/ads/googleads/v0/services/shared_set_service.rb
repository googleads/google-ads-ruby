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
          # Request message for {Google::Ads::Googleads::V0::Services::SharedSetService::GetSharedSet SharedSetService::GetSharedSet}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the shared set to fetch.
          class GetSharedSetRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::SharedSetService::MutateSharedSets SharedSetService::MutateSharedSets}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose shared sets are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::SharedSetOperation>]
          #     The list of operations to perform on individual shared sets.
          class MutateSharedSetsRequest; end

          # A single operation (create, update, remove) on an shared set.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::SharedSet]
          #     Create operation: No resource name is expected for the new shared set.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::SharedSet]
          #     Update operation: The shared set is expected to have a valid resource
          #     name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed shared set is expected,
          #     in this format:
          #
          #     +customers/{customer_id}/sharedSets/{shared_set_id}+
          class SharedSetOperation; end

          # Response message for a shared set mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateSharedSetResult>]
          #     All results for the mutate.
          class MutateSharedSetsResponse; end

          # The result for the shared set mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     Returned for successful operations.
          class MutateSharedSetResult; end
        end
      end
    end
  end
end