# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/payments_account.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n9google/ads/googleads/v16/resources/payments_account.proto\x12\"google.ads.googleads.v16.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xdb\x04\n\x0fPaymentsAccount\x12G\n\rresource_name\x18\x01 \x01(\tB0\xe0\x41\x03\xfa\x41*\n(googleads.googleapis.com/PaymentsAccount\x12%\n\x13payments_account_id\x18\x08 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x16\n\x04name\x18\t \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1f\n\rcurrency_code\x18\n \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12%\n\x13payments_profile_id\x18\x0b \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12/\n\x1dsecondary_payments_profile_id\x18\x0c \x01(\tB\x03\xe0\x41\x03H\x04\x88\x01\x01\x12O\n\x17paying_manager_customer\x18\r \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CustomerH\x05\x88\x01\x01:m\xea\x41j\n(googleads.googleapis.com/PaymentsAccount\x12>customers/{customer_id}/paymentsAccounts/{payments_account_id}B\x16\n\x14_payments_account_idB\x07\n\x05_nameB\x10\n\x0e_currency_codeB\x16\n\x14_payments_profile_idB \n\x1e_secondary_payments_profile_idB\x1a\n\x18_paying_manager_customerB\x86\x02\n&com.google.ads.googleads.v16.resourcesB\x14PaymentsAccountProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
          PaymentsAccount = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.PaymentsAccount").msgclass
        end
      end
    end
  end
end
