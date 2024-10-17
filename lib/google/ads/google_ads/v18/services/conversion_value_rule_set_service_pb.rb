# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/conversion_value_rule_set_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/response_content_type_pb'
require 'google/ads/google_ads/v18/resources/conversion_value_rule_set_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nIgoogle/ads/googleads/v18/services/conversion_value_rule_set_service.proto\x12!google.ads.googleads.v18.services\x1a:google/ads/googleads/v18/enums/response_content_type.proto\x1a\x42google/ads/googleads/v18/resources/conversion_value_rule_set.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xb9\x02\n$MutateConversionValueRuleSetsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12[\n\noperations\x18\x02 \x03(\x0b\x32\x42.google.ads.googleads.v18.services.ConversionValueRuleSetOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x05 \x01(\x08\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\x12j\n\x15response_content_type\x18\x04 \x01(\x0e\x32K.google.ads.googleads.v18.enums.ResponseContentTypeEnum.ResponseContentType\"\xc3\x02\n\x1f\x43onversionValueRuleSetOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12L\n\x06\x63reate\x18\x01 \x01(\x0b\x32:.google.ads.googleads.v18.resources.ConversionValueRuleSetH\x00\x12L\n\x06update\x18\x02 \x01(\x0b\x32:.google.ads.googleads.v18.resources.ConversionValueRuleSetH\x00\x12\x46\n\x06remove\x18\x03 \x01(\tB4\xfa\x41\x31\n/googleads.googleapis.com/ConversionValueRuleSetH\x00\x42\x0b\n\toperation\"\xb2\x01\n%MutateConversionValueRuleSetsResponse\x12V\n\x07results\x18\x01 \x03(\x0b\x32\x45.google.ads.googleads.v18.services.MutateConversionValueRuleSetResult\x12\x31\n\x15partial_failure_error\x18\x02 \x01(\x0b\x32\x12.google.rpc.Status\"\xd0\x01\n\"MutateConversionValueRuleSetResult\x12K\n\rresource_name\x18\x01 \x01(\tB4\xfa\x41\x31\n/googleads.googleapis.com/ConversionValueRuleSet\x12]\n\x19\x63onversion_value_rule_set\x18\x02 \x01(\x0b\x32:.google.ads.googleads.v18.resources.ConversionValueRuleSet2\xfe\x02\n\x1d\x43onversionValueRuleSetService\x12\x95\x02\n\x1dMutateConversionValueRuleSets\x12G.google.ads.googleads.v18.services.MutateConversionValueRuleSetsRequest\x1aH.google.ads.googleads.v18.services.MutateConversionValueRuleSetsResponse\"a\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02\x42\"=/v18/customers/{customer_id=*}/conversionValueRuleSets:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8e\x02\n%com.google.ads.googleads.v18.servicesB\"ConversionValueRuleSetServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.ConversionValueRuleSet", "google/ads/googleads/v18/resources/conversion_value_rule_set.proto"],
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
      module V18
        module Services
          MutateConversionValueRuleSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateConversionValueRuleSetsRequest").msgclass
          ConversionValueRuleSetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ConversionValueRuleSetOperation").msgclass
          MutateConversionValueRuleSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateConversionValueRuleSetsResponse").msgclass
          MutateConversionValueRuleSetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateConversionValueRuleSetResult").msgclass
        end
      end
    end
  end
end
