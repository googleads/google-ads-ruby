# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/url_field_error.proto

require 'google/protobuf'


descriptor_data = "\n5google/ads/googleads/v18/errors/url_field_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\xdf\x0e\n\x11UrlFieldErrorEnum\"\xc9\x0e\n\rUrlFieldError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12!\n\x1dINVALID_TRACKING_URL_TEMPLATE\x10\x02\x12(\n$INVALID_TAG_IN_TRACKING_URL_TEMPLATE\x10\x03\x12%\n!MISSING_TRACKING_URL_TEMPLATE_TAG\x10\x04\x12-\n)MISSING_PROTOCOL_IN_TRACKING_URL_TEMPLATE\x10\x05\x12-\n)INVALID_PROTOCOL_IN_TRACKING_URL_TEMPLATE\x10\x06\x12#\n\x1fMALFORMED_TRACKING_URL_TEMPLATE\x10\x07\x12)\n%MISSING_HOST_IN_TRACKING_URL_TEMPLATE\x10\x08\x12(\n$INVALID_TLD_IN_TRACKING_URL_TEMPLATE\x10\t\x12.\n*REDUNDANT_NESTED_TRACKING_URL_TEMPLATE_TAG\x10\n\x12\x15\n\x11INVALID_FINAL_URL\x10\x0b\x12\x1c\n\x18INVALID_TAG_IN_FINAL_URL\x10\x0c\x12\"\n\x1eREDUNDANT_NESTED_FINAL_URL_TAG\x10\r\x12!\n\x1dMISSING_PROTOCOL_IN_FINAL_URL\x10\x0e\x12!\n\x1dINVALID_PROTOCOL_IN_FINAL_URL\x10\x0f\x12\x17\n\x13MALFORMED_FINAL_URL\x10\x10\x12\x1d\n\x19MISSING_HOST_IN_FINAL_URL\x10\x11\x12\x1c\n\x18INVALID_TLD_IN_FINAL_URL\x10\x12\x12\x1c\n\x18INVALID_FINAL_MOBILE_URL\x10\x13\x12#\n\x1fINVALID_TAG_IN_FINAL_MOBILE_URL\x10\x14\x12)\n%REDUNDANT_NESTED_FINAL_MOBILE_URL_TAG\x10\x15\x12(\n$MISSING_PROTOCOL_IN_FINAL_MOBILE_URL\x10\x16\x12(\n$INVALID_PROTOCOL_IN_FINAL_MOBILE_URL\x10\x17\x12\x1e\n\x1aMALFORMED_FINAL_MOBILE_URL\x10\x18\x12$\n MISSING_HOST_IN_FINAL_MOBILE_URL\x10\x19\x12#\n\x1fINVALID_TLD_IN_FINAL_MOBILE_URL\x10\x1a\x12\x19\n\x15INVALID_FINAL_APP_URL\x10\x1b\x12 \n\x1cINVALID_TAG_IN_FINAL_APP_URL\x10\x1c\x12&\n\"REDUNDANT_NESTED_FINAL_APP_URL_TAG\x10\x1d\x12 \n\x1cMULTIPLE_APP_URLS_FOR_OSTYPE\x10\x1e\x12\x12\n\x0eINVALID_OSTYPE\x10\x1f\x12 \n\x1cINVALID_PROTOCOL_FOR_APP_URL\x10 \x12\"\n\x1eINVALID_PACKAGE_ID_FOR_APP_URL\x10!\x12-\n)URL_CUSTOM_PARAMETERS_COUNT_EXCEEDS_LIMIT\x10\"\x12\x32\n.INVALID_CHARACTERS_IN_URL_CUSTOM_PARAMETER_KEY\x10\'\x12\x34\n0INVALID_CHARACTERS_IN_URL_CUSTOM_PARAMETER_VALUE\x10(\x12-\n)INVALID_TAG_IN_URL_CUSTOM_PARAMETER_VALUE\x10)\x12-\n)REDUNDANT_NESTED_URL_CUSTOM_PARAMETER_TAG\x10*\x12\x14\n\x10MISSING_PROTOCOL\x10+\x12\x14\n\x10INVALID_PROTOCOL\x10\x34\x12\x0f\n\x0bINVALID_URL\x10,\x12\x1e\n\x1a\x44\x45STINATION_URL_DEPRECATED\x10-\x12\x16\n\x12INVALID_TAG_IN_URL\x10.\x12\x13\n\x0fMISSING_URL_TAG\x10/\x12\x14\n\x10\x44UPLICATE_URL_ID\x10\x30\x12\x12\n\x0eINVALID_URL_ID\x10\x31\x12\x1e\n\x1a\x46INAL_URL_SUFFIX_MALFORMED\x10\x32\x12#\n\x1fINVALID_TAG_IN_FINAL_URL_SUFFIX\x10\x33\x12\x1c\n\x18INVALID_TOP_LEVEL_DOMAIN\x10\x35\x12\x1e\n\x1aMALFORMED_TOP_LEVEL_DOMAIN\x10\x36\x12\x11\n\rMALFORMED_URL\x10\x37\x12\x10\n\x0cMISSING_HOST\x10\x38\x12\x1f\n\x1bNULL_CUSTOM_PARAMETER_VALUE\x10\x39\x12\'\n#VALUE_TRACK_PARAMETER_NOT_SUPPORTED\x10:B\xf2\x01\n#com.google.ads.googleads.v18.errorsB\x12UrlFieldErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
        module Errors
          UrlFieldErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.UrlFieldErrorEnum").msgclass
          UrlFieldErrorEnum::UrlFieldError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.UrlFieldErrorEnum.UrlFieldError").enummodule
        end
      end
    end
  end
end