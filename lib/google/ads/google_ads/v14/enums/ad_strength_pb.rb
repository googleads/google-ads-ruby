# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/enums/ad_strength.proto

require 'google/protobuf'


descriptor_data = "\n0google/ads/googleads/v14/enums/ad_strength.proto\x12\x1egoogle.ads.googleads.v14.enums\"\x85\x01\n\x0e\x41\x64StrengthEnum\"s\n\nAdStrength\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0b\n\x07PENDING\x10\x02\x12\n\n\x06NO_ADS\x10\x03\x12\x08\n\x04POOR\x10\x04\x12\x0b\n\x07\x41VERAGE\x10\x05\x12\x08\n\x04GOOD\x10\x06\x12\r\n\tEXCELLENT\x10\x07\x42\xe9\x01\n\"com.google.ads.googleads.v14.enumsB\x0f\x41\x64StrengthProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v14/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V14.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V14\\Enums\xea\x02\"Google::Ads::GoogleAds::V14::Enumsb\x06proto3"

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
        module Enums
          AdStrengthEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.enums.AdStrengthEnum").msgclass
          AdStrengthEnum::AdStrength = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.enums.AdStrengthEnum.AdStrength").enummodule
        end
      end
    end
  end
end
