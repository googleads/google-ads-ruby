# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/common/asset_policy.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/policy_pb'
require 'google/ads/google_ads/v18/enums/asset_link_primary_status_pb'
require 'google/ads/google_ads/v18/enums/asset_link_primary_status_reason_pb'
require 'google/ads/google_ads/v18/enums/asset_offline_evaluation_error_reasons_pb'
require 'google/ads/google_ads/v18/enums/policy_approval_status_pb'
require 'google/ads/google_ads/v18/enums/policy_review_status_pb'


descriptor_data = "\n2google/ads/googleads/v18/common/asset_policy.proto\x12\x1fgoogle.ads.googleads.v18.common\x1a,google/ads/googleads/v18/common/policy.proto\x1a>google/ads/googleads/v18/enums/asset_link_primary_status.proto\x1a\x45google/ads/googleads/v18/enums/asset_link_primary_status_reason.proto\x1aKgoogle/ads/googleads/v18/enums/asset_offline_evaluation_error_reasons.proto\x1a;google/ads/googleads/v18/enums/policy_approval_status.proto\x1a\x39google/ads/googleads/v18/enums/policy_review_status.proto\"\xb1\x02\n\x14\x41\x64\x41ssetPolicySummary\x12O\n\x14policy_topic_entries\x18\x01 \x03(\x0b\x32\x31.google.ads.googleads.v18.common.PolicyTopicEntry\x12`\n\rreview_status\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v18.enums.PolicyReviewStatusEnum.PolicyReviewStatus\x12\x66\n\x0f\x61pproval_status\x18\x03 \x01(\x0e\x32M.google.ads.googleads.v18.enums.PolicyApprovalStatusEnum.PolicyApprovalStatus\"\xec\x02\n\x1d\x41ssetLinkPrimaryStatusDetails\x12r\n\x06reason\x18\x01 \x01(\x0e\x32].google.ads.googleads.v18.enums.AssetLinkPrimaryStatusReasonEnum.AssetLinkPrimaryStatusReasonH\x01\x88\x01\x01\x12\x66\n\x06status\x18\x02 \x01(\x0e\x32Q.google.ads.googleads.v18.enums.AssetLinkPrimaryStatusEnum.AssetLinkPrimaryStatusH\x02\x88\x01\x01\x12N\n\x11\x61sset_disapproved\x18\x03 \x01(\x0b\x32\x31.google.ads.googleads.v18.common.AssetDisapprovedH\x00\x42\t\n\x07\x64\x65tailsB\t\n\x07_reasonB\t\n\x07_status\"\xa8\x01\n\x10\x41ssetDisapproved\x12\x93\x01\n offline_evaluation_error_reasons\x18\x01 \x03(\x0e\x32i.google.ads.googleads.v18.enums.AssetOfflineEvaluationErrorReasonsEnum.AssetOfflineEvaluationErrorReasonsB\xf0\x01\n#com.google.ads.googleads.v18.commonB\x10\x41ssetPolicyProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Common\xea\x02#Google::Ads::GoogleAds::V18::Commonb\x06proto3"

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
    ["google.ads.googleads.v18.common.PolicyTopicEntry", "google/ads/googleads/v18/common/policy.proto"],
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
        module Common
          AdAssetPolicySummary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.common.AdAssetPolicySummary").msgclass
          AssetLinkPrimaryStatusDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.common.AssetLinkPrimaryStatusDetails").msgclass
          AssetDisapproved = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.common.AssetDisapproved").msgclass
        end
      end
    end
  end
end
