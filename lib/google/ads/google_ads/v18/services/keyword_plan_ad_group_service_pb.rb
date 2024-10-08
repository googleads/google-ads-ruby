# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/keyword_plan_ad_group_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/resources/keyword_plan_ad_group_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nEgoogle/ads/googleads/v18/services/keyword_plan_ad_group_service.proto\x12!google.ads.googleads.v18.services\x1a>google/ads/googleads/v18/resources/keyword_plan_ad_group.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xc5\x01\n MutateKeywordPlanAdGroupsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12W\n\noperations\x18\x02 \x03(\x0b\x32>.google.ads.googleads.v18.services.KeywordPlanAdGroupOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\"\xb3\x02\n\x1bKeywordPlanAdGroupOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12H\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x36.google.ads.googleads.v18.resources.KeywordPlanAdGroupH\x00\x12H\n\x06update\x18\x02 \x01(\x0b\x32\x36.google.ads.googleads.v18.resources.KeywordPlanAdGroupH\x00\x12\x42\n\x06remove\x18\x03 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/KeywordPlanAdGroupH\x00\x42\x0b\n\toperation\"\xaa\x01\n!MutateKeywordPlanAdGroupsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12R\n\x07results\x18\x02 \x03(\x0b\x32\x41.google.ads.googleads.v18.services.MutateKeywordPlanAdGroupResult\"i\n\x1eMutateKeywordPlanAdGroupResult\x12G\n\rresource_name\x18\x01 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/KeywordPlanAdGroup2\xea\x02\n\x19KeywordPlanAdGroupService\x12\x85\x02\n\x19MutateKeywordPlanAdGroups\x12\x43.google.ads.googleads.v18.services.MutateKeywordPlanAdGroupsRequest\x1a\x44.google.ads.googleads.v18.services.MutateKeywordPlanAdGroupsResponse\"]\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02>\"9/v18/customers/{customer_id=*}/keywordPlanAdGroups:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8a\x02\n%com.google.ads.googleads.v18.servicesB\x1eKeywordPlanAdGroupServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.KeywordPlanAdGroup", "google/ads/googleads/v18/resources/keyword_plan_ad_group.proto"],
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
          MutateKeywordPlanAdGroupsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateKeywordPlanAdGroupsRequest").msgclass
          KeywordPlanAdGroupOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.KeywordPlanAdGroupOperation").msgclass
          MutateKeywordPlanAdGroupsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateKeywordPlanAdGroupsResponse").msgclass
          MutateKeywordPlanAdGroupResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateKeywordPlanAdGroupResult").msgclass
        end
      end
    end
  end
end
