# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/enums/asset_set_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/enums/asset_set_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.enums.AssetSetStatusEnum" do
    end
    add_enum "google.ads.googleads.v12.enums.AssetSetStatusEnum.AssetSetStatus" do
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
      module V12
        module Enums
          AssetSetStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.AssetSetStatusEnum").msgclass
          AssetSetStatusEnum::AssetSetStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.AssetSetStatusEnum.AssetSetStatus").enummodule
        end
      end
    end
  end
end
