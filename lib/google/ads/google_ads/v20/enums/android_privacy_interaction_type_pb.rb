# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/enums/android_privacy_interaction_type.proto

require 'google/protobuf'


descriptor_data = "\nEgoogle/ads/googleads/v20/enums/android_privacy_interaction_type.proto\x12\x1egoogle.ads.googleads.v20.enums\"\x89\x01\n!AndroidPrivacyInteractionTypeEnum\"d\n\x1d\x41ndroidPrivacyInteractionType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\t\n\x05\x43LICK\x10\x02\x12\x10\n\x0c\x45NGAGED_VIEW\x10\x03\x12\x08\n\x04VIEW\x10\x04\x42\xfc\x01\n\"com.google.ads.googleads.v20.enumsB\"AndroidPrivacyInteractionTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v20/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V20.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V20\\Enums\xea\x02\"Google::Ads::GoogleAds::V20::Enumsb\x06proto3"

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
      module V20
        module Enums
          AndroidPrivacyInteractionTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.AndroidPrivacyInteractionTypeEnum").msgclass
          AndroidPrivacyInteractionTypeEnum::AndroidPrivacyInteractionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.AndroidPrivacyInteractionTypeEnum.AndroidPrivacyInteractionType").enummodule
        end
      end
    end
  end
end
