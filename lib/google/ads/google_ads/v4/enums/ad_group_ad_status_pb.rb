# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/ad_group_ad_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.AdGroupAdStatusEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.AdGroupAdStatusEnum.AdGroupAdStatus" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ENABLED, 2
    value :PAUSED, 3
    value :REMOVED, 4
  end
end

module Google::Ads::GoogleAds::V4::Enums
  AdGroupAdStatusEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.AdGroupAdStatusEnum").msgclass
  AdGroupAdStatusEnum::AdGroupAdStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.AdGroupAdStatusEnum.AdGroupAdStatus").enummodule
end
