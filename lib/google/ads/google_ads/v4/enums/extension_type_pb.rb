# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/extension_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.ExtensionTypeEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.ExtensionTypeEnum.ExtensionType" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :NONE, 2
    value :APP, 3
    value :CALL, 4
    value :CALLOUT, 5
    value :MESSAGE, 6
    value :PRICE, 7
    value :PROMOTION, 8
    value :SITELINK, 10
    value :STRUCTURED_SNIPPET, 11
    value :LOCATION, 12
    value :AFFILIATE_LOCATION, 13
    value :HOTEL_CALLOUT, 15
  end
end

module Google::Ads::GoogleAds::V4::Enums
  ExtensionTypeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.ExtensionTypeEnum").msgclass
  ExtensionTypeEnum::ExtensionType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.ExtensionTypeEnum.ExtensionType").enummodule
end
