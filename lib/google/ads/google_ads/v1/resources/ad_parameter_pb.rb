# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/resources/ad_parameter.proto

require 'google/protobuf'

require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.resources.AdParameter" do
    optional :resource_name, :string, 1
    optional :ad_group_criterion, :message, 2, "google.protobuf.StringValue"
    optional :parameter_index, :message, 3, "google.protobuf.Int64Value"
    optional :insertion_text, :message, 4, "google.protobuf.StringValue"
  end
end

module Google::Ads::GoogleAds::V1::Resources
  AdParameter = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.resources.AdParameter").msgclass
end
