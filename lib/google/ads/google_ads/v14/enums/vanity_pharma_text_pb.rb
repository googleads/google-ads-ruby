# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/enums/vanity_pharma_text.proto

require 'google/protobuf'


descriptor_data = "\n7google/ads/googleads/v14/enums/vanity_pharma_text.proto\x12\x1egoogle.ads.googleads.v14.enums\"\x8b\x04\n\x14VanityPharmaTextEnum\"\xf2\x03\n\x10VanityPharmaText\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12%\n!PRESCRIPTION_TREATMENT_WEBSITE_EN\x10\x02\x12%\n!PRESCRIPTION_TREATMENT_WEBSITE_ES\x10\x03\x12\"\n\x1ePRESCRIPTION_DEVICE_WEBSITE_EN\x10\x04\x12\"\n\x1ePRESCRIPTION_DEVICE_WEBSITE_ES\x10\x05\x12\x1d\n\x19MEDICAL_DEVICE_WEBSITE_EN\x10\x06\x12\x1d\n\x19MEDICAL_DEVICE_WEBSITE_ES\x10\x07\x12%\n!PREVENTATIVE_TREATMENT_WEBSITE_EN\x10\x08\x12%\n!PREVENTATIVE_TREATMENT_WEBSITE_ES\x10\t\x12)\n%PRESCRIPTION_CONTRACEPTION_WEBSITE_EN\x10\n\x12)\n%PRESCRIPTION_CONTRACEPTION_WEBSITE_ES\x10\x0b\x12#\n\x1fPRESCRIPTION_VACCINE_WEBSITE_EN\x10\x0c\x12#\n\x1fPRESCRIPTION_VACCINE_WEBSITE_ES\x10\rB\xef\x01\n\"com.google.ads.googleads.v14.enumsB\x15VanityPharmaTextProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v14/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V14.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V14\\Enums\xea\x02\"Google::Ads::GoogleAds::V14::Enumsb\x06proto3"

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
          VanityPharmaTextEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.enums.VanityPharmaTextEnum").msgclass
          VanityPharmaTextEnum::VanityPharmaText = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.enums.VanityPharmaTextEnum.VanityPharmaText").enummodule
        end
      end
    end
  end
end
