# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/customer_feed_error.proto

require 'google/protobuf'


descriptor_data = "\n9google/ads/googleads/v15/errors/customer_feed_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"\xf7\x02\n\x15\x43ustomerFeedErrorEnum\"\xdd\x02\n\x11\x43ustomerFeedError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12,\n(FEED_ALREADY_EXISTS_FOR_PLACEHOLDER_TYPE\x10\x02\x12\"\n\x1e\x43\x41NNOT_CREATE_FOR_REMOVED_FEED\x10\x03\x12\x30\n,CANNOT_CREATE_ALREADY_EXISTING_CUSTOMER_FEED\x10\x04\x12\'\n#CANNOT_MODIFY_REMOVED_CUSTOMER_FEED\x10\x05\x12\x1c\n\x18INVALID_PLACEHOLDER_TYPE\x10\x06\x12,\n(MISSING_FEEDMAPPING_FOR_PLACEHOLDER_TYPE\x10\x07\x12\x31\n-PLACEHOLDER_TYPE_NOT_ALLOWED_ON_CUSTOMER_FEED\x10\x08\x42\xf6\x01\n#com.google.ads.googleads.v15.errorsB\x16\x43ustomerFeedErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
          CustomerFeedErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.CustomerFeedErrorEnum").msgclass
          CustomerFeedErrorEnum::CustomerFeedError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.CustomerFeedErrorEnum.CustomerFeedError").enummodule
        end
      end
    end
  end
end
