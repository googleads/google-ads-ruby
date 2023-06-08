# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/feed_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/response_content_type_pb'
require 'google/ads/google_ads/v14/resources/feed_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n4google/ads/googleads/v14/services/feed_service.proto\x12!google.ads.googleads.v14.services\x1a:google/ads/googleads/v14/enums/response_content_type.proto\x1a-google/ads/googleads/v14/resources/feed.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\x95\x02\n\x12MutateFeedsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12I\n\noperations\x18\x02 \x03(\x0b\x32\x30.google.ads.googleads.v14.services.FeedOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v14.enums.ResponseContentTypeEnum.ResponseContentType\"\xfb\x01\n\rFeedOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12:\n\x06\x63reate\x18\x01 \x01(\x0b\x32(.google.ads.googleads.v14.resources.FeedH\x00\x12:\n\x06update\x18\x02 \x01(\x0b\x32(.google.ads.googleads.v14.resources.FeedH\x00\x12\x34\n\x06remove\x18\x03 \x01(\tB\"\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/FeedH\x00\x42\x0b\n\toperation\"\x8e\x01\n\x13MutateFeedsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12\x44\n\x07results\x18\x02 \x03(\x0b\x32\x33.google.ads.googleads.v14.services.MutateFeedResult\"\x85\x01\n\x10MutateFeedResult\x12\x39\n\rresource_name\x18\x01 \x01(\tB\"\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/Feed\x12\x36\n\x04\x66\x65\x65\x64\x18\x02 \x01(\x0b\x32(.google.ads.googleads.v14.resources.Feed2\xa4\x02\n\x0b\x46\x65\x65\x64Service\x12\xcd\x01\n\x0bMutateFeeds\x12\x35.google.ads.googleads.v14.services.MutateFeedsRequest\x1a\x36.google.ads.googleads.v14.services.MutateFeedsResponse\"O\x82\xd3\xe4\x93\x02\x30\"+/v14/customers/{customer_id=*}/feeds:mutate:\x01*\xda\x41\x16\x63ustomer_id,operations\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\xfc\x01\n%com.google.ads.googleads.v14.servicesB\x10\x46\x65\x65\x64ServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.resources.Feed", "google/ads/googleads/v14/resources/feed.proto"],
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
          MutateFeedsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateFeedsRequest").msgclass
          FeedOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.FeedOperation").msgclass
          MutateFeedsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateFeedsResponse").msgclass
          MutateFeedResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MutateFeedResult").msgclass
        end
      end
    end
  end
end
