# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/system_managed_entity_source.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.SystemManagedResourceSourceEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.SystemManagedResourceSourceEnum.SystemManagedResourceSource" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :AD_VARIATIONS, 2
  end
end

module Google::Ads::GoogleAds::V1::Enums
  SystemManagedResourceSourceEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.SystemManagedResourceSourceEnum").msgclass
  SystemManagedResourceSourceEnum::SystemManagedResourceSource = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.SystemManagedResourceSourceEnum.SystemManagedResourceSource").enummodule
end
