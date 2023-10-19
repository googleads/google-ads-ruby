# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/language_constant.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n:google/ads/googleads/v15/resources/language_constant.proto\x12\"google.ads.googleads.v15.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xba\x02\n\x10LanguageConstant\x12H\n\rresource_name\x18\x01 \x01(\tB1\xe0\x41\x03\xfa\x41+\n)googleads.googleapis.com/LanguageConstant\x12\x14\n\x02id\x18\x06 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x16\n\x04\x63ode\x18\x07 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x16\n\x04name\x18\x08 \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1c\n\ntargetable\x18\t \x01(\x08\x42\x03\xe0\x41\x03H\x03\x88\x01\x01:P\xea\x41M\n)googleads.googleapis.com/LanguageConstant\x12 languageConstants/{criterion_id}B\x05\n\x03_idB\x07\n\x05_codeB\x07\n\x05_nameB\r\n\x0b_targetableB\x87\x02\n&com.google.ads.googleads.v15.resourcesB\x15LanguageConstantProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

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
          LanguageConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.LanguageConstant").msgclass
        end
      end
    end
  end
end
