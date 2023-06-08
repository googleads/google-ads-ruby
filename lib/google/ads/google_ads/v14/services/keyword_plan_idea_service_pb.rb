# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/keyword_plan_idea_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/criteria_pb'
require 'google/ads/google_ads/v14/common/dates_pb'
require 'google/ads/google_ads/v14/common/keyword_plan_common_pb'
require 'google/ads/google_ads/v14/enums/keyword_match_type_pb'
require 'google/ads/google_ads/v14/enums/keyword_plan_keyword_annotation_pb'
require 'google/ads/google_ads/v14/enums/keyword_plan_network_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'


descriptor_data = "\nAgoogle/ads/googleads/v14/services/keyword_plan_idea_service.proto\x12!google.ads.googleads.v14.services\x1a.google/ads/googleads/v14/common/criteria.proto\x1a+google/ads/googleads/v14/common/dates.proto\x1a\x39google/ads/googleads/v14/common/keyword_plan_common.proto\x1a\x37google/ads/googleads/v14/enums/keyword_match_type.proto\x1a\x44google/ads/googleads/v14/enums/keyword_plan_keyword_annotation.proto\x1a\x39google/ads/googleads/v14/enums/keyword_plan_network.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\"\xff\x06\n\x1bGenerateKeywordIdeasRequest\x12\x13\n\x0b\x63ustomer_id\x18\x01 \x01(\t\x12\x15\n\x08language\x18\x0e \x01(\tH\x01\x88\x01\x01\x12\x1c\n\x14geo_target_constants\x18\x0f \x03(\t\x12\x1e\n\x16include_adult_keywords\x18\n \x01(\x08\x12\x12\n\npage_token\x18\x0c \x01(\t\x12\x11\n\tpage_size\x18\r \x01(\x05\x12g\n\x14keyword_plan_network\x18\t \x01(\x0e\x32I.google.ads.googleads.v14.enums.KeywordPlanNetworkEnum.KeywordPlanNetwork\x12y\n\x12keyword_annotation\x18\x11 \x03(\x0e\x32].google.ads.googleads.v14.enums.KeywordPlanKeywordAnnotationEnum.KeywordPlanKeywordAnnotation\x12W\n\x11\x61ggregate_metrics\x18\x10 \x01(\x0b\x32<.google.ads.googleads.v14.common.KeywordPlanAggregateMetrics\x12]\n\x1ahistorical_metrics_options\x18\x12 \x01(\x0b\x32\x39.google.ads.googleads.v14.common.HistoricalMetricsOptions\x12T\n\x14keyword_and_url_seed\x18\x02 \x01(\x0b\x32\x34.google.ads.googleads.v14.services.KeywordAndUrlSeedH\x00\x12\x46\n\x0ckeyword_seed\x18\x03 \x01(\x0b\x32..google.ads.googleads.v14.services.KeywordSeedH\x00\x12>\n\x08url_seed\x18\x05 \x01(\x0b\x32*.google.ads.googleads.v14.services.UrlSeedH\x00\x12@\n\tsite_seed\x18\x0b \x01(\x0b\x32+.google.ads.googleads.v14.services.SiteSeedH\x00\x42\x06\n\x04seedB\x0b\n\t_language\"?\n\x11KeywordAndUrlSeed\x12\x10\n\x03url\x18\x03 \x01(\tH\x00\x88\x01\x01\x12\x10\n\x08keywords\x18\x04 \x03(\tB\x06\n\x04_url\"\x1f\n\x0bKeywordSeed\x12\x10\n\x08keywords\x18\x02 \x03(\t\"&\n\x08SiteSeed\x12\x11\n\x04site\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x07\n\x05_site\"#\n\x07UrlSeed\x12\x10\n\x03url\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x06\n\x04_url\"\xff\x01\n\x1bGenerateKeywordIdeaResponse\x12M\n\x07results\x18\x01 \x03(\x0b\x32<.google.ads.googleads.v14.services.GenerateKeywordIdeaResult\x12\x64\n\x18\x61ggregate_metric_results\x18\x04 \x01(\x0b\x32\x42.google.ads.googleads.v14.common.KeywordPlanAggregateMetricResults\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\x12\x12\n\ntotal_size\x18\x03 \x01(\x03\"\xfe\x01\n\x19GenerateKeywordIdeaResult\x12\x11\n\x04text\x18\x05 \x01(\tH\x00\x88\x01\x01\x12[\n\x14keyword_idea_metrics\x18\x03 \x01(\x0b\x32=.google.ads.googleads.v14.common.KeywordPlanHistoricalMetrics\x12P\n\x13keyword_annotations\x18\x06 \x01(\x0b\x32\x33.google.ads.googleads.v14.common.KeywordAnnotations\x12\x16\n\x0e\x63lose_variants\x18\x07 \x03(\tB\x07\n\x05_text\"\xd3\x03\n\'GenerateKeywordHistoricalMetricsRequest\x12\x13\n\x0b\x63ustomer_id\x18\x01 \x01(\t\x12\x10\n\x08keywords\x18\x02 \x03(\t\x12\x15\n\x08language\x18\x04 \x01(\tH\x00\x88\x01\x01\x12\x1e\n\x16include_adult_keywords\x18\x05 \x01(\x08\x12\x1c\n\x14geo_target_constants\x18\x06 \x03(\t\x12g\n\x14keyword_plan_network\x18\x07 \x01(\x0e\x32I.google.ads.googleads.v14.enums.KeywordPlanNetworkEnum.KeywordPlanNetwork\x12W\n\x11\x61ggregate_metrics\x18\x08 \x01(\x0b\x32<.google.ads.googleads.v14.common.KeywordPlanAggregateMetrics\x12]\n\x1ahistorical_metrics_options\x18\x03 \x01(\x0b\x32\x39.google.ads.googleads.v14.common.HistoricalMetricsOptionsB\x0b\n\t_language\"\xec\x01\n(GenerateKeywordHistoricalMetricsResponse\x12Z\n\x07results\x18\x01 \x03(\x0b\x32I.google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsResult\x12\x64\n\x18\x61ggregate_metric_results\x18\x02 \x01(\x0b\x32\x42.google.ads.googleads.v14.common.KeywordPlanAggregateMetricResults\"\xb4\x01\n&GenerateKeywordHistoricalMetricsResult\x12\x11\n\x04text\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x16\n\x0e\x63lose_variants\x18\x03 \x03(\t\x12V\n\x0fkeyword_metrics\x18\x02 \x01(\x0b\x32=.google.ads.googleads.v14.common.KeywordPlanHistoricalMetricsB\x07\n\x05_text\"g\n\x1cGenerateAdGroupThemesRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12\x15\n\x08keywords\x18\x02 \x03(\tB\x03\xe0\x41\x02\x12\x16\n\tad_groups\x18\x03 \x03(\tB\x03\xe0\x41\x02\"\xd2\x01\n\x1dGenerateAdGroupThemesResponse\x12\x61\n\x1c\x61\x64_group_keyword_suggestions\x18\x01 \x03(\x0b\x32;.google.ads.googleads.v14.services.AdGroupKeywordSuggestion\x12N\n\x12unusable_ad_groups\x18\x02 \x03(\x0b\x32\x32.google.ads.googleads.v14.services.UnusableAdGroup\"\xed\x01\n\x18\x41\x64GroupKeywordSuggestion\x12\x14\n\x0ckeyword_text\x18\x01 \x01(\t\x12\x1e\n\x16suggested_keyword_text\x18\x02 \x01(\t\x12\x63\n\x14suggested_match_type\x18\x03 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.KeywordMatchTypeEnum.KeywordMatchType\x12\x1a\n\x12suggested_ad_group\x18\x04 \x01(\t\x12\x1a\n\x12suggested_campaign\x18\x05 \x01(\t\"5\n\x0fUnusableAdGroup\x12\x10\n\x08\x61\x64_group\x18\x01 \x01(\t\x12\x10\n\x08\x63\x61mpaign\x18\x02 \x01(\t\"\xfd\x01\n%GenerateKeywordForecastMetricsRequest\x12\x13\n\x0b\x63ustomer_id\x18\x01 \x01(\t\x12\x1a\n\rcurrency_code\x18\x02 \x01(\tH\x00\x88\x01\x01\x12\x43\n\x0f\x66orecast_period\x18\x03 \x01(\x0b\x32*.google.ads.googleads.v14.common.DateRange\x12L\n\x08\x63\x61mpaign\x18\x04 \x01(\x0b\x32\x35.google.ads.googleads.v14.services.CampaignToForecastB\x03\xe0\x41\x02\x42\x10\n\x0e_currency_code\"\x98\x07\n\x12\x43\x61mpaignToForecast\x12\x1a\n\x12language_constants\x18\x01 \x03(\t\x12N\n\rgeo_modifiers\x18\x02 \x03(\x0b\x32\x37.google.ads.googleads.v14.services.CriterionBidModifier\x12l\n\x14keyword_plan_network\x18\x03 \x01(\x0e\x32I.google.ads.googleads.v14.enums.KeywordPlanNetworkEnum.KeywordPlanNetworkB\x03\xe0\x41\x02\x12G\n\x11negative_keywords\x18\x04 \x03(\x0b\x32,.google.ads.googleads.v14.common.KeywordInfo\x12l\n\x10\x62idding_strategy\x18\x05 \x01(\x0b\x32M.google.ads.googleads.v14.services.CampaignToForecast.CampaignBiddingStrategyB\x03\xe0\x41\x02\x12\x1c\n\x0f\x63onversion_rate\x18\x06 \x01(\x01H\x00\x88\x01\x01\x12\x45\n\tad_groups\x18\x07 \x03(\x0b\x32\x32.google.ads.googleads.v14.services.ForecastAdGroup\x1a\xf7\x02\n\x17\x43\x61mpaignBiddingStrategy\x12\x62\n\x1bmanual_cpc_bidding_strategy\x18\x01 \x01(\x0b\x32;.google.ads.googleads.v14.services.ManualCpcBiddingStrategyH\x00\x12l\n maximize_clicks_bidding_strategy\x18\x02 \x01(\x0b\x32@.google.ads.googleads.v14.services.MaximizeClicksBiddingStrategyH\x00\x12v\n%maximize_conversions_bidding_strategy\x18\x03 \x01(\x0b\x32\x45.google.ads.googleads.v14.services.MaximizeConversionsBiddingStrategyH\x00\x42\x12\n\x10\x62idding_strategyB\x12\n\x10_conversion_rate\"\xe6\x01\n\x0f\x46orecastAdGroup\x12\x1f\n\x12max_cpc_bid_micros\x18\x01 \x01(\x03H\x00\x88\x01\x01\x12R\n\x11\x62iddable_keywords\x18\x02 \x03(\x0b\x32\x32.google.ads.googleads.v14.services.BiddableKeywordB\x03\xe0\x41\x02\x12G\n\x11negative_keywords\x18\x03 \x03(\x0b\x32,.google.ads.googleads.v14.common.KeywordInfoB\x15\n\x13_max_cpc_bid_micros\"\x8d\x01\n\x0f\x42iddableKeyword\x12\x42\n\x07keyword\x18\x01 \x01(\x0b\x32,.google.ads.googleads.v14.common.KeywordInfoB\x03\xe0\x41\x02\x12\x1f\n\x12max_cpc_bid_micros\x18\x02 \x01(\x03H\x00\x88\x01\x01\x42\x15\n\x13_max_cpc_bid_micros\"_\n\x14\x43riterionBidModifier\x12\x1b\n\x13geo_target_constant\x18\x01 \x01(\t\x12\x19\n\x0c\x62id_modifier\x18\x02 \x01(\x01H\x00\x88\x01\x01\x42\x0f\n\r_bid_modifier\"u\n\x18ManualCpcBiddingStrategy\x12 \n\x13\x64\x61ily_budget_micros\x18\x01 \x01(\x03H\x00\x88\x01\x01\x12\x1f\n\x12max_cpc_bid_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x02\x42\x16\n\x14_daily_budget_micros\"\x8f\x01\n\x1dMaximizeClicksBiddingStrategy\x12&\n\x19\x64\x61ily_target_spend_micros\x18\x01 \x01(\x03\x42\x03\xe0\x41\x02\x12\'\n\x1amax_cpc_bid_ceiling_micros\x18\x02 \x01(\x03H\x00\x88\x01\x01\x42\x1d\n\x1b_max_cpc_bid_ceiling_micros\"L\n\"MaximizeConversionsBiddingStrategy\x12&\n\x19\x64\x61ily_target_spend_micros\x18\x01 \x01(\x03\x42\x03\xe0\x41\x02\"\xa9\x01\n&GenerateKeywordForecastMetricsResponse\x12\x61\n\x19\x63\x61mpaign_forecast_metrics\x18\x01 \x01(\x0b\x32\x39.google.ads.googleads.v14.services.KeywordForecastMetricsH\x00\x88\x01\x01\x42\x1c\n\x1a_campaign_forecast_metrics\"\x90\x03\n\x16KeywordForecastMetrics\x12\x18\n\x0bimpressions\x18\x01 \x01(\x01H\x00\x88\x01\x01\x12\x1f\n\x12\x63lick_through_rate\x18\x02 \x01(\x01H\x01\x88\x01\x01\x12\x1f\n\x12\x61verage_cpc_micros\x18\x03 \x01(\x03H\x02\x88\x01\x01\x12\x13\n\x06\x63licks\x18\x04 \x01(\x01H\x03\x88\x01\x01\x12\x18\n\x0b\x63ost_micros\x18\x05 \x01(\x03H\x04\x88\x01\x01\x12\x18\n\x0b\x63onversions\x18\x06 \x01(\x01H\x05\x88\x01\x01\x12\x1c\n\x0f\x63onversion_rate\x18\x07 \x01(\x01H\x06\x88\x01\x01\x12\x1f\n\x12\x61verage_cpa_micros\x18\x08 \x01(\x03H\x07\x88\x01\x01\x42\x0e\n\x0c_impressionsB\x15\n\x13_click_through_rateB\x15\n\x13_average_cpc_microsB\t\n\x07_clicksB\x0e\n\x0c_cost_microsB\x0e\n\x0c_conversionsB\x12\n\x10_conversion_rateB\x15\n\x13_average_cpa_micros2\xa2\x08\n\x16KeywordPlanIdeaService\x12\xd6\x01\n\x14GenerateKeywordIdeas\x12>.google.ads.googleads.v14.services.GenerateKeywordIdeasRequest\x1a>.google.ads.googleads.v14.services.GenerateKeywordIdeaResponse\">\x82\xd3\xe4\x93\x02\x38\"3/v14/customers/{customer_id=*}:generateKeywordIdeas:\x01*\x12\x87\x02\n GenerateKeywordHistoricalMetrics\x12J.google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsRequest\x1aK.google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsResponse\"J\x82\xd3\xe4\x93\x02\x44\"?/v14/customers/{customer_id=*}:generateKeywordHistoricalMetrics:\x01*\x12\xdb\x01\n\x15GenerateAdGroupThemes\x12?.google.ads.googleads.v14.services.GenerateAdGroupThemesRequest\x1a@.google.ads.googleads.v14.services.GenerateAdGroupThemesResponse\"?\x82\xd3\xe4\x93\x02\x39\"4/v14/customers/{customer_id=*}:generateAdGroupThemes:\x01*\x12\xff\x01\n\x1eGenerateKeywordForecastMetrics\x12H.google.ads.googleads.v14.services.GenerateKeywordForecastMetricsRequest\x1aI.google.ads.googleads.v14.services.GenerateKeywordForecastMetricsResponse\"H\x82\xd3\xe4\x93\x02\x42\"=/v14/customers/{customer_id=*}:generateKeywordForecastMetrics:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x87\x02\n%com.google.ads.googleads.v14.servicesB\x1bKeywordPlanIdeaServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.common.KeywordPlanAggregateMetrics", "google/ads/googleads/v14/common/keyword_plan_common.proto"],
    ["google.ads.googleads.v14.common.DateRange", "google/ads/googleads/v14/common/dates.proto"],
    ["google.ads.googleads.v14.common.KeywordInfo", "google/ads/googleads/v14/common/criteria.proto"],
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
          GenerateKeywordIdeasRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordIdeasRequest").msgclass
          KeywordAndUrlSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.KeywordAndUrlSeed").msgclass
          KeywordSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.KeywordSeed").msgclass
          SiteSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SiteSeed").msgclass
          UrlSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UrlSeed").msgclass
          GenerateKeywordIdeaResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordIdeaResponse").msgclass
          GenerateKeywordIdeaResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordIdeaResult").msgclass
          GenerateKeywordHistoricalMetricsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsRequest").msgclass
          GenerateKeywordHistoricalMetricsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsResponse").msgclass
          GenerateKeywordHistoricalMetricsResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordHistoricalMetricsResult").msgclass
          GenerateAdGroupThemesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateAdGroupThemesRequest").msgclass
          GenerateAdGroupThemesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateAdGroupThemesResponse").msgclass
          AdGroupKeywordSuggestion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.AdGroupKeywordSuggestion").msgclass
          UnusableAdGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UnusableAdGroup").msgclass
          GenerateKeywordForecastMetricsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordForecastMetricsRequest").msgclass
          CampaignToForecast = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CampaignToForecast").msgclass
          CampaignToForecast::CampaignBiddingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CampaignToForecast.CampaignBiddingStrategy").msgclass
          ForecastAdGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.ForecastAdGroup").msgclass
          BiddableKeyword = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.BiddableKeyword").msgclass
          CriterionBidModifier = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CriterionBidModifier").msgclass
          ManualCpcBiddingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.ManualCpcBiddingStrategy").msgclass
          MaximizeClicksBiddingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MaximizeClicksBiddingStrategy").msgclass
          MaximizeConversionsBiddingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.MaximizeConversionsBiddingStrategy").msgclass
          GenerateKeywordForecastMetricsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.GenerateKeywordForecastMetricsResponse").msgclass
          KeywordForecastMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.KeywordForecastMetrics").msgclass
        end
      end
    end
  end
end
