# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/enums/location_ownership_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/enums/location_ownership_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.enums.LocationOwnershipTypeEnum" do
    end
    add_enum "google.ads.googleads.v12.enums.LocationOwnershipTypeEnum.LocationOwnershipType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :BUSINESS_OWNER, 2
      value :AFFILIATE, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Enums
          LocationOwnershipTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.LocationOwnershipTypeEnum").msgclass
          LocationOwnershipTypeEnum::LocationOwnershipType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.LocationOwnershipTypeEnum.LocationOwnershipType").enummodule
        end
      end
    end
  end
end
