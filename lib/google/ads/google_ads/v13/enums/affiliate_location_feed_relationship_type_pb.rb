# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/affiliate_location_feed_relationship_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/affiliate_location_feed_relationship_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.AffiliateLocationFeedRelationshipTypeEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.AffiliateLocationFeedRelationshipTypeEnum.AffiliateLocationFeedRelationshipType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :GENERAL_RETAILER, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          AffiliateLocationFeedRelationshipTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AffiliateLocationFeedRelationshipTypeEnum").msgclass
          AffiliateLocationFeedRelationshipTypeEnum::AffiliateLocationFeedRelationshipType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AffiliateLocationFeedRelationshipTypeEnum.AffiliateLocationFeedRelationshipType").enummodule
        end
      end
    end
  end
end
