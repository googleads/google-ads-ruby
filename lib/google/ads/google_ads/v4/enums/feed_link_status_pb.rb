# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/feed_link_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.FeedLinkStatusEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.FeedLinkStatusEnum.FeedLinkStatus" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ENABLED, 2
    value :REMOVED, 3
  end
end

module Google::Ads::GoogleAds::V4::Enums
  FeedLinkStatusEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.FeedLinkStatusEnum").msgclass
  FeedLinkStatusEnum::FeedLinkStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.FeedLinkStatusEnum.FeedLinkStatus").enummodule
end
