# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/customer_client_link_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/resources/customer_client_link_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\nDgoogle/ads/googleads/v14/services/customer_client_link_service.proto\x12!google.ads.googleads.v14.services\x1a=google/ads/googleads/v14/resources/customer_client_link.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\"\xaa\x01\n\x1fMutateCustomerClientLinkRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12V\n\toperation\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v14.services.CustomerClientLinkOperationB\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xef\x01\n\x1b\x43ustomerClientLinkOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12H\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x36.google.ads.googleads.v14.resources.CustomerClientLinkH\x00\x12H\n\x06update\x18\x02 \x01(\x0b\x32\x36.google.ads.googleads.v14.resources.CustomerClientLinkH\x00\x42\x0b\n\toperation\"u\n MutateCustomerClientLinkResponse\x12Q\n\x06result\x18\x01 \x01(\x0b\x32\x41.google.ads.googleads.v14.services.MutateCustomerClientLinkResult\"i\n\x1eMutateCustomerClientLinkResult\x12G\n\rresource_name\x18\x01 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/CustomerClientLink2\xe6\x02\n\x19\x43ustomerClientLinkService\x12\x81\x02\n\x18MutateCustomerClientLink\x12\x42.google.ads.googleads.v14.services.MutateCustomerClientLinkRequest\x1a\x43.google.ads.googleads.v14.services.MutateCustomerClientLinkResponse\"\\\x82\xd3\xe4\x93\x02>\"9/v14/customers/{customer_id=*}/customerClientLinks:mutate:\x01*\xda\x41\x15\x63ustomer_id,operation\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8a\x02\n%com.google.ads.googleads.v14.servicesB\x1e\x43ustomerClientLinkServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.resources.CustomerClientLink", "google/ads/googleads/v14/resources/customer_client_link.proto"],
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
          MutateCustomerClientLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerClientLinkRequest").msgclass
          CustomerClientLinkOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CustomerClientLinkOperation").msgclass
          MutateCustomerClientLinkResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerClientLinkResponse").msgclass
          MutateCustomerClientLinkResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerClientLinkResult").msgclass
        end
      end
    end
  end
end
