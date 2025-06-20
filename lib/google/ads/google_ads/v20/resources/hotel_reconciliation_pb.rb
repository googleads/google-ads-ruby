# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/hotel_reconciliation.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/hotel_reconciliation_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n=google/ads/googleads/v20/resources/hotel_reconciliation.proto\x12\"google.ads.googleads.v20.resources\x1a@google/ads/googleads/v20/enums/hotel_reconciliation_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe3\x04\n\x13HotelReconciliation\x12K\n\rresource_name\x18\x01 \x01(\tB4\xe0\x41\x05\xfa\x41.\n,googleads.googleapis.com/HotelReconciliation\x12\x1d\n\rcommission_id\x18\x02 \x01(\tB\x06\xe0\x41\x02\xe0\x41\x03\x12\x15\n\x08order_id\x18\x03 \x01(\tB\x03\xe0\x41\x03\x12;\n\x08\x63\x61mpaign\x18\x0b \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12\x1c\n\x0fhotel_center_id\x18\x04 \x01(\x03\x42\x03\xe0\x41\x03\x12\x15\n\x08hotel_id\x18\x05 \x01(\tB\x03\xe0\x41\x03\x12\x1a\n\rcheck_in_date\x18\x06 \x01(\tB\x03\xe0\x41\x03\x12\x1b\n\x0e\x63heck_out_date\x18\x07 \x01(\tB\x03\xe0\x41\x03\x12\'\n\x17reconciled_value_micros\x18\x08 \x01(\x03\x42\x06\xe0\x41\x02\xe0\x41\x03\x12\x13\n\x06\x62illed\x18\t \x01(\x08\x42\x03\xe0\x41\x03\x12o\n\x06status\x18\n \x01(\x0e\x32W.google.ads.googleads.v20.enums.HotelReconciliationStatusEnum.HotelReconciliationStatusB\x06\xe0\x41\x02\xe0\x41\x03:o\xea\x41l\n,googleads.googleapis.com/HotelReconciliation\x12<customers/{customer_id}/hotelReconciliations/{commission_id}B\x8a\x02\n&com.google.ads.googleads.v20.resourcesB\x18HotelReconciliationProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
      module V20
        module Resources
          HotelReconciliation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.HotelReconciliation").msgclass
        end
      end
    end
  end
end
