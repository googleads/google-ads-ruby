# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/bidding_strategy_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/bidding_strategy_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.BiddingStrategyStatusEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.BiddingStrategyStatusEnum.BiddingStrategyStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ENABLED, 2
      value :REMOVED, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          BiddingStrategyStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.BiddingStrategyStatusEnum").msgclass
          BiddingStrategyStatusEnum::BiddingStrategyStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.BiddingStrategyStatusEnum.BiddingStrategyStatus").enummodule
        end
      end
    end
  end
end
