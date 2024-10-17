# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/ad_group_extension_setting.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/extension_setting_device_pb'
require 'google/ads/google_ads/v18/enums/extension_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nCgoogle/ads/googleads/v18/resources/ad_group_extension_setting.proto\x12\"google.ads.googleads.v18.resources\x1a=google/ads/googleads/v18/enums/extension_setting_device.proto\x1a\x33google/ads/googleads/v18/enums/extension_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd2\x04\n\x17\x41\x64GroupExtensionSetting\x12O\n\rresource_name\x18\x01 \x01(\tB8\xe0\x41\x05\xfa\x41\x32\n0googleads.googleapis.com/AdGroupExtensionSetting\x12\\\n\x0e\x65xtension_type\x18\x02 \x01(\x0e\x32?.google.ads.googleads.v18.enums.ExtensionTypeEnum.ExtensionTypeB\x03\xe0\x41\x05\x12?\n\x08\x61\x64_group\x18\x06 \x01(\tB(\xe0\x41\x05\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x00\x88\x01\x01\x12M\n\x14\x65xtension_feed_items\x18\x07 \x03(\tB/\xfa\x41,\n*googleads.googleapis.com/ExtensionFeedItem\x12\x61\n\x06\x64\x65vice\x18\x05 \x01(\x0e\x32Q.google.ads.googleads.v18.enums.ExtensionSettingDeviceEnum.ExtensionSettingDevice:\x87\x01\xea\x41\x83\x01\n0googleads.googleapis.com/AdGroupExtensionSetting\x12Ocustomers/{customer_id}/adGroupExtensionSettings/{ad_group_id}~{extension_type}B\x0b\n\t_ad_groupB\x8e\x02\n&com.google.ads.googleads.v18.resourcesB\x1c\x41\x64GroupExtensionSettingProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
        module Resources
          AdGroupExtensionSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.AdGroupExtensionSetting").msgclass
        end
      end
    end
  end
end
