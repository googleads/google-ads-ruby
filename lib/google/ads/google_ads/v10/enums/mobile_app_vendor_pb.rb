# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/mobile_app_vendor.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/mobile_app_vendor.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.MobileAppVendorEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.MobileAppVendorEnum.MobileAppVendor" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :APPLE_APP_STORE, 2
      value :GOOGLE_APP_STORE, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          MobileAppVendorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.MobileAppVendorEnum").msgclass
          MobileAppVendorEnum::MobileAppVendor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.MobileAppVendorEnum.MobileAppVendor").enummodule
        end
      end
    end
  end
end
