# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/keyword_plan_idea_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/keyword_plan_idea_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.KeywordPlanIdeaErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.KeywordPlanIdeaErrorEnum.KeywordPlanIdeaError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :URL_CRAWL_ERROR, 2
      value :INVALID_VALUE, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          KeywordPlanIdeaErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.KeywordPlanIdeaErrorEnum").msgclass
          KeywordPlanIdeaErrorEnum::KeywordPlanIdeaError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.KeywordPlanIdeaErrorEnum.KeywordPlanIdeaError").enummodule
        end
      end
    end
  end
end
