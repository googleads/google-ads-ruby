# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/criterion_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/criterion_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.CriterionTypeEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.CriterionTypeEnum.CriterionType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :KEYWORD, 2
      value :PLACEMENT, 3
      value :MOBILE_APP_CATEGORY, 4
      value :MOBILE_APPLICATION, 5
      value :DEVICE, 6
      value :LOCATION, 7
      value :LISTING_GROUP, 8
      value :AD_SCHEDULE, 9
      value :AGE_RANGE, 10
      value :GENDER, 11
      value :INCOME_RANGE, 12
      value :PARENTAL_STATUS, 13
      value :YOUTUBE_VIDEO, 14
      value :YOUTUBE_CHANNEL, 15
      value :USER_LIST, 16
      value :PROXIMITY, 17
      value :TOPIC, 18
      value :LISTING_SCOPE, 19
      value :LANGUAGE, 20
      value :IP_BLOCK, 21
      value :CONTENT_LABEL, 22
      value :CARRIER, 23
      value :USER_INTEREST, 24
      value :WEBPAGE, 25
      value :OPERATING_SYSTEM_VERSION, 26
      value :APP_PAYMENT_MODEL, 27
      value :MOBILE_DEVICE, 28
      value :CUSTOM_AFFINITY, 29
      value :CUSTOM_INTENT, 30
      value :LOCATION_GROUP, 31
      value :CUSTOM_AUDIENCE, 32
      value :COMBINED_AUDIENCE, 33
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          CriterionTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.CriterionTypeEnum").msgclass
          CriterionTypeEnum::CriterionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.CriterionTypeEnum.CriterionType").enummodule
        end
      end
    end
  end
end
