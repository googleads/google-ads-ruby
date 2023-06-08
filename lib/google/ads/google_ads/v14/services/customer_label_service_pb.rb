# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/customer_label_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/resources/customer_label_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n>google/ads/googleads/v14/services/customer_label_service.proto\x12!google.ads.googleads.v14.services\x1a\x37google/ads/googleads/v14/resources/customer_label.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x17google/rpc/status.proto\"\xbb\x01\n\x1bMutateCustomerLabelsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12R\n\noperations\x18\x02 \x03(\x0b\x32\x39.google.ads.googleads.v14.services.CustomerLabelOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\"\xa9\x01\n\x16\x43ustomerLabelOperation\x12\x43\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x31.google.ads.googleads.v14.resources.CustomerLabelH\x00\x12=\n\x06remove\x18\x02 \x01(\tB+\xfa\x41(\n&googleads.googleapis.com/CustomerLabelH\x00\x42\x0b\n\toperation\"\xa0\x01\n\x1cMutateCustomerLabelsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12M\n\x07results\x18\x02 \x03(\x0b\x32<.google.ads.googleads.v14.services.MutateCustomerLabelResult\"_\n\x19MutateCustomerLabelResult\x12\x42\n\rresource_name\x18\x01 \x01(\tB+\xfa\x41(\n&googleads.googleapis.com/CustomerLabel2\xd1\x02\n\x14\x43ustomerLabelService\x12\xf1\x01\n\x14MutateCustomerLabels\x12>.google.ads.googleads.v14.services.MutateCustomerLabelsRequest\x1a?.google.ads.googleads.v14.services.MutateCustomerLabelsResponse\"X\x82\xd3\xe4\x93\x02\x39\"4/v14/customers/{customer_id=*}/customerLabels:mutate:\x01*\xda\x41\x16\x63ustomer_id,operations\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x85\x02\n%com.google.ads.googleads.v14.servicesB\x19\x43ustomerLabelServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.resources.CustomerLabel", "google/ads/googleads/v14/resources/customer_label.proto"],
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
      module V14
        module Services
          MutateCustomerLabelsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerLabelsRequest").msgclass
          CustomerLabelOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CustomerLabelOperation").msgclass
          MutateCustomerLabelsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerLabelsResponse").msgclass
          MutateCustomerLabelResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomerLabelResult").msgclass
        end
      end
    end
  end
end
