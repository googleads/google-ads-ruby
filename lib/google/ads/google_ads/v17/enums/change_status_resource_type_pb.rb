# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/enums/change_status_resource_type.proto

require 'google/protobuf'


descriptor_data = "\n@google/ads/googleads/v17/enums/change_status_resource_type.proto\x12\x1egoogle.ads.googleads.v17.enums\"\xa8\x03\n\x1c\x43hangeStatusResourceTypeEnum\"\x87\x03\n\x18\x43hangeStatusResourceType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0c\n\x08\x41\x44_GROUP\x10\x03\x12\x0f\n\x0b\x41\x44_GROUP_AD\x10\x04\x12\x16\n\x12\x41\x44_GROUP_CRITERION\x10\x05\x12\x0c\n\x08\x43\x41MPAIGN\x10\x06\x12\x16\n\x12\x43\x41MPAIGN_CRITERION\x10\x07\x12\x08\n\x04\x46\x45\x45\x44\x10\t\x12\r\n\tFEED_ITEM\x10\n\x12\x11\n\rAD_GROUP_FEED\x10\x0b\x12\x11\n\rCAMPAIGN_FEED\x10\x0c\x12\x19\n\x15\x41\x44_GROUP_BID_MODIFIER\x10\r\x12\x0e\n\nSHARED_SET\x10\x0e\x12\x17\n\x13\x43\x41MPAIGN_SHARED_SET\x10\x0f\x12\t\n\x05\x41SSET\x10\x10\x12\x12\n\x0e\x43USTOMER_ASSET\x10\x11\x12\x12\n\x0e\x43\x41MPAIGN_ASSET\x10\x12\x12\x12\n\x0e\x41\x44_GROUP_ASSET\x10\x13\x12\x15\n\x11\x43OMBINED_AUDIENCE\x10\x14\x12\x0f\n\x0b\x41SSET_GROUP\x10\x15\x42\xf7\x01\n\"com.google.ads.googleads.v17.enumsB\x1d\x43hangeStatusResourceTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v17/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V17.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V17\\Enums\xea\x02\"Google::Ads::GoogleAds::V17::Enumsb\x06proto3"

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
      module V17
        module Enums
          ChangeStatusResourceTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.enums.ChangeStatusResourceTypeEnum").msgclass
          ChangeStatusResourceTypeEnum::ChangeStatusResourceType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.enums.ChangeStatusResourceTypeEnum.ChangeStatusResourceType").enummodule
        end
      end
    end
  end
end
