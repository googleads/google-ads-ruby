# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/asset_set_asset.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/asset_set_asset_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n8google/ads/googleads/v18/resources/asset_set_asset.proto\x12\"google.ads.googleads.v18.resources\x1a;google/ads/googleads/v18/enums/asset_set_asset_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x9c\x03\n\rAssetSetAsset\x12\x45\n\rresource_name\x18\x01 \x01(\tB.\xe0\x41\x05\xfa\x41(\n&googleads.googleapis.com/AssetSetAsset\x12<\n\tasset_set\x18\x02 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/AssetSet\x12\x35\n\x05\x61sset\x18\x03 \x01(\tB&\xe0\x41\x05\xfa\x41 \n\x1egoogleads.googleapis.com/Asset\x12`\n\x06status\x18\x04 \x01(\x0e\x32K.google.ads.googleads.v18.enums.AssetSetAssetStatusEnum.AssetSetAssetStatusB\x03\xe0\x41\x03:m\xea\x41j\n&googleads.googleapis.com/AssetSetAsset\x12@customers/{customer_id}/assetSetAssets/{asset_set_id}~{asset_id}B\x84\x02\n&com.google.ads.googleads.v18.resourcesB\x12\x41ssetSetAssetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
        module Resources
          AssetSetAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.AssetSetAsset").msgclass
        end
      end
    end
  end
end
