# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/resources/keyword_plan_ad_group_keyword.proto

require 'google/protobuf'

require 'google/ads/google_ads/v4/enums/keyword_match_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.resources.KeywordPlanAdGroupKeyword" do
    optional :resource_name, :string, 1
    optional :keyword_plan_ad_group, :message, 2, "google.protobuf.StringValue"
    optional :id, :message, 3, "google.protobuf.Int64Value"
    optional :text, :message, 4, "google.protobuf.StringValue"
    optional :match_type, :enum, 5, "google.ads.googleads.v4.enums.KeywordMatchTypeEnum.KeywordMatchType"
    optional :cpc_bid_micros, :message, 6, "google.protobuf.Int64Value"
    optional :negative, :message, 7, "google.protobuf.BoolValue"
  end
end

module Google::Ads::GoogleAds::V4::Resources
  KeywordPlanAdGroupKeyword = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.resources.KeywordPlanAdGroupKeyword").msgclass
end
