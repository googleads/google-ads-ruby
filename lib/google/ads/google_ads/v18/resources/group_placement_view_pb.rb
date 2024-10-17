# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/group_placement_view.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/placement_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n=google/ads/googleads/v18/resources/group_placement_view.proto\x12\"google.ads.googleads.v18.resources\x1a\x33google/ads/googleads/v18/enums/placement_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xc7\x03\n\x12GroupPlacementView\x12J\n\rresource_name\x18\x01 \x01(\tB3\xe0\x41\x03\xfa\x41-\n+googleads.googleapis.com/GroupPlacementView\x12\x1b\n\tplacement\x18\x06 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1e\n\x0c\x64isplay_name\x18\x07 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1c\n\ntarget_url\x18\x08 \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\\\n\x0eplacement_type\x18\x05 \x01(\x0e\x32?.google.ads.googleads.v18.enums.PlacementTypeEnum.PlacementTypeB\x03\xe0\x41\x03:~\xea\x41{\n+googleads.googleapis.com/GroupPlacementView\x12Lcustomers/{customer_id}/groupPlacementViews/{ad_group_id}~{base64_placement}B\x0c\n\n_placementB\x0f\n\r_display_nameB\r\n\x0b_target_urlB\x89\x02\n&com.google.ads.googleads.v18.resourcesB\x17GroupPlacementViewProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
          GroupPlacementView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.GroupPlacementView").msgclass
        end
      end
    end
  end
end
