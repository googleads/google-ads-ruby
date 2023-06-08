# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/feed.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/affiliate_location_feed_relationship_type_pb'
require 'google/ads/google_ads/v14/enums/feed_attribute_type_pb'
require 'google/ads/google_ads/v14/enums/feed_origin_pb'
require 'google/ads/google_ads/v14/enums/feed_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n-google/ads/googleads/v14/resources/feed.proto\x12\"google.ads.googleads.v14.resources\x1aNgoogle/ads/googleads/v14/enums/affiliate_location_feed_relationship_type.proto\x1a\x38google/ads/googleads/v14/enums/feed_attribute_type.proto\x1a\x30google/ads/googleads/v14/enums/feed_origin.proto\x1a\x30google/ads/googleads/v14/enums/feed_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xa8\x0b\n\x04\x46\x65\x65\x64\x12<\n\rresource_name\x18\x01 \x01(\tB%\xe0\x41\x05\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/Feed\x12\x14\n\x02id\x18\x0b \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x16\n\x04name\x18\x0c \x01(\tB\x03\xe0\x41\x05H\x02\x88\x01\x01\x12\x45\n\nattributes\x18\x04 \x03(\x0b\x32\x31.google.ads.googleads.v14.resources.FeedAttribute\x12X\n\x14\x61ttribute_operations\x18\t \x03(\x0b\x32:.google.ads.googleads.v14.resources.FeedAttributeOperation\x12N\n\x06origin\x18\x05 \x01(\x0e\x32\x39.google.ads.googleads.v14.enums.FeedOriginEnum.FeedOriginB\x03\xe0\x41\x05\x12N\n\x06status\x18\x08 \x01(\x0e\x32\x39.google.ads.googleads.v14.enums.FeedStatusEnum.FeedStatusB\x03\xe0\x41\x03\x12\x64\n\x19places_location_feed_data\x18\x06 \x01(\x0b\x32?.google.ads.googleads.v14.resources.Feed.PlacesLocationFeedDataH\x00\x12j\n\x1c\x61\x66\x66iliate_location_feed_data\x18\x07 \x01(\x0b\x32\x42.google.ads.googleads.v14.resources.Feed.AffiliateLocationFeedDataH\x00\x1a\xe6\x03\n\x16PlacesLocationFeedData\x12\x62\n\noauth_info\x18\x01 \x01(\x0b\x32I.google.ads.googleads.v14.resources.Feed.PlacesLocationFeedData.OAuthInfoB\x03\xe0\x41\x05\x12\x1a\n\remail_address\x18\x07 \x01(\tH\x00\x88\x01\x01\x12\x1b\n\x13\x62usiness_account_id\x18\x08 \x01(\t\x12!\n\x14\x62usiness_name_filter\x18\t \x01(\tH\x01\x88\x01\x01\x12\x18\n\x10\x63\x61tegory_filters\x18\x0b \x03(\t\x12\x15\n\rlabel_filters\x18\x0c \x03(\t\x1a\xaf\x01\n\tOAuthInfo\x12\x18\n\x0bhttp_method\x18\x04 \x01(\tH\x00\x88\x01\x01\x12\x1d\n\x10http_request_url\x18\x05 \x01(\tH\x01\x88\x01\x01\x12&\n\x19http_authorization_header\x18\x06 \x01(\tH\x02\x88\x01\x01\x42\x0e\n\x0c_http_methodB\x13\n\x11_http_request_urlB\x1c\n\x1a_http_authorization_headerB\x10\n\x0e_email_addressB\x17\n\x15_business_name_filter\x1a\xbb\x01\n\x19\x41\x66\x66iliateLocationFeedData\x12\x11\n\tchain_ids\x18\x03 \x03(\x03\x12\x8a\x01\n\x11relationship_type\x18\x02 \x01(\x0e\x32o.google.ads.googleads.v14.enums.AffiliateLocationFeedRelationshipTypeEnum.AffiliateLocationFeedRelationshipType:K\xea\x41H\n\x1dgoogleads.googleapis.com/Feed\x12\'customers/{customer_id}/feeds/{feed_id}B\x1d\n\x1bsystem_feed_generation_dataB\x05\n\x03_idB\x07\n\x05_name\"\xca\x01\n\rFeedAttribute\x12\x0f\n\x02id\x18\x05 \x01(\x03H\x00\x88\x01\x01\x12\x11\n\x04name\x18\x06 \x01(\tH\x01\x88\x01\x01\x12U\n\x04type\x18\x03 \x01(\x0e\x32G.google.ads.googleads.v14.enums.FeedAttributeTypeEnum.FeedAttributeType\x12\x1b\n\x0eis_part_of_key\x18\x07 \x01(\x08H\x02\x88\x01\x01\x42\x05\n\x03_idB\x07\n\x05_nameB\x11\n\x0f_is_part_of_key\"\xee\x01\n\x16\x46\x65\x65\x64\x41ttributeOperation\x12Z\n\x08operator\x18\x01 \x01(\x0e\x32\x43.google.ads.googleads.v14.resources.FeedAttributeOperation.OperatorB\x03\xe0\x41\x03\x12\x45\n\x05value\x18\x02 \x01(\x0b\x32\x31.google.ads.googleads.v14.resources.FeedAttributeB\x03\xe0\x41\x03\"1\n\x08Operator\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x07\n\x03\x41\x44\x44\x10\x02\x42\xfb\x01\n&com.google.ads.googleads.v14.resourcesB\tFeedProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
        module Resources
          Feed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Feed").msgclass
          Feed::PlacesLocationFeedData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Feed.PlacesLocationFeedData").msgclass
          Feed::PlacesLocationFeedData::OAuthInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Feed.PlacesLocationFeedData.OAuthInfo").msgclass
          Feed::AffiliateLocationFeedData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Feed.AffiliateLocationFeedData").msgclass
          FeedAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.FeedAttribute").msgclass
          FeedAttributeOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.FeedAttributeOperation").msgclass
          FeedAttributeOperation::Operator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.FeedAttributeOperation.Operator").enummodule
        end
      end
    end
  end
end
