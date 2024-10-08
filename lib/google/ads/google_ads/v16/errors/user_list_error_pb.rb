# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/errors/user_list_error.proto

require 'google/protobuf'


descriptor_data = "\n5google/ads/googleads/v16/errors/user_list_error.proto\x12\x1fgoogle.ads.googleads.v16.errors\"\xbb\t\n\x11UserListErrorEnum\"\xa5\t\n\rUserListError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x37\n3EXTERNAL_REMARKETING_USER_LIST_MUTATE_NOT_SUPPORTED\x10\x02\x12\x1a\n\x16\x43ONCRETE_TYPE_REQUIRED\x10\x03\x12\x1f\n\x1b\x43ONVERSION_TYPE_ID_REQUIRED\x10\x04\x12\x1e\n\x1a\x44UPLICATE_CONVERSION_TYPES\x10\x05\x12\x1b\n\x17INVALID_CONVERSION_TYPE\x10\x06\x12\x17\n\x13INVALID_DESCRIPTION\x10\x07\x12\x10\n\x0cINVALID_NAME\x10\x08\x12\x10\n\x0cINVALID_TYPE\x10\t\x12\x34\n0CAN_NOT_ADD_LOGICAL_LIST_AS_LOGICAL_LIST_OPERAND\x10\n\x12*\n&INVALID_USER_LIST_LOGICAL_RULE_OPERAND\x10\x0b\x12\x15\n\x11NAME_ALREADY_USED\x10\x0c\x12%\n!NEW_CONVERSION_TYPE_NAME_REQUIRED\x10\r\x12%\n!CONVERSION_TYPE_NAME_ALREADY_USED\x10\x0e\x12\x1e\n\x1aOWNERSHIP_REQUIRED_FOR_SET\x10\x0f\x12\"\n\x1eUSER_LIST_MUTATE_NOT_SUPPORTED\x10\x10\x12\x10\n\x0cINVALID_RULE\x10\x11\x12\x16\n\x12INVALID_DATE_RANGE\x10\x1b\x12%\n!CAN_NOT_MUTATE_SENSITIVE_USERLIST\x10\x1c\x12\x1f\n\x1bMAX_NUM_RULEBASED_USERLISTS\x10\x1d\x12\'\n#CANNOT_MODIFY_BILLABLE_RECORD_COUNT\x10\x1e\x12\x12\n\x0e\x41PP_ID_NOT_SET\x10\x1f\x12-\n)USERLIST_NAME_IS_RESERVED_FOR_SYSTEM_LIST\x10 \x12\x37\n3ADVERTISER_NOT_ON_ALLOWLIST_FOR_USING_UPLOADED_DATA\x10%\x12\x1e\n\x1aRULE_TYPE_IS_NOT_SUPPORTED\x10\"\x12:\n6CAN_NOT_ADD_A_SIMILAR_USERLIST_AS_LOGICAL_LIST_OPERAND\x10#\x12:\n6CAN_NOT_MIX_CRM_BASED_IN_LOGICAL_LIST_WITH_OTHER_LISTS\x10$\x12\x16\n\x12\x41PP_ID_NOT_ALLOWED\x10\'\x12\x1d\n\x19\x43\x41NNOT_MUTATE_SYSTEM_LIST\x10(\x12\x1b\n\x17MOBILE_APP_IS_SENSITIVE\x10)\x12\x1c\n\x18SEED_LIST_DOES_NOT_EXIST\x10*\x12#\n\x1fINVALID_SEED_LIST_ACCESS_REASON\x10+\x12\x1a\n\x16INVALID_SEED_LIST_TYPE\x10,\x12\x19\n\x15INVALID_COUNTRY_CODES\x10-B\xf2\x01\n#com.google.ads.googleads.v16.errorsB\x12UserListErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v16/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V16.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V16\\Errors\xea\x02#Google::Ads::GoogleAds::V16::Errorsb\x06proto3"

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
          UserListErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.UserListErrorEnum").msgclass
          UserListErrorEnum::UserListError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.UserListErrorEnum.UserListError").enummodule
        end
      end
    end
  end
end