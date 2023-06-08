# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/asset_set_error.proto

require 'google/protobuf'


descriptor_data = "\n5google/ads/googleads/v14/errors/asset_set_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\xef\x03\n\x11\x41ssetSetErrorEnum\"\xd9\x03\n\rAssetSetError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1c\n\x18\x44UPLICATE_ASSET_SET_NAME\x10\x02\x12!\n\x1dINVALID_PARENT_ASSET_SET_TYPE\x10\x03\x12\x37\n3ASSET_SET_SOURCE_INCOMPATIBLE_WITH_PARENT_ASSET_SET\x10\x04\x12/\n+ASSET_SET_TYPE_CANNOT_BE_LINKED_TO_CUSTOMER\x10\x05\x12\x15\n\x11INVALID_CHAIN_IDS\x10\x06\x12>\n:LOCATION_SYNC_ASSET_SET_DOES_NOT_SUPPORT_RELATIONSHIP_TYPE\x10\x07\x12\x34\n0NOT_UNIQUE_ENABLED_LOCATION_SYNC_TYPED_ASSET_SET\x10\x08\x12\x15\n\x11INVALID_PLACE_IDS\x10\t\x12\x16\n\x12OAUTH_INFO_INVALID\x10\x0b\x12\x16\n\x12OAUTH_INFO_MISSING\x10\x0c\x12+\n\'CANNOT_DELETE_AS_ENABLED_LINKAGES_EXIST\x10\nB\xf2\x01\n#com.google.ads.googleads.v14.errorsB\x12\x41ssetSetErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

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
      module V14
        module Errors
          AssetSetErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AssetSetErrorEnum").msgclass
          AssetSetErrorEnum::AssetSetError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AssetSetErrorEnum.AssetSetError").enummodule
        end
      end
    end
  end
end
