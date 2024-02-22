# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/customizer_attribute.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/enums/customizer_attribute_status_pb'
require 'google/ads/google_ads/v16/enums/customizer_attribute_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n=google/ads/googleads/v16/resources/customizer_attribute.proto\x12\"google.ads.googleads.v16.resources\x1a@google/ads/googleads/v16/enums/customizer_attribute_status.proto\x1a>google/ads/googleads/v16/enums/customizer_attribute_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xda\x03\n\x13\x43ustomizerAttribute\x12K\n\rresource_name\x18\x01 \x01(\tB4\xe0\x41\x05\xfa\x41.\n,googleads.googleapis.com/CustomizerAttribute\x12\x0f\n\x02id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x14\n\x04name\x18\x03 \x01(\tB\x06\xe0\x41\x02\xe0\x41\x05\x12\x66\n\x04type\x18\x04 \x01(\x0e\x32S.google.ads.googleads.v16.enums.CustomizerAttributeTypeEnum.CustomizerAttributeTypeB\x03\xe0\x41\x05\x12l\n\x06status\x18\x05 \x01(\x0e\x32W.google.ads.googleads.v16.enums.CustomizerAttributeStatusEnum.CustomizerAttributeStatusB\x03\xe0\x41\x03:y\xea\x41v\n,googleads.googleapis.com/CustomizerAttribute\x12\x46\x63ustomers/{customer_id}/customizerAttributes/{customizer_attribute_id}B\x8a\x02\n&com.google.ads.googleads.v16.resourcesB\x18\x43ustomizerAttributeProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
      module V16
        module Resources
          CustomizerAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.CustomizerAttribute").msgclass
        end
      end
    end
  end
end
