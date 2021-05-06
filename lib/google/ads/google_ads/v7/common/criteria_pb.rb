# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/common/criteria.proto

require 'google/protobuf'

require 'google/ads/google_ads/v7/enums/age_range_type_pb'
require 'google/ads/google_ads/v7/enums/app_payment_model_type_pb'
require 'google/ads/google_ads/v7/enums/content_label_type_pb'
require 'google/ads/google_ads/v7/enums/day_of_week_pb'
require 'google/ads/google_ads/v7/enums/device_pb'
require 'google/ads/google_ads/v7/enums/gender_type_pb'
require 'google/ads/google_ads/v7/enums/hotel_date_selection_type_pb'
require 'google/ads/google_ads/v7/enums/income_range_type_pb'
require 'google/ads/google_ads/v7/enums/interaction_type_pb'
require 'google/ads/google_ads/v7/enums/keyword_match_type_pb'
require 'google/ads/google_ads/v7/enums/listing_group_type_pb'
require 'google/ads/google_ads/v7/enums/location_group_radius_units_pb'
require 'google/ads/google_ads/v7/enums/minute_of_hour_pb'
require 'google/ads/google_ads/v7/enums/parental_status_type_pb'
require 'google/ads/google_ads/v7/enums/preferred_content_type_pb'
require 'google/ads/google_ads/v7/enums/product_bidding_category_level_pb'
require 'google/ads/google_ads/v7/enums/product_channel_pb'
require 'google/ads/google_ads/v7/enums/product_channel_exclusivity_pb'
require 'google/ads/google_ads/v7/enums/product_condition_pb'
require 'google/ads/google_ads/v7/enums/product_custom_attribute_index_pb'
require 'google/ads/google_ads/v7/enums/product_type_level_pb'
require 'google/ads/google_ads/v7/enums/proximity_radius_units_pb'
require 'google/ads/google_ads/v7/enums/webpage_condition_operand_pb'
require 'google/ads/google_ads/v7/enums/webpage_condition_operator_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/common/criteria.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.common.KeywordInfo" do
      proto3_optional :text, :string, 3
      optional :match_type, :enum, 2, "google.ads.googleads.v7.enums.KeywordMatchTypeEnum.KeywordMatchType"
    end
    add_message "google.ads.googleads.v7.common.PlacementInfo" do
      proto3_optional :url, :string, 2
    end
    add_message "google.ads.googleads.v7.common.MobileAppCategoryInfo" do
      proto3_optional :mobile_app_category_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.MobileApplicationInfo" do
      proto3_optional :app_id, :string, 4
      proto3_optional :name, :string, 5
    end
    add_message "google.ads.googleads.v7.common.LocationInfo" do
      proto3_optional :geo_target_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.DeviceInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.DeviceEnum.Device"
    end
    add_message "google.ads.googleads.v7.common.PreferredContentInfo" do
      optional :type, :enum, 2, "google.ads.googleads.v7.enums.PreferredContentTypeEnum.PreferredContentType"
    end
    add_message "google.ads.googleads.v7.common.ListingGroupInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.ListingGroupTypeEnum.ListingGroupType"
      optional :case_value, :message, 2, "google.ads.googleads.v7.common.ListingDimensionInfo"
      proto3_optional :parent_ad_group_criterion, :string, 4
    end
    add_message "google.ads.googleads.v7.common.ListingScopeInfo" do
      repeated :dimensions, :message, 2, "google.ads.googleads.v7.common.ListingDimensionInfo"
    end
    add_message "google.ads.googleads.v7.common.ListingDimensionInfo" do
      oneof :dimension do
        optional :hotel_id, :message, 2, "google.ads.googleads.v7.common.HotelIdInfo"
        optional :hotel_class, :message, 3, "google.ads.googleads.v7.common.HotelClassInfo"
        optional :hotel_country_region, :message, 4, "google.ads.googleads.v7.common.HotelCountryRegionInfo"
        optional :hotel_state, :message, 5, "google.ads.googleads.v7.common.HotelStateInfo"
        optional :hotel_city, :message, 6, "google.ads.googleads.v7.common.HotelCityInfo"
        optional :product_bidding_category, :message, 13, "google.ads.googleads.v7.common.ProductBiddingCategoryInfo"
        optional :product_brand, :message, 15, "google.ads.googleads.v7.common.ProductBrandInfo"
        optional :product_channel, :message, 8, "google.ads.googleads.v7.common.ProductChannelInfo"
        optional :product_channel_exclusivity, :message, 9, "google.ads.googleads.v7.common.ProductChannelExclusivityInfo"
        optional :product_condition, :message, 10, "google.ads.googleads.v7.common.ProductConditionInfo"
        optional :product_custom_attribute, :message, 16, "google.ads.googleads.v7.common.ProductCustomAttributeInfo"
        optional :product_item_id, :message, 11, "google.ads.googleads.v7.common.ProductItemIdInfo"
        optional :product_type, :message, 12, "google.ads.googleads.v7.common.ProductTypeInfo"
        optional :unknown_listing_dimension, :message, 14, "google.ads.googleads.v7.common.UnknownListingDimensionInfo"
      end
    end
    add_message "google.ads.googleads.v7.common.HotelIdInfo" do
      proto3_optional :value, :string, 2
    end
    add_message "google.ads.googleads.v7.common.HotelClassInfo" do
      proto3_optional :value, :int64, 2
    end
    add_message "google.ads.googleads.v7.common.HotelCountryRegionInfo" do
      proto3_optional :country_region_criterion, :string, 2
    end
    add_message "google.ads.googleads.v7.common.HotelStateInfo" do
      proto3_optional :state_criterion, :string, 2
    end
    add_message "google.ads.googleads.v7.common.HotelCityInfo" do
      proto3_optional :city_criterion, :string, 2
    end
    add_message "google.ads.googleads.v7.common.ProductBiddingCategoryInfo" do
      proto3_optional :id, :int64, 4
      proto3_optional :country_code, :string, 5
      optional :level, :enum, 3, "google.ads.googleads.v7.enums.ProductBiddingCategoryLevelEnum.ProductBiddingCategoryLevel"
    end
    add_message "google.ads.googleads.v7.common.ProductBrandInfo" do
      proto3_optional :value, :string, 2
    end
    add_message "google.ads.googleads.v7.common.ProductChannelInfo" do
      optional :channel, :enum, 1, "google.ads.googleads.v7.enums.ProductChannelEnum.ProductChannel"
    end
    add_message "google.ads.googleads.v7.common.ProductChannelExclusivityInfo" do
      optional :channel_exclusivity, :enum, 1, "google.ads.googleads.v7.enums.ProductChannelExclusivityEnum.ProductChannelExclusivity"
    end
    add_message "google.ads.googleads.v7.common.ProductConditionInfo" do
      optional :condition, :enum, 1, "google.ads.googleads.v7.enums.ProductConditionEnum.ProductCondition"
    end
    add_message "google.ads.googleads.v7.common.ProductCustomAttributeInfo" do
      proto3_optional :value, :string, 3
      optional :index, :enum, 2, "google.ads.googleads.v7.enums.ProductCustomAttributeIndexEnum.ProductCustomAttributeIndex"
    end
    add_message "google.ads.googleads.v7.common.ProductItemIdInfo" do
      proto3_optional :value, :string, 2
    end
    add_message "google.ads.googleads.v7.common.ProductTypeInfo" do
      proto3_optional :value, :string, 3
      optional :level, :enum, 2, "google.ads.googleads.v7.enums.ProductTypeLevelEnum.ProductTypeLevel"
    end
    add_message "google.ads.googleads.v7.common.UnknownListingDimensionInfo" do
    end
    add_message "google.ads.googleads.v7.common.HotelDateSelectionTypeInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.HotelDateSelectionTypeEnum.HotelDateSelectionType"
    end
    add_message "google.ads.googleads.v7.common.HotelAdvanceBookingWindowInfo" do
      proto3_optional :min_days, :int64, 3
      proto3_optional :max_days, :int64, 4
    end
    add_message "google.ads.googleads.v7.common.HotelLengthOfStayInfo" do
      proto3_optional :min_nights, :int64, 3
      proto3_optional :max_nights, :int64, 4
    end
    add_message "google.ads.googleads.v7.common.HotelCheckInDateRangeInfo" do
      optional :start_date, :string, 1
      optional :end_date, :string, 2
    end
    add_message "google.ads.googleads.v7.common.HotelCheckInDayInfo" do
      optional :day_of_week, :enum, 1, "google.ads.googleads.v7.enums.DayOfWeekEnum.DayOfWeek"
    end
    add_message "google.ads.googleads.v7.common.InteractionTypeInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.InteractionTypeEnum.InteractionType"
    end
    add_message "google.ads.googleads.v7.common.AdScheduleInfo" do
      optional :start_minute, :enum, 1, "google.ads.googleads.v7.enums.MinuteOfHourEnum.MinuteOfHour"
      optional :end_minute, :enum, 2, "google.ads.googleads.v7.enums.MinuteOfHourEnum.MinuteOfHour"
      proto3_optional :start_hour, :int32, 6
      proto3_optional :end_hour, :int32, 7
      optional :day_of_week, :enum, 5, "google.ads.googleads.v7.enums.DayOfWeekEnum.DayOfWeek"
    end
    add_message "google.ads.googleads.v7.common.AgeRangeInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.AgeRangeTypeEnum.AgeRangeType"
    end
    add_message "google.ads.googleads.v7.common.GenderInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.GenderTypeEnum.GenderType"
    end
    add_message "google.ads.googleads.v7.common.IncomeRangeInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.IncomeRangeTypeEnum.IncomeRangeType"
    end
    add_message "google.ads.googleads.v7.common.ParentalStatusInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.ParentalStatusTypeEnum.ParentalStatusType"
    end
    add_message "google.ads.googleads.v7.common.YouTubeVideoInfo" do
      proto3_optional :video_id, :string, 2
    end
    add_message "google.ads.googleads.v7.common.YouTubeChannelInfo" do
      proto3_optional :channel_id, :string, 2
    end
    add_message "google.ads.googleads.v7.common.UserListInfo" do
      proto3_optional :user_list, :string, 2
    end
    add_message "google.ads.googleads.v7.common.ProximityInfo" do
      optional :geo_point, :message, 1, "google.ads.googleads.v7.common.GeoPointInfo"
      proto3_optional :radius, :double, 5
      optional :radius_units, :enum, 3, "google.ads.googleads.v7.enums.ProximityRadiusUnitsEnum.ProximityRadiusUnits"
      optional :address, :message, 4, "google.ads.googleads.v7.common.AddressInfo"
    end
    add_message "google.ads.googleads.v7.common.GeoPointInfo" do
      proto3_optional :longitude_in_micro_degrees, :int32, 3
      proto3_optional :latitude_in_micro_degrees, :int32, 4
    end
    add_message "google.ads.googleads.v7.common.AddressInfo" do
      proto3_optional :postal_code, :string, 8
      proto3_optional :province_code, :string, 9
      proto3_optional :country_code, :string, 10
      proto3_optional :province_name, :string, 11
      proto3_optional :street_address, :string, 12
      proto3_optional :street_address2, :string, 13
      proto3_optional :city_name, :string, 14
    end
    add_message "google.ads.googleads.v7.common.TopicInfo" do
      proto3_optional :topic_constant, :string, 3
      repeated :path, :string, 4
    end
    add_message "google.ads.googleads.v7.common.LanguageInfo" do
      proto3_optional :language_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.IpBlockInfo" do
      proto3_optional :ip_address, :string, 2
    end
    add_message "google.ads.googleads.v7.common.ContentLabelInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.ContentLabelTypeEnum.ContentLabelType"
    end
    add_message "google.ads.googleads.v7.common.CarrierInfo" do
      proto3_optional :carrier_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.UserInterestInfo" do
      proto3_optional :user_interest_category, :string, 2
    end
    add_message "google.ads.googleads.v7.common.WebpageInfo" do
      proto3_optional :criterion_name, :string, 3
      repeated :conditions, :message, 2, "google.ads.googleads.v7.common.WebpageConditionInfo"
      optional :coverage_percentage, :double, 4
      optional :sample, :message, 5, "google.ads.googleads.v7.common.WebpageSampleInfo"
    end
    add_message "google.ads.googleads.v7.common.WebpageConditionInfo" do
      optional :operand, :enum, 1, "google.ads.googleads.v7.enums.WebpageConditionOperandEnum.WebpageConditionOperand"
      optional :operator, :enum, 2, "google.ads.googleads.v7.enums.WebpageConditionOperatorEnum.WebpageConditionOperator"
      proto3_optional :argument, :string, 4
    end
    add_message "google.ads.googleads.v7.common.WebpageSampleInfo" do
      repeated :sample_urls, :string, 1
    end
    add_message "google.ads.googleads.v7.common.OperatingSystemVersionInfo" do
      proto3_optional :operating_system_version_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.AppPaymentModelInfo" do
      optional :type, :enum, 1, "google.ads.googleads.v7.enums.AppPaymentModelTypeEnum.AppPaymentModelType"
    end
    add_message "google.ads.googleads.v7.common.MobileDeviceInfo" do
      proto3_optional :mobile_device_constant, :string, 2
    end
    add_message "google.ads.googleads.v7.common.CustomAffinityInfo" do
      proto3_optional :custom_affinity, :string, 2
    end
    add_message "google.ads.googleads.v7.common.CustomIntentInfo" do
      proto3_optional :custom_intent, :string, 2
    end
    add_message "google.ads.googleads.v7.common.LocationGroupInfo" do
      proto3_optional :feed, :string, 5
      repeated :geo_target_constants, :string, 6
      proto3_optional :radius, :int64, 7
      optional :radius_units, :enum, 4, "google.ads.googleads.v7.enums.LocationGroupRadiusUnitsEnum.LocationGroupRadiusUnits"
      repeated :feed_item_sets, :string, 8
    end
    add_message "google.ads.googleads.v7.common.CustomAudienceInfo" do
      optional :custom_audience, :string, 1
    end
    add_message "google.ads.googleads.v7.common.CombinedAudienceInfo" do
      optional :combined_audience, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Common
          KeywordInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.KeywordInfo").msgclass
          PlacementInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.PlacementInfo").msgclass
          MobileAppCategoryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.MobileAppCategoryInfo").msgclass
          MobileApplicationInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.MobileApplicationInfo").msgclass
          LocationInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.LocationInfo").msgclass
          DeviceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.DeviceInfo").msgclass
          PreferredContentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.PreferredContentInfo").msgclass
          ListingGroupInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ListingGroupInfo").msgclass
          ListingScopeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ListingScopeInfo").msgclass
          ListingDimensionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ListingDimensionInfo").msgclass
          HotelIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelIdInfo").msgclass
          HotelClassInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelClassInfo").msgclass
          HotelCountryRegionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelCountryRegionInfo").msgclass
          HotelStateInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelStateInfo").msgclass
          HotelCityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelCityInfo").msgclass
          ProductBiddingCategoryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductBiddingCategoryInfo").msgclass
          ProductBrandInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductBrandInfo").msgclass
          ProductChannelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductChannelInfo").msgclass
          ProductChannelExclusivityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductChannelExclusivityInfo").msgclass
          ProductConditionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductConditionInfo").msgclass
          ProductCustomAttributeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductCustomAttributeInfo").msgclass
          ProductItemIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductItemIdInfo").msgclass
          ProductTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProductTypeInfo").msgclass
          UnknownListingDimensionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.UnknownListingDimensionInfo").msgclass
          HotelDateSelectionTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelDateSelectionTypeInfo").msgclass
          HotelAdvanceBookingWindowInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelAdvanceBookingWindowInfo").msgclass
          HotelLengthOfStayInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelLengthOfStayInfo").msgclass
          HotelCheckInDateRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelCheckInDateRangeInfo").msgclass
          HotelCheckInDayInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.HotelCheckInDayInfo").msgclass
          InteractionTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.InteractionTypeInfo").msgclass
          AdScheduleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.AdScheduleInfo").msgclass
          AgeRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.AgeRangeInfo").msgclass
          GenderInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.GenderInfo").msgclass
          IncomeRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.IncomeRangeInfo").msgclass
          ParentalStatusInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ParentalStatusInfo").msgclass
          YouTubeVideoInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.YouTubeVideoInfo").msgclass
          YouTubeChannelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.YouTubeChannelInfo").msgclass
          UserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.UserListInfo").msgclass
          ProximityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ProximityInfo").msgclass
          GeoPointInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.GeoPointInfo").msgclass
          AddressInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.AddressInfo").msgclass
          TopicInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.TopicInfo").msgclass
          LanguageInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.LanguageInfo").msgclass
          IpBlockInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.IpBlockInfo").msgclass
          ContentLabelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.ContentLabelInfo").msgclass
          CarrierInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.CarrierInfo").msgclass
          UserInterestInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.UserInterestInfo").msgclass
          WebpageInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.WebpageInfo").msgclass
          WebpageConditionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.WebpageConditionInfo").msgclass
          WebpageSampleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.WebpageSampleInfo").msgclass
          OperatingSystemVersionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.OperatingSystemVersionInfo").msgclass
          AppPaymentModelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.AppPaymentModelInfo").msgclass
          MobileDeviceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.MobileDeviceInfo").msgclass
          CustomAffinityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.CustomAffinityInfo").msgclass
          CustomIntentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.CustomIntentInfo").msgclass
          LocationGroupInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.LocationGroupInfo").msgclass
          CustomAudienceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.CustomAudienceInfo").msgclass
          CombinedAudienceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.common.CombinedAudienceInfo").msgclass
        end
      end
    end
  end
end
