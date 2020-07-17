# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/services/feed_item_target_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v4/resources/feed_item_target_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.services.GetFeedItemTargetRequest" do
    optional :resource_name, :string, 1
  end
  add_message "google.ads.googleads.v4.services.MutateFeedItemTargetsRequest" do
    optional :customer_id, :string, 1
    repeated :operations, :message, 2, "google.ads.googleads.v4.services.FeedItemTargetOperation"
  end
  add_message "google.ads.googleads.v4.services.FeedItemTargetOperation" do
    oneof :operation do
      optional :create, :message, 1, "google.ads.googleads.v4.resources.FeedItemTarget"
      optional :remove, :string, 2
    end
  end
  add_message "google.ads.googleads.v4.services.MutateFeedItemTargetsResponse" do
    repeated :results, :message, 2, "google.ads.googleads.v4.services.MutateFeedItemTargetResult"
  end
  add_message "google.ads.googleads.v4.services.MutateFeedItemTargetResult" do
    optional :resource_name, :string, 1
  end
end

module Google::Ads::GoogleAds::V4::Services
  GetFeedItemTargetRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.GetFeedItemTargetRequest").msgclass
  MutateFeedItemTargetsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedItemTargetsRequest").msgclass
  FeedItemTargetOperation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.FeedItemTargetOperation").msgclass
  MutateFeedItemTargetsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedItemTargetsResponse").msgclass
  MutateFeedItemTargetResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateFeedItemTargetResult").msgclass
end
