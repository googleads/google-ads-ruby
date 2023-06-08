# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/smart_campaign_setting.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n?google/ads/googleads/v14/resources/smart_campaign_setting.proto\x12\"google.ads.googleads.v14.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd8\x06\n\x14SmartCampaignSetting\x12L\n\rresource_name\x18\x01 \x01(\tB5\xe0\x41\x05\xfa\x41/\n-googleads.googleapis.com/SmartCampaignSetting\x12;\n\x08\x63\x61mpaign\x18\x02 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12Z\n\x0cphone_number\x18\x03 \x01(\x0b\x32\x44.google.ads.googleads.v14.resources.SmartCampaignSetting.PhoneNumber\x12!\n\x19\x61\x64vertising_language_code\x18\x07 \x01(\t\x12\x13\n\tfinal_url\x18\x08 \x01(\tH\x00\x12\x8b\x01\n%ad_optimized_business_profile_setting\x18\t \x01(\x0b\x32Z.google.ads.googleads.v14.resources.SmartCampaignSetting.AdOptimizedBusinessProfileSettingH\x00\x12\x17\n\rbusiness_name\x18\x05 \x01(\tH\x01\x12#\n\x19\x62usiness_profile_location\x18\n \x01(\tH\x01\x1a\x65\n\x0bPhoneNumber\x12\x19\n\x0cphone_number\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x19\n\x0c\x63ountry_code\x18\x02 \x01(\tH\x01\x88\x01\x01\x42\x0f\n\r_phone_numberB\x0f\n\r_country_code\x1aY\n!AdOptimizedBusinessProfileSetting\x12\x1e\n\x11include_lead_form\x18\x01 \x01(\x08H\x00\x88\x01\x01\x42\x14\n\x12_include_lead_form:o\xea\x41l\n-googleads.googleapis.com/SmartCampaignSetting\x12;customers/{customer_id}/smartCampaignSettings/{campaign_id}B\x0e\n\x0clanding_pageB\x12\n\x10\x62usiness_settingB\x8b\x02\n&com.google.ads.googleads.v14.resourcesB\x19SmartCampaignSettingProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
      module V14
        module Resources
          SmartCampaignSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.SmartCampaignSetting").msgclass
          SmartCampaignSetting::PhoneNumber = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.SmartCampaignSetting.PhoneNumber").msgclass
          SmartCampaignSetting::AdOptimizedBusinessProfileSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.SmartCampaignSetting.AdOptimizedBusinessProfileSetting").msgclass
        end
      end
    end
  end
end
