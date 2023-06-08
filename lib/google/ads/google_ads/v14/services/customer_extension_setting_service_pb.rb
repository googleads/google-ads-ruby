# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/customer_extension_setting_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/response_content_type_pb'
require 'google/ads/google_ads/v14/resources/customer_extension_setting_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nJgoogle/ads/googleads/v14/services/customer_extension_setting_service.proto\x12!google.ads.googleads.v14.services\x1a:google/ads/googleads/v14/enums/response_content_type.proto\x1a\x43google/ads/googleads/v14/resources/customer_extension_setting.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xbd\x02\n&MutateCustomerExtensionSettingsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12]\n\noperations\x18\x02 \x03(\x0b\x32\x44.google.ads.googleads.v14.services.CustomerExtensionSettingOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v14.enums.ResponseContentTypeEnum.ResponseContentType\"\xcb\x02\n!CustomerExtensionSettingOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12N\n\x06\x63reate\x18\x01 \x01(\x0b\x32<.google.ads.googleads.v14.resources.CustomerExtensionSettingH\x00\x12N\n\x06update\x18\x02 \x01(\x0b\x32<.google.ads.googleads.v14.resources.CustomerExtensionSettingH\x00\x12H\n\x06remove\x18\x03 \x01(\tB6\xfa\x41\x33\n1googleads.googleapis.com/CustomerExtensionSettingH\x00\x42\x0b\n\toperation\"\xb6\x01\n\'MutateCustomerExtensionSettingsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12X\n\x07results\x18\x02 \x03(\x0b\x32G.google.ads.googleads.v14.services.MutateCustomerExtensionSettingResult\"\xd7\x01\n$MutateCustomerExtensionSettingResult\x12M\n\rresource_name\x18\x01 \x01(\tB6\xfa\x41\x33\n1googleads.googleapis.com/CustomerExtensionSetting\x12`\n\x1a\x63ustomer_extension_setting\x18\x02 \x01(\x0b\x32<.google.ads.googleads.v14.resources.CustomerExtensionSetting2\x88\x03\n\x1f\x43ustomerExtensionSettingService\x12\x9d\x02\n\x1fMutateCustomerExtensionSettings\x12I.google.ads.googleads.v14.services.MutateCustomerExtensionSettingsRequest\x1aJ.google.ads.googleads.v14.services.MutateCustomerExtensionSettingsResponse\"c\x82\xd3\xe4\x93\x02\x44\"?/v14/customers/{customer_id=*}/customerExtensionSettings:mutate:\x01*\xda\x41\x16\x63ustomer_id,operations\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x90\x02\n%com.google.ads.googleads.v14.servicesB$CustomerExtensionSettingServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v14.resources.CustomerExtensionSetting", "google/ads/googleads/v14/resources/customer_extension_setting.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
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
        module Services
          MutateCustomerExtensionSettingsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerExtensionSettingsRequest").msgclass
          CustomerExtensionSettingOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CustomerExtensionSettingOperation").msgclass
          MutateCustomerExtensionSettingsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerExtensionSettingsResponse").msgclass
          MutateCustomerExtensionSettingResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerExtensionSettingResult").msgclass
        end
      end
    end
  end
end
