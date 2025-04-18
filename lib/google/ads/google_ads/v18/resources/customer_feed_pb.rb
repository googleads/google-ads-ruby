# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/customer_feed.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/matching_function_pb'
require 'google/ads/google_ads/v18/enums/feed_link_status_pb'
require 'google/ads/google_ads/v18/enums/placeholder_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n6google/ads/googleads/v18/resources/customer_feed.proto\x12\"google.ads.googleads.v18.resources\x1a\x37google/ads/googleads/v18/common/matching_function.proto\x1a\x35google/ads/googleads/v18/enums/feed_link_status.proto\x1a\x35google/ads/googleads/v18/enums/placeholder_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xfa\x03\n\x0c\x43ustomerFeed\x12\x44\n\rresource_name\x18\x01 \x01(\tB-\xe0\x41\x05\xfa\x41\'\n%googleads.googleapis.com/CustomerFeed\x12\x38\n\x04\x66\x65\x65\x64\x18\x06 \x01(\tB%\xe0\x41\x05\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/FeedH\x00\x88\x01\x01\x12^\n\x11placeholder_types\x18\x03 \x03(\x0e\x32\x43.google.ads.googleads.v18.enums.PlaceholderTypeEnum.PlaceholderType\x12L\n\x11matching_function\x18\x04 \x01(\x0b\x32\x31.google.ads.googleads.v18.common.MatchingFunction\x12V\n\x06status\x18\x05 \x01(\x0e\x32\x41.google.ads.googleads.v18.enums.FeedLinkStatusEnum.FeedLinkStatusB\x03\xe0\x41\x03:[\xea\x41X\n%googleads.googleapis.com/CustomerFeed\x12/customers/{customer_id}/customerFeeds/{feed_id}B\x07\n\x05_feedB\x83\x02\n&com.google.ads.googleads.v18.resourcesB\x11\x43ustomerFeedProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v18.common.MatchingFunction", "google/ads/googleads/v18/common/matching_function.proto"],
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
        module Resources
          CustomerFeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.CustomerFeed").msgclass
        end
      end
    end
  end
end
