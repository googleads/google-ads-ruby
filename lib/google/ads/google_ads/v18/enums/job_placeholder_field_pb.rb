# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/job_placeholder_field.proto

require 'google/protobuf'


descriptor_data = "\n:google/ads/googleads/v18/enums/job_placeholder_field.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xf1\x02\n\x17JobPlaceholderFieldEnum\"\xd5\x02\n\x13JobPlaceholderField\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\n\n\x06JOB_ID\x10\x02\x12\x0f\n\x0bLOCATION_ID\x10\x03\x12\t\n\x05TITLE\x10\x04\x12\x0c\n\x08SUBTITLE\x10\x05\x12\x0f\n\x0b\x44\x45SCRIPTION\x10\x06\x12\r\n\tIMAGE_URL\x10\x07\x12\x0c\n\x08\x43\x41TEGORY\x10\x08\x12\x17\n\x13\x43ONTEXTUAL_KEYWORDS\x10\t\x12\x0b\n\x07\x41\x44\x44RESS\x10\n\x12\n\n\x06SALARY\x10\x0b\x12\x0e\n\nFINAL_URLS\x10\x0c\x12\x15\n\x11\x46INAL_MOBILE_URLS\x10\x0e\x12\x10\n\x0cTRACKING_URL\x10\x0f\x12\x14\n\x10\x41NDROID_APP_LINK\x10\x10\x12\x13\n\x0fSIMILAR_JOB_IDS\x10\x11\x12\x10\n\x0cIOS_APP_LINK\x10\x12\x12\x14\n\x10IOS_APP_STORE_ID\x10\x13\x42\xf3\x01\n\"com.google.ads.googleads.v18.enumsB\x19JobsPlaceholderFieldProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
          JobPlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.JobPlaceholderFieldEnum").msgclass
          JobPlaceholderFieldEnum::JobPlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.JobPlaceholderFieldEnum.JobPlaceholderField").enummodule
        end
      end
    end
  end
end
