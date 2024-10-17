# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/detailed_demographic.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/criterion_category_availability_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n=google/ads/googleads/v18/resources/detailed_demographic.proto\x12\"google.ads.googleads.v18.resources\x1a\x45google/ads/googleads/v18/common/criterion_category_availability.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xc2\x03\n\x13\x44\x65tailedDemographic\x12K\n\rresource_name\x18\x01 \x01(\tB4\xe0\x41\x03\xfa\x41.\n,googleads.googleapis.com/DetailedDemographic\x12\x0f\n\x02id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x11\n\x04name\x18\x03 \x01(\tB\x03\xe0\x41\x03\x12\x44\n\x06parent\x18\x04 \x01(\tB4\xe0\x41\x03\xfa\x41.\n,googleads.googleapis.com/DetailedDemographic\x12\x1c\n\x0flaunched_to_all\x18\x05 \x01(\x08\x42\x03\xe0\x41\x03\x12[\n\x0e\x61vailabilities\x18\x06 \x03(\x0b\x32>.google.ads.googleads.v18.common.CriterionCategoryAvailabilityB\x03\xe0\x41\x03:y\xea\x41v\n,googleads.googleapis.com/DetailedDemographic\x12\x46\x63ustomers/{customer_id}/detailedDemographics/{detailed_demographic_id}B\x8a\x02\n&com.google.ads.googleads.v18.resourcesB\x18\x44\x65tailedDemographicProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v18.common.CriterionCategoryAvailability", "google/ads/googleads/v18/common/criterion_category_availability.proto"],
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
          DetailedDemographic = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.DetailedDemographic").msgclass
        end
      end
    end
  end
end
