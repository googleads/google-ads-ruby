# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/ad_group_criterion_error.proto

require 'google/protobuf'


descriptor_data = "\n>google/ads/googleads/v14/errors/ad_group_criterion_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\xe0\t\n\x19\x41\x64GroupCriterionErrorEnum\"\xc2\t\n\x15\x41\x64GroupCriterionError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12+\n\'AD_GROUP_CRITERION_LABEL_DOES_NOT_EXIST\x10\x02\x12+\n\'AD_GROUP_CRITERION_LABEL_ALREADY_EXISTS\x10\x03\x12*\n&CANNOT_ADD_LABEL_TO_NEGATIVE_CRITERION\x10\x04\x12\x17\n\x13TOO_MANY_OPERATIONS\x10\x05\x12\x18\n\x14\x43\x41NT_UPDATE_NEGATIVE\x10\x06\x12\x1a\n\x16\x43ONCRETE_TYPE_REQUIRED\x10\x07\x12!\n\x1d\x42ID_INCOMPATIBLE_WITH_ADGROUP\x10\x08\x12\x1d\n\x19\x43\x41NNOT_TARGET_AND_EXCLUDE\x10\t\x12\x0f\n\x0bILLEGAL_URL\x10\n\x12\x18\n\x14INVALID_KEYWORD_TEXT\x10\x0b\x12\x1b\n\x17INVALID_DESTINATION_URL\x10\x0c\x12\x1f\n\x1bMISSING_DESTINATION_URL_TAG\x10\r\x12\x31\n-KEYWORD_LEVEL_BID_NOT_SUPPORTED_FOR_MANUALCPM\x10\x0e\x12\x17\n\x13INVALID_USER_STATUS\x10\x0f\x12\x1c\n\x18\x43\x41NNOT_ADD_CRITERIA_TYPE\x10\x10\x12 \n\x1c\x43\x41NNOT_EXCLUDE_CRITERIA_TYPE\x10\x11\x12\x35\n1CAMPAIGN_TYPE_NOT_COMPATIBLE_WITH_PARTIAL_FAILURE\x10\x1b\x12-\n)OPERATIONS_FOR_TOO_MANY_SHOPPING_ADGROUPS\x10\x1c\x12\x34\n0CANNOT_MODIFY_URL_FIELDS_WITH_DUPLICATE_ELEMENTS\x10\x1d\x12!\n\x1d\x43\x41NNOT_SET_WITHOUT_FINAL_URLS\x10\x1e\x12\x36\n2CANNOT_CLEAR_FINAL_URLS_IF_FINAL_MOBILE_URLS_EXIST\x10\x1f\x12\x33\n/CANNOT_CLEAR_FINAL_URLS_IF_FINAL_APP_URLS_EXIST\x10 \x12;\n7CANNOT_CLEAR_FINAL_URLS_IF_TRACKING_URL_TEMPLATE_EXISTS\x10!\x12:\n6CANNOT_CLEAR_FINAL_URLS_IF_URL_CUSTOM_PARAMETERS_EXIST\x10\"\x12\x32\n.CANNOT_SET_BOTH_DESTINATION_URL_AND_FINAL_URLS\x10#\x12=\n9CANNOT_SET_BOTH_DESTINATION_URL_AND_TRACKING_URL_TEMPLATE\x10$\x12/\n+FINAL_URLS_NOT_SUPPORTED_FOR_CRITERION_TYPE\x10%\x12\x36\n2FINAL_MOBILE_URLS_NOT_SUPPORTED_FOR_CRITERION_TYPE\x10&B\xfa\x01\n#com.google.ads.googleads.v14.errorsB\x1a\x41\x64GroupCriterionErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

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
          AdGroupCriterionErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AdGroupCriterionErrorEnum").msgclass
          AdGroupCriterionErrorEnum::AdGroupCriterionError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AdGroupCriterionErrorEnum.AdGroupCriterionError").enummodule
        end
      end
    end
  end
end
