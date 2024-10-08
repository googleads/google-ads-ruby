# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/android_privacy_shared_key_google_campaign.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/enums/android_privacy_interaction_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nSgoogle/ads/googleads/v16/resources/android_privacy_shared_key_google_campaign.proto\x12\"google.ads.googleads.v16.resources\x1a\x45google/ads/googleads/v16/enums/android_privacy_interaction_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xde\x04\n%AndroidPrivacySharedKeyGoogleCampaign\x12]\n\rresource_name\x18\x01 \x01(\tBF\xe0\x41\x03\xfa\x41@\n>googleads.googleapis.com/AndroidPrivacySharedKeyGoogleCampaign\x12\x18\n\x0b\x63\x61mpaign_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x8e\x01\n android_privacy_interaction_type\x18\x03 \x01(\x0e\x32_.google.ads.googleads.v16.enums.AndroidPrivacyInteractionTypeEnum.AndroidPrivacyInteractionTypeB\x03\xe0\x41\x03\x12-\n android_privacy_interaction_date\x18\x04 \x01(\tB\x03\xe0\x41\x03\x12 \n\x13shared_campaign_key\x18\x05 \x01(\tB\x03\xe0\x41\x03:\xd9\x01\xea\x41\xd5\x01\n>googleads.googleapis.com/AndroidPrivacySharedKeyGoogleCampaign\x12\x92\x01\x63ustomers/{customer_id}/androidPrivacySharedKeyGoogleCampaigns/{campaign_id}~{android_privacy_interaction_type}~{android_privacy_interaction_date}B\x9c\x02\n&com.google.ads.googleads.v16.resourcesB*AndroidPrivacySharedKeyGoogleCampaignProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
        module Resources
          AndroidPrivacySharedKeyGoogleCampaign = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.AndroidPrivacySharedKeyGoogleCampaign").msgclass
        end
      end
    end
  end
end