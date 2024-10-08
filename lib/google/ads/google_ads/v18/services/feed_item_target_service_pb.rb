# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/feed_item_target_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/response_content_type_pb'
require 'google/ads/google_ads/v18/resources/feed_item_target_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n@google/ads/googleads/v18/services/feed_item_target_service.proto\x12!google.ads.googleads.v18.services\x1a:google/ads/googleads/v18/enums/response_content_type.proto\x1a\x39google/ads/googleads/v18/resources/feed_item_target.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x17google/rpc/status.proto\"\xa9\x02\n\x1cMutateFeedItemTargetsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12S\n\noperations\x18\x02 \x03(\x0b\x32:.google.ads.googleads.v18.services.FeedItemTargetOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v18.enums.ResponseContentTypeEnum.ResponseContentType\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xac\x01\n\x17\x46\x65\x65\x64ItemTargetOperation\x12\x44\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x32.google.ads.googleads.v18.resources.FeedItemTargetH\x00\x12>\n\x06remove\x18\x02 \x01(\tB,\xfa\x41)\n\'googleads.googleapis.com/FeedItemTargetH\x00\x42\x0b\n\toperation\"\xa2\x01\n\x1dMutateFeedItemTargetsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12N\n\x07results\x18\x02 \x03(\x0b\x32=.google.ads.googleads.v18.services.MutateFeedItemTargetResult\"\xaf\x01\n\x1aMutateFeedItemTargetResult\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xfa\x41)\n\'googleads.googleapis.com/FeedItemTarget\x12L\n\x10\x66\x65\x65\x64_item_target\x18\x02 \x01(\x0b\x32\x32.google.ads.googleads.v18.resources.FeedItemTarget2\xd6\x02\n\x15\x46\x65\x65\x64ItemTargetService\x12\xf5\x01\n\x15MutateFeedItemTargets\x12?.google.ads.googleads.v18.services.MutateFeedItemTargetsRequest\x1a@.google.ads.googleads.v18.services.MutateFeedItemTargetsResponse\"Y\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02:\"5/v18/customers/{customer_id=*}/feedItemTargets:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x86\x02\n%com.google.ads.googleads.v18.servicesB\x1a\x46\x65\x65\x64ItemTargetServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.FeedItemTarget", "google/ads/googleads/v18/resources/feed_item_target.proto"],
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
          MutateFeedItemTargetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateFeedItemTargetsRequest").msgclass
          FeedItemTargetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.FeedItemTargetOperation").msgclass
          MutateFeedItemTargetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateFeedItemTargetsResponse").msgclass
          MutateFeedItemTargetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateFeedItemTargetResult").msgclass
        end
      end
    end
  end
end
