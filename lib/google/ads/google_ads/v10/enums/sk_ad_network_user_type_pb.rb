# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/sk_ad_network_user_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/sk_ad_network_user_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.SkAdNetworkUserTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.SkAdNetworkUserTypeEnum.SkAdNetworkUserType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :UNAVAILABLE, 2
      value :NEW_INSTALLER, 3
      value :REINSTALLER, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          SkAdNetworkUserTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SkAdNetworkUserTypeEnum").msgclass
          SkAdNetworkUserTypeEnum::SkAdNetworkUserType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SkAdNetworkUserTypeEnum.SkAdNetworkUserType").enummodule
        end
      end
    end
  end
end
