# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/errors/feed_item_set_link_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/errors/feed_item_set_link_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.errors.FeedItemSetLinkErrorEnum" do
    end
    add_enum "google.ads.googleads.v13.errors.FeedItemSetLinkErrorEnum.FeedItemSetLinkError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :FEED_ID_MISMATCH, 2
      value :NO_MUTATE_ALLOWED_FOR_DYNAMIC_SET, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Errors
          FeedItemSetLinkErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.FeedItemSetLinkErrorEnum").msgclass
          FeedItemSetLinkErrorEnum::FeedItemSetLinkError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.FeedItemSetLinkErrorEnum.FeedItemSetLinkError").enummodule
        end
      end
    end
  end
end
