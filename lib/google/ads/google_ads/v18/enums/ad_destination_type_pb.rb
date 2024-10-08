# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/ad_destination_type.proto

require 'google/protobuf'


descriptor_data = "\n8google/ads/googleads/v18/enums/ad_destination_type.proto\x12\x1egoogle.ads.googleads.v18.enums\"\x90\x02\n\x15\x41\x64\x44\x65stinationTypeEnum\"\xf6\x01\n\x11\x41\x64\x44\x65stinationType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x12\n\x0eNOT_APPLICABLE\x10\x02\x12\x0b\n\x07WEBSITE\x10\x03\x12\x11\n\rAPP_DEEP_LINK\x10\x04\x12\r\n\tAPP_STORE\x10\x05\x12\x0e\n\nPHONE_CALL\x10\x06\x12\x12\n\x0eMAP_DIRECTIONS\x10\x07\x12\x14\n\x10LOCATION_LISTING\x10\x08\x12\x0b\n\x07MESSAGE\x10\t\x12\r\n\tLEAD_FORM\x10\n\x12\x0b\n\x07YOUTUBE\x10\x0b\x12\x1d\n\x19UNMODELED_FOR_CONVERSIONS\x10\x0c\x42\xf0\x01\n\"com.google.ads.googleads.v18.enumsB\x16\x41\x64\x44\x65stinationTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
        module Enums
          AdDestinationTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.AdDestinationTypeEnum").msgclass
          AdDestinationTypeEnum::AdDestinationType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.AdDestinationTypeEnum.AdDestinationType").enummodule
        end
      end
    end
  end
end
