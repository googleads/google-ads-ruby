# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v9/errors/adx_error.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v9/errors/adx_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v9.errors.AdxErrorEnum" do
    end
    add_enum "google.ads.googleads.v9.errors.AdxErrorEnum.AdxError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :UNSUPPORTED_FEATURE, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V9
        module Errors
          AdxErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.errors.AdxErrorEnum").msgclass
          AdxErrorEnum::AdxError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.errors.AdxErrorEnum.AdxError").enummodule
        end
      end
    end
  end
end
