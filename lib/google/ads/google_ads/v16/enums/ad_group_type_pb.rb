# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/enums/ad_group_type.proto

require 'google/protobuf'


descriptor_data = "\n2google/ads/googleads/v16/enums/ad_group_type.proto\x12\x1egoogle.ads.googleads.v16.enums\"\xe2\x03\n\x0f\x41\x64GroupTypeEnum\"\xce\x03\n\x0b\x41\x64GroupType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x13\n\x0fSEARCH_STANDARD\x10\x02\x12\x14\n\x10\x44ISPLAY_STANDARD\x10\x03\x12\x18\n\x14SHOPPING_PRODUCT_ADS\x10\x04\x12\r\n\tHOTEL_ADS\x10\x06\x12\x16\n\x12SHOPPING_SMART_ADS\x10\x07\x12\x10\n\x0cVIDEO_BUMPER\x10\x08\x12\x1d\n\x19VIDEO_TRUE_VIEW_IN_STREAM\x10\t\x12\x1e\n\x1aVIDEO_TRUE_VIEW_IN_DISPLAY\x10\n\x12!\n\x1dVIDEO_NON_SKIPPABLE_IN_STREAM\x10\x0b\x12\x13\n\x0fVIDEO_OUTSTREAM\x10\x0c\x12\x16\n\x12SEARCH_DYNAMIC_ADS\x10\r\x12#\n\x1fSHOPPING_COMPARISON_LISTING_ADS\x10\x0e\x12\x16\n\x12PROMOTED_HOTEL_ADS\x10\x0f\x12\x14\n\x10VIDEO_RESPONSIVE\x10\x10\x12\x19\n\x15VIDEO_EFFICIENT_REACH\x10\x11\x12\x16\n\x12SMART_CAMPAIGN_ADS\x10\x12\x12\x0e\n\nTRAVEL_ADS\x10\x13\x42\xea\x01\n\"com.google.ads.googleads.v16.enumsB\x10\x41\x64GroupTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v16/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V16.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V16\\Enums\xea\x02\"Google::Ads::GoogleAds::V16::Enumsb\x06proto3"

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
        module Enums
          AdGroupTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.AdGroupTypeEnum").msgclass
          AdGroupTypeEnum::AdGroupType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.AdGroupTypeEnum.AdGroupType").enummodule
        end
      end
    end
  end
end