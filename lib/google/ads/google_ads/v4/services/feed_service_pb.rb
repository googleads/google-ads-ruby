# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/services/feed_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v4/resources/feed_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.services.GetFeedRequest" do
    optional :resource_name, :string, 1
  end
  add_message "google.ads.googleads.v4.services.MutateFeedsRequest" do
    optional :customer_id, :string, 1
    repeated :operations, :message, 2, "google.ads.googleads.v4.services.FeedOperation"
    optional :partial_failure, :bool, 3
    optional :validate_only, :bool, 4
  end
  add_message "google.ads.googleads.v4.services.FeedOperation" do
    optional :update_mask, :message, 4, "google.protobuf.FieldMask"
    oneof :operation do
      optional :create, :message, 1, "google.ads.googleads.v4.resources.Feed"
      optional :update, :message, 2, "google.ads.googleads.v4.resources.Feed"
      optional :remove, :string, 3
    end
  end
  add_message "google.ads.googleads.v4.services.MutateFeedsResponse" do
    optional :partial_failure_error, :message, 3, "google.rpc.Status"
    repeated :results, :message, 2, "google.ads.googleads.v4.services.MutateFeedResult"
  end
  add_message "google.ads.googleads.v4.services.MutateFeedResult" do
    optional :resource_name, :string, 1
  end
end

module Google::Ads::GoogleAds::V4::Services
  GetFeedRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.GetFeedRequest").msgclass
  MutateFeedsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedsRequest").msgclass
  FeedOperation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.FeedOperation").msgclass
  MutateFeedsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedsResponse").msgclass
  MutateFeedResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedResult").msgclass
end
