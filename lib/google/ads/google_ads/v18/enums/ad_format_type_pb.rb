# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/ad_format_type.proto

require 'google/protobuf'


descriptor_data = "\n3google/ads/googleads/v18/enums/ad_format_type.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xdd\x01\n\x10\x41\x64\x46ormatTypeEnum\"\xc8\x01\n\x0c\x41\x64\x46ormatType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\t\n\x05OTHER\x10\x02\x12\x0f\n\x0bUNSEGMENTED\x10\x03\x12\x16\n\x12INSTREAM_SKIPPABLE\x10\x04\x12\x1a\n\x16INSTREAM_NON_SKIPPABLE\x10\x05\x12\n\n\x06INFEED\x10\x06\x12\n\n\x06\x42UMPER\x10\x07\x12\r\n\tOUTSTREAM\x10\x08\x12\x0c\n\x08MASTHEAD\x10\t\x12\t\n\x05\x41UDIO\x10\n\x12\n\n\x06SHORTS\x10\x0b\x42\xeb\x01\n\"com.google.ads.googleads.v18.enumsB\x11\x41\x64\x46ormatTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
          AdFormatTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.AdFormatTypeEnum").msgclass
          AdFormatTypeEnum::AdFormatType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.AdFormatTypeEnum.AdFormatType").enummodule
        end
      end
    end
  end
end
