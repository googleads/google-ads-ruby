# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/optimization_goal_type.proto

require 'google/protobuf'


descriptor_data = "\n;google/ads/googleads/v18/enums/optimization_goal_type.proto\x12\x1egoogle.ads.googleads.v18.enums\"\x93\x01\n\x18OptimizationGoalTypeEnum\"w\n\x14OptimizationGoalType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0f\n\x0b\x43\x41LL_CLICKS\x10\x02\x12\x16\n\x12\x44RIVING_DIRECTIONS\x10\x03\x12\x18\n\x14\x41PP_PRE_REGISTRATION\x10\x04\x42\xf3\x01\n\"com.google.ads.googleads.v18.enumsB\x19OptimizationGoalTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
        module Enums
          OptimizationGoalTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.OptimizationGoalTypeEnum").msgclass
          OptimizationGoalTypeEnum::OptimizationGoalType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.OptimizationGoalTypeEnum.OptimizationGoalType").enummodule
        end
      end
    end
  end
end