# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/campaign_criterion_error.proto

require 'google/protobuf'


descriptor_data = "\n>google/ads/googleads/v14/errors/campaign_criterion_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\x84\n\n\x1a\x43\x61mpaignCriterionErrorEnum\"\xe5\t\n\x16\x43\x61mpaignCriterionError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1a\n\x16\x43ONCRETE_TYPE_REQUIRED\x10\x02\x12\x19\n\x15INVALID_PLACEMENT_URL\x10\x03\x12 \n\x1c\x43\x41NNOT_EXCLUDE_CRITERIA_TYPE\x10\x04\x12\'\n#CANNOT_SET_STATUS_FOR_CRITERIA_TYPE\x10\x05\x12+\n\'CANNOT_SET_STATUS_FOR_EXCLUDED_CRITERIA\x10\x06\x12\x1d\n\x19\x43\x41NNOT_TARGET_AND_EXCLUDE\x10\x07\x12\x17\n\x13TOO_MANY_OPERATIONS\x10\x08\x12-\n)OPERATOR_NOT_SUPPORTED_FOR_CRITERION_TYPE\x10\t\x12\x43\n?SHOPPING_CAMPAIGN_SALES_COUNTRY_NOT_SUPPORTED_FOR_SALES_CHANNEL\x10\n\x12\x1d\n\x19\x43\x41NNOT_ADD_EXISTING_FIELD\x10\x0b\x12$\n CANNOT_UPDATE_NEGATIVE_CRITERION\x10\x0c\x12\x38\n4CANNOT_SET_NEGATIVE_KEYWORD_THEME_CONSTANT_CRITERION\x10\r\x12\"\n\x1eINVALID_KEYWORD_THEME_CONSTANT\x10\x0e\x12=\n9MISSING_KEYWORD_THEME_CONSTANT_OR_FREE_FORM_KEYWORD_THEME\x10\x0f\x12I\nECANNOT_TARGET_BOTH_PROXIMITY_AND_LOCATION_CRITERIA_FOR_SMART_CAMPAIGN\x10\x10\x12@\n<CANNOT_TARGET_MULTIPLE_PROXIMITY_CRITERIA_FOR_SMART_CAMPAIGN\x10\x11\x12\x35\n1LOCATION_NOT_LAUNCHED_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x12\x12\x30\n,LOCATION_INVALID_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x13\x12\x35\n1CANNOT_TARGET_COUNTRY_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x14\x12<\n8LOCATION_NOT_IN_HOME_COUNTRY_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x15\x12=\n9CANNOT_ADD_OR_REMOVE_LOCATION_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x16\x12G\nCAT_LEAST_ONE_POSITIVE_LOCATION_REQUIRED_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x17\x12P\nLAT_LEAST_ONE_LOCAL_SERVICE_ID_CRITERION_REQUIRED_FOR_LOCAL_SERVICES_CAMPAIGN\x10\x18\x12+\n\'LOCAL_SERVICE_ID_NOT_FOUND_FOR_CATEGORY\x10\x19\x42\xfb\x01\n#com.google.ads.googleads.v14.errorsB\x1b\x43\x61mpaignCriterionErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

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
          CampaignCriterionErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.CampaignCriterionErrorEnum").msgclass
          CampaignCriterionErrorEnum::CampaignCriterionError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.CampaignCriterionErrorEnum.CampaignCriterionError").enummodule
        end
      end
    end
  end
end
