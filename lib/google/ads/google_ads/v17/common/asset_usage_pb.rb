# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/common/asset_usage.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/enums/served_asset_field_type_pb'


descriptor_data = "\n1google/ads/googleads/v17/common/asset_usage.proto\x12\x1fgoogle.ads.googleads.v17.common\x1a<google/ads/googleads/v17/enums/served_asset_field_type.proto\"\x8b\x01\n\nAssetUsage\x12\r\n\x05\x61sset\x18\x01 \x01(\t\x12n\n\x17served_asset_field_type\x18\x02 \x01(\x0e\x32M.google.ads.googleads.v17.enums.ServedAssetFieldTypeEnum.ServedAssetFieldTypeB\xef\x01\n#com.google.ads.googleads.v17.commonB\x0f\x41ssetUsageProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v17/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V17.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V17\\Common\xea\x02#Google::Ads::GoogleAds::V17::Commonb\x06proto3"

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
      module V17
        module Common
          AssetUsage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.AssetUsage").msgclass
        end
      end
    end
  end
end