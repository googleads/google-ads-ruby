# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/hotel_rate_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/hotel_rate_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.HotelRateTypeEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.HotelRateTypeEnum.HotelRateType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :UNAVAILABLE, 2
      value :PUBLIC_RATE, 3
      value :QUALIFIED_RATE, 4
      value :PRIVATE_RATE, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          HotelRateTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.HotelRateTypeEnum").msgclass
          HotelRateTypeEnum::HotelRateType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.HotelRateTypeEnum.HotelRateType").enummodule
        end
      end
    end
  end
end
