# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v19/services/ad_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v19/common/policy_pb'
require 'google/ads/google_ads/v19/enums/response_content_type_pb'
require 'google/ads/google_ads/v19/resources/ad_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n2google/ads/googleads/v19/services/ad_service.proto\x12!google.ads.googleads.v19.services\x1a,google/ads/googleads/v19/common/policy.proto\x1a:google/ads/googleads/v19/enums/response_content_type.proto\x1a+google/ads/googleads/v19/resources/ad.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\x91\x02\n\x10MutateAdsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12G\n\noperations\x18\x02 \x03(\x0b\x32..google.ads.googleads.v19.services.AdOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v19.enums.ResponseContentTypeEnum.ResponseContentType\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xe6\x01\n\x0b\x41\x64Operation\x12/\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12_\n\x1bpolicy_validation_parameter\x18\x03 \x01(\x0b\x32:.google.ads.googleads.v19.common.PolicyValidationParameter\x12\x38\n\x06update\x18\x01 \x01(\x0b\x32&.google.ads.googleads.v19.resources.AdH\x00\x42\x0b\n\toperation\"\x8a\x01\n\x11MutateAdsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12\x42\n\x07results\x18\x02 \x03(\x0b\x32\x31.google.ads.googleads.v19.services.MutateAdResult\"}\n\x0eMutateAdResult\x12\x37\n\rresource_name\x18\x01 \x01(\tB \xfa\x41\x1d\n\x1bgoogleads.googleapis.com/Ad\x12\x32\n\x02\x61\x64\x18\x02 \x01(\x0b\x32&.google.ads.googleads.v19.resources.Ad2\x9a\x02\n\tAdService\x12\xc5\x01\n\tMutateAds\x12\x33.google.ads.googleads.v19.services.MutateAdsRequest\x1a\x34.google.ads.googleads.v19.services.MutateAdsResponse\"M\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02.\")/v19/customers/{customer_id=*}/ads:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\xfa\x01\n%com.google.ads.googleads.v19.servicesB\x0e\x41\x64ServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v19/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V19.Services\xca\x02!Google\\Ads\\GoogleAds\\V19\\Services\xea\x02%Google::Ads::GoogleAds::V19::Servicesb\x06proto3"

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
    ["google.ads.googleads.v19.common.PolicyValidationParameter", "google/ads/googleads/v19/common/policy.proto"],
    ["google.ads.googleads.v19.resources.Ad", "google/ads/googleads/v19/resources/ad.proto"],
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
      module V19
        module Services
          MutateAdsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.MutateAdsRequest").msgclass
          AdOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.AdOperation").msgclass
          MutateAdsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.MutateAdsResponse").msgclass
          MutateAdResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.MutateAdResult").msgclass
        end
      end
    end
  end
end
