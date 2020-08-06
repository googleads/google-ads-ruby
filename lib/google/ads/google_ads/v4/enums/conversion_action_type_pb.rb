# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/conversion_action_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.ConversionActionTypeEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.ConversionActionTypeEnum.ConversionActionType" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :AD_CALL, 2
    value :CLICK_TO_CALL, 3
    value :GOOGLE_PLAY_DOWNLOAD, 4
    value :GOOGLE_PLAY_IN_APP_PURCHASE, 5
    value :UPLOAD_CALLS, 6
    value :UPLOAD_CLICKS, 7
    value :WEBPAGE, 8
    value :WEBSITE_CALL, 9
    value :STORE_SALES_DIRECT_UPLOAD, 10
    value :STORE_SALES, 11
    value :FIREBASE_ANDROID_FIRST_OPEN, 12
    value :FIREBASE_ANDROID_IN_APP_PURCHASE, 13
    value :FIREBASE_ANDROID_CUSTOM, 14
    value :FIREBASE_IOS_FIRST_OPEN, 15
    value :FIREBASE_IOS_IN_APP_PURCHASE, 16
    value :FIREBASE_IOS_CUSTOM, 17
    value :THIRD_PARTY_APP_ANALYTICS_ANDROID_FIRST_OPEN, 18
    value :THIRD_PARTY_APP_ANALYTICS_ANDROID_IN_APP_PURCHASE, 19
    value :THIRD_PARTY_APP_ANALYTICS_ANDROID_CUSTOM, 20
    value :THIRD_PARTY_APP_ANALYTICS_IOS_FIRST_OPEN, 21
    value :THIRD_PARTY_APP_ANALYTICS_IOS_IN_APP_PURCHASE, 22
    value :THIRD_PARTY_APP_ANALYTICS_IOS_CUSTOM, 23
  end
end

module Google::Ads::GoogleAds::V4::Enums
  ConversionActionTypeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.ConversionActionTypeEnum").msgclass
  ConversionActionTypeEnum::ConversionActionType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.ConversionActionTypeEnum.ConversionActionType").enummodule
end
