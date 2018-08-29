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
          # A field or resource (artifact) used by GoogleAdsService.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the artifact.
          #     Artifact resource names have the form:
          #
          #     +googleAdsFields/{name}+
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the artifact.
          # @!attribute [rw] category
          #   @return [Google::Ads::Googleads::V0::Enums::GoogleAdsFieldCategoryEnum::GoogleAdsFieldCategory]
          #     The category of the artifact.
          # @!attribute [rw] selectable
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the artifact can be used in a SELECT clause in search
          #     queries.
          # @!attribute [rw] filterable
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the artifact can be used in a WHERE clause in search
          #     queries.
          # @!attribute [rw] sortable
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the artifact can be used in a ORDER BY clause in search
          #     queries.
          # @!attribute [rw] selectable_with
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The names of all resources, segments, and metrics that are selectable with
          #     the described artifact.
          # @!attribute [rw] attribute_resources
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The names of all resources that are selectable with the described
          #     artifact. Fields from these resources do not segment metrics when included
          #     in search queries.
          #
          #     This field is only set for artifacts whose category is RESOURCE.
          # @!attribute [rw] metrics
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The names of all metrics that are selectable with the described artifact.
          #
          #     This field is only set for artifacts whose category is either RESOURCE or
          #     SEGMENT.
          # @!attribute [rw] segments
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The names of all artifacts, whether a segment or another resource, that
          #     segment metrics when included in search queries.
          #
          #     This field is only set for artifacts of category RESOURCE, SEGMENT or
          #     METRIC.
          # @!attribute [rw] enum_values
          #   @return [Array<Google::Protobuf::StringValue>]
          #     Values the artifact can assume if it is a field of type ENUM.
          #
          #     This field is only set for artifacts of category SEGMENT or ATTRIBUTE.
          # @!attribute [rw] data_type
          #   @return [Google::Ads::Googleads::V0::Enums::GoogleAdsFieldDataTypeEnum::GoogleAdsFieldDataType]
          #     This field determines the operators that can be used with the artifact
          #     in WHERE clauses.
          # @!attribute [rw] type_url
          #   @return [Google::Protobuf::StringValue]
          #     The URL of proto describing the artifact's data type.
          # @!attribute [rw] is_repeated
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the field artifact is repeated.
          class GoogleAdsField; end
        end
      end
    end
  end
end