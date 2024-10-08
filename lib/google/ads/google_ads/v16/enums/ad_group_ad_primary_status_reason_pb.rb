# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/enums/ad_group_ad_primary_status_reason.proto

require 'google/protobuf'


descriptor_data = "\nFgoogle/ads/googleads/v16/enums/ad_group_ad_primary_status_reason.proto\x12\x1egoogle.ads.googleads.v16.enums\"\xea\x03\n AdGroupAdPrimaryStatusReasonEnum\"\xc5\x03\n\x1c\x41\x64GroupAdPrimaryStatusReason\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x14\n\x10\x43\x41MPAIGN_REMOVED\x10\x02\x12\x13\n\x0f\x43\x41MPAIGN_PAUSED\x10\x03\x12\x14\n\x10\x43\x41MPAIGN_PENDING\x10\x04\x12\x12\n\x0e\x43\x41MPAIGN_ENDED\x10\x05\x12\x13\n\x0f\x41\x44_GROUP_PAUSED\x10\x06\x12\x14\n\x10\x41\x44_GROUP_REMOVED\x10\x07\x12\x16\n\x12\x41\x44_GROUP_AD_PAUSED\x10\x08\x12\x17\n\x13\x41\x44_GROUP_AD_REMOVED\x10\t\x12\x1b\n\x17\x41\x44_GROUP_AD_DISAPPROVED\x10\n\x12\x1c\n\x18\x41\x44_GROUP_AD_UNDER_REVIEW\x10\x0b\x12\x1c\n\x18\x41\x44_GROUP_AD_POOR_QUALITY\x10\x0c\x12\x16\n\x12\x41\x44_GROUP_AD_NO_ADS\x10\r\x12 \n\x1c\x41\x44_GROUP_AD_APPROVED_LABELED\x10\x0e\x12%\n!AD_GROUP_AD_AREA_OF_INTEREST_ONLY\x10\x0f\x12\x1c\n\x18\x41\x44_GROUP_AD_UNDER_APPEAL\x10\x10\x42\xfb\x01\n\"com.google.ads.googleads.v16.enumsB!AdGroupAdPrimaryStatusReasonProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v16/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V16.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V16\\Enums\xea\x02\"Google::Ads::GoogleAds::V16::Enumsb\x06proto3"

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
          AdGroupAdPrimaryStatusReasonEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.AdGroupAdPrimaryStatusReasonEnum").msgclass
          AdGroupAdPrimaryStatusReasonEnum::AdGroupAdPrimaryStatusReason = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.AdGroupAdPrimaryStatusReasonEnum.AdGroupAdPrimaryStatusReason").enummodule
        end
      end
    end
  end
end