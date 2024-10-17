# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/content_criterion_view.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n?google/ads/googleads/v18/resources/content_criterion_view.proto\x12\"google.ads.googleads.v18.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe4\x01\n\x14\x43ontentCriterionView\x12L\n\rresource_name\x18\x01 \x01(\tB5\xe0\x41\x03\xfa\x41/\n-googleads.googleapis.com/ContentCriterionView:~\xea\x41{\n-googleads.googleapis.com/ContentCriterionView\x12Jcustomers/{customer_id}/contentCriterionViews/{ad_group_id}~{criterion_id}B\x8b\x02\n&com.google.ads.googleads.v18.resourcesB\x19\x43ontentCriterionViewProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
          ContentCriterionView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ContentCriterionView").msgclass
        end
      end
    end
  end
end
