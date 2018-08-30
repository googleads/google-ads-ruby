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
          # Represents an ad group bid modifier.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad group bid modifier.
          #     Ad group bid modifier resource names have the form:
          #
          #     +customers/{customer_id}/adGroupBidModifiers/{ad_group_id}_{criterion_id}+
          # @!attribute [rw] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     The ad group to which this criterion belongs.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the criterion to bid modify.
          #
          #     This field is ignored for mutates.
          # @!attribute [rw] bid_modifier
          #   @return [Google::Protobuf::DoubleValue]
          #     The modifier for the bid when the criterion matches.
          # @!attribute [rw] base_ad_group
          #   @return [Google::Protobuf::StringValue]
          #     The base ad group from which this draft/trial adgroup bid modifier was
          #     created. If ad_group is a base ad group then this field will be equal to
          #     ad_group. If the ad group was created in the draft or trial and has no
          #     corresponding base ad group, then this field will be null.
          #     This field is readonly.
          # @!attribute [rw] bid_modifier_source
          #   @return [Google::Ads::Googleads::V0::Enums::BidModifierSourceEnum::BidModifierSource]
          #     Bid modifier source.
          # @!attribute [rw] hotel_date_selection_type
          #   @return [Google::Ads::Googleads::V0::Common::HotelDateSelectionTypeInfo]
          #     Criterion for hotel date selection (default dates vs. user selected).
          # @!attribute [rw] hotel_advance_booking_window
          #   @return [Google::Ads::Googleads::V0::Common::HotelAdvanceBookingWindowInfo]
          #     Criterion for number of days prior to the stay the booking is being made.
          # @!attribute [rw] hotel_length_of_stay
          #   @return [Google::Ads::Googleads::V0::Common::HotelLengthOfStayInfo]
          #     Criterion for length of hotel stay in nights.
          # @!attribute [rw] hotel_check_in_day
          #   @return [Google::Ads::Googleads::V0::Common::HotelCheckInDayInfo]
          #     Criterion for day of the week the booking is for.
          # @!attribute [rw] device
          #   @return [Google::Ads::Googleads::V0::Common::DeviceInfo]
          #     A device criterion.
          class AdGroupBidModifier; end
        end
      end
    end
  end
end