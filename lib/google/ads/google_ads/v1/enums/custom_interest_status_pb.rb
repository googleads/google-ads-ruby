# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/custom_interest_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.CustomInterestStatusEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.CustomInterestStatusEnum.CustomInterestStatus" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ENABLED, 2
    value :REMOVED, 3
  end
end

module Google::Ads::GoogleAds::V1::Enums
  CustomInterestStatusEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.CustomInterestStatusEnum").msgclass
  CustomInterestStatusEnum::CustomInterestStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.CustomInterestStatusEnum.CustomInterestStatus").enummodule
end
