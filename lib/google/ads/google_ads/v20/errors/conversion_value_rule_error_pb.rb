# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/conversion_value_rule_error.proto

require 'google/protobuf'


descriptor_data = "\nAgoogle/ads/googleads/v20/errors/conversion_value_rule_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\xa2\x04\n\x1c\x43onversionValueRuleErrorEnum\"\x81\x04\n\x18\x43onversionValueRuleError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1f\n\x1bINVALID_GEO_TARGET_CONSTANT\x10\x02\x12\x30\n,CONFLICTING_INCLUDED_AND_EXCLUDED_GEO_TARGET\x10\x03\x12\x1a\n\x16\x43ONFLICTING_CONDITIONS\x10\x04\x12/\n+CANNOT_REMOVE_IF_INCLUDED_IN_VALUE_RULE_SET\x10\x05\x12\x19\n\x15\x43ONDITION_NOT_ALLOWED\x10\x06\x12\x17\n\x13\x46IELD_MUST_BE_UNSET\x10\x07\x12\x30\n,CANNOT_PAUSE_UNLESS_VALUE_RULE_SET_IS_PAUSED\x10\x08\x12\x1b\n\x17UNTARGETABLE_GEO_TARGET\x10\t\x12\x1e\n\x1aINVALID_AUDIENCE_USER_LIST\x10\n\x12\x1a\n\x16INACCESSIBLE_USER_LIST\x10\x0b\x12\"\n\x1eINVALID_AUDIENCE_USER_INTEREST\x10\x0c\x12\'\n#CANNOT_ADD_RULE_WITH_STATUS_REMOVED\x10\r\x12\x1b\n\x17NO_DAY_OF_WEEK_SELECTED\x10\x0e\x42\xfd\x01\n#com.google.ads.googleads.v20.errorsB\x1d\x43onversionValueRuleErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
      module V20
        module Errors
          ConversionValueRuleErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.ConversionValueRuleErrorEnum").msgclass
          ConversionValueRuleErrorEnum::ConversionValueRuleError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.ConversionValueRuleErrorEnum.ConversionValueRuleError").enummodule
        end
      end
    end
  end
end
