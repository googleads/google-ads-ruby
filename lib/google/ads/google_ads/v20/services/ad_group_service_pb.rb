# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/services/ad_group_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/response_content_type_pb'
require 'google/ads/google_ads/v20/resources/ad_group_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n8google/ads/googleads/v20/services/ad_group_service.proto\x12!google.ads.googleads.v20.services\x1a:google/ads/googleads/v20/enums/response_content_type.proto\x1a\x31google/ads/googleads/v20/resources/ad_group.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\x9b\x02\n\x15MutateAdGroupsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12L\n\noperations\x18\x02 \x03(\x0b\x32\x33.google.ads.googleads.v20.services.AdGroupOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v20.enums.ResponseContentTypeEnum.ResponseContentType\"\x87\x02\n\x10\x41\x64GroupOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12=\n\x06\x63reate\x18\x01 \x01(\x0b\x32+.google.ads.googleads.v20.resources.AdGroupH\x00\x12=\n\x06update\x18\x02 \x01(\x0b\x32+.google.ads.googleads.v20.resources.AdGroupH\x00\x12\x37\n\x06remove\x18\x03 \x01(\tB%\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x00\x42\x0b\n\toperation\"\x94\x01\n\x16MutateAdGroupsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12G\n\x07results\x18\x02 \x03(\x0b\x32\x36.google.ads.googleads.v20.services.MutateAdGroupResult\"\x92\x01\n\x13MutateAdGroupResult\x12<\n\rresource_name\x18\x01 \x01(\tB%\xfa\x41\"\n googleads.googleapis.com/AdGroup\x12=\n\x08\x61\x64_group\x18\x02 \x01(\x0b\x32+.google.ads.googleads.v20.resources.AdGroup2\xb3\x02\n\x0e\x41\x64GroupService\x12\xd9\x01\n\x0eMutateAdGroups\x12\x38.google.ads.googleads.v20.services.MutateAdGroupsRequest\x1a\x39.google.ads.googleads.v20.services.MutateAdGroupsResponse\"R\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02\x33\"./v20/customers/{customer_id=*}/adGroups:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\xff\x01\n%com.google.ads.googleads.v20.servicesB\x13\x41\x64GroupServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v20/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V20.Services\xca\x02!Google\\Ads\\GoogleAds\\V20\\Services\xea\x02%Google::Ads::GoogleAds::V20::Servicesb\x06proto3"

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
    ["google.ads.googleads.v20.resources.AdGroup", "google/ads/googleads/v20/resources/ad_group.proto"],
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
      module V20
        module Services
          MutateAdGroupsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateAdGroupsRequest").msgclass
          AdGroupOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.AdGroupOperation").msgclass
          MutateAdGroupsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateAdGroupsResponse").msgclass
          MutateAdGroupResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateAdGroupResult").msgclass
        end
      end
    end
  end
end
