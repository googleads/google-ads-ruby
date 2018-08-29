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
          # Represents a bid-modifiable only criterion at the campaign level.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign bid modifier.
          #     Campaign bid modifier resource names have the form:
          #
          #     +customers/{customer_id}/campaignBidModifiers/{campaign_id}_{criterion_id}+
          # @!attribute [rw] campaign
          #   @return [Google::Protobuf::StringValue]
          #     The campaign to which this criterion belongs.
          # @!attribute [rw] criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the criterion to bid modify.
          #
          #     This field is ignored for mutates.
          # @!attribute [rw] bid_modifier
          #   @return [Google::Protobuf::DoubleValue]
          #     The modifier for the bid when the criterion matches.
          # @!attribute [rw] interaction_type
          #   @return [Google::Ads::Googleads::V0::Common::InteractionTypeInfo]
          #     Criterion for interaction type. Only supported for search campaigns.
          class CampaignBidModifier; end
        end
      end
    end
  end
end