# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/customer_feed_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/response_content_type_pb'
require 'google/ads/google_ads/v18/resources/customer_feed_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n=google/ads/googleads/v18/services/customer_feed_service.proto\x12!google.ads.googleads.v18.services\x1a:google/ads/googleads/v18/enums/response_content_type.proto\x1a\x36google/ads/googleads/v18/resources/customer_feed.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xa5\x02\n\x1aMutateCustomerFeedsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12Q\n\noperations\x18\x02 \x03(\x0b\x32\x38.google.ads.googleads.v18.services.CustomerFeedOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v18.enums.ResponseContentTypeEnum.ResponseContentType\"\x9b\x02\n\x15\x43ustomerFeedOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12\x42\n\x06\x63reate\x18\x01 \x01(\x0b\x32\x30.google.ads.googleads.v18.resources.CustomerFeedH\x00\x12\x42\n\x06update\x18\x02 \x01(\x0b\x32\x30.google.ads.googleads.v18.resources.CustomerFeedH\x00\x12<\n\x06remove\x18\x03 \x01(\tB*\xfa\x41\'\n%googleads.googleapis.com/CustomerFeedH\x00\x42\x0b\n\toperation\"\x9e\x01\n\x1bMutateCustomerFeedsResponse\x12\x31\n\x15partial_failure_error\x18\x03 \x01(\x0b\x32\x12.google.rpc.Status\x12L\n\x07results\x18\x02 \x03(\x0b\x32;.google.ads.googleads.v18.services.MutateCustomerFeedResult\"\xa6\x01\n\x18MutateCustomerFeedResult\x12\x41\n\rresource_name\x18\x01 \x01(\tB*\xfa\x41\'\n%googleads.googleapis.com/CustomerFeed\x12G\n\rcustomer_feed\x18\x02 \x01(\x0b\x32\x30.google.ads.googleads.v18.resources.CustomerFeed2\xcc\x02\n\x13\x43ustomerFeedService\x12\xed\x01\n\x13MutateCustomerFeeds\x12=.google.ads.googleads.v18.services.MutateCustomerFeedsRequest\x1a>.google.ads.googleads.v18.services.MutateCustomerFeedsResponse\"W\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02\x38\"3/v18/customers/{customer_id=*}/customerFeeds:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x84\x02\n%com.google.ads.googleads.v18.servicesB\x18\x43ustomerFeedServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.CustomerFeed", "google/ads/googleads/v18/resources/customer_feed.proto"],
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
          MutateCustomerFeedsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerFeedsRequest").msgclass
          CustomerFeedOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.CustomerFeedOperation").msgclass
          MutateCustomerFeedsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerFeedsResponse").msgclass
          MutateCustomerFeedResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerFeedResult").msgclass
        end
      end
    end
  end
end
