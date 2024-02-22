# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/services/customer_user_access_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/resources/customer_user_access_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\nDgoogle/ads/googleads/v16/services/customer_user_access_service.proto\x12!google.ads.googleads.v16.services\x1a=google/ads/googleads/v16/resources/customer_user_access.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\"\x93\x01\n\x1fMutateCustomerUserAccessRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12V\n\toperation\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v16.services.CustomerUserAccessOperationB\x03\xe0\x41\x02\"\xe9\x01\n\x1b\x43ustomerUserAccessOperation\x12/\n\x0bupdate_mask\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12H\n\x06update\x18\x01 \x01(\x0b\x32\x36.google.ads.googleads.v16.resources.CustomerUserAccessH\x00\x12\x42\n\x06remove\x18\x02 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/CustomerUserAccessH\x00\x42\x0b\n\toperation\"u\n MutateCustomerUserAccessResponse\x12Q\n\x06result\x18\x01 \x01(\x0b\x32\x41.google.ads.googleads.v16.services.MutateCustomerUserAccessResult\"i\n\x1eMutateCustomerUserAccessResult\x12G\n\rresource_name\x18\x01 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/CustomerUserAccess2\xe7\x02\n\x19\x43ustomerUserAccessService\x12\x82\x02\n\x18MutateCustomerUserAccess\x12\x42.google.ads.googleads.v16.services.MutateCustomerUserAccessRequest\x1a\x43.google.ads.googleads.v16.services.MutateCustomerUserAccessResponse\"]\xda\x41\x15\x63ustomer_id,operation\x82\xd3\xe4\x93\x02?\":/v16/customers/{customer_id=*}/customerUserAccesses:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8a\x02\n%com.google.ads.googleads.v16.servicesB\x1e\x43ustomerUserAccessServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v16/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V16.Services\xca\x02!Google\\Ads\\GoogleAds\\V16\\Services\xea\x02%Google::Ads::GoogleAds::V16::Servicesb\x06proto3"

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
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v16.resources.CustomerUserAccess", "google/ads/googleads/v16/resources/customer_user_access.proto"],
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
        module Services
          MutateCustomerUserAccessRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.MutateCustomerUserAccessRequest").msgclass
          CustomerUserAccessOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.CustomerUserAccessOperation").msgclass
          MutateCustomerUserAccessResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.MutateCustomerUserAccessResponse").msgclass
          MutateCustomerUserAccessResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.MutateCustomerUserAccessResult").msgclass
        end
      end
    end
  end
end
