# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/errors/feed_item_set_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/errors/feed_item_set_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.errors.FeedItemSetErrorEnum" do
    end
    add_enum "google.ads.googleads.v11.errors.FeedItemSetErrorEnum.FeedItemSetError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :FEED_ITEM_SET_REMOVED, 2
      value :CANNOT_CLEAR_DYNAMIC_FILTER, 3
      value :CANNOT_CREATE_DYNAMIC_FILTER, 4
      value :INVALID_FEED_TYPE, 5
      value :DUPLICATE_NAME, 6
      value :WRONG_DYNAMIC_FILTER_FOR_FEED_TYPE, 7
      value :DYNAMIC_FILTER_INVALID_CHAIN_IDS, 8
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Errors
          FeedItemSetErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.errors.FeedItemSetErrorEnum").msgclass
          FeedItemSetErrorEnum::FeedItemSetError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.errors.FeedItemSetErrorEnum.FeedItemSetError").enummodule
        end
      end
    end
  end
end
