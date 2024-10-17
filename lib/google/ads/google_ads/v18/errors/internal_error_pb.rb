# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/internal_error.proto

require 'google/protobuf'


descriptor_data = "\n4google/ads/googleads/v18/errors/internal_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\xa1\x01\n\x11InternalErrorEnum\"\x8b\x01\n\rInternalError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x12\n\x0eINTERNAL_ERROR\x10\x02\x12\x1c\n\x18\x45RROR_CODE_NOT_PUBLISHED\x10\x03\x12\x13\n\x0fTRANSIENT_ERROR\x10\x04\x12\x15\n\x11\x44\x45\x41\x44LINE_EXCEEDED\x10\x05\x42\xf2\x01\n#com.google.ads.googleads.v18.errorsB\x12InternalErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
          InternalErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.InternalErrorEnum").msgclass
          InternalErrorEnum::InternalError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.InternalErrorEnum.InternalError").enummodule
        end
      end
    end
  end
end
