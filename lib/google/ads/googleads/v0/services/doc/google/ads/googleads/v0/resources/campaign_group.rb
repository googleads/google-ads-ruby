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
          # A campaign group.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign group.
          #     Campaign group resource names have the form:
          #
          #     +customers/{customer_id}/campaignGroups/{campaign_group_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the campaign group.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the campaign group.
          #
          #     This field is required and should not be empty when creating new campaign
          #     groups.
          #
          #     It must not contain any null (code point 0x0), NL line feed
          #     (code point 0xA) or carriage return (code point 0xD) characters.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::CampaignGroupStatusEnum::CampaignGroupStatus]
          #     The status of the campaign group.
          #
          #     When a new campaign group is added, the status defaults to ENABLED.
          class CampaignGroup; end
        end
      end
    end
  end
end