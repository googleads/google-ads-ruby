# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/bidding_source.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/bidding_source.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.BiddingSourceEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.BiddingSourceEnum.BiddingSource" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CAMPAIGN_BIDDING_STRATEGY, 5
      value :AD_GROUP, 6
      value :AD_GROUP_CRITERION, 7
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          BiddingSourceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.BiddingSourceEnum").msgclass
          BiddingSourceEnum::BiddingSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.BiddingSourceEnum.BiddingSource").enummodule
        end
      end
    end
  end
end
