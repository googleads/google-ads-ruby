# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/campaign_asset_set.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/enums/asset_set_link_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n;google/ads/googleads/v15/resources/campaign_asset_set.proto\x12\"google.ads.googleads.v15.resources\x1a:google/ads/googleads/v15/enums/asset_set_link_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xaf\x03\n\x10\x43\x61mpaignAssetSet\x12H\n\rresource_name\x18\x01 \x01(\tB1\xe0\x41\x05\xfa\x41+\n)googleads.googleapis.com/CampaignAssetSet\x12;\n\x08\x63\x61mpaign\x18\x02 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/Campaign\x12<\n\tasset_set\x18\x03 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/AssetSet\x12^\n\x06status\x18\x04 \x01(\x0e\x32I.google.ads.googleads.v15.enums.AssetSetLinkStatusEnum.AssetSetLinkStatusB\x03\xe0\x41\x03:v\xea\x41s\n)googleads.googleapis.com/CampaignAssetSet\x12\x46\x63ustomers/{customer_id}/campaignAssetSets/{campaign_id}~{asset_set_id}B\x87\x02\n&com.google.ads.googleads.v15.resourcesB\x15\x43\x61mpaignAssetSetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

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
      module V15
        module Resources
          CampaignAssetSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.CampaignAssetSet").msgclass
        end
      end
    end
  end
end
