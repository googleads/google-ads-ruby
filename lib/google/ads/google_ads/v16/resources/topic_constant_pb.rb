# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/topic_constant.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n7google/ads/googleads/v16/resources/topic_constant.proto\x12\"google.ads.googleads.v16.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xbc\x02\n\rTopicConstant\x12\x45\n\rresource_name\x18\x01 \x01(\tB.\xe0\x41\x03\xfa\x41(\n&googleads.googleapis.com/TopicConstant\x12\x14\n\x02id\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12R\n\x15topic_constant_parent\x18\x06 \x01(\tB.\xe0\x41\x03\xfa\x41(\n&googleads.googleapis.com/TopicConstantH\x01\x88\x01\x01\x12\x11\n\x04path\x18\x07 \x03(\tB\x03\xe0\x41\x03:F\xea\x41\x43\n&googleads.googleapis.com/TopicConstant\x12\x19topicConstants/{topic_id}B\x05\n\x03_idB\x18\n\x16_topic_constant_parentB\x84\x02\n&com.google.ads.googleads.v16.resourcesB\x12TopicConstantProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
      module V16
        module Resources
          TopicConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.TopicConstant").msgclass
        end
      end
    end
  end
end
