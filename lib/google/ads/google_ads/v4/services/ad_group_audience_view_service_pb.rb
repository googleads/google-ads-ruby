# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/services/ad_group_audience_view_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v4/resources/ad_group_audience_view_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.services.GetAdGroupAudienceViewRequest" do
    optional :resource_name, :string, 1
  end
end

module Google::Ads::GoogleAds::V4::Services
  GetAdGroupAudienceViewRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.GetAdGroupAudienceViewRequest").msgclass
end
