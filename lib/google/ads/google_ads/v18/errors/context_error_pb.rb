# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/context_error.proto

require 'google/protobuf'


descriptor_data = "\n3google/ads/googleads/v18/errors/context_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\x9c\x01\n\x10\x43ontextErrorEnum\"\x87\x01\n\x0c\x43ontextError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\'\n#OPERATION_NOT_PERMITTED_FOR_CONTEXT\x10\x02\x12\x30\n,OPERATION_NOT_PERMITTED_FOR_REMOVED_RESOURCE\x10\x03\x42\xf1\x01\n#com.google.ads.googleads.v18.errorsB\x11\x43ontextErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
          ContextErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.ContextErrorEnum").msgclass
          ContextErrorEnum::ContextError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.ContextErrorEnum.ContextError").enummodule
        end
      end
    end
  end
end
