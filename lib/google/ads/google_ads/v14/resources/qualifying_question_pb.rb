# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/qualifying_question.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n<google/ads/googleads/v14/resources/qualifying_question.proto\x12\"google.ads.googleads.v14.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x8d\x02\n\x12QualifyingQuestion\x12J\n\rresource_name\x18\x01 \x01(\tB3\xe0\x41\x03\xfa\x41-\n+googleads.googleapis.com/QualifyingQuestion\x12#\n\x16qualifying_question_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x13\n\x06locale\x18\x03 \x01(\tB\x03\xe0\x41\x03\x12\x11\n\x04text\x18\x04 \x01(\tB\x03\xe0\x41\x03:^\xea\x41[\n+googleads.googleapis.com/QualifyingQuestion\x12,qualifyingQuestions/{qualifying_question_id}B\x89\x02\n&com.google.ads.googleads.v14.resourcesB\x17QualifyingQuestionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
          QualifyingQuestion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.QualifyingQuestion").msgclass
        end
      end
    end
  end
end
