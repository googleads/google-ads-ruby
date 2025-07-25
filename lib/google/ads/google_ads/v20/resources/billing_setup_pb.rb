# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/billing_setup.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/billing_setup_status_pb'
require 'google/ads/google_ads/v20/enums/time_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n6google/ads/googleads/v20/resources/billing_setup.proto\x12\"google.ads.googleads.v20.resources\x1a\x39google/ads/googleads/v20/enums/billing_setup_status.proto\x1a.google/ads/googleads/v20/enums/time_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xfa\x08\n\x0c\x42illingSetup\x12\x44\n\rresource_name\x18\x01 \x01(\tB-\xe0\x41\x05\xfa\x41\'\n%googleads.googleapis.com/BillingSetup\x12\x14\n\x02id\x18\x0f \x01(\x03\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12^\n\x06status\x18\x03 \x01(\x0e\x32I.google.ads.googleads.v20.enums.BillingSetupStatusEnum.BillingSetupStatusB\x03\xe0\x41\x03\x12O\n\x10payments_account\x18\x12 \x01(\tB0\xe0\x41\x05\xfa\x41*\n(googleads.googleapis.com/PaymentsAccountH\x03\x88\x01\x01\x12h\n\x15payments_account_info\x18\x0c \x01(\x0b\x32\x44.google.ads.googleads.v20.resources.BillingSetup.PaymentsAccountInfoB\x03\xe0\x41\x05\x12\x1e\n\x0fstart_date_time\x18\x10 \x01(\tB\x03\xe0\x41\x05H\x00\x12U\n\x0fstart_time_type\x18\n \x01(\x0e\x32\x35.google.ads.googleads.v20.enums.TimeTypeEnum.TimeTypeB\x03\xe0\x41\x05H\x00\x12\x1c\n\rend_date_time\x18\x11 \x01(\tB\x03\xe0\x41\x03H\x01\x12S\n\rend_time_type\x18\x0e \x01(\x0e\x32\x35.google.ads.googleads.v20.enums.TimeTypeEnum.TimeTypeB\x03\xe0\x41\x03H\x01\x1a\xec\x02\n\x13PaymentsAccountInfo\x12%\n\x13payments_account_id\x18\x06 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\'\n\x15payments_account_name\x18\x07 \x01(\tB\x03\xe0\x41\x05H\x01\x88\x01\x01\x12%\n\x13payments_profile_id\x18\x08 \x01(\tB\x03\xe0\x41\x05H\x02\x88\x01\x01\x12\'\n\x15payments_profile_name\x18\t \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12/\n\x1dsecondary_payments_profile_id\x18\n \x01(\tB\x03\xe0\x41\x03H\x04\x88\x01\x01\x42\x16\n\x14_payments_account_idB\x18\n\x16_payments_account_nameB\x16\n\x14_payments_profile_idB\x18\n\x16_payments_profile_nameB \n\x1e_secondary_payments_profile_id:d\xea\x41\x61\n%googleads.googleapis.com/BillingSetup\x12\x38\x63ustomers/{customer_id}/billingSetups/{billing_setup_id}B\x0c\n\nstart_timeB\n\n\x08\x65nd_timeB\x05\n\x03_idB\x13\n\x11_payments_accountB\x83\x02\n&com.google.ads.googleads.v20.resourcesB\x11\x42illingSetupProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
          BillingSetup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.BillingSetup").msgclass
          BillingSetup::PaymentsAccountInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.BillingSetup.PaymentsAccountInfo").msgclass
        end
      end
    end
  end
end
