# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/account_link.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/account_link_status_pb'
require 'google/ads/google_ads/v18/enums/linked_account_type_pb'
require 'google/ads/google_ads/v18/enums/mobile_app_vendor_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n5google/ads/googleads/v18/resources/account_link.proto\x12\"google.ads.googleads.v18.resources\x1a\x38google/ads/googleads/v18/enums/account_link_status.proto\x1a\x38google/ads/googleads/v18/enums/linked_account_type.proto\x1a\x36google/ads/googleads/v18/enums/mobile_app_vendor.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xa7\x04\n\x0b\x41\x63\x63ountLink\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x05\xfa\x41&\n$googleads.googleapis.com/AccountLink\x12!\n\x0f\x61\x63\x63ount_link_id\x18\x08 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12W\n\x06status\x18\x03 \x01(\x0e\x32G.google.ads.googleads.v18.enums.AccountLinkStatusEnum.AccountLinkStatus\x12Z\n\x04type\x18\x04 \x01(\x0e\x32G.google.ads.googleads.v18.enums.LinkedAccountTypeEnum.LinkedAccountTypeB\x03\xe0\x41\x03\x12r\n\x19third_party_app_analytics\x18\x05 \x01(\x0b\x32H.google.ads.googleads.v18.resources.ThirdPartyAppAnalyticsLinkIdentifierB\x03\xe0\x41\x05H\x00:a\xea\x41^\n$googleads.googleapis.com/AccountLink\x12\x36\x63ustomers/{customer_id}/accountLinks/{account_link_id}B\x10\n\x0elinked_accountB\x12\n\x10_account_link_id\"\xf4\x01\n$ThirdPartyAppAnalyticsLinkIdentifier\x12+\n\x19\x61pp_analytics_provider_id\x18\x04 \x01(\x03\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x12\x18\n\x06\x61pp_id\x18\x05 \x01(\tB\x03\xe0\x41\x05H\x01\x88\x01\x01\x12\\\n\napp_vendor\x18\x03 \x01(\x0e\x32\x43.google.ads.googleads.v18.enums.MobileAppVendorEnum.MobileAppVendorB\x03\xe0\x41\x05\x42\x1c\n\x1a_app_analytics_provider_idB\t\n\x07_app_idB\x82\x02\n&com.google.ads.googleads.v18.resourcesB\x10\x41\x63\x63ountLinkProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
        module Resources
          AccountLink = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.AccountLink").msgclass
          ThirdPartyAppAnalyticsLinkIdentifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ThirdPartyAppAnalyticsLinkIdentifier").msgclass
        end
      end
    end
  end
end