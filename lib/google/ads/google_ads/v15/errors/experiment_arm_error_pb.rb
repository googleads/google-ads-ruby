# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/experiment_arm_error.proto

require 'google/protobuf'


descriptor_data = "\n:google/ads/googleads/v15/errors/experiment_arm_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"\xb1\x05\n\x16\x45xperimentArmErrorEnum\"\x96\x05\n\x12\x45xperimentArmError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\'\n#EXPERIMENT_ARM_COUNT_LIMIT_EXCEEDED\x10\x02\x12\x1b\n\x17INVALID_CAMPAIGN_STATUS\x10\x03\x12!\n\x1d\x44UPLICATE_EXPERIMENT_ARM_NAME\x10\x04\x12%\n!CANNOT_SET_TREATMENT_ARM_CAMPAIGN\x10\x05\x12\x1e\n\x1a\x43\x41NNOT_MODIFY_CAMPAIGN_IDS\x10\x06\x12-\n)CANNOT_MODIFY_CAMPAIGN_WITHOUT_SUFFIX_SET\x10\x07\x12+\n\'CANNOT_MUTATE_TRAFFIC_SPLIT_AFTER_START\x10\x08\x12*\n&CANNOT_ADD_CAMPAIGN_WITH_SHARED_BUDGET\x10\t\x12*\n&CANNOT_ADD_CAMPAIGN_WITH_CUSTOM_BUDGET\x10\n\x12\x34\n0CANNOT_ADD_CAMPAIGNS_WITH_DYNAMIC_ASSETS_ENABLED\x10\x0b\x12\x35\n1UNSUPPORTED_CAMPAIGN_ADVERTISING_CHANNEL_SUB_TYPE\x10\x0c\x12,\n(CANNOT_ADD_BASE_CAMPAIGN_WITH_DATE_RANGE\x10\r\x12\x31\n-BIDDING_STRATEGY_NOT_SUPPORTED_IN_EXPERIMENTS\x10\x0e\x12\x30\n,TRAFFIC_SPLIT_NOT_SUPPORTED_FOR_CHANNEL_TYPE\x10\x0f\x42\xf7\x01\n#com.google.ads.googleads.v15.errorsB\x17\x45xperimentArmErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
          ExperimentArmErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.ExperimentArmErrorEnum").msgclass
          ExperimentArmErrorEnum::ExperimentArmError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.ExperimentArmErrorEnum.ExperimentArmError").enummodule
        end
      end
    end
  end
end
