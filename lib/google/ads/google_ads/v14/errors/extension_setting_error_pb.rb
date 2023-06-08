# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/extension_setting_error.proto

require 'google/protobuf'


descriptor_data = "\n=google/ads/googleads/v14/errors/extension_setting_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\xae\x14\n\x19\x45xtensionSettingErrorEnum\"\x90\x14\n\x15\x45xtensionSettingError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x17\n\x13\x45XTENSIONS_REQUIRED\x10\x02\x12%\n!FEED_TYPE_EXTENSION_TYPE_MISMATCH\x10\x03\x12\x15\n\x11INVALID_FEED_TYPE\x10\x04\x12\x34\n0INVALID_FEED_TYPE_FOR_CUSTOMER_EXTENSION_SETTING\x10\x05\x12%\n!CANNOT_CHANGE_FEED_ITEM_ON_CREATE\x10\x06\x12)\n%CANNOT_UPDATE_NEWLY_CREATED_EXTENSION\x10\x07\x12\x33\n/NO_EXISTING_AD_GROUP_EXTENSION_SETTING_FOR_TYPE\x10\x08\x12\x33\n/NO_EXISTING_CAMPAIGN_EXTENSION_SETTING_FOR_TYPE\x10\t\x12\x33\n/NO_EXISTING_CUSTOMER_EXTENSION_SETTING_FOR_TYPE\x10\n\x12-\n)AD_GROUP_EXTENSION_SETTING_ALREADY_EXISTS\x10\x0b\x12-\n)CAMPAIGN_EXTENSION_SETTING_ALREADY_EXISTS\x10\x0c\x12-\n)CUSTOMER_EXTENSION_SETTING_ALREADY_EXISTS\x10\r\x12\x35\n1AD_GROUP_FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE\x10\x0e\x12\x35\n1CAMPAIGN_FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE\x10\x0f\x12\x35\n1CUSTOMER_FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE\x10\x10\x12\x16\n\x12VALUE_OUT_OF_RANGE\x10\x11\x12$\n CANNOT_SET_FIELD_WITH_FINAL_URLS\x10\x12\x12\x16\n\x12\x46INAL_URLS_NOT_SET\x10\x13\x12\x18\n\x14INVALID_PHONE_NUMBER\x10\x14\x12*\n&PHONE_NUMBER_NOT_SUPPORTED_FOR_COUNTRY\x10\x15\x12-\n)CARRIER_SPECIFIC_SHORT_NUMBER_NOT_ALLOWED\x10\x16\x12#\n\x1fPREMIUM_RATE_NUMBER_NOT_ALLOWED\x10\x17\x12\x1a\n\x16\x44ISALLOWED_NUMBER_TYPE\x10\x18\x12(\n$INVALID_DOMESTIC_PHONE_NUMBER_FORMAT\x10\x19\x12#\n\x1fVANITY_PHONE_NUMBER_NOT_ALLOWED\x10\x1a\x12\x18\n\x14INVALID_COUNTRY_CODE\x10\x1b\x12#\n\x1fINVALID_CALL_CONVERSION_TYPE_ID\x10\x1c\x12.\n*CUSTOMER_NOT_IN_ALLOWLIST_FOR_CALLTRACKING\x10\x45\x12*\n&CALLTRACKING_NOT_SUPPORTED_FOR_COUNTRY\x10\x1e\x12\x12\n\x0eINVALID_APP_ID\x10\x1f\x12&\n\"QUOTES_IN_REVIEW_EXTENSION_SNIPPET\x10 \x12\'\n#HYPHENS_IN_REVIEW_EXTENSION_SNIPPET\x10!\x12(\n$REVIEW_EXTENSION_SOURCE_NOT_ELIGIBLE\x10\"\x12(\n$SOURCE_NAME_IN_REVIEW_EXTENSION_TEXT\x10#\x12\x11\n\rMISSING_FIELD\x10$\x12\x1f\n\x1bINCONSISTENT_CURRENCY_CODES\x10%\x12*\n&PRICE_EXTENSION_HAS_DUPLICATED_HEADERS\x10&\x12\x34\n0PRICE_ITEM_HAS_DUPLICATED_HEADER_AND_DESCRIPTION\x10\'\x12%\n!PRICE_EXTENSION_HAS_TOO_FEW_ITEMS\x10(\x12&\n\"PRICE_EXTENSION_HAS_TOO_MANY_ITEMS\x10)\x12\x15\n\x11UNSUPPORTED_VALUE\x10*\x12\x1d\n\x19INVALID_DEVICE_PREFERENCE\x10+\x12\x18\n\x14INVALID_SCHEDULE_END\x10-\x12*\n&DATE_TIME_MUST_BE_IN_ACCOUNT_TIME_ZONE\x10/\x12%\n!OVERLAPPING_SCHEDULES_NOT_ALLOWED\x10\x30\x12 \n\x1cSCHEDULE_END_NOT_AFTER_START\x10\x31\x12\x1e\n\x1aTOO_MANY_SCHEDULES_PER_DAY\x10\x32\x12&\n\"DUPLICATE_EXTENSION_FEED_ITEM_EDIT\x10\x33\x12\x1b\n\x17INVALID_SNIPPETS_HEADER\x10\x34\x12<\n8PHONE_NUMBER_NOT_SUPPORTED_WITH_CALLTRACKING_FOR_COUNTRY\x10\x35\x12\x1f\n\x1b\x43\x41MPAIGN_TARGETING_MISMATCH\x10\x36\x12\"\n\x1e\x43\x41NNOT_OPERATE_ON_REMOVED_FEED\x10\x37\x12\x1b\n\x17\x45XTENSION_TYPE_REQUIRED\x10\x38\x12-\n)INCOMPATIBLE_UNDERLYING_MATCHING_FUNCTION\x10\x39\x12\x1d\n\x19START_DATE_AFTER_END_DATE\x10:\x12\x18\n\x14INVALID_PRICE_FORMAT\x10;\x12\x1a\n\x16PROMOTION_INVALID_TIME\x10<\x12<\n8PROMOTION_CANNOT_SET_PERCENT_DISCOUNT_AND_MONEY_DISCOUNT\x10=\x12>\n:PROMOTION_CANNOT_SET_PROMOTION_CODE_AND_ORDERS_OVER_AMOUNT\x10>\x12%\n!TOO_MANY_DECIMAL_PLACES_SPECIFIED\x10?\x12\x19\n\x15INVALID_LANGUAGE_CODE\x10@\x12\x18\n\x14UNSUPPORTED_LANGUAGE\x10\x41\x12\x30\n,CUSTOMER_CONSENT_FOR_CALL_RECORDING_REQUIRED\x10\x42\x12&\n\"EXTENSION_SETTING_UPDATE_IS_A_NOOP\x10\x43\x12\x13\n\x0f\x44ISALLOWED_TEXT\x10\x44\x42\xfa\x01\n#com.google.ads.googleads.v14.errorsB\x1a\x45xtensionSettingErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
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
      module V14
        module Errors
          ExtensionSettingErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.ExtensionSettingErrorEnum").msgclass
          ExtensionSettingErrorEnum::ExtensionSettingError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.ExtensionSettingErrorEnum.ExtensionSettingError").enummodule
        end
      end
    end
  end
end
