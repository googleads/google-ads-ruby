# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/errors/keyword_plan_ad_group_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.errors.KeywordPlanAdGroupErrorEnum" do
  end
  add_enum "google.ads.googleads.v1.errors.KeywordPlanAdGroupErrorEnum.KeywordPlanAdGroupError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :INVALID_NAME, 2
    value :DUPLICATE_NAME, 3
  end
end

module Google::Ads::GoogleAds::V1::Errors
  KeywordPlanAdGroupErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.KeywordPlanAdGroupErrorEnum").msgclass
  KeywordPlanAdGroupErrorEnum::KeywordPlanAdGroupError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.KeywordPlanAdGroupErrorEnum.KeywordPlanAdGroupError").enummodule
end
