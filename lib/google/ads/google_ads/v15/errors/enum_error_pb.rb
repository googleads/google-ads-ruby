# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/enum_error.proto

require 'google/protobuf'


descriptor_data = "\n0google/ads/googleads/v15/errors/enum_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"X\n\rEnumErrorEnum\"G\n\tEnumError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1c\n\x18\x45NUM_VALUE_NOT_PERMITTED\x10\x03\x42\xee\x01\n#com.google.ads.googleads.v15.errorsB\x0e\x45numErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
          EnumErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.EnumErrorEnum").msgclass
          EnumErrorEnum::EnumError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.EnumErrorEnum.EnumError").enummodule
        end
      end
    end
  end
end
