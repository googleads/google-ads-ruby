# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/bid_modifier_source.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/bid_modifier_source.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.BidModifierSourceEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.BidModifierSourceEnum.BidModifierSource" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CAMPAIGN, 2
      value :AD_GROUP, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          BidModifierSourceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.BidModifierSourceEnum").msgclass
          BidModifierSourceEnum::BidModifierSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.BidModifierSourceEnum.BidModifierSource").enummodule
        end
      end
    end
  end
end
