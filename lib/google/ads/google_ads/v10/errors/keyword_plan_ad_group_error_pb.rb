# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/keyword_plan_ad_group_error.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/keyword_plan_ad_group_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.KeywordPlanAdGroupErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.KeywordPlanAdGroupErrorEnum.KeywordPlanAdGroupError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :INVALID_NAME, 2
      value :DUPLICATE_NAME, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          KeywordPlanAdGroupErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.KeywordPlanAdGroupErrorEnum").msgclass
          KeywordPlanAdGroupErrorEnum::KeywordPlanAdGroupError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.KeywordPlanAdGroupErrorEnum.KeywordPlanAdGroupError").enummodule
        end
      end
    end
  end
end
