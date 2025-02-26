# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v19/errors/brand_guidelines_migration_error.proto

require 'google/protobuf'


descriptor_data = "\nFgoogle/ads/googleads/v19/errors/brand_guidelines_migration_error.proto\x12\x1fgoogle.ads.googleads.v19.errors\"\x91\x03\n!BrandGuidelinesMigrationErrorEnum\"\xeb\x02\n\x1d\x42randGuidelinesMigrationError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12$\n BRAND_GUIDELINES_ALREADY_ENABLED\x10\x02\x12\x37\n3CANNOT_ENABLE_BRAND_GUIDELINES_FOR_REMOVED_CAMPAIGN\x10\x03\x12(\n$BRAND_GUIDELINES_LOGO_LIMIT_EXCEEDED\x10\x04\x12@\n<CANNOT_AUTO_POPULATE_BRAND_ASSETS_WHEN_BRAND_ASSETS_PROVIDED\x10\x05\x12\x41\n=AUTO_POPULATE_BRAND_ASSETS_REQUIRED_WHEN_BRAND_ASSETS_OMITTED\x10\x06\x12\x1e\n\x1aTOO_MANY_ENABLE_OPERATIONS\x10\x07\x42\x82\x02\n#com.google.ads.googleads.v19.errorsB\"BrandGuidelinesMigrationErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v19/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V19.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V19\\Errors\xea\x02#Google::Ads::GoogleAds::V19::Errorsb\x06proto3"

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
      module V19
        module Errors
          BrandGuidelinesMigrationErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.errors.BrandGuidelinesMigrationErrorEnum").msgclass
          BrandGuidelinesMigrationErrorEnum::BrandGuidelinesMigrationError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.errors.BrandGuidelinesMigrationErrorEnum.BrandGuidelinesMigrationError").enummodule
        end
      end
    end
  end
end
