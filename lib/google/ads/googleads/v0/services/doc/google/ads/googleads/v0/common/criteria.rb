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
          # A keyword criterion.
          # @!attribute [rw] text
          #   @return [Google::Protobuf::StringValue]
          #     The text of the keyword (at most 80 characters and 10 words).
          # @!attribute [rw] match_type
          #   @return [Google::Ads::Googleads::V0::Enums::KeywordMatchTypeEnum::KeywordMatchType]
          #     The match type of the keyword.
          class KeywordInfo; end

          # A location criterion.
          # @!attribute [rw] geo_target_constant
          #   @return [Google::Protobuf::StringValue]
          #     The geo target constant resource name.
          class LocationInfo; end

          # A device criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::DeviceEnum::Device]
          #     Type of the device.
          class DeviceInfo; end

          # A listing group criterion.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::ListingGroupTypeEnum::ListingGroupType]
          #     Type of the listing group.
          # @!attribute [rw] case_value
          #   @return [Google::Ads::Googleads::V0::Common::ListingDimensionInfo]
          #     Dimension value with which this listing group is refining its parent.
          #     Undefined for the root group.
          # @!attribute [rw] parent_ad_group_criterion
          #   @return [Google::Protobuf::StringValue]
          #     Resource name of ad group criterion which is the parent listing group
          #     subdivision. Null for the root group.
          class ListingGroupInfo; end

          # Listing dimensions for listing group criterion.
          # @!attribute [rw] listing_brand
          #   @return [Google::Ads::Googleads::V0::Common::ListingBrandInfo]
          #     Brand of the listing.
          # @!attribute [rw] hotel_id
          #   @return [Google::Ads::Googleads::V0::Common::HotelIdInfo]
          #     Advertiser-specific hotel ID.
          # @!attribute [rw] hotel_class
          #   @return [Google::Ads::Googleads::V0::Common::HotelClassInfo]
          #     Class of the hotel as a number of stars 1 to 5.
          # @!attribute [rw] hotel_country_region
          #   @return [Google::Ads::Googleads::V0::Common::HotelCountryRegionInfo]
          #     Country or Region the hotel is located in.
          # @!attribute [rw] hotel_state
          #   @return [Google::Ads::Googleads::V0::Common::HotelStateInfo]
          #     State the hotel is located in.
          # @!attribute [rw] hotel_city
          #   @return [Google::Ads::Googleads::V0::Common::HotelCityInfo]
          #     City the hotel is located in.
          # @!attribute [rw] listing_custom_attribute
          #   @return [Google::Ads::Googleads::V0::Common::ListingCustomAttributeInfo]
          #     Listing custom attribute.
          # @!attribute [rw] product_condition
          #   @return [Google::Ads::Googleads::V0::Common::ProductConditionInfo]
          #     Condition of a product offer.
          # @!attribute [rw] product_type
          #   @return [Google::Ads::Googleads::V0::Common::ProductTypeInfo]
          #     Type of a product offer.
          class ListingDimensionInfo; end

          # Brand of the listing.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the listing brand.
          class ListingBrandInfo; end

          # Advertiser-specific hotel ID.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the hotel ID.
          class HotelIdInfo; end

          # Class of the hotel as a number of stars 1 to 5.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::Int64Value]
          #     Long value of the hotel class.
          class HotelClassInfo; end

          # Country or Region the hotel is located in.
          # @!attribute [rw] country_region_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelCountryRegionInfo; end

          # State the hotel is located in.
          # @!attribute [rw] state_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelStateInfo; end

          # City the hotel is located in.
          # @!attribute [rw] city_criterion
          #   @return [Google::Protobuf::StringValue]
          #     The Geo Target Constant resource name.
          class HotelCityInfo; end

          # Listing custom attribute.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     String value of the listing custom attribute.
          # @!attribute [rw] index
          #   @return [Google::Ads::Googleads::V0::Enums::ListingCustomAttributeIndexEnum::ListingCustomAttributeIndex]
          #     Indicates the index of the custom attribute.
          class ListingCustomAttributeInfo; end

          # Condition of a product offer.
          # @!attribute [rw] condition
          #   @return [Google::Ads::Googleads::V0::Enums::ProductConditionEnum::ProductCondition]
          #     Value of the condition.
          class ProductConditionInfo; end

          # Type of a product offer.
          # @!attribute [rw] value
          #   @return [Google::Protobuf::StringValue]
          #     Value of the type.
          # @!attribute [rw] level
          #   @return [Google::Ads::Googleads::V0::Enums::ProductTypeLevelEnum::ProductTypeLevel]
          #     Level of the type.
          class ProductTypeInfo; end

          # Criterion for hotel date selection (default dates vs. user selected).
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::HotelDateSelectionTypeEnum::HotelDateSelectionType]
          #     Type of the hotel date selection
          class HotelDateSelectionTypeInfo; end

          # Criterion for number of days prior to the stay the booking is being made.
          # @!attribute [rw] min_days
          #   @return [Google::Protobuf::Int64Value]
          #     Low end of the number of days prior to the stay.
          # @!attribute [rw] max_days
          #   @return [Google::Protobuf::Int64Value]
          #     High end of the number of days prior to the stay.
          class HotelAdvanceBookingWindowInfo; end

          # Criterion for length of hotel stay in nights.
          # @!attribute [rw] min_nights
          #   @return [Google::Protobuf::Int64Value]
          #     Low end of the number of nights in the stay.
          # @!attribute [rw] max_nights
          #   @return [Google::Protobuf::Int64Value]
          #     High end of the number of nights in the stay.
          class HotelLengthOfStayInfo; end

          # Criterion for day of the week the booking is for.
          # @!attribute [rw] day_of_week
          #   @return [Google::Ads::Googleads::V0::Enums::DayOfWeekEnum::DayOfWeek]
          #     The day of the week.
          class HotelCheckInDayInfo; end

          # Criterion for Interaction Type.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::InteractionTypeEnum::InteractionType]
          #     The interaction type.
          class InteractionTypeInfo; end

          # Represents an AdSchedule criterion.
          #
          # AdSchedule is specified as the day of the week and a time interval
          # within which ads will be shown.
          #
          # No more than six AdSchedules can be added for the same day.
          # @!attribute [rw] start_minute
          #   @return [Google::Ads::Googleads::V0::Enums::MinuteOfHourEnum::MinuteOfHour]
          #     Minutes after the start hour at which this schedule starts.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] end_minute
          #   @return [Google::Ads::Googleads::V0::Enums::MinuteOfHourEnum::MinuteOfHour]
          #     Minutes after the end hour at which this schedule ends. The schedule is
          #     exclusive of the end minute.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] start_hour
          #   @return [Google::Protobuf::Int32Value]
          #     Starting hour in 24 hour time.
          #     This field must be between 0 and 23, inclusive.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] end_hour
          #   @return [Google::Protobuf::Int32Value]
          #     Ending hour in 24 hour time; 24 signifies end of the day.
          #     This field must be between 0 and 24, inclusive.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          # @!attribute [rw] day_of_week
          #   @return [Google::Ads::Googleads::V0::Enums::DayOfWeekEnum::DayOfWeek]
          #     Day of the week the schedule applies to.
          #
          #     This field is required for CREATE operations and is prohibited on UPDATE
          #     operations.
          class AdScheduleInfo; end
        end
      end
    end
  end
end