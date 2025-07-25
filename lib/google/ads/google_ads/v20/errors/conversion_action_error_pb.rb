# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/conversion_action_error.proto

require 'google/protobuf'


descriptor_data = "\n=google/ads/googleads/v20/errors/conversion_action_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\xd3\x03\n\x19\x43onversionActionErrorEnum\"\xb5\x03\n\x15\x43onversionActionError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x12\n\x0e\x44UPLICATE_NAME\x10\x02\x12\x14\n\x10\x44UPLICATE_APP_ID\x10\x03\x12\x37\n3TWO_CONVERSION_ACTIONS_BIDDING_ON_SAME_APP_DOWNLOAD\x10\x04\x12\x31\n-BIDDING_ON_SAME_APP_DOWNLOAD_AS_GLOBAL_ACTION\x10\x05\x12)\n%DATA_DRIVEN_MODEL_WAS_NEVER_GENERATED\x10\x06\x12\x1d\n\x19\x44\x41TA_DRIVEN_MODEL_EXPIRED\x10\x07\x12\x1b\n\x17\x44\x41TA_DRIVEN_MODEL_STALE\x10\x08\x12\x1d\n\x19\x44\x41TA_DRIVEN_MODEL_UNKNOWN\x10\t\x12\x1a\n\x16\x43REATION_NOT_SUPPORTED\x10\n\x12\x18\n\x14UPDATE_NOT_SUPPORTED\x10\x0b\x12,\n(CANNOT_SET_RULE_BASED_ATTRIBUTION_MODELS\x10\x0c\x42\xfa\x01\n#com.google.ads.googleads.v20.errorsB\x1a\x43onversionActionErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
          ConversionActionErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.ConversionActionErrorEnum").msgclass
          ConversionActionErrorEnum::ConversionActionError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.ConversionActionErrorEnum.ConversionActionError").enummodule
        end
      end
    end
  end
end
