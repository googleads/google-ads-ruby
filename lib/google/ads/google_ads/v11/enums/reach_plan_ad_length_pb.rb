# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/reach_plan_ad_length.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/reach_plan_ad_length.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.ReachPlanAdLengthEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.ReachPlanAdLengthEnum.ReachPlanAdLength" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :SIX_SECONDS, 2
      value :FIFTEEN_OR_TWENTY_SECONDS, 3
      value :TWENTY_SECONDS_OR_MORE, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          ReachPlanAdLengthEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.ReachPlanAdLengthEnum").msgclass
          ReachPlanAdLengthEnum::ReachPlanAdLength = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.ReachPlanAdLengthEnum.ReachPlanAdLength").enummodule
        end
      end
    end
  end
end
