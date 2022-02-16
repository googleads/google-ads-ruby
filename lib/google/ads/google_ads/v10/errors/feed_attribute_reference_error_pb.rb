# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/feed_attribute_reference_error.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/feed_attribute_reference_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.FeedAttributeReferenceErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.FeedAttributeReferenceErrorEnum.FeedAttributeReferenceError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CANNOT_REFERENCE_REMOVED_FEED, 2
      value :INVALID_FEED_NAME, 3
      value :INVALID_FEED_ATTRIBUTE_NAME, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          FeedAttributeReferenceErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.FeedAttributeReferenceErrorEnum").msgclass
          FeedAttributeReferenceErrorEnum::FeedAttributeReferenceError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.FeedAttributeReferenceErrorEnum.FeedAttributeReferenceError").enummodule
        end
      end
    end
  end
end
