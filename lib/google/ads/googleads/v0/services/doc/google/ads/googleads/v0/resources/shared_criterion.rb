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
          # A criterion belonging to a shared set.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the shared criterion.
          #     Shared set resource names have the form:
          #
          #     +customers/{customer_id}/sharedCriteria/{shared_set_id}_{criterion_id}+
          # @!attribute [rw] shared_set
          #   @return [Google::Protobuf::StringValue]
          #     The shared set to which the shared criterion belongs.
          # @!attribute [rw] criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the criterion.
          #
          #     This field is ignored for mutates.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::CriterionTypeEnum::CriterionType]
          #     The type of the criterion.
          # @!attribute [rw] keyword
          #   @return [Google::Ads::Googleads::V0::Common::KeywordInfo]
          #     Keyword.
          class SharedCriterion; end
        end
      end
    end
  end
end