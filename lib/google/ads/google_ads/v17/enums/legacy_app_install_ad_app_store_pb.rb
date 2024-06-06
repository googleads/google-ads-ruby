# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/enums/legacy_app_install_ad_app_store.proto

require 'google/protobuf'


descriptor_data = "\nDgoogle/ads/googleads/v17/enums/legacy_app_install_ad_app_store.proto\x12\x1egoogle.ads.googleads.v17.enums\"\xc1\x01\n\x1eLegacyAppInstallAdAppStoreEnum\"\x9e\x01\n\x1aLegacyAppInstallAdAppStore\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x13\n\x0f\x41PPLE_APP_STORE\x10\x02\x12\x0f\n\x0bGOOGLE_PLAY\x10\x03\x12\x11\n\rWINDOWS_STORE\x10\x04\x12\x17\n\x13WINDOWS_PHONE_STORE\x10\x05\x12\x10\n\x0c\x43N_APP_STORE\x10\x06\x42\xf9\x01\n\"com.google.ads.googleads.v17.enumsB\x1fLegacyAppInstallAdAppStoreProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v17/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V17.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V17\\Enums\xea\x02\"Google::Ads::GoogleAds::V17::Enumsb\x06proto3"

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
      module V17
        module Enums
          LegacyAppInstallAdAppStoreEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.enums.LegacyAppInstallAdAppStoreEnum").msgclass
          LegacyAppInstallAdAppStoreEnum::LegacyAppInstallAdAppStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.enums.LegacyAppInstallAdAppStoreEnum.LegacyAppInstallAdAppStore").enummodule
        end
      end
    end
  end
end
