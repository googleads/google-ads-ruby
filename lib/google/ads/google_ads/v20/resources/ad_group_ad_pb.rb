# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/ad_group_ad.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/common/policy_pb'
require 'google/ads/google_ads/v20/enums/ad_group_ad_primary_status_pb'
require 'google/ads/google_ads/v20/enums/ad_group_ad_primary_status_reason_pb'
require 'google/ads/google_ads/v20/enums/ad_group_ad_status_pb'
require 'google/ads/google_ads/v20/enums/ad_strength_pb'
require 'google/ads/google_ads/v20/enums/asset_automation_status_pb'
require 'google/ads/google_ads/v20/enums/asset_automation_type_pb'
require 'google/ads/google_ads/v20/enums/policy_approval_status_pb'
require 'google/ads/google_ads/v20/enums/policy_review_status_pb'
require 'google/ads/google_ads/v20/resources/ad_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n4google/ads/googleads/v20/resources/ad_group_ad.proto\x12\"google.ads.googleads.v20.resources\x1a,google/ads/googleads/v20/common/policy.proto\x1a?google/ads/googleads/v20/enums/ad_group_ad_primary_status.proto\x1a\x46google/ads/googleads/v20/enums/ad_group_ad_primary_status_reason.proto\x1a\x37google/ads/googleads/v20/enums/ad_group_ad_status.proto\x1a\x30google/ads/googleads/v20/enums/ad_strength.proto\x1a<google/ads/googleads/v20/enums/asset_automation_status.proto\x1a:google/ads/googleads/v20/enums/asset_automation_type.proto\x1a;google/ads/googleads/v20/enums/policy_approval_status.proto\x1a\x39google/ads/googleads/v20/enums/policy_review_status.proto\x1a+google/ads/googleads/v20/resources/ad.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x80\x08\n\tAdGroupAd\x12\x41\n\rresource_name\x18\x01 \x01(\tB*\xe0\x41\x05\xfa\x41$\n\"googleads.googleapis.com/AdGroupAd\x12S\n\x06status\x18\x03 \x01(\x0e\x32\x43.google.ads.googleads.v20.enums.AdGroupAdStatusEnum.AdGroupAdStatus\x12?\n\x08\x61\x64_group\x18\t \x01(\tB(\xe0\x41\x05\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x00\x88\x01\x01\x12\x37\n\x02\x61\x64\x18\x05 \x01(\x0b\x32&.google.ads.googleads.v20.resources.AdB\x03\xe0\x41\x05\x12W\n\x0epolicy_summary\x18\x06 \x01(\x0b\x32:.google.ads.googleads.v20.resources.AdGroupAdPolicySummaryB\x03\xe0\x41\x03\x12S\n\x0b\x61\x64_strength\x18\x07 \x01(\x0e\x32\x39.google.ads.googleads.v20.enums.AdStrengthEnum.AdStrengthB\x03\xe0\x41\x03\x12\x19\n\x0c\x61\x63tion_items\x18\r \x03(\tB\x03\xe0\x41\x03\x12?\n\x06labels\x18\n \x03(\tB/\xe0\x41\x03\xfa\x41)\n\'googleads.googleapis.com/AdGroupAdLabel\x12n\n\x0eprimary_status\x18\x10 \x01(\x0e\x32Q.google.ads.googleads.v20.enums.AdGroupAdPrimaryStatusEnum.AdGroupAdPrimaryStatusB\x03\xe0\x41\x03\x12\x82\x01\n\x16primary_status_reasons\x18\x11 \x03(\x0e\x32].google.ads.googleads.v20.enums.AdGroupAdPrimaryStatusReasonEnum.AdGroupAdPrimaryStatusReasonB\x03\xe0\x41\x03\x12r\n%ad_group_ad_asset_automation_settings\x18\x12 \x03(\x0b\x32\x43.google.ads.googleads.v20.resources.AdGroupAdAssetAutomationSetting:a\xea\x41^\n\"googleads.googleapis.com/AdGroupAd\x12\x38\x63ustomers/{customer_id}/adGroupAds/{ad_group_id}~{ad_id}B\x0b\n\t_ad_group\"\xc2\x02\n\x16\x41\x64GroupAdPolicySummary\x12T\n\x14policy_topic_entries\x18\x01 \x03(\x0b\x32\x31.google.ads.googleads.v20.common.PolicyTopicEntryB\x03\xe0\x41\x03\x12\x65\n\rreview_status\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v20.enums.PolicyReviewStatusEnum.PolicyReviewStatusB\x03\xe0\x41\x03\x12k\n\x0f\x61pproval_status\x18\x03 \x01(\x0e\x32M.google.ads.googleads.v20.enums.PolicyApprovalStatusEnum.PolicyApprovalStatusB\x03\xe0\x41\x03\"\xbf\x02\n\x1f\x41\x64GroupAdAssetAutomationSetting\x12o\n\x15\x61sset_automation_type\x18\x01 \x01(\x0e\x32K.google.ads.googleads.v20.enums.AssetAutomationTypeEnum.AssetAutomationTypeH\x00\x88\x01\x01\x12u\n\x17\x61sset_automation_status\x18\x02 \x01(\x0e\x32O.google.ads.googleads.v20.enums.AssetAutomationStatusEnum.AssetAutomationStatusH\x01\x88\x01\x01\x42\x18\n\x16_asset_automation_typeB\x1a\n\x18_asset_automation_statusB\x80\x02\n&com.google.ads.googleads.v20.resourcesB\x0e\x41\x64GroupAdProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v20.resources.Ad", "google/ads/googleads/v20/resources/ad.proto"],
    ["google.ads.googleads.v20.common.PolicyTopicEntry", "google/ads/googleads/v20/common/policy.proto"],
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
      module V20
        module Resources
          AdGroupAd = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.AdGroupAd").msgclass
          AdGroupAdPolicySummary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.AdGroupAdPolicySummary").msgclass
          AdGroupAdAssetAutomationSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.AdGroupAdAssetAutomationSetting").msgclass
        end
      end
    end
  end
end
