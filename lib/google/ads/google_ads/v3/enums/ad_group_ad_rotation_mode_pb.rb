# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/ad_group_ad_rotation_mode.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/ad_group_ad_rotation_mode.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.AdGroupAdRotationModeEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.AdGroupAdRotationModeEnum.AdGroupAdRotationMode" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :OPTIMIZE, 2
      value :ROTATE_FOREVER, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          AdGroupAdRotationModeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.AdGroupAdRotationModeEnum").msgclass
          AdGroupAdRotationModeEnum::AdGroupAdRotationMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.AdGroupAdRotationModeEnum.AdGroupAdRotationMode").enummodule
        end
      end
    end
  end
end