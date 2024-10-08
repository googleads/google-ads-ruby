# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/services/account_link_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/resources/account_link_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n<google/ads/googleads/v17/services/account_link_service.proto\x12!google.ads.googleads.v17.services\x1a\x35google/ads/googleads/v17/resources/account_link.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\x80\x01\n\x18\x43reateAccountLinkRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12J\n\x0c\x61\x63\x63ount_link\x18\x02 \x01(\x0b\x32/.google.ads.googleads.v17.resources.AccountLinkB\x03\xe0\x41\x02\"]\n\x19\x43reateAccountLinkResponse\x12@\n\rresource_name\x18\x01 \x01(\tB)\xfa\x41&\n$googleads.googleapis.com/AccountLink\"\xb5\x01\n\x18MutateAccountLinkRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12O\n\toperation\x18\x02 \x01(\x0b\x32\x37.google.ads.googleads.v17.services.AccountLinkOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\"\xd4\x01\n\x14\x41\x63\x63ountLinkOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12\x41\n\x06update\x18\x02 \x01(\x0b\x32/.google.ads.googleads.v17.resources.AccountLinkH\x00\x12;\n\x06remove\x18\x03 \x01(\tB)\xfa\x41&\n$googleads.googleapis.com/AccountLinkH\x00\x42\x0b\n\toperation\"\x9a\x01\n\x19MutateAccountLinkResponse\x12J\n\x06result\x18\x01 \x01(\x0b\x32:.google.ads.googleads.v17.services.MutateAccountLinkResult\x12\x31\n\x15partial_failure_error\x18\x02 \x01(\x0b\x32\x12.google.rpc.Status\"[\n\x17MutateAccountLinkResult\x12@\n\rresource_name\x18\x01 \x01(\tB)\xfa\x41&\n$googleads.googleapis.com/AccountLink2\xae\x04\n\x12\x41\x63\x63ountLinkService\x12\xe8\x01\n\x11\x43reateAccountLink\x12;.google.ads.googleads.v17.services.CreateAccountLinkRequest\x1a<.google.ads.googleads.v17.services.CreateAccountLinkResponse\"X\xda\x41\x18\x63ustomer_id,account_link\x82\xd3\xe4\x93\x02\x37\"2/v17/customers/{customer_id=*}/accountLinks:create:\x01*\x12\xe5\x01\n\x11MutateAccountLink\x12;.google.ads.googleads.v17.services.MutateAccountLinkRequest\x1a<.google.ads.googleads.v17.services.MutateAccountLinkResponse\"U\xda\x41\x15\x63ustomer_id,operation\x82\xd3\xe4\x93\x02\x37\"2/v17/customers/{customer_id=*}/accountLinks:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x83\x02\n%com.google.ads.googleads.v17.servicesB\x17\x41\x63\x63ountLinkServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v17/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V17.Services\xca\x02!Google\\Ads\\GoogleAds\\V17\\Services\xea\x02%Google::Ads::GoogleAds::V17::Servicesb\x06proto3"

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
    ["google.ads.googleads.v17.resources.AccountLink", "google/ads/googleads/v17/resources/account_link.proto"],
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
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
      module V17
        module Services
          CreateAccountLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.CreateAccountLinkRequest").msgclass
          CreateAccountLinkResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.CreateAccountLinkResponse").msgclass
          MutateAccountLinkRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.MutateAccountLinkRequest").msgclass
          AccountLinkOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.AccountLinkOperation").msgclass
          MutateAccountLinkResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.MutateAccountLinkResponse").msgclass
          MutateAccountLinkResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.services.MutateAccountLinkResult").msgclass
        end
      end
    end
  end
end