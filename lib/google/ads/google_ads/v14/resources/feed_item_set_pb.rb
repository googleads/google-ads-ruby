# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/feed_item_set.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/feed_item_set_filter_type_infos_pb'
require 'google/ads/google_ads/v14/enums/feed_item_set_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n6google/ads/googleads/v14/resources/feed_item_set.proto\x12\"google.ads.googleads.v14.resources\x1a\x45google/ads/googleads/v14/common/feed_item_set_filter_type_infos.proto\x1a\x39google/ads/googleads/v14/enums/feed_item_set_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xf5\x04\n\x0b\x46\x65\x65\x64ItemSet\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x05\xfa\x41&\n$googleads.googleapis.com/FeedItemSet\x12\x33\n\x04\x66\x65\x65\x64\x18\x02 \x01(\tB%\xe0\x41\x05\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/Feed\x12\x1d\n\x10\x66\x65\x65\x64_item_set_id\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12\x14\n\x0c\x64isplay_name\x18\x04 \x01(\t\x12\\\n\x06status\x18\x08 \x01(\x0e\x32G.google.ads.googleads.v14.enums.FeedItemSetStatusEnum.FeedItemSetStatusB\x03\xe0\x41\x03\x12`\n\x1b\x64ynamic_location_set_filter\x18\x05 \x01(\x0b\x32\x39.google.ads.googleads.v14.common.DynamicLocationSetFilterH\x00\x12s\n%dynamic_affiliate_location_set_filter\x18\x06 \x01(\x0b\x32\x42.google.ads.googleads.v14.common.DynamicAffiliateLocationSetFilterH\x00:l\xea\x41i\n$googleads.googleapis.com/FeedItemSet\x12\x41\x63ustomers/{customer_id}/feedItemSets/{feed_id}~{feed_item_set_id}B\x14\n\x12\x64ynamic_set_filterB\x82\x02\n&com.google.ads.googleads.v14.resourcesB\x10\x46\x65\x65\x64ItemSetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v14.common.DynamicLocationSetFilter", "google/ads/googleads/v14/common/feed_item_set_filter_type_infos.proto"],
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
        module Resources
          FeedItemSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.FeedItemSet").msgclass
        end
      end
    end
  end
end
