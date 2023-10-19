# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/offline_user_data_job_error.proto

require 'google/protobuf'


descriptor_data = "\nAgoogle/ads/googleads/v15/errors/offline_user_data_job_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"\xce\n\n\x1bOfflineUserDataJobErrorEnum\"\xae\n\n\x17OfflineUserDataJobError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x18\n\x14INVALID_USER_LIST_ID\x10\x03\x12\x1a\n\x16INVALID_USER_LIST_TYPE\x10\x04\x12 \n\x1cNOT_ON_ALLOWLIST_FOR_USER_ID\x10!\x12 \n\x1cINCOMPATIBLE_UPLOAD_KEY_TYPE\x10\x06\x12\x1b\n\x17MISSING_USER_IDENTIFIER\x10\x07\x12\x1c\n\x18INVALID_MOBILE_ID_FORMAT\x10\x08\x12\x1d\n\x19TOO_MANY_USER_IDENTIFIERS\x10\t\x12+\n\'NOT_ON_ALLOWLIST_FOR_STORE_SALES_DIRECT\x10\x1f\x12,\n(NOT_ON_ALLOWLIST_FOR_UNIFIED_STORE_SALES\x10 \x12\x16\n\x12INVALID_PARTNER_ID\x10\x0b\x12\x14\n\x10INVALID_ENCODING\x10\x0c\x12\x18\n\x14INVALID_COUNTRY_CODE\x10\r\x12 \n\x1cINCOMPATIBLE_USER_IDENTIFIER\x10\x0e\x12\x1b\n\x17\x46UTURE_TRANSACTION_TIME\x10\x0f\x12\x1d\n\x19INVALID_CONVERSION_ACTION\x10\x10\x12\x1b\n\x17MOBILE_ID_NOT_SUPPORTED\x10\x11\x12\x1b\n\x17INVALID_OPERATION_ORDER\x10\x12\x12\x19\n\x15\x43ONFLICTING_OPERATION\x10\x13\x12%\n!EXTERNAL_UPDATE_ID_ALREADY_EXISTS\x10\x15\x12\x17\n\x13JOB_ALREADY_STARTED\x10\x16\x12\x18\n\x14REMOVE_NOT_SUPPORTED\x10\x17\x12\x1c\n\x18REMOVE_ALL_NOT_SUPPORTED\x10\x18\x12\x19\n\x15INVALID_SHA256_FORMAT\x10\x19\x12\x17\n\x13\x43USTOM_KEY_DISABLED\x10\x1a\x12\x1d\n\x19\x43USTOM_KEY_NOT_PREDEFINED\x10\x1b\x12\x16\n\x12\x43USTOM_KEY_NOT_SET\x10\x1d\x12-\n)CUSTOMER_NOT_ACCEPTED_CUSTOMER_DATA_TERMS\x10\x1e\x12:\n6ATTRIBUTES_NOT_APPLICABLE_FOR_CUSTOMER_MATCH_USER_LIST\x10\"\x12&\n\"LIFETIME_VALUE_BUCKET_NOT_IN_RANGE\x10#\x12/\n+INCOMPATIBLE_USER_IDENTIFIER_FOR_ATTRIBUTES\x10$\x12\x1b\n\x17\x46UTURE_TIME_NOT_ALLOWED\x10%\x12\x31\n-LAST_PURCHASE_TIME_LESS_THAN_ACQUISITION_TIME\x10&\x12#\n\x1f\x43USTOMER_IDENTIFIER_NOT_ALLOWED\x10\'\x12\x13\n\x0fINVALID_ITEM_ID\x10(\x12\x37\n3FIRST_PURCHASE_TIME_GREATER_THAN_LAST_PURCHASE_TIME\x10*\x12\x1b\n\x17INVALID_LIFECYCLE_STAGE\x10+\x12\x17\n\x13INVALID_EVENT_VALUE\x10,\x12+\n\'EVENT_ATTRIBUTE_ALL_FIELDS_ARE_REQUIRED\x10-B\xfc\x01\n#com.google.ads.googleads.v15.errorsB\x1cOfflineUserDataJobErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
      module V15
        module Errors
          OfflineUserDataJobErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.OfflineUserDataJobErrorEnum").msgclass
          OfflineUserDataJobErrorEnum::OfflineUserDataJobError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.OfflineUserDataJobErrorEnum.OfflineUserDataJobError").enummodule
        end
      end
    end
  end
end
