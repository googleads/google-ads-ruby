# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/ad_parameter.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n5google/ads/googleads/v14/resources/ad_parameter.proto\x12\"google.ads.googleads.v14.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xa4\x03\n\x0b\x41\x64Parameter\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x05\xfa\x41&\n$googleads.googleapis.com/AdParameter\x12R\n\x12\x61\x64_group_criterion\x18\x05 \x01(\tB1\xe0\x41\x05\xfa\x41+\n)googleads.googleapis.com/AdGroupCriterionH\x00\x88\x01\x01\x12!\n\x0fparameter_index\x18\x06 \x01(\x03\x42\x03\xe0\x41\x05H\x01\x88\x01\x01\x12\x1b\n\x0einsertion_text\x18\x07 \x01(\tH\x02\x88\x01\x01:~\xea\x41{\n$googleads.googleapis.com/AdParameter\x12Scustomers/{customer_id}/adParameters/{ad_group_id}~{criterion_id}~{parameter_index}B\x15\n\x13_ad_group_criterionB\x12\n\x10_parameter_indexB\x11\n\x0f_insertion_textB\x82\x02\n&com.google.ads.googleads.v14.resourcesB\x10\x41\x64ParameterProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
          AdParameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.AdParameter").msgclass
        end
      end
    end
  end
end
