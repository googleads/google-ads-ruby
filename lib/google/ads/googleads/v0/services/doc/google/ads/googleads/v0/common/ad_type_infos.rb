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
        module Common
          # A text ad.
          # @!attribute [rw] headline
          #   @return [Google::Protobuf::StringValue]
          #     The headline of the ad.
          # @!attribute [rw] description1
          #   @return [Google::Protobuf::StringValue]
          #     The first line of the ad's description.
          # @!attribute [rw] description2
          #   @return [Google::Protobuf::StringValue]
          #     The second line of the ad's description.
          class TextAdInfo; end

          # An expanded text ad.
          # @!attribute [rw] headline_part1
          #   @return [Google::Protobuf::StringValue]
          #     The first part of the ad's headline.
          # @!attribute [rw] headline_part2
          #   @return [Google::Protobuf::StringValue]
          #     The second part of the ad's headline.
          # @!attribute [rw] description
          #   @return [Google::Protobuf::StringValue]
          #     The description of the ad.
          # @!attribute [rw] path1
          #   @return [Google::Protobuf::StringValue]
          #     The text that can appear alongside the ad's displayed URL.
          # @!attribute [rw] path2
          #   @return [Google::Protobuf::StringValue]
          #     Additional text that can appear alongside the ad's displayed URL.
          class ExpandedTextAdInfo; end

          # A dynamic search ad.
          # @!attribute [rw] description1
          #   @return [Google::Protobuf::StringValue]
          #     The first line of the ad's description.
          # @!attribute [rw] description2
          #   @return [Google::Protobuf::StringValue]
          #     The second line of the ad's description.
          class DynamicSearchAdInfo; end

          # A responsive display ad.
          # @!attribute [rw] short_headline
          #   @return [Google::Protobuf::StringValue]
          #     The short version of the ad's headline.
          # @!attribute [rw] long_headline
          #   @return [Google::Protobuf::StringValue]
          #     The long version of the ad's headline.
          # @!attribute [rw] description
          #   @return [Google::Protobuf::StringValue]
          #     The description of the ad.
          # @!attribute [rw] business_name
          #   @return [Google::Protobuf::StringValue]
          #     The business name in the ad.
          class ResponsiveDisplayAdInfo; end

          # A call-only ad.
          # @!attribute [rw] country_code
          #   @return [Google::Protobuf::StringValue]
          #     The country code in the ad.
          # @!attribute [rw] phone_number
          #   @return [Google::Protobuf::StringValue]
          #     The phone number in the ad.
          # @!attribute [rw] business_name
          #   @return [Google::Protobuf::StringValue]
          #     The business name in the ad.
          # @!attribute [rw] description1
          #   @return [Google::Protobuf::StringValue]
          #     The first line of the ad's description.
          # @!attribute [rw] description2
          #   @return [Google::Protobuf::StringValue]
          #     The second line of the ad's description.
          # @!attribute [rw] call_tracked
          #   @return [Google::Protobuf::BoolValue]
          #     Whether to enable call tracking for the creative. Enabling call
          #     tracking also enables call conversions.
          # @!attribute [rw] disable_call_conversion
          #   @return [Google::Protobuf::BoolValue]
          #     Whether to disable call conversion for the creative.
          #     If set to +true+, disables call conversions even when +call_tracked+ is
          #     +true+.
          #     If +call_tracked+ is +false+, this field is ignored.
          # @!attribute [rw] phone_number_verification_url
          #   @return [Google::Protobuf::StringValue]
          #     The URL to be used for phone number verification.
          class CallOnlyAdInfo; end

          # An expanded dynamic search ad.
          # @!attribute [rw] description
          #   @return [Google::Protobuf::StringValue]
          #     The description of the ad.
          class ExpandedDynamicSearchAdInfo; end

          # A hotel ad.
          class HotelAdInfo; end

          # A Smart Shopping ad.
          class ShoppingSmartAdInfo; end
        end
      end
    end
  end
end