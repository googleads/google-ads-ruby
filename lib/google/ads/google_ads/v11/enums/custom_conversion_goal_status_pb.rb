# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/custom_conversion_goal_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/custom_conversion_goal_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.CustomConversionGoalStatusEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.CustomConversionGoalStatusEnum.CustomConversionGoalStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ENABLED, 2
      value :REMOVED, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          CustomConversionGoalStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.CustomConversionGoalStatusEnum").msgclass
          CustomConversionGoalStatusEnum::CustomConversionGoalStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.CustomConversionGoalStatusEnum.CustomConversionGoalStatus").enummodule
        end
      end
    end
  end
end
