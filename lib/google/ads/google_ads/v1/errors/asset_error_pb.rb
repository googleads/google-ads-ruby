# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/errors/asset_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.errors.AssetErrorEnum" do
  end
  add_enum "google.ads.googleads.v1.errors.AssetErrorEnum.AssetError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :CUSTOMER_NOT_WHITELISTED_FOR_ASSET_TYPE, 2
    value :DUPLICATE_ASSET, 3
    value :DUPLICATE_ASSET_NAME, 4
    value :ASSET_DATA_IS_MISSING, 5
  end
end

module Google::Ads::GoogleAds::V1::Errors
  AssetErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.AssetErrorEnum").msgclass
  AssetErrorEnum::AssetError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.AssetErrorEnum.AssetError").enummodule
end
