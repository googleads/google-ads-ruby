# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/common/frequency_cap.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/frequency_cap_event_type_pb'
require 'google/ads/google_ads/v18/enums/frequency_cap_level_pb'
require 'google/ads/google_ads/v18/enums/frequency_cap_time_unit_pb'


descriptor_data = "\n3google/ads/googleads/v18/common/frequency_cap.proto\x12\x1fgoogle.ads.googleads.v18.common\x1a=google/ads/googleads/v18/enums/frequency_cap_event_type.proto\x1a\x38google/ads/googleads/v18/enums/frequency_cap_level.proto\x1a<google/ads/googleads/v18/enums/frequency_cap_time_unit.proto\"l\n\x11\x46requencyCapEntry\x12=\n\x03key\x18\x01 \x01(\x0b\x32\x30.google.ads.googleads.v18.common.FrequencyCapKey\x12\x10\n\x03\x63\x61p\x18\x03 \x01(\x05H\x00\x88\x01\x01\x42\x06\n\x04_cap\"\xda\x02\n\x0f\x46requencyCapKey\x12V\n\x05level\x18\x01 \x01(\x0e\x32G.google.ads.googleads.v18.enums.FrequencyCapLevelEnum.FrequencyCapLevel\x12\x63\n\nevent_type\x18\x03 \x01(\x0e\x32O.google.ads.googleads.v18.enums.FrequencyCapEventTypeEnum.FrequencyCapEventType\x12`\n\ttime_unit\x18\x02 \x01(\x0e\x32M.google.ads.googleads.v18.enums.FrequencyCapTimeUnitEnum.FrequencyCapTimeUnit\x12\x18\n\x0btime_length\x18\x05 \x01(\x05H\x00\x88\x01\x01\x42\x0e\n\x0c_time_lengthB\xf1\x01\n#com.google.ads.googleads.v18.commonB\x11\x46requencyCapProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Common\xea\x02#Google::Ads::GoogleAds::V18::Commonb\x06proto3"

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
        module Common
          FrequencyCapEntry = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.common.FrequencyCapEntry").msgclass
          FrequencyCapKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.common.FrequencyCapKey").msgclass
        end
      end
    end
  end
end
