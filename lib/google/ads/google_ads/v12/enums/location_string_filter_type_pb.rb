# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/enums/location_string_filter_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/enums/location_string_filter_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.enums.LocationStringFilterTypeEnum" do
    end
    add_enum "google.ads.googleads.v12.enums.LocationStringFilterTypeEnum.LocationStringFilterType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :EXACT, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Enums
          LocationStringFilterTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.LocationStringFilterTypeEnum").msgclass
          LocationStringFilterTypeEnum::LocationStringFilterType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.LocationStringFilterTypeEnum.LocationStringFilterType").enummodule
        end
      end
    end
  end
end