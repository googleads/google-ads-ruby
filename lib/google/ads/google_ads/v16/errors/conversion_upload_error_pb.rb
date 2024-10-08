# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/errors/conversion_upload_error.proto

require 'google/protobuf'


descriptor_data = "\n=google/ads/googleads/v16/errors/conversion_upload_error.proto\x12\x1fgoogle.ads.googleads.v16.errors\"\xca\r\n\x19\x43onversionUploadErrorEnum\"\xac\r\n\x15\x43onversionUploadError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12#\n\x1fTOO_MANY_CONVERSIONS_IN_REQUEST\x10\x02\x12\x15\n\x11UNPARSEABLE_GCLID\x10\x03\x12\x1d\n\x19\x43ONVERSION_PRECEDES_EVENT\x10*\x12\x11\n\rEXPIRED_EVENT\x10+\x12\x14\n\x10TOO_RECENT_EVENT\x10,\x12\x13\n\x0f\x45VENT_NOT_FOUND\x10-\x12\x19\n\x15UNAUTHORIZED_CUSTOMER\x10\x08\x12 \n\x1cTOO_RECENT_CONVERSION_ACTION\x10\n\x12\x36\n2CONVERSION_TRACKING_NOT_ENABLED_AT_IMPRESSION_TIME\x10\x0b\x12Q\nMEXTERNAL_ATTRIBUTION_DATA_SET_FOR_NON_EXTERNALLY_ATTRIBUTED_CONVERSION_ACTION\x10\x0c\x12Q\nMEXTERNAL_ATTRIBUTION_DATA_NOT_SET_FOR_EXTERNALLY_ATTRIBUTED_CONVERSION_ACTION\x10\r\x12\x46\nBORDER_ID_NOT_PERMITTED_FOR_EXTERNALLY_ATTRIBUTED_CONVERSION_ACTION\x10\x0e\x12\x1b\n\x17ORDER_ID_ALREADY_IN_USE\x10\x0f\x12\x16\n\x12\x44UPLICATE_ORDER_ID\x10\x10\x12\x13\n\x0fTOO_RECENT_CALL\x10\x11\x12\x10\n\x0c\x45XPIRED_CALL\x10\x12\x12\x12\n\x0e\x43\x41LL_NOT_FOUND\x10\x13\x12\x1c\n\x18\x43ONVERSION_PRECEDES_CALL\x10\x14\x12\x30\n,CONVERSION_TRACKING_NOT_ENABLED_AT_CALL_TIME\x10\x15\x12$\n UNPARSEABLE_CALLERS_PHONE_NUMBER\x10\x16\x12#\n\x1f\x43LICK_CONVERSION_ALREADY_EXISTS\x10\x17\x12\"\n\x1e\x43\x41LL_CONVERSION_ALREADY_EXISTS\x10\x18\x12)\n%DUPLICATE_CLICK_CONVERSION_IN_REQUEST\x10\x19\x12(\n$DUPLICATE_CALL_CONVERSION_IN_REQUEST\x10\x1a\x12\x1f\n\x1b\x43USTOM_VARIABLE_NOT_ENABLED\x10\x1c\x12&\n\"CUSTOM_VARIABLE_VALUE_CONTAINS_PII\x10\x1d\x12\x1e\n\x1aINVALID_CUSTOMER_FOR_CLICK\x10\x1e\x12\x1d\n\x19INVALID_CUSTOMER_FOR_CALL\x10\x1f\x12,\n(CONVERSION_NOT_COMPLIANT_WITH_ATT_POLICY\x10 \x12\x13\n\x0f\x43LICK_NOT_FOUND\x10!\x12\x1b\n\x17INVALID_USER_IDENTIFIER\x10\"\x12N\nJEXTERNALLY_ATTRIBUTED_CONVERSION_ACTION_NOT_PERMITTED_WITH_USER_IDENTIFIER\x10#\x12\x1f\n\x1bUNSUPPORTED_USER_IDENTIFIER\x10$\x12\x1a\n\x16GBRAID_WBRAID_BOTH_SET\x10&\x12\x16\n\x12UNPARSEABLE_WBRAID\x10\'\x12\x16\n\x12UNPARSEABLE_GBRAID\x10(\x12<\n8ONE_PER_CLICK_CONVERSION_ACTION_NOT_PERMITTED_WITH_BRAID\x10.\x12\x37\n3CUSTOMER_DATA_POLICY_PROHIBITS_ENHANCED_CONVERSIONS\x10/\x12-\n)CUSTOMER_NOT_ACCEPTED_CUSTOMER_DATA_TERMS\x10\x30\x12\x19\n\x15ORDER_ID_CONTAINS_PII\x10\x31\x12\x37\n3CUSTOMER_NOT_ENABLED_ENHANCED_CONVERSIONS_FOR_LEADS\x10\x32\x12\x12\n\x0eINVALID_JOB_ID\x10\x34\x12\x1e\n\x1aNO_CONVERSION_ACTION_FOUND\x10\x35\x12\"\n\x1eINVALID_CONVERSION_ACTION_TYPE\x10\x36\x42\xfa\x01\n#com.google.ads.googleads.v16.errorsB\x1a\x43onversionUploadErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v16/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V16.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V16\\Errors\xea\x02#Google::Ads::GoogleAds::V16::Errorsb\x06proto3"

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
      module V16
        module Errors
          ConversionUploadErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.ConversionUploadErrorEnum").msgclass
          ConversionUploadErrorEnum::ConversionUploadError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.ConversionUploadErrorEnum.ConversionUploadError").enummodule
        end
      end
    end
  end
end