# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/ad_group_criterion.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/common/criteria_pb'
require 'google/ads/google_ads/v17/common/custom_parameter_pb'
require 'google/ads/google_ads/v17/enums/ad_group_criterion_approval_status_pb'
require 'google/ads/google_ads/v17/enums/ad_group_criterion_primary_status_pb'
require 'google/ads/google_ads/v17/enums/ad_group_criterion_primary_status_reason_pb'
require 'google/ads/google_ads/v17/enums/ad_group_criterion_status_pb'
require 'google/ads/google_ads/v17/enums/bidding_source_pb'
require 'google/ads/google_ads/v17/enums/criterion_system_serving_status_pb'
require 'google/ads/google_ads/v17/enums/criterion_type_pb'
require 'google/ads/google_ads/v17/enums/quality_score_bucket_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n;google/ads/googleads/v17/resources/ad_group_criterion.proto\x12\"google.ads.googleads.v17.resources\x1a.google/ads/googleads/v17/common/criteria.proto\x1a\x36google/ads/googleads/v17/common/custom_parameter.proto\x1aGgoogle/ads/googleads/v17/enums/ad_group_criterion_approval_status.proto\x1a\x46google/ads/googleads/v17/enums/ad_group_criterion_primary_status.proto\x1aMgoogle/ads/googleads/v17/enums/ad_group_criterion_primary_status_reason.proto\x1a>google/ads/googleads/v17/enums/ad_group_criterion_status.proto\x1a\x33google/ads/googleads/v17/enums/bidding_source.proto\x1a\x44google/ads/googleads/v17/enums/criterion_system_serving_status.proto\x1a\x33google/ads/googleads/v17/enums/criterion_type.proto\x1a\x39google/ads/googleads/v17/enums/quality_score_bucket.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe9)\n\x10\x41\x64GroupCriterion\x12H\n\rresource_name\x18\x01 \x01(\tB1\xe0\x41\x05\xfa\x41+\n)googleads.googleapis.com/AdGroupCriterion\x12\x1e\n\x0c\x63riterion_id\x18\x38 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x19\n\x0c\x64isplay_name\x18M \x01(\tB\x03\xe0\x41\x03\x12\x61\n\x06status\x18\x03 \x01(\x0e\x32Q.google.ads.googleads.v17.enums.AdGroupCriterionStatusEnum.AdGroupCriterionStatus\x12[\n\x0cquality_info\x18\x04 \x01(\x0b\x32@.google.ads.googleads.v17.resources.AdGroupCriterion.QualityInfoB\x03\xe0\x41\x03\x12?\n\x08\x61\x64_group\x18\x39 \x01(\tB(\xe0\x41\x05\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x02\x88\x01\x01\x12R\n\x04type\x18\x19 \x01(\x0e\x32?.google.ads.googleads.v17.enums.CriterionTypeEnum.CriterionTypeB\x03\xe0\x41\x03\x12\x1a\n\x08negative\x18: \x01(\x08\x42\x03\xe0\x41\x05H\x03\x88\x01\x01\x12\x81\x01\n\x15system_serving_status\x18\x34 \x01(\x0e\x32].google.ads.googleads.v17.enums.CriterionSystemServingStatusEnum.CriterionSystemServingStatusB\x03\xe0\x41\x03\x12\x7f\n\x0f\x61pproval_status\x18\x35 \x01(\x0e\x32\x61.google.ads.googleads.v17.enums.AdGroupCriterionApprovalStatusEnum.AdGroupCriterionApprovalStatusB\x03\xe0\x41\x03\x12 \n\x13\x64isapproval_reasons\x18; \x03(\tB\x03\xe0\x41\x03\x12\x46\n\x06labels\x18< \x03(\tB6\xe0\x41\x03\xfa\x41\x30\n.googleads.googleapis.com/AdGroupCriterionLabel\x12\x19\n\x0c\x62id_modifier\x18= \x01(\x01H\x04\x88\x01\x01\x12\x1b\n\x0e\x63pc_bid_micros\x18> \x01(\x03H\x05\x88\x01\x01\x12\x1b\n\x0e\x63pm_bid_micros\x18? \x01(\x03H\x06\x88\x01\x01\x12\x1b\n\x0e\x63pv_bid_micros\x18@ \x01(\x03H\x07\x88\x01\x01\x12#\n\x16percent_cpc_bid_micros\x18\x41 \x01(\x03H\x08\x88\x01\x01\x12*\n\x18\x65\x66\x66\x65\x63tive_cpc_bid_micros\x18\x42 \x01(\x03\x42\x03\xe0\x41\x03H\t\x88\x01\x01\x12*\n\x18\x65\x66\x66\x65\x63tive_cpm_bid_micros\x18\x43 \x01(\x03\x42\x03\xe0\x41\x03H\n\x88\x01\x01\x12*\n\x18\x65\x66\x66\x65\x63tive_cpv_bid_micros\x18\x44 \x01(\x03\x42\x03\xe0\x41\x03H\x0b\x88\x01\x01\x12\x32\n effective_percent_cpc_bid_micros\x18\x45 \x01(\x03\x42\x03\xe0\x41\x03H\x0c\x88\x01\x01\x12\x66\n\x18\x65\x66\x66\x65\x63tive_cpc_bid_source\x18\x15 \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12\x66\n\x18\x65\x66\x66\x65\x63tive_cpm_bid_source\x18\x16 \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12\x66\n\x18\x65\x66\x66\x65\x63tive_cpv_bid_source\x18\x17 \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12n\n effective_percent_cpc_bid_source\x18# \x01(\x0e\x32?.google.ads.googleads.v17.enums.BiddingSourceEnum.BiddingSourceB\x03\xe0\x41\x03\x12g\n\x12position_estimates\x18\n \x01(\x0b\x32\x46.google.ads.googleads.v17.resources.AdGroupCriterion.PositionEstimatesB\x03\xe0\x41\x03\x12\x12\n\nfinal_urls\x18\x46 \x03(\t\x12\x19\n\x11\x66inal_mobile_urls\x18G \x03(\t\x12\x1d\n\x10\x66inal_url_suffix\x18H \x01(\tH\r\x88\x01\x01\x12\"\n\x15tracking_url_template\x18I \x01(\tH\x0e\x88\x01\x01\x12O\n\x15url_custom_parameters\x18\x0e \x03(\x0b\x32\x30.google.ads.googleads.v17.common.CustomParameter\x12\x81\x01\n\x0eprimary_status\x18U \x01(\x0e\x32_.google.ads.googleads.v17.enums.AdGroupCriterionPrimaryStatusEnum.AdGroupCriterionPrimaryStatusB\x03\xe0\x41\x03H\x0f\x88\x01\x01\x12\x90\x01\n\x16primary_status_reasons\x18V \x03(\x0e\x32k.google.ads.googleads.v17.enums.AdGroupCriterionPrimaryStatusReasonEnum.AdGroupCriterionPrimaryStatusReasonB\x03\xe0\x41\x03\x12\x44\n\x07keyword\x18\x1b \x01(\x0b\x32,.google.ads.googleads.v17.common.KeywordInfoB\x03\xe0\x41\x05H\x00\x12H\n\tplacement\x18\x1c \x01(\x0b\x32..google.ads.googleads.v17.common.PlacementInfoB\x03\xe0\x41\x05H\x00\x12Z\n\x13mobile_app_category\x18\x1d \x01(\x0b\x32\x36.google.ads.googleads.v17.common.MobileAppCategoryInfoB\x03\xe0\x41\x05H\x00\x12Y\n\x12mobile_application\x18\x1e \x01(\x0b\x32\x36.google.ads.googleads.v17.common.MobileApplicationInfoB\x03\xe0\x41\x05H\x00\x12O\n\rlisting_group\x18  \x01(\x0b\x32\x31.google.ads.googleads.v17.common.ListingGroupInfoB\x03\xe0\x41\x05H\x00\x12G\n\tage_range\x18$ \x01(\x0b\x32-.google.ads.googleads.v17.common.AgeRangeInfoB\x03\xe0\x41\x05H\x00\x12\x42\n\x06gender\x18% \x01(\x0b\x32+.google.ads.googleads.v17.common.GenderInfoB\x03\xe0\x41\x05H\x00\x12M\n\x0cincome_range\x18& \x01(\x0b\x32\x30.google.ads.googleads.v17.common.IncomeRangeInfoB\x03\xe0\x41\x05H\x00\x12S\n\x0fparental_status\x18\' \x01(\x0b\x32\x33.google.ads.googleads.v17.common.ParentalStatusInfoB\x03\xe0\x41\x05H\x00\x12G\n\tuser_list\x18* \x01(\x0b\x32-.google.ads.googleads.v17.common.UserListInfoB\x03\xe0\x41\x05H\x00\x12O\n\ryoutube_video\x18( \x01(\x0b\x32\x31.google.ads.googleads.v17.common.YouTubeVideoInfoB\x03\xe0\x41\x05H\x00\x12S\n\x0fyoutube_channel\x18) \x01(\x0b\x32\x33.google.ads.googleads.v17.common.YouTubeChannelInfoB\x03\xe0\x41\x05H\x00\x12@\n\x05topic\x18+ \x01(\x0b\x32*.google.ads.googleads.v17.common.TopicInfoB\x03\xe0\x41\x05H\x00\x12O\n\ruser_interest\x18- \x01(\x0b\x32\x31.google.ads.googleads.v17.common.UserInterestInfoB\x03\xe0\x41\x05H\x00\x12\x44\n\x07webpage\x18. \x01(\x0b\x32,.google.ads.googleads.v17.common.WebpageInfoB\x03\xe0\x41\x05H\x00\x12V\n\x11\x61pp_payment_model\x18/ \x01(\x0b\x32\x34.google.ads.googleads.v17.common.AppPaymentModelInfoB\x03\xe0\x41\x05H\x00\x12S\n\x0f\x63ustom_affinity\x18\x30 \x01(\x0b\x32\x33.google.ads.googleads.v17.common.CustomAffinityInfoB\x03\xe0\x41\x05H\x00\x12O\n\rcustom_intent\x18\x31 \x01(\x0b\x32\x31.google.ads.googleads.v17.common.CustomIntentInfoB\x03\xe0\x41\x05H\x00\x12S\n\x0f\x63ustom_audience\x18J \x01(\x0b\x32\x33.google.ads.googleads.v17.common.CustomAudienceInfoB\x03\xe0\x41\x05H\x00\x12W\n\x11\x63ombined_audience\x18K \x01(\x0b\x32\x35.google.ads.googleads.v17.common.CombinedAudienceInfoB\x03\xe0\x41\x05H\x00\x12\x46\n\x08\x61udience\x18O \x01(\x0b\x32-.google.ads.googleads.v17.common.AudienceInfoB\x03\xe0\x41\x05H\x00\x12\x46\n\x08location\x18R \x01(\x0b\x32-.google.ads.googleads.v17.common.LocationInfoB\x03\xe0\x41\x05H\x00\x12\x46\n\x08language\x18S \x01(\x0b\x32-.google.ads.googleads.v17.common.LanguageInfoB\x03\xe0\x41\x05H\x00\x1a\x90\x03\n\x0bQualityInfo\x12\x1f\n\rquality_score\x18\x05 \x01(\x05\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12n\n\x16\x63reative_quality_score\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v17.enums.QualityScoreBucketEnum.QualityScoreBucketB\x03\xe0\x41\x03\x12p\n\x18post_click_quality_score\x18\x03 \x01(\x0e\x32I.google.ads.googleads.v17.enums.QualityScoreBucketEnum.QualityScoreBucketB\x03\xe0\x41\x03\x12l\n\x14search_predicted_ctr\x18\x04 \x01(\x0e\x32I.google.ads.googleads.v17.enums.QualityScoreBucketEnum.QualityScoreBucketB\x03\xe0\x41\x03\x42\x10\n\x0e_quality_score\x1a\xbc\x03\n\x11PositionEstimates\x12\'\n\x15\x66irst_page_cpc_micros\x18\x06 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12+\n\x19\x66irst_position_cpc_micros\x18\x07 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12(\n\x16top_of_page_cpc_micros\x18\x08 \x01(\x03\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12<\n*estimated_add_clicks_at_first_position_cpc\x18\t \x01(\x03\x42\x03\xe0\x41\x03H\x03\x88\x01\x01\x12:\n(estimated_add_cost_at_first_position_cpc\x18\n \x01(\x03\x42\x03\xe0\x41\x03H\x04\x88\x01\x01\x42\x18\n\x16_first_page_cpc_microsB\x1c\n\x1a_first_position_cpc_microsB\x19\n\x17_top_of_page_cpc_microsB-\n+_estimated_add_clicks_at_first_position_cpcB+\n)_estimated_add_cost_at_first_position_cpc:t\xea\x41q\n)googleads.googleapis.com/AdGroupCriterion\x12\x44\x63ustomers/{customer_id}/adGroupCriteria/{ad_group_id}~{criterion_id}B\x0b\n\tcriterionB\x0f\n\r_criterion_idB\x0b\n\t_ad_groupB\x0b\n\t_negativeB\x0f\n\r_bid_modifierB\x11\n\x0f_cpc_bid_microsB\x11\n\x0f_cpm_bid_microsB\x11\n\x0f_cpv_bid_microsB\x19\n\x17_percent_cpc_bid_microsB\x1b\n\x19_effective_cpc_bid_microsB\x1b\n\x19_effective_cpm_bid_microsB\x1b\n\x19_effective_cpv_bid_microsB#\n!_effective_percent_cpc_bid_microsB\x13\n\x11_final_url_suffixB\x18\n\x16_tracking_url_templateB\x11\n\x0f_primary_statusB\x87\x02\n&com.google.ads.googleads.v17.resourcesB\x15\x41\x64GroupCriterionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v17.common.KeywordInfo", "google/ads/googleads/v17/common/criteria.proto"],
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
          AdGroupCriterion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AdGroupCriterion").msgclass
          AdGroupCriterion::QualityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AdGroupCriterion.QualityInfo").msgclass
          AdGroupCriterion::PositionEstimates = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AdGroupCriterion.PositionEstimates").msgclass
        end
      end
    end
  end
end
