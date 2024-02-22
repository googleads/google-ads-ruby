# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/enums/served_asset_field_type.proto

require 'google/protobuf'


descriptor_data = "\n<google/ads/googleads/v16/enums/served_asset_field_type.proto\x12\x1egoogle.ads.googleads.v16.enums\"\x8f\x05\n\x18ServedAssetFieldTypeEnum\"\xf2\x04\n\x14ServedAssetFieldType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0e\n\nHEADLINE_1\x10\x02\x12\x0e\n\nHEADLINE_2\x10\x03\x12\x0e\n\nHEADLINE_3\x10\x04\x12\x11\n\rDESCRIPTION_1\x10\x05\x12\x11\n\rDESCRIPTION_2\x10\x06\x12\x0c\n\x08HEADLINE\x10\x07\x12\x18\n\x14HEADLINE_IN_PORTRAIT\x10\x08\x12\x11\n\rLONG_HEADLINE\x10\t\x12\x0f\n\x0b\x44\x45SCRIPTION\x10\n\x12\x1b\n\x17\x44\x45SCRIPTION_IN_PORTRAIT\x10\x0b\x12\x1d\n\x19\x42USINESS_NAME_IN_PORTRAIT\x10\x0c\x12\x11\n\rBUSINESS_NAME\x10\r\x12\x13\n\x0fMARKETING_IMAGE\x10\x0e\x12\x1f\n\x1bMARKETING_IMAGE_IN_PORTRAIT\x10\x0f\x12\x1a\n\x16SQUARE_MARKETING_IMAGE\x10\x10\x12\x1c\n\x18PORTRAIT_MARKETING_IMAGE\x10\x11\x12\x08\n\x04LOGO\x10\x12\x12\x12\n\x0eLANDSCAPE_LOGO\x10\x13\x12\x12\n\x0e\x43\x41LL_TO_ACTION\x10\x14\x12\x12\n\x0eYOU_TUBE_VIDEO\x10\x15\x12\x0c\n\x08SITELINK\x10\x16\x12\x08\n\x04\x43\x41LL\x10\x17\x12\x0e\n\nMOBILE_APP\x10\x18\x12\x0b\n\x07\x43\x41LLOUT\x10\x19\x12\x16\n\x12STRUCTURED_SNIPPET\x10\x1a\x12\t\n\x05PRICE\x10\x1b\x12\r\n\tPROMOTION\x10\x1c\x12\x0c\n\x08\x41\x44_IMAGE\x10\x1d\x12\r\n\tLEAD_FORM\x10\x1e\x12\x11\n\rBUSINESS_LOGO\x10\x1f\x42\xf3\x01\n\"com.google.ads.googleads.v16.enumsB\x19ServedAssetFieldTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v16/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V16.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V16\\Enums\xea\x02\"Google::Ads::GoogleAds::V16::Enumsb\x06proto3"

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
          ServedAssetFieldTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.ServedAssetFieldTypeEnum").msgclass
          ServedAssetFieldTypeEnum::ServedAssetFieldType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.enums.ServedAssetFieldTypeEnum.ServedAssetFieldType").enummodule
        end
      end
    end
  end
end
