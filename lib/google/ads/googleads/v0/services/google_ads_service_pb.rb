# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/services/google_ads_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v0/common/metrics_pb'
require 'google/ads/googleads/v0/enums/ad_network_type_pb'
require 'google/ads/googleads/v0/enums/day_of_week_pb'
require 'google/ads/googleads/v0/enums/device_pb'
require 'google/ads/googleads/v0/enums/slot_pb'
require 'google/ads/googleads/v0/resources/ad_group_pb'
require 'google/ads/googleads/v0/resources/ad_group_ad_pb'
require 'google/ads/googleads/v0/resources/ad_group_criterion_pb'
require 'google/ads/googleads/v0/resources/bidding_strategy_pb'
require 'google/ads/googleads/v0/resources/campaign_pb'
require 'google/ads/googleads/v0/resources/campaign_budget_pb'
require 'google/ads/googleads/v0/resources/campaign_criterion_pb'
require 'google/ads/googleads/v0/resources/customer_pb'
require 'google/ads/googleads/v0/resources/keyword_view_pb'
require 'google/api/annotations_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.services.SearchGoogleAdsRequest" do
    optional :customer_id, :string, 1
    optional :query, :string, 2
    optional :page_token, :string, 3
    optional :page_size, :int32, 4
  end
  add_message "google.ads.googleads.v0.services.SearchGoogleAdsResponse" do
    repeated :results, :message, 1, "google.ads.googleads.v0.services.GoogleAdsRow"
    optional :next_page_token, :string, 2
    optional :total_results_count, :int64, 3
    optional :field_mask, :message, 5, "google.protobuf.FieldMask"
  end
  add_message "google.ads.googleads.v0.services.GoogleAdsRow" do
    optional :ad_group, :message, 3, "google.ads.googleads.v0.resources.AdGroup"
    optional :ad_group_ad, :message, 16, "google.ads.googleads.v0.resources.AdGroupAd"
    optional :ad_group_criterion, :message, 17, "google.ads.googleads.v0.resources.AdGroupCriterion"
    optional :bidding_strategy, :message, 18, "google.ads.googleads.v0.resources.BiddingStrategy"
    optional :campaign_budget, :message, 19, "google.ads.googleads.v0.resources.CampaignBudget"
    optional :campaign, :message, 2, "google.ads.googleads.v0.resources.Campaign"
    optional :campaign_criterion, :message, 20, "google.ads.googleads.v0.resources.CampaignCriterion"
    optional :customer, :message, 1, "google.ads.googleads.v0.resources.Customer"
    optional :keyword_view, :message, 21, "google.ads.googleads.v0.resources.KeywordView"
    optional :metrics, :message, 4, "google.ads.googleads.v0.common.Metrics"
    optional :ad_network_type, :enum, 5, "google.ads.googleads.v0.enums.AdNetworkTypeEnum.AdNetworkType"
    optional :date, :message, 6, "google.protobuf.StringValue"
    optional :day_of_week, :enum, 7, "google.ads.googleads.v0.enums.DayOfWeekEnum.DayOfWeek"
    optional :device, :enum, 8, "google.ads.googleads.v0.enums.DeviceEnum.Device"
    optional :hour, :message, 9, "google.protobuf.Int32Value"
    optional :month, :message, 10, "google.protobuf.StringValue"
    optional :quarter, :message, 12, "google.protobuf.StringValue"
    optional :slot, :enum, 13, "google.ads.googleads.v0.enums.SlotEnum.Slot"
    optional :week, :message, 14, "google.protobuf.StringValue"
    optional :year, :message, 15, "google.protobuf.Int32Value"
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Services
          SearchGoogleAdsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.services.SearchGoogleAdsRequest").msgclass
          SearchGoogleAdsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.services.SearchGoogleAdsResponse").msgclass
          GoogleAdsRow = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.services.GoogleAdsRow").msgclass
        end
      end
    end
  end
end
