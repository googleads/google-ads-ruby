# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/brand_safety_suitability.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/brand_safety_suitability.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.BrandSafetySuitabilityEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.BrandSafetySuitabilityEnum.BrandSafetySuitability" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :EXPANDED_INVENTORY, 2
      value :STANDARD_INVENTORY, 3
      value :LIMITED_INVENTORY, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          BrandSafetySuitabilityEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.BrandSafetySuitabilityEnum").msgclass
          BrandSafetySuitabilityEnum::BrandSafetySuitability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.BrandSafetySuitabilityEnum.BrandSafetySuitability").enummodule
        end
      end
    end
  end
end
