# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/third_party_app_analytics_link.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nGgoogle/ads/googleads/v15/resources/third_party_app_analytics_link.proto\x12\"google.ads.googleads.v15.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xae\x02\n\x1aThirdPartyAppAnalyticsLink\x12R\n\rresource_name\x18\x01 \x01(\tB;\xe0\x41\x05\xfa\x41\x35\n3googleads.googleapis.com/ThirdPartyAppAnalyticsLink\x12#\n\x11shareable_link_id\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01:\x80\x01\xea\x41}\n3googleads.googleapis.com/ThirdPartyAppAnalyticsLink\x12\x46\x63ustomers/{customer_id}/thirdPartyAppAnalyticsLinks/{customer_link_id}B\x14\n\x12_shareable_link_idB\x91\x02\n&com.google.ads.googleads.v15.resourcesB\x1fThirdPartyAppAnalyticsLinkProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

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
      module V15
        module Resources
          ThirdPartyAppAnalyticsLink = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ThirdPartyAppAnalyticsLink").msgclass
        end
      end
    end
  end
end
