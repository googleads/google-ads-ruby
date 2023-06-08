# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/common/feed_item_set_filter_type_infos.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/feed_item_set_string_filter_type_pb'


descriptor_data = "\nEgoogle/ads/googleads/v14/common/feed_item_set_filter_type_infos.proto\x12\x1fgoogle.ads.googleads.v14.common\x1a\x45google/ads/googleads/v14/enums/feed_item_set_string_filter_type.proto\"}\n\x18\x44ynamicLocationSetFilter\x12\x0e\n\x06labels\x18\x01 \x03(\t\x12Q\n\x14\x62usiness_name_filter\x18\x02 \x01(\x0b\x32\x33.google.ads.googleads.v14.common.BusinessNameFilter\"\x9d\x01\n\x12\x42usinessNameFilter\x12\x15\n\rbusiness_name\x18\x01 \x01(\t\x12p\n\x0b\x66ilter_type\x18\x02 \x01(\x0e\x32[.google.ads.googleads.v14.enums.FeedItemSetStringFilterTypeEnum.FeedItemSetStringFilterType\"6\n!DynamicAffiliateLocationSetFilter\x12\x11\n\tchain_ids\x18\x01 \x03(\x03\x42\xff\x01\n#com.google.ads.googleads.v14.commonB\x1f\x46\x65\x65\x64ItemSetFilterTypeInfosProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Common\xea\x02#Google::Ads::GoogleAds::V14::Commonb\x06proto3"

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
        module Common
          DynamicLocationSetFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.DynamicLocationSetFilter").msgclass
          BusinessNameFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.BusinessNameFilter").msgclass
          DynamicAffiliateLocationSetFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.DynamicAffiliateLocationSetFilter").msgclass
        end
      end
    end
  end
end
