# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/field_mask_error.proto

require 'google/protobuf'


descriptor_data = "\n6google/ads/googleads/v15/errors/field_mask_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"\xa7\x01\n\x12\x46ieldMaskErrorEnum\"\x90\x01\n\x0e\x46ieldMaskError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x16\n\x12\x46IELD_MASK_MISSING\x10\x05\x12\x1a\n\x16\x46IELD_MASK_NOT_ALLOWED\x10\x04\x12\x13\n\x0f\x46IELD_NOT_FOUND\x10\x02\x12\x17\n\x13\x46IELD_HAS_SUBFIELDS\x10\x03\x42\xf3\x01\n#com.google.ads.googleads.v15.errorsB\x13\x46ieldMaskErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
          FieldMaskErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.FieldMaskErrorEnum").msgclass
          FieldMaskErrorEnum::FieldMaskError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.FieldMaskErrorEnum.FieldMaskError").enummodule
        end
      end
    end
  end
end
