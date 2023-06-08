# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/custom_audience_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/resources/custom_audience_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\n?google/ads/googleads/v14/services/custom_audience_service.proto\x12!google.ads.googleads.v14.services\x1a\x38google/ads/googleads/v14/resources/custom_audience.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\"\xa4\x01\n\x1cMutateCustomAudiencesRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12S\n\noperations\x18\x02 \x03(\x0b\x32:.google.ads.googleads.v14.services.CustomAudienceOperationB\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xa3\x02\n\x17\x43ustomAudienceOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12\x44\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x32.google.ads.googleads.v14.resources.CustomAudienceH\x00\x12\x44\n\x06update\x18\x02 \x01(\x0b\x32\x32.google.ads.googleads.v14.resources.CustomAudienceH\x00\x12>\n\x06remove\x18\x03 \x01(\tB,\xfa\x41)\n\'googleads.googleapis.com/CustomAudienceH\x00\x42\x0b\n\toperation\"o\n\x1dMutateCustomAudiencesResponse\x12N\n\x07results\x18\x01 \x03(\x0b\x32=.google.ads.googleads.v14.services.MutateCustomAudienceResult\"a\n\x1aMutateCustomAudienceResult\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xfa\x41)\n\'googleads.googleapis.com/CustomAudience2\xd6\x02\n\x15\x43ustomAudienceService\x12\xf5\x01\n\x15MutateCustomAudiences\x12?.google.ads.googleads.v14.services.MutateCustomAudiencesRequest\x1a@.google.ads.googleads.v14.services.MutateCustomAudiencesResponse\"Y\x82\xd3\xe4\x93\x02:\"5/v14/customers/{customer_id=*}/customAudiences:mutate:\x01*\xda\x41\x16\x63ustomer_id,operations\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x86\x02\n%com.google.ads.googleads.v14.servicesB\x1a\x43ustomAudienceServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v14.resources.CustomAudience", "google/ads/googleads/v14/resources/custom_audience.proto"],
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
          MutateCustomAudiencesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomAudiencesRequest").msgclass
          CustomAudienceOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CustomAudienceOperation").msgclass
          MutateCustomAudiencesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomAudiencesResponse").msgclass
          MutateCustomAudienceResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateCustomAudienceResult").msgclass
        end
      end
    end
  end
end
