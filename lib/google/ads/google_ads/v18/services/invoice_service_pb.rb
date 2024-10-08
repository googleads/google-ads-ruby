# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/invoice_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/month_of_year_pb'
require 'google/ads/google_ads/v18/resources/invoice_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'


descriptor_data = "\n7google/ads/googleads/v18/services/invoice_service.proto\x12!google.ads.googleads.v18.services\x1a\x32google/ads/googleads/v18/enums/month_of_year.proto\x1a\x30google/ads/googleads/v18/resources/invoice.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\"\xbb\x01\n\x13ListInvoicesRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\x1a\n\rbilling_setup\x18\x02 \x01(\tB\x03\xe0\x41\x02\x12\x17\n\nissue_year\x18\x03 \x01(\tB\x03\xe0\x41\x02\x12U\n\x0bissue_month\x18\x04 \x01(\x0e\x32;.google.ads.googleads.v18.enums.MonthOfYearEnum.MonthOfYearB\x03\xe0\x41\x02\"U\n\x14ListInvoicesResponse\x12=\n\x08invoices\x18\x01 \x03(\x0b\x32+.google.ads.googleads.v18.resources.Invoice2\xbd\x02\n\x0eInvoiceService\x12\xe3\x01\n\x0cListInvoices\x12\x36.google.ads.googleads.v18.services.ListInvoicesRequest\x1a\x37.google.ads.googleads.v18.services.ListInvoicesResponse\"b\xda\x41\x30\x63ustomer_id,billing_setup,issue_year,issue_month\x82\xd3\xe4\x93\x02)\x12\'/v18/customers/{customer_id=*}/invoices\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\xff\x01\n%com.google.ads.googleads.v18.servicesB\x13InvoiceServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.Invoice", "google/ads/googleads/v18/resources/invoice.proto"],
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
        module Services
          ListInvoicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ListInvoicesRequest").msgclass
          ListInvoicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ListInvoicesResponse").msgclass
        end
      end
    end
  end
end