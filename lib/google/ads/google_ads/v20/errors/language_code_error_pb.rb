# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/language_code_error.proto

require 'google/protobuf'


descriptor_data = "\n9google/ads/googleads/v20/errors/language_code_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\x82\x01\n\x15LanguageCodeErrorEnum\"i\n\x11LanguageCodeError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1b\n\x17LANGUAGE_CODE_NOT_FOUND\x10\x02\x12\x19\n\x15INVALID_LANGUAGE_CODE\x10\x03\x42\xf6\x01\n#com.google.ads.googleads.v20.errorsB\x16LanguageCodeErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
          LanguageCodeErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.LanguageCodeErrorEnum").msgclass
          LanguageCodeErrorEnum::LanguageCodeError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.LanguageCodeErrorEnum.LanguageCodeError").enummodule
        end
      end
    end
  end
end
