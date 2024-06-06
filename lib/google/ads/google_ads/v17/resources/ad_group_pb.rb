# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/ad_group.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/common/custom_parameter_pb'
require 'google/ads/google_ads/v17/common/targeting_setting_pb'
require 'google/ads/google_ads/v17/enums/ad_group_ad_rotation_mode_pb'
require 'google/ads/google_ads/v17/enums/ad_group_primary_status_pb'
require 'google/ads/google_ads/v17/enums/ad_group_primary_status_reason_pb'
require 'google/ads/google_ads/v17/enums/ad_group_status_pb'
require 'google/ads/google_ads/v17/enums/ad_group_type_pb'
require 'google/ads/google_ads/v17/enums/asset_field_type_pb'
require 'google/ads/google_ads/v17/enums/asset_set_type_pb'
require 'google/ads/google_ads/v17/enums/bidding_source_pb'
require 'google/ads/google_ads/v17/enums/targeting_dimension_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n1google/ads/googleads/v17/resources/ad_group.proto\x12\"google.ads.googleads.v17.resources\x1a\x36google/ads/googleads/v17/common/custom_parameter.proto\x1a\x37google/ads/googleads/v17/common/targeting_setting.proto\x1a>google/ads/googleads/v17/enums/ad_group_ad_rotation_mode.proto\x1a<google/ads/googleads/v17/enums/ad_group_primary_status.proto\x1a\x43google/ads/googleads/v17/enums/ad_group_primary_status_reason.proto\x1a\x34google/ads/googleads/v17/enums/ad_group_status.proto\x1a\x32google/ads/googleads/v17/enums/ad_group_type.proto\x1a\x35google/ads/googleads/v17/enums/asset_field_type.proto\x1a\x33google/ads/googleads/v17/enums/asset_set_type.proto\x1a\x33google/ads/googleads/v17/enums/bidding_source.proto\x1a\x38google/ads/googleads/v17/enums/targeting_dimension.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xdf\x13\n\x07\x41\x64Group\x12?\n\rresource_name\x18\x01 \x01(\tB(\xe0\x41\x05\xfa\x41\"\n googleads.googleapis.com/AdGroup\x12\x14\n\x02id\x18\" \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x11\n\x04name\x18# \x01(\tH\x01\x88\x01\x01\x12O\n\x06status\x18\x05 \x01(\x0e\x32?.google.ads.googleads.v17.enums.AdGroupStatusEnum.AdGroupStatus\x12N\n\x04type\x18\x0c \x01(\x0e\x32;.google.ads.googleads.v17.enums.AdGroupTypeEnum.AdGroupTypeB\x03\xe0\x41\x05\x12i\n\x10\x61\x64_rotation_mode\x18\x16 \x01(\x0e\x32O.google.ads.googleads.v17.enums.AdGroupAdRotationModeEnum.AdGroupAdRotationMode\x12\x44\n\rbase_ad_group\x18$ \x01(\tB(\xe0\x41\x03\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x02\x88\x01\x01\x12\"\n\x15tracking_url_template\x18% \x01(\tH\x03\x88\x01\x01\x12O\n\x15url_custom_parameters\x18\x06 \x03(\x0b\x32\x30.google.ads.googleads.v17.common.CustomParameter\x12@\n\x08\x63\x61mpaign\x18& \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/CampaignH\x04\x88\x01\x01\x12\x1b\n\x0e\x63pc_bid_micros\x18\' \x01(\x03H\x05\x88\x01\x01\x12*\n\x18\x65\x66\x66\x65\x63tive_cpc_bid_micros\x18\x39 \x01(\x03\x42\x03\xe0\x41\x03H\x06\x88\x01\x01\x12\x1b\n\x0e\x63pm_bid_micros\x18( \x01(\x03H\x07\x88\x01\x01\x12\x1e\n\x11target_cpa_micros\x18) \x01(\x03H\x08\x88\x01\x01\x12\x1b\n\x0e\x63pv_bid_micros\x18* \x01(\x03H\t\x88\x01\x01\x12\x1e\n\x11target_cpm_micros\x18+ \x01(\x03H\n\x88\x01\x01\x12\x18\n\x0btarget_roas\x18, \x01(\x01H\x0b\x88\x01\x01\x12#\n\x16percent_cpc_bid_micros\x18- \x01(\x03H\x0c\x88\x01\x01\x12#\n\x1boptimized_targeting_enabled\x18; \x01(\x08\x12o\n\x1c\x64isplay_custom_bid_dimension\x18\x17 \x01(\x0e\x32I.google.ads.googleads.v17.enums.TargetingDimensionEnum.TargetingDimension\x12\x1d\n\x10\x66inal_url_suffix\x18. \x01(\tH\r\x88\x01\x01\x12L\n\x11targeting_setting\x18\x19 \x01(\x0b\x32\x31.google.ads.googleads.v17.common.TargetingSetting\x12Z\n\x10\x61udience_setting\x18\x38 \x01(\x0b\x32;.google.ads.googleads.v17.resources.AdGroup.AudienceSettingB\x03\xe0\x41\x05\x12-\n\x1b\x65\x66\x66\x65\x63tive_target_cpa_micros\x18/ \x01(\x03\x42\x03\xe0\x41\x03H\x0e\x88\x01\x01\x12i\n\x1b\x65\x66\x66\x65\x63tive_target_cpa_source\x18\x1d \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12\'\n\x15\x65\x66\x66\x65\x63tive_target_roas\x18\x30 \x01(\x01\x42\x03\xe0\x41\x03H\x0f\x88\x01\x01\x12j\n\x1c\x65\x66\x66\x65\x63tive_target_roas_source\x18  \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12=\n\x06labels\x18\x31 \x03(\tB-\xe0\x41\x03\xfa\x41\'\n%googleads.googleapis.com/AdGroupLabel\x12l\n!excluded_parent_asset_field_types\x18\x36 \x03(\x0e\x32\x41.google.ads.googleads.v17.enums.AssetFieldTypeEnum.AssetFieldType\x12\x66\n\x1f\x65xcluded_parent_asset_set_types\x18: \x03(\x0e\x32=.google.ads.googleads.v17.enums.AssetSetTypeEnum.AssetSetType\x12j\n\x0eprimary_status\x18> \x01(\x0e\x32M.google.ads.googleads.v17.enums.AdGroupPrimaryStatusEnum.AdGroupPrimaryStatusB\x03\xe0\x41\x03\x12~\n\x16primary_status_reasons\x18? \x03(\x0e\x32Y.google.ads.googleads.v17.enums.AdGroupPrimaryStatusReasonEnum.AdGroupPrimaryStatusReasonB\x03\xe0\x41\x03\x1a\x34\n\x0f\x41udienceSetting\x12!\n\x14use_audience_grouped\x18\x01 \x01(\x08\x42\x03\xe0\x41\x05:U\xea\x41R\n googleads.googleapis.com/AdGroup\x12.customers/{customer_id}/adGroups/{ad_group_id}B\x05\n\x03_idB\x07\n\x05_nameB\x10\n\x0e_base_ad_groupB\x18\n\x16_tracking_url_templateB\x0b\n\t_campaignB\x11\n\x0f_cpc_bid_microsB\x1b\n\x19_effective_cpc_bid_microsB\x11\n\x0f_cpm_bid_microsB\x14\n\x12_target_cpa_microsB\x11\n\x0f_cpv_bid_microsB\x14\n\x12_target_cpm_microsB\x0e\n\x0c_target_roasB\x19\n\x17_percent_cpc_bid_microsB\x13\n\x11_final_url_suffixB\x1e\n\x1c_effective_target_cpa_microsB\x18\n\x16_effective_target_roasB\xfe\x01\n&com.google.ads.googleads.v17.resourcesB\x0c\x41\x64GroupProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v17.common.CustomParameter", "google/ads/googleads/v17/common/custom_parameter.proto"],
    ["google.ads.googleads.v17.common.TargetingSetting", "google/ads/googleads/v17/common/targeting_setting.proto"],
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
      module V17
        module Resources
          AdGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AdGroup").msgclass
          AdGroup::AudienceSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AdGroup.AudienceSetting").msgclass
        end
      end
    end
  end
end
