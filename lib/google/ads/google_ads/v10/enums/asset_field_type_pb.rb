# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/asset_field_type.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/asset_field_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.AssetFieldTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.AssetFieldTypeEnum.AssetFieldType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :HEADLINE, 2
      value :DESCRIPTION, 3
      value :MANDATORY_AD_TEXT, 4
      value :MARKETING_IMAGE, 5
      value :MEDIA_BUNDLE, 6
      value :YOUTUBE_VIDEO, 7
      value :BOOK_ON_GOOGLE, 8
      value :LEAD_FORM, 9
      value :PROMOTION, 10
      value :CALLOUT, 11
      value :STRUCTURED_SNIPPET, 12
      value :SITELINK, 13
      value :MOBILE_APP, 14
      value :HOTEL_CALLOUT, 15
      value :CALL, 16
      value :PRICE, 24
      value :LONG_HEADLINE, 17
      value :BUSINESS_NAME, 18
      value :SQUARE_MARKETING_IMAGE, 19
      value :PORTRAIT_MARKETING_IMAGE, 20
      value :LOGO, 21
      value :LANDSCAPE_LOGO, 22
      value :VIDEO, 23
      value :CALL_TO_ACTION_SELECTION, 25
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          AssetFieldTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AssetFieldTypeEnum").msgclass
          AssetFieldTypeEnum::AssetFieldType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AssetFieldTypeEnum.AssetFieldType").enummodule
        end
      end
    end
  end
end
