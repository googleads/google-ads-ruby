# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/geo_targeting_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.GeoTargetingTypeEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.GeoTargetingTypeEnum.GeoTargetingType" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :AREA_OF_INTEREST, 2
    value :LOCATION_OF_PRESENCE, 3
  end
end

module Google::Ads::GoogleAds::V1::Enums
  GeoTargetingTypeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.GeoTargetingTypeEnum").msgclass
  GeoTargetingTypeEnum::GeoTargetingType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.GeoTargetingTypeEnum.GeoTargetingType").enummodule
end
