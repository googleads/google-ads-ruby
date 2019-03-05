# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/common/segments.proto

require 'google/protobuf'

require 'google/ads/google_ads/v1/common/criteria_pb'
require 'google/ads/google_ads/v1/enums/ad_network_type_pb'
require 'google/ads/google_ads/v1/enums/click_type_pb'
require 'google/ads/google_ads/v1/enums/conversion_action_category_pb'
require 'google/ads/google_ads/v1/enums/conversion_attribution_event_type_pb'
require 'google/ads/google_ads/v1/enums/conversion_lag_bucket_pb'
require 'google/ads/google_ads/v1/enums/conversion_or_adjustment_lag_bucket_pb'
require 'google/ads/google_ads/v1/enums/day_of_week_pb'
require 'google/ads/google_ads/v1/enums/device_pb'
require 'google/ads/google_ads/v1/enums/external_conversion_source_pb'
require 'google/ads/google_ads/v1/enums/hotel_date_selection_type_pb'
require 'google/ads/google_ads/v1/enums/month_of_year_pb'
require 'google/ads/google_ads/v1/enums/placeholder_type_pb'
require 'google/ads/google_ads/v1/enums/product_channel_pb'
require 'google/ads/google_ads/v1/enums/product_channel_exclusivity_pb'
require 'google/ads/google_ads/v1/enums/product_condition_pb'
require 'google/ads/google_ads/v1/enums/search_term_match_type_pb'
require 'google/ads/google_ads/v1/enums/slot_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.common.Segments" do
    optional :ad_network_type, :enum, 3, "google.ads.googleads.v1.enums.AdNetworkTypeEnum.AdNetworkType"
    optional :click_type, :enum, 26, "google.ads.googleads.v1.enums.ClickTypeEnum.ClickType"
    optional :conversion_action, :message, 52, "google.protobuf.StringValue"
    optional :conversion_action_category, :enum, 53, "google.ads.googleads.v1.enums.ConversionActionCategoryEnum.ConversionActionCategory"
    optional :conversion_action_name, :message, 54, "google.protobuf.StringValue"
    optional :conversion_adjustment, :message, 27, "google.protobuf.BoolValue"
    optional :conversion_attribution_event_type, :enum, 2, "google.ads.googleads.v1.enums.ConversionAttributionEventTypeEnum.ConversionAttributionEventType"
    optional :conversion_lag_bucket, :enum, 50, "google.ads.googleads.v1.enums.ConversionLagBucketEnum.ConversionLagBucket"
    optional :conversion_or_adjustment_lag_bucket, :enum, 51, "google.ads.googleads.v1.enums.ConversionOrAdjustmentLagBucketEnum.ConversionOrAdjustmentLagBucket"
    optional :date, :message, 4, "google.protobuf.StringValue"
    optional :day_of_week, :enum, 5, "google.ads.googleads.v1.enums.DayOfWeekEnum.DayOfWeek"
    optional :device, :enum, 1, "google.ads.googleads.v1.enums.DeviceEnum.Device"
    optional :external_conversion_source, :enum, 55, "google.ads.googleads.v1.enums.ExternalConversionSourceEnum.ExternalConversionSource"
    optional :geo_target_city, :message, 62, "google.protobuf.StringValue"
    optional :geo_target_metro, :message, 63, "google.protobuf.StringValue"
    optional :geo_target_region, :message, 64, "google.protobuf.StringValue"
    optional :hotel_booking_window_days, :message, 6, "google.protobuf.Int64Value"
    optional :hotel_center_id, :message, 7, "google.protobuf.Int64Value"
    optional :hotel_check_in_date, :message, 8, "google.protobuf.StringValue"
    optional :hotel_check_in_day_of_week, :enum, 9, "google.ads.googleads.v1.enums.DayOfWeekEnum.DayOfWeek"
    optional :hotel_city, :message, 10, "google.protobuf.StringValue"
    optional :hotel_class, :message, 11, "google.protobuf.Int32Value"
    optional :hotel_country, :message, 12, "google.protobuf.StringValue"
    optional :hotel_date_selection_type, :enum, 13, "google.ads.googleads.v1.enums.HotelDateSelectionTypeEnum.HotelDateSelectionType"
    optional :hotel_length_of_stay, :message, 14, "google.protobuf.Int32Value"
    optional :hotel_state, :message, 15, "google.protobuf.StringValue"
    optional :hour, :message, 16, "google.protobuf.Int32Value"
    optional :interaction_on_this_extension, :message, 49, "google.protobuf.BoolValue"
    optional :keyword, :message, 61, "google.ads.googleads.v1.common.Keyword"
    optional :month, :message, 17, "google.protobuf.StringValue"
    optional :month_of_year, :enum, 18, "google.ads.googleads.v1.enums.MonthOfYearEnum.MonthOfYear"
    optional :partner_hotel_id, :message, 19, "google.protobuf.StringValue"
    optional :placeholder_type, :enum, 20, "google.ads.googleads.v1.enums.PlaceholderTypeEnum.PlaceholderType"
    optional :product_aggregator_id, :message, 28, "google.protobuf.UInt64Value"
    optional :product_bidding_category_level1, :message, 56, "google.protobuf.StringValue"
    optional :product_bidding_category_level2, :message, 57, "google.protobuf.StringValue"
    optional :product_bidding_category_level3, :message, 58, "google.protobuf.StringValue"
    optional :product_bidding_category_level4, :message, 59, "google.protobuf.StringValue"
    optional :product_bidding_category_level5, :message, 60, "google.protobuf.StringValue"
    optional :product_brand, :message, 29, "google.protobuf.StringValue"
    optional :product_channel, :enum, 30, "google.ads.googleads.v1.enums.ProductChannelEnum.ProductChannel"
    optional :product_channel_exclusivity, :enum, 31, "google.ads.googleads.v1.enums.ProductChannelExclusivityEnum.ProductChannelExclusivity"
    optional :product_condition, :enum, 32, "google.ads.googleads.v1.enums.ProductConditionEnum.ProductCondition"
    optional :product_country, :message, 33, "google.protobuf.StringValue"
    optional :product_custom_attribute0, :message, 34, "google.protobuf.StringValue"
    optional :product_custom_attribute1, :message, 35, "google.protobuf.StringValue"
    optional :product_custom_attribute2, :message, 36, "google.protobuf.StringValue"
    optional :product_custom_attribute3, :message, 37, "google.protobuf.StringValue"
    optional :product_custom_attribute4, :message, 38, "google.protobuf.StringValue"
    optional :product_item_id, :message, 39, "google.protobuf.StringValue"
    optional :product_language, :message, 40, "google.protobuf.StringValue"
    optional :product_merchant_id, :message, 41, "google.protobuf.UInt64Value"
    optional :product_store_id, :message, 42, "google.protobuf.StringValue"
    optional :product_title, :message, 43, "google.protobuf.StringValue"
    optional :product_type_l1, :message, 44, "google.protobuf.StringValue"
    optional :product_type_l2, :message, 45, "google.protobuf.StringValue"
    optional :product_type_l3, :message, 46, "google.protobuf.StringValue"
    optional :product_type_l4, :message, 47, "google.protobuf.StringValue"
    optional :product_type_l5, :message, 48, "google.protobuf.StringValue"
    optional :quarter, :message, 21, "google.protobuf.StringValue"
    optional :search_term_match_type, :enum, 22, "google.ads.googleads.v1.enums.SearchTermMatchTypeEnum.SearchTermMatchType"
    optional :slot, :enum, 23, "google.ads.googleads.v1.enums.SlotEnum.Slot"
    optional :week, :message, 24, "google.protobuf.StringValue"
    optional :year, :message, 25, "google.protobuf.Int32Value"
  end
  add_message "google.ads.googleads.v1.common.Keyword" do
    optional :ad_group_criterion, :message, 1, "google.protobuf.StringValue"
    optional :info, :message, 2, "google.ads.googleads.v1.common.KeywordInfo"
  end
end

module Google::Ads::GoogleAds::V1::Common
  Segments = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.common.Segments").msgclass
  Keyword = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.common.Keyword").msgclass
end
