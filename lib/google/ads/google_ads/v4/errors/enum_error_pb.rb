# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/errors/enum_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.errors.EnumErrorEnum" do
  end
  add_enum "google.ads.googleads.v4.errors.EnumErrorEnum.EnumError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ENUM_VALUE_NOT_PERMITTED, 3
  end
end

module Google::Ads::GoogleAds::V4::Errors
  EnumErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.EnumErrorEnum").msgclass
  EnumErrorEnum::EnumError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.EnumErrorEnum.EnumError").enummodule
end
