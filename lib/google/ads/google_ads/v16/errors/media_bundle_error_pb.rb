# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/errors/media_bundle_error.proto

require 'google/protobuf'


descriptor_data = "\n8google/ads/googleads/v16/errors/media_bundle_error.proto\x12\x1fgoogle.ads.googleads.v16.errors\"\xb8\x05\n\x14MediaBundleErrorEnum\"\x9f\x05\n\x10MediaBundleError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0f\n\x0b\x42\x41\x44_REQUEST\x10\x03\x12\"\n\x1e\x44OUBLECLICK_BUNDLE_NOT_ALLOWED\x10\x04\x12\x1c\n\x18\x45XTERNAL_URL_NOT_ALLOWED\x10\x05\x12\x12\n\x0e\x46ILE_TOO_LARGE\x10\x06\x12.\n*GOOGLE_WEB_DESIGNER_ZIP_FILE_NOT_PUBLISHED\x10\x07\x12\x11\n\rINVALID_INPUT\x10\x08\x12\x18\n\x14INVALID_MEDIA_BUNDLE\x10\t\x12\x1e\n\x1aINVALID_MEDIA_BUNDLE_ENTRY\x10\n\x12\x15\n\x11INVALID_MIME_TYPE\x10\x0b\x12\x10\n\x0cINVALID_PATH\x10\x0c\x12\x19\n\x15INVALID_URL_REFERENCE\x10\r\x12\x18\n\x14MEDIA_DATA_TOO_LARGE\x10\x0e\x12&\n\"MISSING_PRIMARY_MEDIA_BUNDLE_ENTRY\x10\x0f\x12\x10\n\x0cSERVER_ERROR\x10\x10\x12\x11\n\rSTORAGE_ERROR\x10\x11\x12\x1d\n\x19SWIFFY_BUNDLE_NOT_ALLOWED\x10\x12\x12\x12\n\x0eTOO_MANY_FILES\x10\x13\x12\x13\n\x0fUNEXPECTED_SIZE\x10\x14\x12/\n+UNSUPPORTED_GOOGLE_WEB_DESIGNER_ENVIRONMENT\x10\x15\x12\x1d\n\x19UNSUPPORTED_HTML5_FEATURE\x10\x16\x12)\n%URL_IN_MEDIA_BUNDLE_NOT_SSL_COMPLIANT\x10\x17\x12\x1b\n\x17\x43USTOM_EXIT_NOT_ALLOWED\x10\x18\x42\xf5\x01\n#com.google.ads.googleads.v16.errorsB\x15MediaBundleErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v16/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V16.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V16\\Errors\xea\x02#Google::Ads::GoogleAds::V16::Errorsb\x06proto3"

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
      module V16
        module Errors
          MediaBundleErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.MediaBundleErrorEnum").msgclass
          MediaBundleErrorEnum::MediaBundleError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.MediaBundleErrorEnum.MediaBundleError").enummodule
        end
      end
    end
  end
end
