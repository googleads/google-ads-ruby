# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/ad_group_bid_modifier.proto

require 'google/ads/google_ads/v10/common/criteria_pb'
require 'google/ads/google_ads/v10/enums/bid_modifier_source_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/ad_group_bid_modifier.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.AdGroupBidModifier" do
      optional :resource_name, :string, 1
      proto3_optional :ad_group, :string, 13
      proto3_optional :criterion_id, :int64, 14
      proto3_optional :bid_modifier, :double, 15
      proto3_optional :base_ad_group, :string, 16
      optional :bid_modifier_source, :enum, 10, "google.ads.googleads.v10.enums.BidModifierSourceEnum.BidModifierSource"
      oneof :criterion do
        optional :hotel_date_selection_type, :message, 5, "google.ads.googleads.v10.common.HotelDateSelectionTypeInfo"
        optional :hotel_advance_booking_window, :message, 6, "google.ads.googleads.v10.common.HotelAdvanceBookingWindowInfo"
        optional :hotel_length_of_stay, :message, 7, "google.ads.googleads.v10.common.HotelLengthOfStayInfo"
        optional :hotel_check_in_day, :message, 8, "google.ads.googleads.v10.common.HotelCheckInDayInfo"
        optional :device, :message, 11, "google.ads.googleads.v10.common.DeviceInfo"
        optional :preferred_content, :message, 12, "google.ads.googleads.v10.common.PreferredContentInfo"
        optional :hotel_check_in_date_range, :message, 17, "google.ads.googleads.v10.common.HotelCheckInDateRangeInfo"
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          AdGroupBidModifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.AdGroupBidModifier").msgclass
        end
      end
    end
  end
end
