# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/ad_group_ad_error.proto

require 'google/protobuf'


descriptor_data = "\n7google/ads/googleads/v18/errors/ad_group_ad_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\xab\x03\n\x12\x41\x64GroupAdErrorEnum\"\x94\x03\n\x0e\x41\x64GroupAdError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12$\n AD_GROUP_AD_LABEL_DOES_NOT_EXIST\x10\x02\x12$\n AD_GROUP_AD_LABEL_ALREADY_EXISTS\x10\x03\x12\x18\n\x14\x41\x44_NOT_UNDER_ADGROUP\x10\x04\x12\'\n#CANNOT_OPERATE_ON_REMOVED_ADGROUPAD\x10\x05\x12 \n\x1c\x43\x41NNOT_CREATE_DEPRECATED_ADS\x10\x06\x12\x1a\n\x16\x43\x41NNOT_CREATE_TEXT_ADS\x10\x07\x12\x0f\n\x0b\x45MPTY_FIELD\x10\x08\x12\'\n#RESOURCE_REFERENCED_IN_MULTIPLE_OPS\x10\t\x12\x1c\n\x18\x41\x44_TYPE_CANNOT_BE_PAUSED\x10\n\x12\x1d\n\x19\x41\x44_TYPE_CANNOT_BE_REMOVED\x10\x0b\x12 \n\x1c\x43\x41NNOT_UPDATE_DEPRECATED_ADS\x10\x0c\x42\xf3\x01\n#com.google.ads.googleads.v18.errorsB\x13\x41\x64GroupAdErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
          AdGroupAdErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.AdGroupAdErrorEnum").msgclass
          AdGroupAdErrorEnum::AdGroupAdError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.AdGroupAdErrorEnum.AdGroupAdError").enummodule
        end
      end
    end
  end
end
