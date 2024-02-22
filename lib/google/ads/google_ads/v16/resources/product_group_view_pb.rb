# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/product_group_view.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n;google/ads/googleads/v16/resources/product_group_view.proto\x12\"google.ads.googleads.v16.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd3\x01\n\x10ProductGroupView\x12H\n\rresource_name\x18\x01 \x01(\tB1\xe0\x41\x03\xfa\x41+\n)googleads.googleapis.com/ProductGroupView:u\xea\x41r\n)googleads.googleapis.com/ProductGroupView\x12\x45\x63ustomers/{customer_id}/productGroupViews/{adgroup_id}~{criterion_id}B\x87\x02\n&com.google.ads.googleads.v16.resourcesB\x15ProductGroupViewProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
          ProductGroupView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.ProductGroupView").msgclass
        end
      end
    end
  end
end
