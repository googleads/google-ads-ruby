# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/device.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/device.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.DeviceEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.DeviceEnum.Device" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :MOBILE, 2
      value :TABLET, 3
      value :DESKTOP, 4
      value :CONNECTED_TV, 6
      value :OTHER, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          DeviceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.DeviceEnum").msgclass
          DeviceEnum::Device = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.DeviceEnum.Device").enummodule
        end
      end
    end
  end
end
