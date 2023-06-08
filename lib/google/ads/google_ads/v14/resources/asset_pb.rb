# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/asset.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/asset_types_pb'
require 'google/ads/google_ads/v14/common/custom_parameter_pb'
require 'google/ads/google_ads/v14/common/policy_pb'
require 'google/ads/google_ads/v14/enums/asset_field_type_pb'
require 'google/ads/google_ads/v14/enums/asset_source_pb'
require 'google/ads/google_ads/v14/enums/asset_type_pb'
require 'google/ads/google_ads/v14/enums/policy_approval_status_pb'
require 'google/ads/google_ads/v14/enums/policy_review_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n.google/ads/googleads/v14/resources/asset.proto\x12\"google.ads.googleads.v14.resources\x1a\x31google/ads/googleads/v14/common/asset_types.proto\x1a\x36google/ads/googleads/v14/common/custom_parameter.proto\x1a,google/ads/googleads/v14/common/policy.proto\x1a\x35google/ads/googleads/v14/enums/asset_field_type.proto\x1a\x31google/ads/googleads/v14/enums/asset_source.proto\x1a/google/ads/googleads/v14/enums/asset_type.proto\x1a;google/ads/googleads/v14/enums/policy_approval_status.proto\x1a\x39google/ads/googleads/v14/enums/policy_review_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xec\x17\n\x05\x41sset\x12=\n\rresource_name\x18\x01 \x01(\tB&\xe0\x41\x05\xfa\x41 \n\x1egoogleads.googleapis.com/Asset\x12\x14\n\x02id\x18\x0b \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x11\n\x04name\x18\x0c \x01(\tH\x02\x88\x01\x01\x12J\n\x04type\x18\x04 \x01(\x0e\x32\x37.google.ads.googleads.v14.enums.AssetTypeEnum.AssetTypeB\x03\xe0\x41\x03\x12\x12\n\nfinal_urls\x18\x0e \x03(\t\x12\x19\n\x11\x66inal_mobile_urls\x18\x10 \x03(\t\x12\"\n\x15tracking_url_template\x18\x11 \x01(\tH\x03\x88\x01\x01\x12O\n\x15url_custom_parameters\x18\x12 \x03(\x0b\x32\x30.google.ads.googleads.v14.common.CustomParameter\x12\x1d\n\x10\x66inal_url_suffix\x18\x13 \x01(\tH\x04\x88\x01\x01\x12P\n\x06source\x18& \x01(\x0e\x32;.google.ads.googleads.v14.enums.AssetSourceEnum.AssetSourceB\x03\xe0\x41\x03\x12S\n\x0epolicy_summary\x18\r \x01(\x0b\x32\x36.google.ads.googleads.v14.resources.AssetPolicySummaryB\x03\xe0\x41\x03\x12i\n\x1b\x66ield_type_policy_summaries\x18( \x03(\x0b\x32?.google.ads.googleads.v14.resources.AssetFieldTypePolicySummaryB\x03\xe0\x41\x03\x12V\n\x13youtube_video_asset\x18\x05 \x01(\x0b\x32\x32.google.ads.googleads.v14.common.YoutubeVideoAssetB\x03\xe0\x41\x05H\x00\x12T\n\x12media_bundle_asset\x18\x06 \x01(\x0b\x32\x31.google.ads.googleads.v14.common.MediaBundleAssetB\x03\xe0\x41\x05H\x00\x12G\n\x0bimage_asset\x18\x07 \x01(\x0b\x32+.google.ads.googleads.v14.common.ImageAssetB\x03\xe0\x41\x03H\x00\x12\x45\n\ntext_asset\x18\x08 \x01(\x0b\x32*.google.ads.googleads.v14.common.TextAssetB\x03\xe0\x41\x05H\x00\x12I\n\x0flead_form_asset\x18\t \x01(\x0b\x32..google.ads.googleads.v14.common.LeadFormAssetH\x00\x12R\n\x14\x62ook_on_google_asset\x18\n \x01(\x0b\x32\x32.google.ads.googleads.v14.common.BookOnGoogleAssetH\x00\x12J\n\x0fpromotion_asset\x18\x0f \x01(\x0b\x32/.google.ads.googleads.v14.common.PromotionAssetH\x00\x12\x46\n\rcallout_asset\x18\x14 \x01(\x0b\x32-.google.ads.googleads.v14.common.CalloutAssetH\x00\x12[\n\x18structured_snippet_asset\x18\x15 \x01(\x0b\x32\x37.google.ads.googleads.v14.common.StructuredSnippetAssetH\x00\x12H\n\x0esitelink_asset\x18\x16 \x01(\x0b\x32..google.ads.googleads.v14.common.SitelinkAssetH\x00\x12I\n\x0fpage_feed_asset\x18\x17 \x01(\x0b\x32..google.ads.googleads.v14.common.PageFeedAssetH\x00\x12Y\n\x17\x64ynamic_education_asset\x18\x18 \x01(\x0b\x32\x36.google.ads.googleads.v14.common.DynamicEducationAssetH\x00\x12K\n\x10mobile_app_asset\x18\x19 \x01(\x0b\x32/.google.ads.googleads.v14.common.MobileAppAssetH\x00\x12Q\n\x13hotel_callout_asset\x18\x1a \x01(\x0b\x32\x32.google.ads.googleads.v14.common.HotelCalloutAssetH\x00\x12@\n\ncall_asset\x18\x1b \x01(\x0b\x32*.google.ads.googleads.v14.common.CallAssetH\x00\x12\x42\n\x0bprice_asset\x18\x1c \x01(\x0b\x32+.google.ads.googleads.v14.common.PriceAssetH\x00\x12W\n\x14\x63\x61ll_to_action_asset\x18\x1d \x01(\x0b\x32\x32.google.ads.googleads.v14.common.CallToActionAssetB\x03\xe0\x41\x05H\x00\x12\\\n\x19\x64ynamic_real_estate_asset\x18\x1e \x01(\x0b\x32\x37.google.ads.googleads.v14.common.DynamicRealEstateAssetH\x00\x12S\n\x14\x64ynamic_custom_asset\x18\x1f \x01(\x0b\x32\x33.google.ads.googleads.v14.common.DynamicCustomAssetH\x00\x12i\n dynamic_hotels_and_rentals_asset\x18  \x01(\x0b\x32=.google.ads.googleads.v14.common.DynamicHotelsAndRentalsAssetH\x00\x12U\n\x15\x64ynamic_flights_asset\x18! \x01(\x0b\x32\x34.google.ads.googleads.v14.common.DynamicFlightsAssetH\x00\x12i\n\x1d\x64iscovery_carousel_card_asset\x18\" \x01(\x0b\x32;.google.ads.googleads.v14.common.DiscoveryCarouselCardAssetB\x03\xe0\x41\x05H\x00\x12S\n\x14\x64ynamic_travel_asset\x18# \x01(\x0b\x32\x33.google.ads.googleads.v14.common.DynamicTravelAssetH\x00\x12Q\n\x13\x64ynamic_local_asset\x18$ \x01(\x0b\x32\x32.google.ads.googleads.v14.common.DynamicLocalAssetH\x00\x12O\n\x12\x64ynamic_jobs_asset\x18% \x01(\x0b\x32\x31.google.ads.googleads.v14.common.DynamicJobsAssetH\x00\x12M\n\x0elocation_asset\x18\' \x01(\x0b\x32..google.ads.googleads.v14.common.LocationAssetB\x03\xe0\x41\x03H\x00\x12X\n\x14hotel_property_asset\x18) \x01(\x0b\x32\x33.google.ads.googleads.v14.common.HotelPropertyAssetB\x03\xe0\x41\x05H\x00:N\xea\x41K\n\x1egoogleads.googleapis.com/Asset\x12)customers/{customer_id}/assets/{asset_id}B\x0c\n\nasset_dataB\x05\n\x03_idB\x07\n\x05_nameB\x18\n\x16_tracking_url_templateB\x13\n\x11_final_url_suffix\"\xfe\x02\n\x1b\x41ssetFieldTypePolicySummary\x12\x65\n\x10\x61sset_field_type\x18\x01 \x01(\x0e\x32\x41.google.ads.googleads.v14.enums.AssetFieldTypeEnum.AssetFieldTypeB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12[\n\x0c\x61sset_source\x18\x02 \x01(\x0e\x32;.google.ads.googleads.v14.enums.AssetSourceEnum.AssetSourceB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12]\n\x13policy_summary_info\x18\x03 \x01(\x0b\x32\x36.google.ads.googleads.v14.resources.AssetPolicySummaryB\x03\xe0\x41\x03H\x02\x88\x01\x01\x42\x13\n\x11_asset_field_typeB\x0f\n\r_asset_sourceB\x16\n\x14_policy_summary_info\"\xbe\x02\n\x12\x41ssetPolicySummary\x12T\n\x14policy_topic_entries\x18\x01 \x03(\x0b\x32\x31.google.ads.googleads.v14.common.PolicyTopicEntryB\x03\xe0\x41\x03\x12\x65\n\rreview_status\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v14.enums.PolicyReviewStatusEnum.PolicyReviewStatusB\x03\xe0\x41\x03\x12k\n\x0f\x61pproval_status\x18\x03 \x01(\x0e\x32M.google.ads.googleads.v14.enums.PolicyApprovalStatusEnum.PolicyApprovalStatusB\x03\xe0\x41\x03\x42\xfc\x01\n&com.google.ads.googleads.v14.resourcesB\nAssetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v14.common.CustomParameter", "google/ads/googleads/v14/common/custom_parameter.proto"],
    ["google.ads.googleads.v14.common.YoutubeVideoAsset", "google/ads/googleads/v14/common/asset_types.proto"],
    ["google.ads.googleads.v14.common.PolicyTopicEntry", "google/ads/googleads/v14/common/policy.proto"],
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
          Asset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Asset").msgclass
          AssetFieldTypePolicySummary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.AssetFieldTypePolicySummary").msgclass
          AssetPolicySummary = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.AssetPolicySummary").msgclass
        end
      end
    end
  end
end
