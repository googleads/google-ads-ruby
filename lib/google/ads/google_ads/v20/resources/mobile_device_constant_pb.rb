# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/mobile_device_constant.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/mobile_device_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n?google/ads/googleads/v20/resources/mobile_device_constant.proto\x12\"google.ads.googleads.v20.resources\x1a\x37google/ads/googleads/v20/enums/mobile_device_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd4\x03\n\x14MobileDeviceConstant\x12L\n\rresource_name\x18\x01 \x01(\tB5\xe0\x41\x03\xfa\x41/\n-googleads.googleapis.com/MobileDeviceConstant\x12\x14\n\x02id\x18\x07 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x16\n\x04name\x18\x08 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12#\n\x11manufacturer_name\x18\t \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\'\n\x15operating_system_name\x18\n \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12X\n\x04type\x18\x06 \x01(\x0e\x32\x45.google.ads.googleads.v20.enums.MobileDeviceTypeEnum.MobileDeviceTypeB\x03\xe0\x41\x03:X\xea\x41U\n-googleads.googleapis.com/MobileDeviceConstant\x12$mobileDeviceConstants/{criterion_id}B\x05\n\x03_idB\x07\n\x05_nameB\x14\n\x12_manufacturer_nameB\x18\n\x16_operating_system_nameB\x8b\x02\n&com.google.ads.googleads.v20.resourcesB\x19MobileDeviceConstantProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
        module Resources
          MobileDeviceConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.MobileDeviceConstant").msgclass
        end
      end
    end
  end
end
