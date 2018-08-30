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
          # An ad.
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the ad.
          # @!attribute [rw] final_urls
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The list of possible final URLs after all cross-domain redirects for the
          #     ad.
          # @!attribute [rw] final_mobile_urls
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The list of possible final mobile URLs after all cross-domain redirects
          #     for the ad.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL.
          # @!attribute [rw] url_custom_parameters
          #   @return [Array<Google::Ads::Googleads::V0::Common::CustomParameter>]
          #     The list of mappings that can be used to substitute custom parameter tags
          #     in a
          #     +tracking_url_template+, +final_urls+, or +mobile_final_urls+.
          # @!attribute [rw] display_url
          #   @return [Google::Protobuf::StringValue]
          #     The URL that appears in the ad description for some ad formats.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::AdTypeEnum::AdType]
          #     The type of ad.
          # @!attribute [rw] text_ad
          #   @return [Google::Ads::Googleads::V0::Common::TextAdInfo]
          #     Details pertaining to a text ad.
          # @!attribute [rw] expanded_text_ad
          #   @return [Google::Ads::Googleads::V0::Common::ExpandedTextAdInfo]
          #     Details pertaining to an expanded text ad.
          # @!attribute [rw] dynamic_search_ad
          #   @return [Google::Ads::Googleads::V0::Common::DynamicSearchAdInfo]
          #     Details pertaining to a Dynamic Search Ad.
          # @!attribute [rw] responsive_display_ad
          #   @return [Google::Ads::Googleads::V0::Common::ResponsiveDisplayAdInfo]
          #     Details pertaining to a responsive display ad.
          # @!attribute [rw] call_only_ad
          #   @return [Google::Ads::Googleads::V0::Common::CallOnlyAdInfo]
          #     Details pertaining to a call-only ad.
          # @!attribute [rw] expanded_dynamic_search_ad
          #   @return [Google::Ads::Googleads::V0::Common::ExpandedDynamicSearchAdInfo]
          #     Details pertaining to an Expanded Dynamic Search Ad.
          #     This type of ad has its headline, final URLs, and display URL
          #     auto-generated at serving time according to domain name specific
          #     information provided by +dynamic_search_ads_setting+ linked at the
          #     campaign level.
          # @!attribute [rw] hotel_ad
          #   @return [Google::Ads::Googleads::V0::Common::HotelAdInfo]
          #     Details pertaining to a hotel ad.
          # @!attribute [rw] shopping_smart_ad
          #   @return [Google::Ads::Googleads::V0::Common::ShoppingSmartAdInfo]
          #     Details pertaining to a Smart Shopping ad.
          class Ad; end
        end
      end
    end
  end
end