# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/errors/id_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.errors.IdErrorEnum" do
  end
  add_enum "google.ads.googleads.v4.errors.IdErrorEnum.IdError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :NOT_FOUND, 2
  end
end

module Google::Ads::GoogleAds::V4::Errors
  IdErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.IdErrorEnum").msgclass
  IdErrorEnum::IdError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.IdErrorEnum.IdError").enummodule
end
