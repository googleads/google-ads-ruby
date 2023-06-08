# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/smart_campaign_suggest_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/ad_type_infos_pb'
require 'google/ads/google_ads/v14/common/criteria_pb'
require 'google/ads/google_ads/v14/resources/keyword_theme_constant_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nFgoogle/ads/googleads/v14/services/smart_campaign_suggest_service.proto\x12!google.ads.googleads.v14.services\x1a\x33google/ads/googleads/v14/common/ad_type_infos.proto\x1a.google/ads/googleads/v14/common/criteria.proto\x1a?google/ads/googleads/v14/resources/keyword_theme_constant.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xf6\x01\n(SuggestSmartCampaignBudgetOptionsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12=\n\x08\x63\x61mpaign\x18\x02 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!googleads.googleapis.com/CampaignH\x00\x12^\n\x0fsuggestion_info\x18\x03 \x01(\x0b\x32>.google.ads.googleads.v14.services.SmartCampaignSuggestionInfoB\x03\xe0\x41\x02H\x00\x42\x11\n\x0fsuggestion_data\"\xe5\x05\n\x1bSmartCampaignSuggestionInfo\x12\x16\n\tfinal_url\x18\x01 \x01(\tB\x03\xe0\x41\x01\x12\x1a\n\rlanguage_code\x18\x03 \x01(\tB\x03\xe0\x41\x01\x12J\n\x0c\x61\x64_schedules\x18\x06 \x03(\x0b\x32/.google.ads.googleads.v14.common.AdScheduleInfoB\x03\xe0\x41\x01\x12N\n\x0ekeyword_themes\x18\x07 \x03(\x0b\x32\x31.google.ads.googleads.v14.common.KeywordThemeInfoB\x03\xe0\x41\x01\x12o\n\x10\x62usiness_context\x18\x08 \x01(\x0b\x32N.google.ads.googleads.v14.services.SmartCampaignSuggestionInfo.BusinessContextB\x03\xe0\x41\x01H\x00\x12(\n\x19\x62usiness_profile_location\x18\t \x01(\tB\x03\xe0\x41\x01H\x00\x12i\n\rlocation_list\x18\x04 \x01(\x0b\x32K.google.ads.googleads.v14.services.SmartCampaignSuggestionInfo.LocationListB\x03\xe0\x41\x01H\x01\x12H\n\tproximity\x18\x05 \x01(\x0b\x32..google.ads.googleads.v14.common.ProximityInfoB\x03\xe0\x41\x01H\x01\x1aU\n\x0cLocationList\x12\x45\n\tlocations\x18\x01 \x03(\x0b\x32-.google.ads.googleads.v14.common.LocationInfoB\x03\xe0\x41\x02\x1a-\n\x0f\x42usinessContext\x12\x1a\n\rbusiness_name\x18\x01 \x01(\tB\x03\xe0\x41\x01\x42\x12\n\x10\x62usiness_settingB\x0c\n\ngeo_target\"\xff\x04\n)SuggestSmartCampaignBudgetOptionsResponse\x12p\n\x03low\x18\x01 \x01(\x0b\x32Y.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.BudgetOptionB\x03\xe0\x41\x01H\x00\x88\x01\x01\x12x\n\x0brecommended\x18\x02 \x01(\x0b\x32Y.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.BudgetOptionB\x03\xe0\x41\x01H\x01\x88\x01\x01\x12q\n\x04high\x18\x03 \x01(\x0b\x32Y.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.BudgetOptionB\x03\xe0\x41\x01H\x02\x88\x01\x01\x1a=\n\x07Metrics\x12\x18\n\x10min_daily_clicks\x18\x01 \x01(\x03\x12\x18\n\x10max_daily_clicks\x18\x02 \x01(\x03\x1a\x92\x01\n\x0c\x42udgetOption\x12\x1b\n\x13\x64\x61ily_amount_micros\x18\x01 \x01(\x03\x12\x65\n\x07metrics\x18\x02 \x01(\x0b\x32T.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.MetricsB\x06\n\x04_lowB\x0e\n\x0c_recommendedB\x07\n\x05_high\"\x97\x01\n\x1dSuggestSmartCampaignAdRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\\\n\x0fsuggestion_info\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v14.services.SmartCampaignSuggestionInfoB\x03\xe0\x41\x02\"l\n\x1eSuggestSmartCampaignAdResponse\x12J\n\x07\x61\x64_info\x18\x01 \x01(\x0b\x32\x34.google.ads.googleads.v14.common.SmartCampaignAdInfoB\x03\xe0\x41\x01\"\x95\x01\n\x1bSuggestKeywordThemesRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\\\n\x0fsuggestion_info\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v14.services.SmartCampaignSuggestionInfoB\x03\xe0\x41\x02\"\xa5\x02\n\x1cSuggestKeywordThemesResponse\x12\x64\n\x0ekeyword_themes\x18\x02 \x03(\x0b\x32L.google.ads.googleads.v14.services.SuggestKeywordThemesResponse.KeywordTheme\x1a\x9e\x01\n\x0cKeywordTheme\x12Z\n\x16keyword_theme_constant\x18\x01 \x01(\x0b\x32\x38.google.ads.googleads.v14.resources.KeywordThemeConstantH\x00\x12!\n\x17\x66ree_form_keyword_theme\x18\x02 \x01(\tH\x00\x42\x0f\n\rkeyword_theme2\xae\x06\n\x1bSmartCampaignSuggestService\x12\x8b\x02\n!SuggestSmartCampaignBudgetOptions\x12K.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsRequest\x1aL.google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse\"K\x82\xd3\xe4\x93\x02\x45\"@/v14/customers/{customer_id=*}:suggestSmartCampaignBudgetOptions:\x01*\x12\xdf\x01\n\x16SuggestSmartCampaignAd\x12@.google.ads.googleads.v14.services.SuggestSmartCampaignAdRequest\x1a\x41.google.ads.googleads.v14.services.SuggestSmartCampaignAdResponse\"@\x82\xd3\xe4\x93\x02:\"5/v14/customers/{customer_id=*}:suggestSmartCampaignAd:\x01*\x12\xd7\x01\n\x14SuggestKeywordThemes\x12>.google.ads.googleads.v14.services.SuggestKeywordThemesRequest\x1a?.google.ads.googleads.v14.services.SuggestKeywordThemesResponse\">\x82\xd3\xe4\x93\x02\x38\"3/v14/customers/{customer_id=*}:suggestKeywordThemes:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8c\x02\n%com.google.ads.googleads.v14.servicesB SmartCampaignSuggestServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.common.AdScheduleInfo", "google/ads/googleads/v14/common/criteria.proto"],
    ["google.ads.googleads.v14.common.SmartCampaignAdInfo", "google/ads/googleads/v14/common/ad_type_infos.proto"],
    ["google.ads.googleads.v14.resources.KeywordThemeConstant", "google/ads/googleads/v14/resources/keyword_theme_constant.proto"],
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
        module Services
          SuggestSmartCampaignBudgetOptionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsRequest").msgclass
          SmartCampaignSuggestionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SmartCampaignSuggestionInfo").msgclass
          SmartCampaignSuggestionInfo::LocationList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SmartCampaignSuggestionInfo.LocationList").msgclass
          SmartCampaignSuggestionInfo::BusinessContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SmartCampaignSuggestionInfo.BusinessContext").msgclass
          SuggestSmartCampaignBudgetOptionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse").msgclass
          SuggestSmartCampaignBudgetOptionsResponse::Metrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.Metrics").msgclass
          SuggestSmartCampaignBudgetOptionsResponse::BudgetOption = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignBudgetOptionsResponse.BudgetOption").msgclass
          SuggestSmartCampaignAdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignAdRequest").msgclass
          SuggestSmartCampaignAdResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestSmartCampaignAdResponse").msgclass
          SuggestKeywordThemesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestKeywordThemesRequest").msgclass
          SuggestKeywordThemesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestKeywordThemesResponse").msgclass
          SuggestKeywordThemesResponse::KeywordTheme = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestKeywordThemesResponse.KeywordTheme").msgclass
        end
      end
    end
  end
end