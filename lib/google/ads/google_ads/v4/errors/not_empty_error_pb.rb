# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/errors/not_empty_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.errors.NotEmptyErrorEnum" do
  end
  add_enum "google.ads.googleads.v4.errors.NotEmptyErrorEnum.NotEmptyError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :EMPTY_LIST, 2
  end
end

module Google::Ads::GoogleAds::V4::Errors
  NotEmptyErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.NotEmptyErrorEnum").msgclass
  NotEmptyErrorEnum::NotEmptyError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.NotEmptyErrorEnum.NotEmptyError").enummodule
end
