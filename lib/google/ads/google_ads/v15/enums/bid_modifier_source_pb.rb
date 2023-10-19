# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/enums/bid_modifier_source.proto

require 'google/protobuf'


descriptor_data = "\n8google/ads/googleads/v15/enums/bid_modifier_source.proto\x12\x1egoogle.ads.googleads.v15.enums\"f\n\x15\x42idModifierSourceEnum\"M\n\x11\x42idModifierSource\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0c\n\x08\x43\x41MPAIGN\x10\x02\x12\x0c\n\x08\x41\x44_GROUP\x10\x03\x42\xf0\x01\n\"com.google.ads.googleads.v15.enumsB\x16\x42idModifierSourceProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v15/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V15.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V15\\Enums\xea\x02\"Google::Ads::GoogleAds::V15::Enumsb\x06proto3"

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
        module Enums
          BidModifierSourceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.enums.BidModifierSourceEnum").msgclass
          BidModifierSourceEnum::BidModifierSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.enums.BidModifierSourceEnum.BidModifierSource").enummodule
        end
      end
    end
  end
end
