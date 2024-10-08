# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/services/payments_account_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/resources/payments_account_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'


descriptor_data = "\n@google/ads/googleads/v16/services/payments_account_service.proto\x12!google.ads.googleads.v16.services\x1a\x39google/ads/googleads/v16/resources/payments_account.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\"7\n\x1bListPaymentsAccountsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\"n\n\x1cListPaymentsAccountsResponse\x12N\n\x11payments_accounts\x18\x01 \x03(\x0b\x32\x33.google.ads.googleads.v16.resources.PaymentsAccount2\xc0\x02\n\x16PaymentsAccountService\x12\xde\x01\n\x14ListPaymentsAccounts\x12>.google.ads.googleads.v16.services.ListPaymentsAccountsRequest\x1a?.google.ads.googleads.v16.services.ListPaymentsAccountsResponse\"E\xda\x41\x0b\x63ustomer_id\x82\xd3\xe4\x93\x02\x31\x12//v16/customers/{customer_id=*}/paymentsAccounts\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x87\x02\n%com.google.ads.googleads.v16.servicesB\x1bPaymentsAccountServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v16/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V16.Services\xca\x02!Google\\Ads\\GoogleAds\\V16\\Services\xea\x02%Google::Ads::GoogleAds::V16::Servicesb\x06proto3"

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
    ["google.ads.googleads.v16.resources.PaymentsAccount", "google/ads/googleads/v16/resources/payments_account.proto"],
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
          ListPaymentsAccountsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.ListPaymentsAccountsRequest").msgclass
          ListPaymentsAccountsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.services.ListPaymentsAccountsResponse").msgclass
        end
      end
    end
  end
end