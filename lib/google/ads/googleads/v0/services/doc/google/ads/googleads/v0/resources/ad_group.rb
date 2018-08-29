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
          # An ad group.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad group.
          #     Ad group resource names have the form:
          #
          #     +customers/{customer_id}/adGroups/{ad_group_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the ad group.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the ad group.
          #
          #     This field is required and should not be empty when creating new ad
          #     groups.
          #
          #     It must contain fewer than 255 UTF-8 full-width characters.
          #
          #     It must not contain any null (code point 0x0), NL line feed
          #     (code point 0xA) or carriage return (code point 0xD) characters.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::AdGroupStatusEnum::AdGroupStatus]
          #     The status of the ad group.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::AdGroupTypeEnum::AdGroupType]
          #     The type of the ad group.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL.
          # @!attribute [rw] url_custom_parameters
          #   @return [Array<Google::Ads::Googleads::V0::Common::CustomParameter>]
          #     The list of mappings used to substitute custom parameter tags in a
          #     +tracking_url_template+, +final_urls+, or +mobile_final_urls+.
          # @!attribute [rw] campaign
          #   @return [Google::Protobuf::StringValue]
          #     The campaign to which the ad group belongs.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The maximum CPC (cost-per-click) bid.
          # @!attribute [rw] cpm_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The maximum CPM (cost-per-thousand viewable impressions) bid.
          # @!attribute [rw] cpa_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The target cost-per-acquisition (conversion) bid.
          # @!attribute [rw] cpv_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The CPV (cost-per-view) bid.
          # @!attribute [rw] target_roas_override
          #   @return [Google::Protobuf::DoubleValue]
          #     The target return on ad spend (ROAS) override. If the ad group's campaign
          #     bidding strategy is a standard Target ROAS strategy, then this field
          #     overrides the target ROAS specified in the campaign's bidding strategy.
          #     Otherwise, this value is ignored.
          # @!attribute [rw] percent_cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The percent cpc bid amount, expressed as a fraction of the advertised price
          #     for some good or service. The valid range for the fraction is [0,1) and the
          #     value stored here is 1,000,000 * [fraction].
          class AdGroup; end
        end
      end
    end
  end
end