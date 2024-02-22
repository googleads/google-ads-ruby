# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/errors/smart_campaign_error.proto

require 'google/protobuf'


descriptor_data = "\n:google/ads/googleads/v16/errors/smart_campaign_error.proto\x12\x1fgoogle.ads.googleads.v16.errors\"\xbe\x02\n\x16SmartCampaignErrorEnum\"\xa3\x02\n\x12SmartCampaignError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12 \n\x1cINVALID_BUSINESS_LOCATION_ID\x10\x02\x12\x14\n\x10INVALID_CAMPAIGN\x10\x03\x12\x31\n-BUSINESS_NAME_OR_BUSINESS_LOCATION_ID_MISSING\x10\x04\x12%\n!REQUIRED_SUGGESTION_FIELD_MISSING\x10\x05\x12\x18\n\x14GEO_TARGETS_REQUIRED\x10\x06\x12&\n\"CANNOT_DETERMINE_SUGGESTION_LOCALE\x10\x07\x12\x1b\n\x17\x46INAL_URL_NOT_CRAWLABLE\x10\x08\x42\xf7\x01\n#com.google.ads.googleads.v16.errorsB\x17SmartCampaignErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v16/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V16.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V16\\Errors\xea\x02#Google::Ads::GoogleAds::V16::Errorsb\x06proto3"

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
        module Errors
          SmartCampaignErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.SmartCampaignErrorEnum").msgclass
          SmartCampaignErrorEnum::SmartCampaignError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.errors.SmartCampaignErrorEnum.SmartCampaignError").enummodule
        end
      end
    end
  end
end
