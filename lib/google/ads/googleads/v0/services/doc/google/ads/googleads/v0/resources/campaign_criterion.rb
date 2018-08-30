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
          # A campaign criterion.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign criterion.
          #     Campaign criterion resource names have the form:
          #
          #     +customers/{customer_id}/campaignCriteria/{campaign_id}_{criterion_id}+
          # @!attribute [rw] campaign
          #   @return [Google::Protobuf::StringValue]
          #     The campaign to which the criterion belongs.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the criterion.
          #
          #     This field is ignored during mutate.
          # @!attribute [rw] bid_modifier
          #   @return [Google::Protobuf::FloatValue]
          #     The modifier for the bids when the criterion matches.
          #     Allowable modifier values depend on the criterion:
          #     * 0.1 - 10.0: Location
          #       * 0.1 - 4.0: Device (mobile). Use 0 to opt out of mobile.
          # @!attribute [rw] negative
          #   @return [Google::Protobuf::BoolValue]
          #     Whether to target (+false+) or exclude (+true+) the criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::CriterionTypeEnum::CriterionType]
          #     The type of the criterion.
          # @!attribute [rw] keyword
          #   @return [Google::Ads::Googleads::V0::Common::KeywordInfo]
          #     Keyword.
          # @!attribute [rw] location
          #   @return [Google::Ads::Googleads::V0::Common::LocationInfo]
          #     Location.
          # @!attribute [rw] device
          #   @return [Google::Ads::Googleads::V0::Common::DeviceInfo]
          #     Device.
          # @!attribute [rw] ad_schedule
          #   @return [Google::Ads::Googleads::V0::Common::AdScheduleInfo]
          #     Ad Schedule.
          class CampaignCriterion; end
        end
      end
    end
  end
end