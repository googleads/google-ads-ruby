# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/asset_set.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/common/asset_set_types_pb'
require 'google/ads/google_ads/v16/enums/asset_set_status_pb'
require 'google/ads/google_ads/v16/enums/asset_set_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n2google/ads/googleads/v16/resources/asset_set.proto\x12\"google.ads.googleads.v16.resources\x1a\x35google/ads/googleads/v16/common/asset_set_types.proto\x1a\x35google/ads/googleads/v16/enums/asset_set_status.proto\x1a\x33google/ads/googleads/v16/enums/asset_set_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xdc\x08\n\x08\x41ssetSet\x12\x0f\n\x02id\x18\x06 \x01(\x03\x42\x03\xe0\x41\x03\x12@\n\rresource_name\x18\x01 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/AssetSet\x12\x11\n\x04name\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12S\n\x04type\x18\x03 \x01(\x0e\x32=.google.ads.googleads.v16.enums.AssetSetTypeEnum.AssetSetTypeB\x06\xe0\x41\x02\xe0\x41\x05\x12V\n\x06status\x18\x04 \x01(\x0e\x32\x41.google.ads.googleads.v16.enums.AssetSetStatusEnum.AssetSetStatusB\x03\xe0\x41\x03\x12]\n\x14merchant_center_feed\x18\x05 \x01(\x0b\x32?.google.ads.googleads.v16.resources.AssetSet.MerchantCenterFeed\x12/\n\"location_group_parent_asset_set_id\x18\n \x01(\x03\x42\x03\xe0\x41\x05\x12`\n\x13hotel_property_data\x18\x0b \x01(\x0b\x32>.google.ads.googleads.v16.resources.AssetSet.HotelPropertyDataB\x03\xe0\x41\x03\x12\x44\n\x0clocation_set\x18\x07 \x01(\x0b\x32,.google.ads.googleads.v16.common.LocationSetH\x00\x12h\n\x1f\x62usiness_profile_location_group\x18\x08 \x01(\x0b\x32=.google.ads.googleads.v16.common.BusinessProfileLocationGroupH\x00\x12S\n\x14\x63hain_location_group\x18\t \x01(\x0b\x32\x33.google.ads.googleads.v16.common.ChainLocationGroupH\x00\x1a[\n\x12MerchantCenterFeed\x12\x18\n\x0bmerchant_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x02\x12\x1c\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x01H\x00\x88\x01\x01\x42\r\n\x0b_feed_label\x1a{\n\x11HotelPropertyData\x12!\n\x0fhotel_center_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1e\n\x0cpartner_name\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x42\x12\n\x10_hotel_center_idB\x0f\n\r_partner_name:X\xea\x41U\n!googleads.googleapis.com/AssetSet\x12\x30\x63ustomers/{customer_id}/assetSets/{asset_set_id}B\x12\n\x10\x61sset_set_sourceB\xff\x01\n&com.google.ads.googleads.v16.resourcesB\rAssetSetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v16.common.LocationSet", "google/ads/googleads/v16/common/asset_set_types.proto"],
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
        module Resources
          AssetSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.AssetSet").msgclass
          AssetSet::MerchantCenterFeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.AssetSet.MerchantCenterFeed").msgclass
          AssetSet::HotelPropertyData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.AssetSet.HotelPropertyData").msgclass
        end
      end
    end
  end
end
