# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/listing_group_filter_product_type_level.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/listing_group_filter_product_type_level.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.ListingGroupFilterProductTypeLevelEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.ListingGroupFilterProductTypeLevelEnum.ListingGroupFilterProductTypeLevel" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :LEVEL1, 2
      value :LEVEL2, 3
      value :LEVEL3, 4
      value :LEVEL4, 5
      value :LEVEL5, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          ListingGroupFilterProductTypeLevelEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.ListingGroupFilterProductTypeLevelEnum").msgclass
          ListingGroupFilterProductTypeLevelEnum::ListingGroupFilterProductTypeLevel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.ListingGroupFilterProductTypeLevelEnum.ListingGroupFilterProductTypeLevel").enummodule
        end
      end
    end
  end
end
