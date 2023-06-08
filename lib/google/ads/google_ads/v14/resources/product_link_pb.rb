# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/product_link.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/linked_product_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n5google/ads/googleads/v14/resources/product_link.proto\x12\"google.ads.googleads.v14.resources\x1a\x38google/ads/googleads/v14/enums/linked_product_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x86\x04\n\x0bProductLink\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x05\xfa\x41&\n$googleads.googleapis.com/ProductLink\x12!\n\x0fproduct_link_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12Z\n\x04type\x18\x03 \x01(\x0e\x32G.google.ads.googleads.v14.enums.LinkedProductTypeEnum.LinkedProductTypeB\x03\xe0\x41\x03\x12V\n\x0c\x64\x61ta_partner\x18\x04 \x01(\x0b\x32\x39.google.ads.googleads.v14.resources.DataPartnerIdentifierB\x03\xe0\x41\x05H\x00\x12R\n\ngoogle_ads\x18\x05 \x01(\x0b\x32\x37.google.ads.googleads.v14.resources.GoogleAdsIdentifierB\x03\xe0\x41\x05H\x00:a\xea\x41^\n$googleads.googleapis.com/ProductLink\x12\x36\x63ustomers/{customer_id}/productLinks/{product_link_id}B\x10\n\x0elinked_productB\x12\n\x10_product_link_id\"N\n\x15\x44\x61taPartnerIdentifier\x12!\n\x0f\x64\x61ta_partner_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x42\x12\n\x10_data_partner_id\"d\n\x13GoogleAdsIdentifier\x12@\n\x08\x63ustomer\x18\x01 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/CustomerH\x00\x88\x01\x01\x42\x0b\n\t_customerB\x82\x02\n&com.google.ads.googleads.v14.resourcesB\x10ProductLinkProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
        module Resources
          ProductLink = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.ProductLink").msgclass
          DataPartnerIdentifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.DataPartnerIdentifier").msgclass
          GoogleAdsIdentifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.GoogleAdsIdentifier").msgclass
        end
      end
    end
  end
end
