# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/search_engine_results_page_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.SearchEngineResultsPageTypeEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.SearchEngineResultsPageTypeEnum.SearchEngineResultsPageType" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ADS_ONLY, 2
    value :ORGANIC_ONLY, 3
    value :ADS_AND_ORGANIC, 4
  end
end

module Google::Ads::GoogleAds::V4::Enums
  SearchEngineResultsPageTypeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.SearchEngineResultsPageTypeEnum").msgclass
  SearchEngineResultsPageTypeEnum::SearchEngineResultsPageType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.SearchEngineResultsPageTypeEnum.SearchEngineResultsPageType").enummodule
end
