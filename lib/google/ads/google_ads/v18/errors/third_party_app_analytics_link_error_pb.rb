# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/third_party_app_analytics_link_error.proto

require 'google/protobuf'


descriptor_data = "\nJgoogle/ads/googleads/v18/errors/third_party_app_analytics_link_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\xfe\x01\n#ThirdPartyAppAnalyticsLinkErrorEnum\"\xd6\x01\n\x1fThirdPartyAppAnalyticsLinkError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12!\n\x1dINVALID_ANALYTICS_PROVIDER_ID\x10\x02\x12\x19\n\x15INVALID_MOBILE_APP_ID\x10\x03\x12\x1d\n\x19MOBILE_APP_IS_NOT_ENABLED\x10\x04\x12\x38\n4CANNOT_REGENERATE_SHAREABLE_LINK_ID_FOR_REMOVED_LINK\x10\x05\x42\x84\x02\n#com.google.ads.googleads.v18.errorsB$ThirdPartyAppAnalyticsLinkErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
        module Errors
          ThirdPartyAppAnalyticsLinkErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.ThirdPartyAppAnalyticsLinkErrorEnum").msgclass
          ThirdPartyAppAnalyticsLinkErrorEnum::ThirdPartyAppAnalyticsLinkError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.ThirdPartyAppAnalyticsLinkErrorEnum.ThirdPartyAppAnalyticsLinkError").enummodule
        end
      end
    end
  end
end