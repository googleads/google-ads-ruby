# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/ad_group_ad_rotation_mode.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.AdGroupAdRotationModeEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.AdGroupAdRotationModeEnum.AdGroupAdRotationMode" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :OPTIMIZE, 2
    value :ROTATE_FOREVER, 3
  end
end

module Google::Ads::GoogleAds::V1::Enums
  AdGroupAdRotationModeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.AdGroupAdRotationModeEnum").msgclass
  AdGroupAdRotationModeEnum::AdGroupAdRotationMode = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.AdGroupAdRotationModeEnum.AdGroupAdRotationMode").enummodule
end
