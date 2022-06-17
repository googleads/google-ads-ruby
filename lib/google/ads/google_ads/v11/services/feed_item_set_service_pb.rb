# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/services/feed_item_set_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/resources/feed_item_set_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/services/feed_item_set_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.services.MutateFeedItemSetsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v11.services.FeedItemSetOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v11.services.FeedItemSetOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v11.resources.FeedItemSet"
        optional :update, :message, 2, "google.ads.googleads.v11.resources.FeedItemSet"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v11.services.MutateFeedItemSetsResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v11.services.MutateFeedItemSetResult"
      optional :partial_failure_error, :message, 2, "google.rpc.Status"
    end
    add_message "google.ads.googleads.v11.services.MutateFeedItemSetResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Services
          MutateFeedItemSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateFeedItemSetsRequest").msgclass
          FeedItemSetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.FeedItemSetOperation").msgclass
          MutateFeedItemSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateFeedItemSetsResponse").msgclass
          MutateFeedItemSetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateFeedItemSetResult").msgclass
        end
      end
    end
  end
end
