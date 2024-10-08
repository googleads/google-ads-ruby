# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/campaign_customizer.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/customizer_value_pb'
require 'google/ads/google_ads/v18/enums/customizer_value_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n<google/ads/googleads/v18/resources/campaign_customizer.proto\x12\"google.ads.googleads.v18.resources\x1a\x36google/ads/googleads/v18/common/customizer_value.proto\x1a<google/ads/googleads/v18/enums/customizer_value_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xa9\x04\n\x12\x43\x61mpaignCustomizer\x12J\n\rresource_name\x18\x01 \x01(\tB3\xe0\x41\x05\xfa\x41-\n+googleads.googleapis.com/CampaignCustomizer\x12;\n\x08\x63\x61mpaign\x18\x02 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/Campaign\x12U\n\x14\x63ustomizer_attribute\x18\x03 \x01(\tB7\xe0\x41\x02\xe0\x41\x05\xfa\x41.\n,googleads.googleapis.com/CustomizerAttribute\x12\x64\n\x06status\x18\x04 \x01(\x0e\x32O.google.ads.googleads.v18.enums.CustomizerValueStatusEnum.CustomizerValueStatusB\x03\xe0\x41\x03\x12\x44\n\x05value\x18\x05 \x01(\x0b\x32\x30.google.ads.googleads.v18.common.CustomizerValueB\x03\xe0\x41\x02:\x86\x01\xea\x41\x82\x01\n+googleads.googleapis.com/CampaignCustomizer\x12Scustomers/{customer_id}/campaignCustomizers/{campaign_id}~{customizer_attribute_id}B\x89\x02\n&com.google.ads.googleads.v18.resourcesB\x17\x43\x61mpaignCustomizerProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v18.common.CustomizerValue", "google/ads/googleads/v18/common/customizer_value.proto"],
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
          CampaignCustomizer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.CampaignCustomizer").msgclass
        end
      end
    end
  end
end
