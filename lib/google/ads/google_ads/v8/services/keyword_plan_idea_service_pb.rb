# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/services/keyword_plan_idea_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v8/common/keyword_plan_common_pb'
require 'google/ads/google_ads/v8/enums/keyword_plan_keyword_annotation_pb'
require 'google/ads/google_ads/v8/enums/keyword_plan_network_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/services/keyword_plan_idea_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.services.GenerateKeywordIdeasRequest" do
      optional :customer_id, :string, 1
      proto3_optional :language, :string, 14
      repeated :geo_target_constants, :string, 15
      optional :include_adult_keywords, :bool, 10
      optional :page_token, :string, 12
      optional :page_size, :int32, 13
      optional :keyword_plan_network, :enum, 9, "google.ads.googleads.v8.enums.KeywordPlanNetworkEnum.KeywordPlanNetwork"
      repeated :keyword_annotation, :enum, 17, "google.ads.googleads.v8.enums.KeywordPlanKeywordAnnotationEnum.KeywordPlanKeywordAnnotation"
      optional :aggregate_metrics, :message, 16, "google.ads.googleads.v8.common.KeywordPlanAggregateMetrics"
      optional :historical_metrics_options, :message, 18, "google.ads.googleads.v8.common.HistoricalMetricsOptions"
      oneof :seed do
        optional :keyword_and_url_seed, :message, 2, "google.ads.googleads.v8.services.KeywordAndUrlSeed"
        optional :keyword_seed, :message, 3, "google.ads.googleads.v8.services.KeywordSeed"
        optional :url_seed, :message, 5, "google.ads.googleads.v8.services.UrlSeed"
        optional :site_seed, :message, 11, "google.ads.googleads.v8.services.SiteSeed"
      end
    end
    add_message "google.ads.googleads.v8.services.KeywordAndUrlSeed" do
      proto3_optional :url, :string, 3
      repeated :keywords, :string, 4
    end
    add_message "google.ads.googleads.v8.services.KeywordSeed" do
      repeated :keywords, :string, 2
    end
    add_message "google.ads.googleads.v8.services.SiteSeed" do
      proto3_optional :site, :string, 2
    end
    add_message "google.ads.googleads.v8.services.UrlSeed" do
      proto3_optional :url, :string, 2
    end
    add_message "google.ads.googleads.v8.services.GenerateKeywordIdeaResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v8.services.GenerateKeywordIdeaResult"
      optional :aggregate_metric_results, :message, 4, "google.ads.googleads.v8.common.KeywordPlanAggregateMetricResults"
      optional :next_page_token, :string, 2
      optional :total_size, :int64, 3
    end
    add_message "google.ads.googleads.v8.services.GenerateKeywordIdeaResult" do
      proto3_optional :text, :string, 5
      optional :keyword_idea_metrics, :message, 3, "google.ads.googleads.v8.common.KeywordPlanHistoricalMetrics"
      optional :keyword_annotations, :message, 6, "google.ads.googleads.v8.common.KeywordAnnotations"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Services
          GenerateKeywordIdeasRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.GenerateKeywordIdeasRequest").msgclass
          KeywordAndUrlSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.KeywordAndUrlSeed").msgclass
          KeywordSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.KeywordSeed").msgclass
          SiteSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.SiteSeed").msgclass
          UrlSeed = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.UrlSeed").msgclass
          GenerateKeywordIdeaResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.GenerateKeywordIdeaResponse").msgclass
          GenerateKeywordIdeaResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.GenerateKeywordIdeaResult").msgclass
        end
      end
    end
  end
end
