# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v19/resources/performance_max_placement_view.proto

require 'google/protobuf'

require 'google/ads/google_ads/v19/enums/placement_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nGgoogle/ads/googleads/v19/resources/performance_max_placement_view.proto\x12\"google.ads.googleads.v19.resources\x1a\x33google/ads/googleads/v19/enums/placement_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x9b\x04\n\x1bPerformanceMaxPlacementView\x12S\n\rresource_name\x18\x01 \x01(\tB<\xe0\x41\x03\xfa\x41\x36\n4googleads.googleapis.com/PerformanceMaxPlacementView\x12\x1b\n\tplacement\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1e\n\x0c\x64isplay_name\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1c\n\ntarget_url\x18\x04 \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\\\n\x0eplacement_type\x18\x05 \x01(\x0e\x32?.google.ads.googleads.v19.enums.PlacementTypeEnum.PlacementTypeB\x03\xe0\x41\x03:\xbf\x01\xea\x41\xbb\x01\n4googleads.googleapis.com/PerformanceMaxPlacementView\x12Hcustomers/{customer_id}/performanceMaxPlacementViews/{base_64_placement}*\x1cperformanceMaxPlacementViews2\x1bperformanceMaxPlacementViewB\x0c\n\n_placementB\x0f\n\r_display_nameB\r\n\x0b_target_urlB\x92\x02\n&com.google.ads.googleads.v19.resourcesB PerformanceMaxPlacementViewProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v19/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V19.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V19\\Resources\xea\x02&Google::Ads::GoogleAds::V19::Resourcesb\x06proto3"

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
      module V19
        module Resources
          PerformanceMaxPlacementView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.resources.PerformanceMaxPlacementView").msgclass
        end
      end
    end
  end
end
