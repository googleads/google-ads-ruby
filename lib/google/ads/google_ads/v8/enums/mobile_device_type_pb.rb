# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/mobile_device_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/mobile_device_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.MobileDeviceTypeEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.MobileDeviceTypeEnum.MobileDeviceType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :MOBILE, 2
      value :TABLET, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          MobileDeviceTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.MobileDeviceTypeEnum").msgclass
          MobileDeviceTypeEnum::MobileDeviceType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.MobileDeviceTypeEnum.MobileDeviceType").enummodule
        end
      end
    end
  end
end
