# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v19/resources/change_event.proto

require 'google/protobuf'

require 'google/ads/google_ads/v19/enums/change_client_type_pb'
require 'google/ads/google_ads/v19/enums/change_event_resource_type_pb'
require 'google/ads/google_ads/v19/enums/resource_change_operation_pb'
require 'google/ads/google_ads/v19/resources/ad_pb'
require 'google/ads/google_ads/v19/resources/ad_group_pb'
require 'google/ads/google_ads/v19/resources/ad_group_ad_pb'
require 'google/ads/google_ads/v19/resources/ad_group_asset_pb'
require 'google/ads/google_ads/v19/resources/ad_group_bid_modifier_pb'
require 'google/ads/google_ads/v19/resources/ad_group_criterion_pb'
require 'google/ads/google_ads/v19/resources/asset_pb'
require 'google/ads/google_ads/v19/resources/asset_set_pb'
require 'google/ads/google_ads/v19/resources/asset_set_asset_pb'
require 'google/ads/google_ads/v19/resources/campaign_pb'
require 'google/ads/google_ads/v19/resources/campaign_asset_pb'
require 'google/ads/google_ads/v19/resources/campaign_asset_set_pb'
require 'google/ads/google_ads/v19/resources/campaign_budget_pb'
require 'google/ads/google_ads/v19/resources/campaign_criterion_pb'
require 'google/ads/google_ads/v19/resources/customer_asset_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\n5google/ads/googleads/v19/resources/change_event.proto\x12\"google.ads.googleads.v19.resources\x1a\x37google/ads/googleads/v19/enums/change_client_type.proto\x1a?google/ads/googleads/v19/enums/change_event_resource_type.proto\x1a>google/ads/googleads/v19/enums/resource_change_operation.proto\x1a+google/ads/googleads/v19/resources/ad.proto\x1a\x31google/ads/googleads/v19/resources/ad_group.proto\x1a\x34google/ads/googleads/v19/resources/ad_group_ad.proto\x1a\x37google/ads/googleads/v19/resources/ad_group_asset.proto\x1a>google/ads/googleads/v19/resources/ad_group_bid_modifier.proto\x1a;google/ads/googleads/v19/resources/ad_group_criterion.proto\x1a.google/ads/googleads/v19/resources/asset.proto\x1a\x32google/ads/googleads/v19/resources/asset_set.proto\x1a\x38google/ads/googleads/v19/resources/asset_set_asset.proto\x1a\x31google/ads/googleads/v19/resources/campaign.proto\x1a\x37google/ads/googleads/v19/resources/campaign_asset.proto\x1a;google/ads/googleads/v19/resources/campaign_asset_set.proto\x1a\x38google/ads/googleads/v19/resources/campaign_budget.proto\x1a;google/ads/googleads/v19/resources/campaign_criterion.proto\x1a\x37google/ads/googleads/v19/resources/customer_asset.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\"\xc0\x11\n\x0b\x43hangeEvent\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x03\xfa\x41&\n$googleads.googleapis.com/ChangeEvent\x12\x1d\n\x10\x63hange_date_time\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12v\n\x14\x63hange_resource_type\x18\x03 \x01(\x0e\x32S.google.ads.googleads.v19.enums.ChangeEventResourceTypeEnum.ChangeEventResourceTypeB\x03\xe0\x41\x03\x12!\n\x14\x63hange_resource_name\x18\x04 \x01(\tB\x03\xe0\x41\x03\x12_\n\x0b\x63lient_type\x18\x05 \x01(\x0e\x32\x45.google.ads.googleads.v19.enums.ChangeClientTypeEnum.ChangeClientTypeB\x03\xe0\x41\x03\x12\x17\n\nuser_email\x18\x06 \x01(\tB\x03\xe0\x41\x03\x12Z\n\x0cold_resource\x18\x07 \x01(\x0b\x32?.google.ads.googleads.v19.resources.ChangeEvent.ChangedResourceB\x03\xe0\x41\x03\x12Z\n\x0cnew_resource\x18\x08 \x01(\x0b\x32?.google.ads.googleads.v19.resources.ChangeEvent.ChangedResourceB\x03\xe0\x41\x03\x12{\n\x19resource_change_operation\x18\t \x01(\x0e\x32S.google.ads.googleads.v19.enums.ResourceChangeOperationEnum.ResourceChangeOperationB\x03\xe0\x41\x03\x12\x37\n\x0e\x63hanged_fields\x18\n \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x03\x12;\n\x08\x63\x61mpaign\x18\x0b \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12:\n\x08\x61\x64_group\x18\x0c \x01(\tB(\xe0\x41\x03\xfa\x41\"\n googleads.googleapis.com/AdGroup\x12\x35\n\x05\x61sset\x18\x14 \x01(\tB&\xe0\x41\x03\xfa\x41 \n\x1egoogleads.googleapis.com/Asset\x1a\x95\t\n\x0f\x43hangedResource\x12\x37\n\x02\x61\x64\x18\x01 \x01(\x0b\x32&.google.ads.googleads.v19.resources.AdB\x03\xe0\x41\x03\x12\x42\n\x08\x61\x64_group\x18\x02 \x01(\x0b\x32+.google.ads.googleads.v19.resources.AdGroupB\x03\xe0\x41\x03\x12U\n\x12\x61\x64_group_criterion\x18\x03 \x01(\x0b\x32\x34.google.ads.googleads.v19.resources.AdGroupCriterionB\x03\xe0\x41\x03\x12\x43\n\x08\x63\x61mpaign\x18\x04 \x01(\x0b\x32,.google.ads.googleads.v19.resources.CampaignB\x03\xe0\x41\x03\x12P\n\x0f\x63\x61mpaign_budget\x18\x05 \x01(\x0b\x32\x32.google.ads.googleads.v19.resources.CampaignBudgetB\x03\xe0\x41\x03\x12Z\n\x15\x61\x64_group_bid_modifier\x18\x06 \x01(\x0b\x32\x36.google.ads.googleads.v19.resources.AdGroupBidModifierB\x03\xe0\x41\x03\x12V\n\x12\x63\x61mpaign_criterion\x18\x07 \x01(\x0b\x32\x35.google.ads.googleads.v19.resources.CampaignCriterionB\x03\xe0\x41\x03\x12G\n\x0b\x61\x64_group_ad\x18\x0c \x01(\x0b\x32-.google.ads.googleads.v19.resources.AdGroupAdB\x03\xe0\x41\x03\x12=\n\x05\x61sset\x18\r \x01(\x0b\x32).google.ads.googleads.v19.resources.AssetB\x03\xe0\x41\x03\x12N\n\x0e\x63ustomer_asset\x18\x0e \x01(\x0b\x32\x31.google.ads.googleads.v19.resources.CustomerAssetB\x03\xe0\x41\x03\x12N\n\x0e\x63\x61mpaign_asset\x18\x0f \x01(\x0b\x32\x31.google.ads.googleads.v19.resources.CampaignAssetB\x03\xe0\x41\x03\x12M\n\x0e\x61\x64_group_asset\x18\x10 \x01(\x0b\x32\x30.google.ads.googleads.v19.resources.AdGroupAssetB\x03\xe0\x41\x03\x12\x44\n\tasset_set\x18\x11 \x01(\x0b\x32,.google.ads.googleads.v19.resources.AssetSetB\x03\xe0\x41\x03\x12O\n\x0f\x61sset_set_asset\x18\x12 \x01(\x0b\x32\x31.google.ads.googleads.v19.resources.AssetSetAssetB\x03\xe0\x41\x03\x12U\n\x12\x63\x61mpaign_asset_set\x18\x13 \x01(\x0b\x32\x34.google.ads.googleads.v19.resources.CampaignAssetSetB\x03\xe0\x41\x03:\x81\x01\xea\x41~\n$googleads.googleapis.com/ChangeEvent\x12Vcustomers/{customer_id}/changeEvents/{timestamp_micros}~{command_index}~{mutate_index}B\x82\x02\n&com.google.ads.googleads.v19.resourcesB\x10\x43hangeEventProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v19/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V19.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V19\\Resources\xea\x02&Google::Ads::GoogleAds::V19::Resourcesb\x06proto3"

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
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v19.resources.Ad", "google/ads/googleads/v19/resources/ad.proto"],
    ["google.ads.googleads.v19.resources.AdGroup", "google/ads/googleads/v19/resources/ad_group.proto"],
    ["google.ads.googleads.v19.resources.AdGroupCriterion", "google/ads/googleads/v19/resources/ad_group_criterion.proto"],
    ["google.ads.googleads.v19.resources.Campaign", "google/ads/googleads/v19/resources/campaign.proto"],
    ["google.ads.googleads.v19.resources.CampaignBudget", "google/ads/googleads/v19/resources/campaign_budget.proto"],
    ["google.ads.googleads.v19.resources.AdGroupBidModifier", "google/ads/googleads/v19/resources/ad_group_bid_modifier.proto"],
    ["google.ads.googleads.v19.resources.CampaignCriterion", "google/ads/googleads/v19/resources/campaign_criterion.proto"],
    ["google.ads.googleads.v19.resources.AdGroupAd", "google/ads/googleads/v19/resources/ad_group_ad.proto"],
    ["google.ads.googleads.v19.resources.Asset", "google/ads/googleads/v19/resources/asset.proto"],
    ["google.ads.googleads.v19.resources.CustomerAsset", "google/ads/googleads/v19/resources/customer_asset.proto"],
    ["google.ads.googleads.v19.resources.CampaignAsset", "google/ads/googleads/v19/resources/campaign_asset.proto"],
    ["google.ads.googleads.v19.resources.AdGroupAsset", "google/ads/googleads/v19/resources/ad_group_asset.proto"],
    ["google.ads.googleads.v19.resources.AssetSet", "google/ads/googleads/v19/resources/asset_set.proto"],
    ["google.ads.googleads.v19.resources.AssetSetAsset", "google/ads/googleads/v19/resources/asset_set_asset.proto"],
    ["google.ads.googleads.v19.resources.CampaignAssetSet", "google/ads/googleads/v19/resources/campaign_asset_set.proto"],
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
      module V19
        module Resources
          ChangeEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.resources.ChangeEvent").msgclass
          ChangeEvent::ChangedResource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.resources.ChangeEvent.ChangedResource").msgclass
        end
      end
    end
  end
end
