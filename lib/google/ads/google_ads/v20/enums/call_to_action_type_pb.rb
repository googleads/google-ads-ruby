# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/enums/call_to_action_type.proto

require 'google/protobuf'


descriptor_data = "\n8google/ads/googleads/v20/enums/call_to_action_type.proto\x12\x1egoogle.ads.googleads.v20.enums\"\xc3\x02\n\x14\x43\x61llToActionTypeEnum\"\xaa\x02\n\x10\x43\x61llToActionType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0e\n\nLEARN_MORE\x10\x02\x12\r\n\tGET_QUOTE\x10\x03\x12\r\n\tAPPLY_NOW\x10\x04\x12\x0b\n\x07SIGN_UP\x10\x05\x12\x0e\n\nCONTACT_US\x10\x06\x12\r\n\tSUBSCRIBE\x10\x07\x12\x0c\n\x08\x44OWNLOAD\x10\x08\x12\x0c\n\x08\x42OOK_NOW\x10\t\x12\x0c\n\x08SHOP_NOW\x10\n\x12\x0b\n\x07\x42UY_NOW\x10\x0b\x12\x0e\n\nDONATE_NOW\x10\x0c\x12\r\n\tORDER_NOW\x10\r\x12\x0c\n\x08PLAY_NOW\x10\x0e\x12\x0c\n\x08SEE_MORE\x10\x0f\x12\r\n\tSTART_NOW\x10\x10\x12\x0e\n\nVISIT_SITE\x10\x11\x12\r\n\tWATCH_NOW\x10\x12\x42\xef\x01\n\"com.google.ads.googleads.v20.enumsB\x15\x43\x61llToActionTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v20/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V20.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V20\\Enums\xea\x02\"Google::Ads::GoogleAds::V20::Enumsb\x06proto3"

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
      module V20
        module Enums
          CallToActionTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.CallToActionTypeEnum").msgclass
          CallToActionTypeEnum::CallToActionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.CallToActionTypeEnum.CallToActionType").enummodule
        end
      end
    end
  end
end
