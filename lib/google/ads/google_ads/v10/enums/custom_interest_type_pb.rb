# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/custom_interest_type.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/custom_interest_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CustomInterestTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CustomInterestTypeEnum.CustomInterestType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CUSTOM_AFFINITY, 2
      value :CUSTOM_INTENT, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CustomInterestTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomInterestTypeEnum").msgclass
          CustomInterestTypeEnum::CustomInterestType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomInterestTypeEnum.CustomInterestType").enummodule
        end
      end
    end
  end
end
