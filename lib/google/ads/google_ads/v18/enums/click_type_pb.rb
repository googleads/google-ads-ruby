# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/click_type.proto

require 'google/protobuf'


descriptor_data = "\n/google/ads/googleads/v18/enums/click_type.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xda\x0c\n\rClickTypeEnum\"\xc8\x0c\n\tClickType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x10\n\x0c\x41PP_DEEPLINK\x10\x02\x12\x0f\n\x0b\x42READCRUMBS\x10\x03\x12\x12\n\x0e\x42ROADBAND_PLAN\x10\x04\x12\x11\n\rCALL_TRACKING\x10\x05\x12\t\n\x05\x43\x41LLS\x10\x06\x12\x1a\n\x16\x43LICK_ON_ENGAGEMENT_AD\x10\x07\x12\x12\n\x0eGET_DIRECTIONS\x10\x08\x12\x16\n\x12LOCATION_EXPANSION\x10\t\x12\x18\n\x14LOCATION_FORMAT_CALL\x10\n\x12\x1e\n\x1aLOCATION_FORMAT_DIRECTIONS\x10\x0b\x12\x19\n\x15LOCATION_FORMAT_IMAGE\x10\x0c\x12 \n\x1cLOCATION_FORMAT_LANDING_PAGE\x10\r\x12\x17\n\x13LOCATION_FORMAT_MAP\x10\x0e\x12\x1e\n\x1aLOCATION_FORMAT_STORE_INFO\x10\x0f\x12\x18\n\x14LOCATION_FORMAT_TEXT\x10\x10\x12\x18\n\x14MOBILE_CALL_TRACKING\x10\x11\x12\x10\n\x0cOFFER_PRINTS\x10\x12\x12\t\n\x05OTHER\x10\x13\x12\x1c\n\x18PRODUCT_EXTENSION_CLICKS\x10\x14\x12\x1d\n\x19PRODUCT_LISTING_AD_CLICKS\x10\x15\x12\r\n\tSITELINKS\x10\x16\x12\x11\n\rSTORE_LOCATOR\x10\x17\x12\x0e\n\nURL_CLICKS\x10\x19\x12\x1a\n\x16VIDEO_APP_STORE_CLICKS\x10\x1a\x12\x1f\n\x1bVIDEO_CALL_TO_ACTION_CLICKS\x10\x1b\x12%\n!VIDEO_CARD_ACTION_HEADLINE_CLICKS\x10\x1c\x12\x18\n\x14VIDEO_END_CAP_CLICKS\x10\x1d\x12\x18\n\x14VIDEO_WEBSITE_CLICKS\x10\x1e\x12\x14\n\x10VISUAL_SITELINKS\x10\x1f\x12\x11\n\rWIRELESS_PLAN\x10 \x12\x1c\n\x18PRODUCT_LISTING_AD_LOCAL\x10!\x12)\n%PRODUCT_LISTING_AD_MULTICHANNEL_LOCAL\x10\"\x12*\n&PRODUCT_LISTING_AD_MULTICHANNEL_ONLINE\x10#\x12\x1e\n\x1aPRODUCT_LISTING_ADS_COUPON\x10$\x12#\n\x1fPRODUCT_LISTING_AD_TRANSACTABLE\x10%\x12\x1b\n\x17PRODUCT_AD_APP_DEEPLINK\x10&\x12\x1d\n\x19SHOWCASE_AD_CATEGORY_LINK\x10\'\x12%\n!SHOWCASE_AD_LOCAL_STOREFRONT_LINK\x10(\x12#\n\x1fSHOWCASE_AD_ONLINE_PRODUCT_LINK\x10*\x12\"\n\x1eSHOWCASE_AD_LOCAL_PRODUCT_LINK\x10+\x12\x17\n\x13PROMOTION_EXTENSION\x10,\x12!\n\x1dSWIPEABLE_GALLERY_AD_HEADLINE\x10-\x12\x1f\n\x1bSWIPEABLE_GALLERY_AD_SWIPES\x10.\x12!\n\x1dSWIPEABLE_GALLERY_AD_SEE_MORE\x10/\x12%\n!SWIPEABLE_GALLERY_AD_SITELINK_ONE\x10\x30\x12%\n!SWIPEABLE_GALLERY_AD_SITELINK_TWO\x10\x31\x12\'\n#SWIPEABLE_GALLERY_AD_SITELINK_THREE\x10\x32\x12&\n\"SWIPEABLE_GALLERY_AD_SITELINK_FOUR\x10\x33\x12&\n\"SWIPEABLE_GALLERY_AD_SITELINK_FIVE\x10\x34\x12\x0f\n\x0bHOTEL_PRICE\x10\x35\x12\x13\n\x0fPRICE_EXTENSION\x10\x36\x12\'\n#HOTEL_BOOK_ON_GOOGLE_ROOM_SELECTION\x10\x37\x12\x1f\n\x1bSHOPPING_COMPARISON_LISTING\x10\x38\x12\x11\n\rCROSS_NETWORK\x10\x39\x12\x0c\n\x08\x41\x44_IMAGE\x10:\x12\x11\n\rTRAVEL_ASSETS\x10;B\xe8\x01\n\"com.google.ads.googleads.v18.enumsB\x0e\x43lickTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Ads
    module GoogleAds
      module V18
        module Enums
          ClickTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.ClickTypeEnum").msgclass
          ClickTypeEnum::ClickType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.ClickTypeEnum.ClickType").enummodule
        end
      end
    end
  end
end
