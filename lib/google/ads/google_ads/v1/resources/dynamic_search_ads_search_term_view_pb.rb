# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/resources/dynamic_search_ads_search_term_view.proto

require 'google/protobuf'

require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.resources.DynamicSearchAdsSearchTermView" do
    optional :resource_name, :string, 1
    optional :search_term, :message, 2, "google.protobuf.StringValue"
    optional :headline, :message, 3, "google.protobuf.StringValue"
    optional :landing_page, :message, 4, "google.protobuf.StringValue"
    optional :page_url, :message, 5, "google.protobuf.StringValue"
  end
end

module Google::Ads::GoogleAds::V1::Resources
  DynamicSearchAdsSearchTermView = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.resources.DynamicSearchAdsSearchTermView").msgclass
end
