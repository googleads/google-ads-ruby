# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/advertising_channel_sub_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/advertising_channel_sub_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.AdvertisingChannelSubTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :SEARCH_MOBILE_APP, 2
      value :DISPLAY_MOBILE_APP, 3
      value :SEARCH_EXPRESS, 4
      value :DISPLAY_EXPRESS, 5
      value :SHOPPING_SMART_ADS, 6
      value :DISPLAY_GMAIL_AD, 7
      value :DISPLAY_SMART_CAMPAIGN, 8
      value :VIDEO_OUTSTREAM, 9
      value :VIDEO_ACTION, 10
      value :VIDEO_NON_SKIPPABLE, 11
      value :APP_CAMPAIGN, 12
      value :APP_CAMPAIGN_FOR_ENGAGEMENT, 13
      value :LOCAL_CAMPAIGN, 14
      value :SHOPPING_COMPARISON_LISTING_ADS, 15
      value :SMART_CAMPAIGN, 16
      value :VIDEO_SEQUENCE, 17
      value :APP_CAMPAIGN_FOR_PRE_REGISTRATION, 18
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          AdvertisingChannelSubTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AdvertisingChannelSubTypeEnum").msgclass
          AdvertisingChannelSubTypeEnum::AdvertisingChannelSubType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubType").enummodule
        end
      end
    end
  end
end
