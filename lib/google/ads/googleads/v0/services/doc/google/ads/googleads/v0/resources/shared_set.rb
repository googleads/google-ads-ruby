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
        module Resources
          # SharedSets are used for sharing criterion exclusions across multiple
          # campaigns.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the shared set.
          #     Shared set resource names have the form:
          #
          #     +customers/{customer_id}/sharedSets/{shared_set_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of this shared set. Read only.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::SharedSetTypeEnum::SharedSetType]
          #     The type of this shared set: each shared set holds only a single kind
          #     of entity. Required. Immutable.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of this shared set. Required.
          #     Shared Sets must have names that are unique among active shared sets of
          #     the same type.
          #     The length of this string should be between 1 and 255 UTF-8 bytes,
          #     inclusive.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::SharedSetStatusEnum::SharedSetStatus]
          #     The status of this shared set. Read only.
          # @!attribute [rw] member_count
          #   @return [Google::Protobuf::Int64Value]
          #     The number of shared criteria within this shared set. Read only.
          # @!attribute [rw] reference_count
          #   @return [Google::Protobuf::Int64Value]
          #     The number of campaigns associated with this shared set. Read only.
          class SharedSet; end
        end
      end
    end
  end
end