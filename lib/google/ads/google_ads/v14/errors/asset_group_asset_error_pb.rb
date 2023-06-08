# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/asset_group_asset_error.proto

require 'google/protobuf'


descriptor_data = "\n=google/ads/googleads/v14/errors/asset_group_asset_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\xeb\x01\n\x18\x41ssetGroupAssetErrorEnum\"\xce\x01\n\x14\x41ssetGroupAssetError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x16\n\x12\x44UPLICATE_RESOURCE\x10\x02\x12.\n*EXPANDABLE_TAGS_NOT_ALLOWED_IN_DESCRIPTION\x10\x03\x12\x1f\n\x1b\x41\x44_CUSTOMIZER_NOT_SUPPORTED\x10\x04\x12/\n+HOTEL_PROPERTY_ASSET_NOT_LINKED_TO_CAMPAIGN\x10\x05\x42\xf9\x01\n#com.google.ads.googleads.v14.errorsB\x19\x41ssetGroupAssetErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

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
          AssetGroupAssetErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AssetGroupAssetErrorEnum").msgclass
          AssetGroupAssetErrorEnum::AssetGroupAssetError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AssetGroupAssetErrorEnum.AssetGroupAssetError").enummodule
        end
      end
    end
  end
end
