# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/mobile_app_vendor.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.MobileAppVendorEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.MobileAppVendorEnum.MobileAppVendor" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :APPLE_APP_STORE, 2
    value :GOOGLE_APP_STORE, 3
  end
end

module Google::Ads::GoogleAds::V4::Enums
  MobileAppVendorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.MobileAppVendorEnum").msgclass
  MobileAppVendorEnum::MobileAppVendor = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.MobileAppVendorEnum.MobileAppVendor").enummodule
end
