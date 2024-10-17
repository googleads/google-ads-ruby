# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/google_ads_field_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/resources/google_ads_field_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n@google/ads/googleads/v18/services/google_ads_field_service.proto\x12!google.ads.googleads.v18.services\x1a\x39google/ads/googleads/v18/resources/google_ads_field.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"b\n\x18GetGoogleAdsFieldRequest\x12\x46\n\rresource_name\x18\x01 \x01(\tB/\xe0\x41\x02\xfa\x41)\n\'googleads.googleapis.com/GoogleAdsField\"Y\n\x1cSearchGoogleAdsFieldsRequest\x12\x12\n\x05query\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\x12\n\npage_token\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\"\x9a\x01\n\x1dSearchGoogleAdsFieldsResponse\x12\x43\n\x07results\x18\x01 \x03(\x0b\x32\x32.google.ads.googleads.v18.resources.GoogleAdsField\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\x12\x1b\n\x13total_results_count\x18\x03 \x01(\x03\x32\xf2\x03\n\x15GoogleAdsFieldService\x12\xc4\x01\n\x11GetGoogleAdsField\x12;.google.ads.googleads.v18.services.GetGoogleAdsFieldRequest\x1a\x32.google.ads.googleads.v18.resources.GoogleAdsField\">\xda\x41\rresource_name\x82\xd3\xe4\x93\x02(\x12&/v18/{resource_name=googleAdsFields/*}\x12\xca\x01\n\x15SearchGoogleAdsFields\x12?.google.ads.googleads.v18.services.SearchGoogleAdsFieldsRequest\x1a@.google.ads.googleads.v18.services.SearchGoogleAdsFieldsResponse\".\xda\x41\x05query\x82\xd3\xe4\x93\x02 \"\x1b/v18/googleAdsFields:search:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x86\x02\n%com.google.ads.googleads.v18.servicesB\x1aGoogleAdsFieldServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.GoogleAdsField", "google/ads/googleads/v18/resources/google_ads_field.proto"],
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
          GetGoogleAdsFieldRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.GetGoogleAdsFieldRequest").msgclass
          SearchGoogleAdsFieldsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.SearchGoogleAdsFieldsRequest").msgclass
          SearchGoogleAdsFieldsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.SearchGoogleAdsFieldsResponse").msgclass
        end
      end
    end
  end
end
