# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/resources/ad_group_bid_modifier.proto

require 'google/protobuf'

require 'google/ads/google_ads/v3/common/criteria_pb'
require 'google/ads/google_ads/v3/enums/bid_modifier_source_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/resources/ad_group_bid_modifier.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.resources.AdGroupBidModifier" do
      optional :resource_name, :string, 1
      optional :ad_group, :message, 2, "google.protobuf.StringValue"
      optional :criterion_id, :message, 3, "google.protobuf.Int64Value"
      optional :bid_modifier, :message, 4, "google.protobuf.DoubleValue"
      optional :base_ad_group, :message, 9, "google.protobuf.StringValue"
      optional :bid_modifier_source, :enum, 10, "google.ads.googleads.v3.enums.BidModifierSourceEnum.BidModifierSource"
      oneof :criterion do
        optional :hotel_date_selection_type, :message, 5, "google.ads.googleads.v3.common.HotelDateSelectionTypeInfo"
        optional :hotel_advance_booking_window, :message, 6, "google.ads.googleads.v3.common.HotelAdvanceBookingWindowInfo"
        optional :hotel_length_of_stay, :message, 7, "google.ads.googleads.v3.common.HotelLengthOfStayInfo"
        optional :hotel_check_in_day, :message, 8, "google.ads.googleads.v3.common.HotelCheckInDayInfo"
        optional :device, :message, 11, "google.ads.googleads.v3.common.DeviceInfo"
        optional :preferred_content, :message, 12, "google.ads.googleads.v3.common.PreferredContentInfo"
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Resources
          AdGroupBidModifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.resources.AdGroupBidModifier").msgclass
        end
      end
    end
  end
end