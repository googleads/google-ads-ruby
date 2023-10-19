# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/services/audience_insights_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/common/criteria_pb'
require 'google/ads/google_ads/v15/common/dates_pb'
require 'google/ads/google_ads/v15/enums/audience_insights_dimension_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'


descriptor_data = "\nAgoogle/ads/googleads/v15/services/audience_insights_service.proto\x12!google.ads.googleads.v15.services\x1a.google/ads/googleads/v15/common/criteria.proto\x1a+google/ads/googleads/v15/common/dates.proto\x1a@google/ads/googleads/v15/enums/audience_insights_dimension.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\"\x94\x02\n#GenerateInsightsFinderReportRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12X\n\x11\x62\x61seline_audience\x18\x02 \x01(\x0b\x32\x38.google.ads.googleads.v15.services.BasicInsightsAudienceB\x03\xe0\x41\x02\x12X\n\x11specific_audience\x18\x03 \x01(\x0b\x32\x38.google.ads.googleads.v15.services.BasicInsightsAudienceB\x03\xe0\x41\x02\x12\x1f\n\x17\x63ustomer_insights_group\x18\x04 \x01(\t\"@\n$GenerateInsightsFinderReportResponse\x12\x18\n\x10saved_report_url\x18\x01 \x01(\t\"\x89\x03\n*GenerateAudienceCompositionInsightsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12J\n\x08\x61udience\x18\x02 \x01(\x0b\x32\x33.google.ads.googleads.v15.services.InsightsAudienceB\x03\xe0\x41\x02\x12N\n\x11\x62\x61seline_audience\x18\x06 \x01(\x0b\x32\x33.google.ads.googleads.v15.services.InsightsAudience\x12\x12\n\ndata_month\x18\x03 \x01(\t\x12p\n\ndimensions\x18\x04 \x03(\x0e\x32W.google.ads.googleads.v15.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimensionB\x03\xe0\x41\x02\x12\x1f\n\x17\x63ustomer_insights_group\x18\x05 \x01(\t\"~\n+GenerateAudienceCompositionInsightsResponse\x12O\n\x08sections\x18\x01 \x03(\x0b\x32=.google.ads.googleads.v15.services.AudienceCompositionSection\"\xa5\x02\n)GenerateSuggestedTargetingInsightsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12J\n\x08\x61udience\x18\x02 \x01(\x0b\x32\x33.google.ads.googleads.v15.services.InsightsAudienceB\x03\xe0\x41\x02\x12S\n\x11\x62\x61seline_audience\x18\x03 \x01(\x0b\x32\x33.google.ads.googleads.v15.services.InsightsAudienceB\x03\xe0\x41\x01\x12\x17\n\ndata_month\x18\x04 \x01(\tB\x03\xe0\x41\x01\x12$\n\x17\x63ustomer_insights_group\x18\x05 \x01(\tB\x03\xe0\x41\x01\"\x80\x01\n*GenerateSuggestedTargetingInsightsResponse\x12R\n\x0bsuggestions\x18\x01 \x03(\x0b\x32=.google.ads.googleads.v15.services.TargetingSuggestionMetrics\"\x95\x03\n\x1aTargetingSuggestionMetrics\x12W\n\tlocations\x18\x01 \x03(\x0b\x32\x44.google.ads.googleads.v15.services.AudienceInsightsAttributeMetadata\x12\x41\n\nage_ranges\x18\x02 \x03(\x0b\x32-.google.ads.googleads.v15.common.AgeRangeInfo\x12;\n\x06gender\x18\x03 \x01(\x0b\x32+.google.ads.googleads.v15.common.GenderInfo\x12\\\n\x0euser_interests\x18\x04 \x03(\x0b\x32\x44.google.ads.googleads.v15.services.AudienceInsightsAttributeMetadata\x12\x10\n\x08\x63overage\x18\x05 \x01(\x01\x12\r\n\x05index\x18\x06 \x01(\x01\x12\x1f\n\x17potential_youtube_reach\x18\x07 \x01(\x03\"\xbe\x02\n%ListAudienceInsightsAttributesRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12p\n\ndimensions\x18\x02 \x03(\x0e\x32W.google.ads.googleads.v15.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimensionB\x03\xe0\x41\x02\x12\x17\n\nquery_text\x18\x03 \x01(\tB\x03\xe0\x41\x02\x12\x1f\n\x17\x63ustomer_insights_group\x18\x04 \x01(\t\x12O\n\x18location_country_filters\x18\x05 \x03(\x0b\x32-.google.ads.googleads.v15.common.LocationInfo\"\x82\x01\n&ListAudienceInsightsAttributesResponse\x12X\n\nattributes\x18\x01 \x03(\x0b\x32\x44.google.ads.googleads.v15.services.AudienceInsightsAttributeMetadata\"\"\n ListInsightsEligibleDatesRequest\"~\n!ListInsightsEligibleDatesResponse\x12\x13\n\x0b\x64\x61ta_months\x18\x01 \x03(\t\x12\x44\n\x10last_thirty_days\x18\x02 \x01(\x0b\x32*.google.ads.googleads.v15.common.DateRange\"\x9e\x06\n\x19\x41udienceInsightsAttribute\x12\x42\n\tage_range\x18\x01 \x01(\x0b\x32-.google.ads.googleads.v15.common.AgeRangeInfoH\x00\x12=\n\x06gender\x18\x02 \x01(\x0b\x32+.google.ads.googleads.v15.common.GenderInfoH\x00\x12\x41\n\x08location\x18\x03 \x01(\x0b\x32-.google.ads.googleads.v15.common.LocationInfoH\x00\x12J\n\ruser_interest\x18\x04 \x01(\x0b\x32\x31.google.ads.googleads.v15.common.UserInterestInfoH\x00\x12K\n\x06\x65ntity\x18\x05 \x01(\x0b\x32\x39.google.ads.googleads.v15.services.AudienceInsightsEntityH\x00\x12O\n\x08\x63\x61tegory\x18\x06 \x01(\x0b\x32;.google.ads.googleads.v15.services.AudienceInsightsCategoryH\x00\x12Z\n\x0e\x64ynamic_lineup\x18\x07 \x01(\x0b\x32@.google.ads.googleads.v15.services.AudienceInsightsDynamicLineupH\x00\x12N\n\x0fparental_status\x18\x08 \x01(\x0b\x32\x33.google.ads.googleads.v15.common.ParentalStatusInfoH\x00\x12H\n\x0cincome_range\x18\t \x01(\x0b\x32\x30.google.ads.googleads.v15.common.IncomeRangeInfoH\x00\x12N\n\x0fyoutube_channel\x18\n \x01(\x0b\x32\x33.google.ads.googleads.v15.common.YouTubeChannelInfoH\x00\x42\x0b\n\tattribute\"\xbe\x01\n\x15\x41udienceInsightsTopic\x12K\n\x06\x65ntity\x18\x01 \x01(\x0b\x32\x39.google.ads.googleads.v15.services.AudienceInsightsEntityH\x00\x12O\n\x08\x63\x61tegory\x18\x02 \x01(\x0b\x32;.google.ads.googleads.v15.services.AudienceInsightsCategoryH\x00\x42\x07\n\x05topic\"A\n\x16\x41udienceInsightsEntity\x12\'\n\x1aknowledge_graph_machine_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\"4\n\x18\x41udienceInsightsCategory\x12\x18\n\x0b\x63\x61tegory_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\"?\n\x1d\x41udienceInsightsDynamicLineup\x12\x1e\n\x11\x64ynamic_lineup_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\"\xc8\x03\n\x15\x42\x61sicInsightsAudience\x12L\n\x10\x63ountry_location\x18\x01 \x03(\x0b\x32-.google.ads.googleads.v15.common.LocationInfoB\x03\xe0\x41\x02\x12L\n\x15sub_country_locations\x18\x02 \x03(\x0b\x32-.google.ads.googleads.v15.common.LocationInfo\x12;\n\x06gender\x18\x03 \x01(\x0b\x32+.google.ads.googleads.v15.common.GenderInfo\x12\x41\n\nage_ranges\x18\x04 \x03(\x0b\x32-.google.ads.googleads.v15.common.AgeRangeInfo\x12I\n\x0euser_interests\x18\x05 \x03(\x0b\x32\x31.google.ads.googleads.v15.common.UserInterestInfo\x12H\n\x06topics\x18\x06 \x03(\x0b\x32\x38.google.ads.googleads.v15.services.AudienceInsightsTopic\"\xe7\x04\n!AudienceInsightsAttributeMetadata\x12j\n\tdimension\x18\x01 \x01(\x0e\x32W.google.ads.googleads.v15.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension\x12O\n\tattribute\x18\x02 \x01(\x0b\x32<.google.ads.googleads.v15.services.AudienceInsightsAttribute\x12\x14\n\x0c\x64isplay_name\x18\x03 \x01(\t\x12\r\n\x05score\x18\x04 \x01(\x01\x12\x14\n\x0c\x64isplay_info\x18\x05 \x01(\t\x12\x66\n\x18youtube_channel_metadata\x18\x06 \x01(\x0b\x32\x42.google.ads.googleads.v15.services.YouTubeChannelAttributeMetadataH\x00\x12g\n\x1a\x64ynamic_attribute_metadata\x18\x07 \x01(\x0b\x32\x41.google.ads.googleads.v15.services.DynamicLineupAttributeMetadataH\x00\x12\x63\n\x1blocation_attribute_metadata\x18\x08 \x01(\x0b\x32<.google.ads.googleads.v15.services.LocationAttributeMetadataH\x00\x42\x14\n\x12\x64imension_metadata\";\n\x1fYouTubeChannelAttributeMetadata\x12\x18\n\x10subscriber_count\x18\x01 \x01(\x03\"\x80\x05\n\x1e\x44ynamicLineupAttributeMetadata\x12H\n\x11inventory_country\x18\x01 \x01(\x0b\x32-.google.ads.googleads.v15.common.LocationInfo\x12%\n\x18median_monthly_inventory\x18\x02 \x01(\x03H\x00\x88\x01\x01\x12&\n\x19\x63hannel_count_lower_bound\x18\x03 \x01(\x03H\x01\x88\x01\x01\x12&\n\x19\x63hannel_count_upper_bound\x18\x04 \x01(\x03H\x02\x88\x01\x01\x12h\n\x0fsample_channels\x18\x05 \x03(\x0b\x32O.google.ads.googleads.v15.services.DynamicLineupAttributeMetadata.SampleChannel\x1a\xd9\x01\n\rSampleChannel\x12L\n\x0fyoutube_channel\x18\x01 \x01(\x0b\x32\x33.google.ads.googleads.v15.common.YouTubeChannelInfo\x12\x14\n\x0c\x64isplay_name\x18\x02 \x01(\t\x12\x64\n\x18youtube_channel_metadata\x18\x03 \x01(\x0b\x32\x42.google.ads.googleads.v15.services.YouTubeChannelAttributeMetadataB\x1b\n\x19_median_monthly_inventoryB\x1c\n\x1a_channel_count_lower_boundB\x1c\n\x1a_channel_count_upper_bound\"d\n\x19LocationAttributeMetadata\x12G\n\x10\x63ountry_location\x18\x01 \x01(\x0b\x32-.google.ads.googleads.v15.common.LocationInfo\"\x89\x05\n\x10InsightsAudience\x12M\n\x11\x63ountry_locations\x18\x01 \x03(\x0b\x32-.google.ads.googleads.v15.common.LocationInfoB\x03\xe0\x41\x02\x12L\n\x15sub_country_locations\x18\x02 \x03(\x0b\x32-.google.ads.googleads.v15.common.LocationInfo\x12;\n\x06gender\x18\x03 \x01(\x0b\x32+.google.ads.googleads.v15.common.GenderInfo\x12\x41\n\nage_ranges\x18\x04 \x03(\x0b\x32-.google.ads.googleads.v15.common.AgeRangeInfo\x12L\n\x0fparental_status\x18\x05 \x01(\x0b\x32\x33.google.ads.googleads.v15.common.ParentalStatusInfo\x12G\n\rincome_ranges\x18\x06 \x03(\x0b\x32\x30.google.ads.googleads.v15.common.IncomeRangeInfo\x12Y\n\x0f\x64ynamic_lineups\x18\x07 \x03(\x0b\x32@.google.ads.googleads.v15.services.AudienceInsightsDynamicLineup\x12\x66\n\x1btopic_audience_combinations\x18\x08 \x03(\x0b\x32\x41.google.ads.googleads.v15.services.InsightsAudienceAttributeGroup\"w\n\x1eInsightsAudienceAttributeGroup\x12U\n\nattributes\x18\x01 \x03(\x0b\x32<.google.ads.googleads.v15.services.AudienceInsightsAttributeB\x03\xe0\x41\x02\"\xc7\x02\n\x1a\x41udienceCompositionSection\x12j\n\tdimension\x18\x01 \x01(\x0e\x32W.google.ads.googleads.v15.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension\x12W\n\x0etop_attributes\x18\x03 \x03(\x0b\x32?.google.ads.googleads.v15.services.AudienceCompositionAttribute\x12\x64\n\x14\x63lustered_attributes\x18\x04 \x03(\x0b\x32\x46.google.ads.googleads.v15.services.AudienceCompositionAttributeCluster\"\xf0\x01\n#AudienceCompositionAttributeCluster\x12\x1c\n\x14\x63luster_display_name\x18\x01 \x01(\t\x12V\n\x0f\x63luster_metrics\x18\x03 \x01(\x0b\x32=.google.ads.googleads.v15.services.AudienceCompositionMetrics\x12S\n\nattributes\x18\x04 \x03(\x0b\x32?.google.ads.googleads.v15.services.AudienceCompositionAttribute\"s\n\x1a\x41udienceCompositionMetrics\x12\x1f\n\x17\x62\x61seline_audience_share\x18\x01 \x01(\x01\x12\x16\n\x0e\x61udience_share\x18\x02 \x01(\x01\x12\r\n\x05index\x18\x03 \x01(\x01\x12\r\n\x05score\x18\x04 \x01(\x01\"\xd0\x01\n\x1c\x41udienceCompositionAttribute\x12`\n\x12\x61ttribute_metadata\x18\x01 \x01(\x0b\x32\x44.google.ads.googleads.v15.services.AudienceInsightsAttributeMetadata\x12N\n\x07metrics\x18\x02 \x01(\x0b\x32=.google.ads.googleads.v15.services.AudienceCompositionMetrics2\xfa\x0b\n\x17\x41udienceInsightsService\x12\xa9\x02\n\x1cGenerateInsightsFinderReport\x12\x46.google.ads.googleads.v15.services.GenerateInsightsFinderReportRequest\x1aG.google.ads.googleads.v15.services.GenerateInsightsFinderReportResponse\"x\x82\xd3\xe4\x93\x02@\";/v15/customers/{customer_id=*}:generateInsightsFinderReport:\x01*\xda\x41/customer_id,baseline_audience,specific_audience\x12\xa5\x02\n\x1eListAudienceInsightsAttributes\x12H.google.ads.googleads.v15.services.ListAudienceInsightsAttributesRequest\x1aI.google.ads.googleads.v15.services.ListAudienceInsightsAttributesResponse\"n\x82\xd3\xe4\x93\x02\x44\"?/v15/customers/{customer_id=*}:searchAudienceInsightsAttributes:\x01*\xda\x41!customer_id,dimensions,query_text\x12\xe2\x01\n\x19ListInsightsEligibleDates\x12\x43.google.ads.googleads.v15.services.ListInsightsEligibleDatesRequest\x1a\x44.google.ads.googleads.v15.services.ListInsightsEligibleDatesResponse\":\x82\xd3\xe4\x93\x02\x34\"//v15/audienceInsights:listInsightsEligibleDates:\x01*\x12\xb5\x02\n#GenerateAudienceCompositionInsights\x12M.google.ads.googleads.v15.services.GenerateAudienceCompositionInsightsRequest\x1aN.google.ads.googleads.v15.services.GenerateAudienceCompositionInsightsResponse\"o\x82\xd3\xe4\x93\x02G\"B/v15/customers/{customer_id=*}:generateAudienceCompositionInsights:\x01*\xda\x41\x1f\x63ustomer_id,audience,dimensions\x12\xa6\x02\n\"GenerateSuggestedTargetingInsights\x12L.google.ads.googleads.v15.services.GenerateSuggestedTargetingInsightsRequest\x1aM.google.ads.googleads.v15.services.GenerateSuggestedTargetingInsightsResponse\"c\x82\xd3\xe4\x93\x02\x46\"A/v15/customers/{customer_id=*}:generateSuggestedTargetingInsights:\x01*\xda\x41\x14\x63ustomer_id,audience\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x88\x02\n%com.google.ads.googleads.v15.servicesB\x1c\x41udienceInsightsServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v15/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V15.Services\xca\x02!Google\\Ads\\GoogleAds\\V15\\Services\xea\x02%Google::Ads::GoogleAds::V15::Servicesb\x06proto3"

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
    ["google.ads.googleads.v15.common.AgeRangeInfo", "google/ads/googleads/v15/common/criteria.proto"],
    ["google.ads.googleads.v15.common.DateRange", "google/ads/googleads/v15/common/dates.proto"],
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
        module Services
          GenerateInsightsFinderReportRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateInsightsFinderReportRequest").msgclass
          GenerateInsightsFinderReportResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateInsightsFinderReportResponse").msgclass
          GenerateAudienceCompositionInsightsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateAudienceCompositionInsightsRequest").msgclass
          GenerateAudienceCompositionInsightsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateAudienceCompositionInsightsResponse").msgclass
          GenerateSuggestedTargetingInsightsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateSuggestedTargetingInsightsRequest").msgclass
          GenerateSuggestedTargetingInsightsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.GenerateSuggestedTargetingInsightsResponse").msgclass
          TargetingSuggestionMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.TargetingSuggestionMetrics").msgclass
          ListAudienceInsightsAttributesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.ListAudienceInsightsAttributesRequest").msgclass
          ListAudienceInsightsAttributesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.ListAudienceInsightsAttributesResponse").msgclass
          ListInsightsEligibleDatesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.ListInsightsEligibleDatesRequest").msgclass
          ListInsightsEligibleDatesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.ListInsightsEligibleDatesResponse").msgclass
          AudienceInsightsAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsAttribute").msgclass
          AudienceInsightsTopic = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsTopic").msgclass
          AudienceInsightsEntity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsEntity").msgclass
          AudienceInsightsCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsCategory").msgclass
          AudienceInsightsDynamicLineup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsDynamicLineup").msgclass
          BasicInsightsAudience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.BasicInsightsAudience").msgclass
          AudienceInsightsAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceInsightsAttributeMetadata").msgclass
          YouTubeChannelAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.YouTubeChannelAttributeMetadata").msgclass
          DynamicLineupAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.DynamicLineupAttributeMetadata").msgclass
          DynamicLineupAttributeMetadata::SampleChannel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.DynamicLineupAttributeMetadata.SampleChannel").msgclass
          LocationAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.LocationAttributeMetadata").msgclass
          InsightsAudience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.InsightsAudience").msgclass
          InsightsAudienceAttributeGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.InsightsAudienceAttributeGroup").msgclass
          AudienceCompositionSection = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceCompositionSection").msgclass
          AudienceCompositionAttributeCluster = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceCompositionAttributeCluster").msgclass
          AudienceCompositionMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceCompositionMetrics").msgclass
          AudienceCompositionAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.services.AudienceCompositionAttribute").msgclass
        end
      end
    end
  end
end
