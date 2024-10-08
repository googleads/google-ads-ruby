# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/dynamic_search_ads_search_term_view.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nLgoogle/ads/googleads/v18/resources/dynamic_search_ads_search_term_view.proto\x12\"google.ads.googleads.v18.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd0\x05\n\x1e\x44ynamicSearchAdsSearchTermView\x12V\n\rresource_name\x18\x01 \x01(\tB?\xe0\x41\x03\xfa\x41\x39\n7googleads.googleapis.com/DynamicSearchAdsSearchTermView\x12\x1d\n\x0bsearch_term\x18\t \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1a\n\x08headline\x18\n \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1e\n\x0clanding_page\x18\x0b \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1a\n\x08page_url\x18\x0c \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12&\n\x14has_negative_keyword\x18\r \x01(\x08\x42\x03\xe0\x41\x03H\x04\x88\x01\x01\x12&\n\x14has_matching_keyword\x18\x0e \x01(\x08\x42\x03\xe0\x41\x03H\x05\x88\x01\x01\x12\"\n\x10has_negative_url\x18\x0f \x01(\x08\x42\x03\xe0\x41\x03H\x06\x88\x01\x01:\xe8\x01\xea\x41\xe4\x01\n7googleads.googleapis.com/DynamicSearchAdsSearchTermView\x12\xa8\x01\x63ustomers/{customer_id}/dynamicSearchAdsSearchTermViews/{ad_group_id}~{search_term_fingerprint}~{headline_fingerprint}~{landing_page_fingerprint}~{page_url_fingerprint}B\x0e\n\x0c_search_termB\x0b\n\t_headlineB\x0f\n\r_landing_pageB\x0b\n\t_page_urlB\x17\n\x15_has_negative_keywordB\x17\n\x15_has_matching_keywordB\x13\n\x11_has_negative_urlB\x95\x02\n&com.google.ads.googleads.v18.resourcesB#DynamicSearchAdsSearchTermViewProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
          DynamicSearchAdsSearchTermView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.DynamicSearchAdsSearchTermView").msgclass
        end
      end
    end
  end
end