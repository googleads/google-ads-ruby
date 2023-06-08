# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/common/criteria.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/age_range_type_pb'
require 'google/ads/google_ads/v14/enums/app_payment_model_type_pb'
require 'google/ads/google_ads/v14/enums/content_label_type_pb'
require 'google/ads/google_ads/v14/enums/day_of_week_pb'
require 'google/ads/google_ads/v14/enums/device_pb'
require 'google/ads/google_ads/v14/enums/gender_type_pb'
require 'google/ads/google_ads/v14/enums/hotel_date_selection_type_pb'
require 'google/ads/google_ads/v14/enums/income_range_type_pb'
require 'google/ads/google_ads/v14/enums/interaction_type_pb'
require 'google/ads/google_ads/v14/enums/keyword_match_type_pb'
require 'google/ads/google_ads/v14/enums/listing_group_type_pb'
require 'google/ads/google_ads/v14/enums/location_group_radius_units_pb'
require 'google/ads/google_ads/v14/enums/minute_of_hour_pb'
require 'google/ads/google_ads/v14/enums/parental_status_type_pb'
require 'google/ads/google_ads/v14/enums/product_bidding_category_level_pb'
require 'google/ads/google_ads/v14/enums/product_channel_pb'
require 'google/ads/google_ads/v14/enums/product_channel_exclusivity_pb'
require 'google/ads/google_ads/v14/enums/product_condition_pb'
require 'google/ads/google_ads/v14/enums/product_custom_attribute_index_pb'
require 'google/ads/google_ads/v14/enums/product_type_level_pb'
require 'google/ads/google_ads/v14/enums/proximity_radius_units_pb'
require 'google/ads/google_ads/v14/enums/webpage_condition_operand_pb'
require 'google/ads/google_ads/v14/enums/webpage_condition_operator_pb'


descriptor_data = "\n.google/ads/googleads/v14/common/criteria.proto\x12\x1fgoogle.ads.googleads.v14.common\x1a\x33google/ads/googleads/v14/enums/age_range_type.proto\x1a;google/ads/googleads/v14/enums/app_payment_model_type.proto\x1a\x37google/ads/googleads/v14/enums/content_label_type.proto\x1a\x30google/ads/googleads/v14/enums/day_of_week.proto\x1a+google/ads/googleads/v14/enums/device.proto\x1a\x30google/ads/googleads/v14/enums/gender_type.proto\x1a>google/ads/googleads/v14/enums/hotel_date_selection_type.proto\x1a\x36google/ads/googleads/v14/enums/income_range_type.proto\x1a\x35google/ads/googleads/v14/enums/interaction_type.proto\x1a\x37google/ads/googleads/v14/enums/keyword_match_type.proto\x1a\x37google/ads/googleads/v14/enums/listing_group_type.proto\x1a@google/ads/googleads/v14/enums/location_group_radius_units.proto\x1a\x33google/ads/googleads/v14/enums/minute_of_hour.proto\x1a\x39google/ads/googleads/v14/enums/parental_status_type.proto\x1a\x43google/ads/googleads/v14/enums/product_bidding_category_level.proto\x1a\x34google/ads/googleads/v14/enums/product_channel.proto\x1a@google/ads/googleads/v14/enums/product_channel_exclusivity.proto\x1a\x36google/ads/googleads/v14/enums/product_condition.proto\x1a\x43google/ads/googleads/v14/enums/product_custom_attribute_index.proto\x1a\x37google/ads/googleads/v14/enums/product_type_level.proto\x1a;google/ads/googleads/v14/enums/proximity_radius_units.proto\x1a>google/ads/googleads/v14/enums/webpage_condition_operand.proto\x1a?google/ads/googleads/v14/enums/webpage_condition_operator.proto\"\x84\x01\n\x0bKeywordInfo\x12\x11\n\x04text\x18\x03 \x01(\tH\x00\x88\x01\x01\x12Y\n\nmatch_type\x18\x02 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.KeywordMatchTypeEnum.KeywordMatchTypeB\x07\n\x05_text\")\n\rPlacementInfo\x12\x10\n\x03url\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x06\n\x04_url\"A\n\x17NegativeKeywordListInfo\x12\x17\n\nshared_set\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\r\n\x0b_shared_set\"c\n\x15MobileAppCategoryInfo\x12)\n\x1cmobile_app_category_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x1f\n\x1d_mobile_app_category_constant\"S\n\x15MobileApplicationInfo\x12\x13\n\x06\x61pp_id\x18\x04 \x01(\tH\x00\x88\x01\x01\x12\x11\n\x04name\x18\x05 \x01(\tH\x01\x88\x01\x01\x42\t\n\x07_app_idB\x07\n\x05_name\"H\n\x0cLocationInfo\x12 \n\x13geo_target_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x16\n\x14_geo_target_constant\"M\n\nDeviceInfo\x12?\n\x04type\x18\x01 \x01(\x0e\x32\x31.google.ads.googleads.v14.enums.DeviceEnum.Device\"\xf8\x01\n\x10ListingGroupInfo\x12S\n\x04type\x18\x01 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.ListingGroupTypeEnum.ListingGroupType\x12I\n\ncase_value\x18\x02 \x01(\x0b\x32\x35.google.ads.googleads.v14.common.ListingDimensionInfo\x12&\n\x19parent_ad_group_criterion\x18\x04 \x01(\tH\x00\x88\x01\x01\x42\x1c\n\x1a_parent_ad_group_criterion\"]\n\x10ListingScopeInfo\x12I\n\ndimensions\x18\x02 \x03(\x0b\x32\x35.google.ads.googleads.v14.common.ListingDimensionInfo\"\xe7\r\n\x14ListingDimensionInfo\x12@\n\x08hotel_id\x18\x02 \x01(\x0b\x32,.google.ads.googleads.v14.common.HotelIdInfoH\x00\x12\x46\n\x0bhotel_class\x18\x03 \x01(\x0b\x32/.google.ads.googleads.v14.common.HotelClassInfoH\x00\x12W\n\x14hotel_country_region\x18\x04 \x01(\x0b\x32\x37.google.ads.googleads.v14.common.HotelCountryRegionInfoH\x00\x12\x46\n\x0bhotel_state\x18\x05 \x01(\x0b\x32/.google.ads.googleads.v14.common.HotelStateInfoH\x00\x12\x44\n\nhotel_city\x18\x06 \x01(\x0b\x32..google.ads.googleads.v14.common.HotelCityInfoH\x00\x12_\n\x18product_bidding_category\x18\r \x01(\x0b\x32;.google.ads.googleads.v14.common.ProductBiddingCategoryInfoH\x00\x12J\n\rproduct_brand\x18\x0f \x01(\x0b\x32\x31.google.ads.googleads.v14.common.ProductBrandInfoH\x00\x12N\n\x0fproduct_channel\x18\x08 \x01(\x0b\x32\x33.google.ads.googleads.v14.common.ProductChannelInfoH\x00\x12\x65\n\x1bproduct_channel_exclusivity\x18\t \x01(\x0b\x32>.google.ads.googleads.v14.common.ProductChannelExclusivityInfoH\x00\x12R\n\x11product_condition\x18\n \x01(\x0b\x32\x35.google.ads.googleads.v14.common.ProductConditionInfoH\x00\x12_\n\x18product_custom_attribute\x18\x10 \x01(\x0b\x32;.google.ads.googleads.v14.common.ProductCustomAttributeInfoH\x00\x12M\n\x0fproduct_item_id\x18\x0b \x01(\x0b\x32\x32.google.ads.googleads.v14.common.ProductItemIdInfoH\x00\x12H\n\x0cproduct_type\x18\x0c \x01(\x0b\x32\x30.google.ads.googleads.v14.common.ProductTypeInfoH\x00\x12P\n\x10product_grouping\x18\x11 \x01(\x0b\x32\x34.google.ads.googleads.v14.common.ProductGroupingInfoH\x00\x12L\n\x0eproduct_labels\x18\x12 \x01(\x0b\x32\x32.google.ads.googleads.v14.common.ProductLabelsInfoH\x00\x12_\n\x18product_legacy_condition\x18\x13 \x01(\x0b\x32;.google.ads.googleads.v14.common.ProductLegacyConditionInfoH\x00\x12Q\n\x11product_type_full\x18\x14 \x01(\x0b\x32\x34.google.ads.googleads.v14.common.ProductTypeFullInfoH\x00\x12\x46\n\x0b\x61\x63tivity_id\x18\x15 \x01(\x0b\x32/.google.ads.googleads.v14.common.ActivityIdInfoH\x00\x12N\n\x0f\x61\x63tivity_rating\x18\x16 \x01(\x0b\x32\x33.google.ads.googleads.v14.common.ActivityRatingInfoH\x00\x12P\n\x10\x61\x63tivity_country\x18\x17 \x01(\x0b\x32\x34.google.ads.googleads.v14.common.ActivityCountryInfoH\x00\x12\x61\n\x19unknown_listing_dimension\x18\x0e \x01(\x0b\x32<.google.ads.googleads.v14.common.UnknownListingDimensionInfoH\x00\x42\x0b\n\tdimension\"+\n\x0bHotelIdInfo\x12\x12\n\x05value\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\".\n\x0eHotelClassInfo\x12\x12\n\x05value\x18\x02 \x01(\x03H\x00\x88\x01\x01\x42\x08\n\x06_value\"\\\n\x16HotelCountryRegionInfo\x12%\n\x18\x63ountry_region_criterion\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x1b\n\x19_country_region_criterion\"B\n\x0eHotelStateInfo\x12\x1c\n\x0fstate_criterion\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x12\n\x10_state_criterion\"?\n\rHotelCityInfo\x12\x1b\n\x0e\x63ity_criterion\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x11\n\x0f_city_criterion\"\xa0\x01\n\x1aProductBiddingCategoryInfo\x12\x0f\n\x02id\x18\x04 \x01(\x03H\x00\x88\x01\x01\x12j\n\x05level\x18\x03 \x01(\x0e\x32[.google.ads.googleads.v14.enums.ProductBiddingCategoryLevelEnum.ProductBiddingCategoryLevelB\x05\n\x03_id\"0\n\x10ProductBrandInfo\x12\x12\n\x05value\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"h\n\x12ProductChannelInfo\x12R\n\x07\x63hannel\x18\x01 \x01(\x0e\x32\x41.google.ads.googleads.v14.enums.ProductChannelEnum.ProductChannel\"\x95\x01\n\x1dProductChannelExclusivityInfo\x12t\n\x13\x63hannel_exclusivity\x18\x01 \x01(\x0e\x32W.google.ads.googleads.v14.enums.ProductChannelExclusivityEnum.ProductChannelExclusivity\"p\n\x14ProductConditionInfo\x12X\n\tcondition\x18\x01 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.ProductConditionEnum.ProductCondition\"\xa6\x01\n\x1aProductCustomAttributeInfo\x12\x12\n\x05value\x18\x03 \x01(\tH\x00\x88\x01\x01\x12j\n\x05index\x18\x02 \x01(\x0e\x32[.google.ads.googleads.v14.enums.ProductCustomAttributeIndexEnum.ProductCustomAttributeIndexB\x08\n\x06_value\"1\n\x11ProductItemIdInfo\x12\x12\n\x05value\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"\x85\x01\n\x0fProductTypeInfo\x12\x12\n\x05value\x18\x03 \x01(\tH\x00\x88\x01\x01\x12T\n\x05level\x18\x02 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.ProductTypeLevelEnum.ProductTypeLevelB\x08\n\x06_value\"3\n\x13ProductGroupingInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"1\n\x11ProductLabelsInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\":\n\x1aProductLegacyConditionInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"3\n\x13ProductTypeFullInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"\x1d\n\x1bUnknownListingDimensionInfo\"}\n\x1aHotelDateSelectionTypeInfo\x12_\n\x04type\x18\x01 \x01(\x0e\x32Q.google.ads.googleads.v14.enums.HotelDateSelectionTypeEnum.HotelDateSelectionType\"g\n\x1dHotelAdvanceBookingWindowInfo\x12\x15\n\x08min_days\x18\x03 \x01(\x03H\x00\x88\x01\x01\x12\x15\n\x08max_days\x18\x04 \x01(\x03H\x01\x88\x01\x01\x42\x0b\n\t_min_daysB\x0b\n\t_max_days\"g\n\x15HotelLengthOfStayInfo\x12\x17\n\nmin_nights\x18\x03 \x01(\x03H\x00\x88\x01\x01\x12\x17\n\nmax_nights\x18\x04 \x01(\x03H\x01\x88\x01\x01\x42\r\n\x0b_min_nightsB\r\n\x0b_max_nights\"A\n\x19HotelCheckInDateRangeInfo\x12\x12\n\nstart_date\x18\x01 \x01(\t\x12\x10\n\x08\x65nd_date\x18\x02 \x01(\t\"c\n\x13HotelCheckInDayInfo\x12L\n\x0b\x64\x61y_of_week\x18\x01 \x01(\x0e\x32\x37.google.ads.googleads.v14.enums.DayOfWeekEnum.DayOfWeek\".\n\x0e\x41\x63tivityIdInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"2\n\x12\x41\x63tivityRatingInfo\x12\x12\n\x05value\x18\x01 \x01(\x03H\x00\x88\x01\x01\x42\x08\n\x06_value\"3\n\x13\x41\x63tivityCountryInfo\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\"h\n\x13InteractionTypeInfo\x12Q\n\x04type\x18\x01 \x01(\x0e\x32\x43.google.ads.googleads.v14.enums.InteractionTypeEnum.InteractionType\"\xd2\x02\n\x0e\x41\x64ScheduleInfo\x12S\n\x0cstart_minute\x18\x01 \x01(\x0e\x32=.google.ads.googleads.v14.enums.MinuteOfHourEnum.MinuteOfHour\x12Q\n\nend_minute\x18\x02 \x01(\x0e\x32=.google.ads.googleads.v14.enums.MinuteOfHourEnum.MinuteOfHour\x12\x17\n\nstart_hour\x18\x06 \x01(\x05H\x00\x88\x01\x01\x12\x15\n\x08\x65nd_hour\x18\x07 \x01(\x05H\x01\x88\x01\x01\x12L\n\x0b\x64\x61y_of_week\x18\x05 \x01(\x0e\x32\x37.google.ads.googleads.v14.enums.DayOfWeekEnum.DayOfWeekB\r\n\x0b_start_hourB\x0b\n\t_end_hour\"[\n\x0c\x41geRangeInfo\x12K\n\x04type\x18\x01 \x01(\x0e\x32=.google.ads.googleads.v14.enums.AgeRangeTypeEnum.AgeRangeType\"U\n\nGenderInfo\x12G\n\x04type\x18\x01 \x01(\x0e\x32\x39.google.ads.googleads.v14.enums.GenderTypeEnum.GenderType\"d\n\x0fIncomeRangeInfo\x12Q\n\x04type\x18\x01 \x01(\x0e\x32\x43.google.ads.googleads.v14.enums.IncomeRangeTypeEnum.IncomeRangeType\"m\n\x12ParentalStatusInfo\x12W\n\x04type\x18\x01 \x01(\x0e\x32I.google.ads.googleads.v14.enums.ParentalStatusTypeEnum.ParentalStatusType\"6\n\x10YouTubeVideoInfo\x12\x15\n\x08video_id\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x0b\n\t_video_id\"<\n\x12YouTubeChannelInfo\x12\x17\n\nchannel_id\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\r\n\x0b_channel_id\"4\n\x0cUserListInfo\x12\x16\n\tuser_list\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x0c\n\n_user_list\"\x95\x02\n\rProximityInfo\x12@\n\tgeo_point\x18\x01 \x01(\x0b\x32-.google.ads.googleads.v14.common.GeoPointInfo\x12\x13\n\x06radius\x18\x05 \x01(\x01H\x00\x88\x01\x01\x12\x63\n\x0cradius_units\x18\x03 \x01(\x0e\x32M.google.ads.googleads.v14.enums.ProximityRadiusUnitsEnum.ProximityRadiusUnits\x12=\n\x07\x61\x64\x64ress\x18\x04 \x01(\x0b\x32,.google.ads.googleads.v14.common.AddressInfoB\t\n\x07_radius\"\x9c\x01\n\x0cGeoPointInfo\x12\'\n\x1alongitude_in_micro_degrees\x18\x03 \x01(\x05H\x00\x88\x01\x01\x12&\n\x19latitude_in_micro_degrees\x18\x04 \x01(\x05H\x01\x88\x01\x01\x42\x1d\n\x1b_longitude_in_micro_degreesB\x1c\n\x1a_latitude_in_micro_degrees\"\xc7\x02\n\x0b\x41\x64\x64ressInfo\x12\x18\n\x0bpostal_code\x18\x08 \x01(\tH\x00\x88\x01\x01\x12\x1a\n\rprovince_code\x18\t \x01(\tH\x01\x88\x01\x01\x12\x19\n\x0c\x63ountry_code\x18\n \x01(\tH\x02\x88\x01\x01\x12\x1a\n\rprovince_name\x18\x0b \x01(\tH\x03\x88\x01\x01\x12\x1b\n\x0estreet_address\x18\x0c \x01(\tH\x04\x88\x01\x01\x12\x1c\n\x0fstreet_address2\x18\r \x01(\tH\x05\x88\x01\x01\x12\x16\n\tcity_name\x18\x0e \x01(\tH\x06\x88\x01\x01\x42\x0e\n\x0c_postal_codeB\x10\n\x0e_province_codeB\x0f\n\r_country_codeB\x10\n\x0e_province_nameB\x11\n\x0f_street_addressB\x12\n\x10_street_address2B\x0c\n\n_city_name\"I\n\tTopicInfo\x12\x1b\n\x0etopic_constant\x18\x03 \x01(\tH\x00\x88\x01\x01\x12\x0c\n\x04path\x18\x04 \x03(\tB\x11\n\x0f_topic_constant\"D\n\x0cLanguageInfo\x12\x1e\n\x11language_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x14\n\x12_language_constant\"5\n\x0bIpBlockInfo\x12\x17\n\nip_address\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\r\n\x0b_ip_address\"g\n\x10\x43ontentLabelInfo\x12S\n\x04type\x18\x01 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.ContentLabelTypeEnum.ContentLabelType\"A\n\x0b\x43\x61rrierInfo\x12\x1d\n\x10\x63\x61rrier_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x13\n\x11_carrier_constant\"R\n\x10UserInterestInfo\x12#\n\x16user_interest_category\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x19\n\x17_user_interest_category\"\xe9\x01\n\x0bWebpageInfo\x12\x1b\n\x0e\x63riterion_name\x18\x03 \x01(\tH\x00\x88\x01\x01\x12I\n\nconditions\x18\x02 \x03(\x0b\x32\x35.google.ads.googleads.v14.common.WebpageConditionInfo\x12\x1b\n\x13\x63overage_percentage\x18\x04 \x01(\x01\x12\x42\n\x06sample\x18\x05 \x01(\x0b\x32\x32.google.ads.googleads.v14.common.WebpageSampleInfoB\x11\n\x0f_criterion_name\"\x89\x02\n\x14WebpageConditionInfo\x12\x64\n\x07operand\x18\x01 \x01(\x0e\x32S.google.ads.googleads.v14.enums.WebpageConditionOperandEnum.WebpageConditionOperand\x12g\n\x08operator\x18\x02 \x01(\x0e\x32U.google.ads.googleads.v14.enums.WebpageConditionOperatorEnum.WebpageConditionOperator\x12\x15\n\x08\x61rgument\x18\x04 \x01(\tH\x00\x88\x01\x01\x42\x0b\n\t_argument\"(\n\x11WebpageSampleInfo\x12\x13\n\x0bsample_urls\x18\x01 \x03(\t\"r\n\x1aOperatingSystemVersionInfo\x12.\n!operating_system_version_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42$\n\"_operating_system_version_constant\"p\n\x13\x41ppPaymentModelInfo\x12Y\n\x04type\x18\x01 \x01(\x0e\x32K.google.ads.googleads.v14.enums.AppPaymentModelTypeEnum.AppPaymentModelType\"R\n\x10MobileDeviceInfo\x12#\n\x16mobile_device_constant\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x19\n\x17_mobile_device_constant\"F\n\x12\x43ustomAffinityInfo\x12\x1c\n\x0f\x63ustom_affinity\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x12\n\x10_custom_affinity\"@\n\x10\x43ustomIntentInfo\x12\x1a\n\rcustom_intent\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x10\n\x0e_custom_intent\"\xf9\x02\n\x11LocationGroupInfo\x12\x11\n\x04\x66\x65\x65\x64\x18\x05 \x01(\tH\x00\x88\x01\x01\x12\x1c\n\x14geo_target_constants\x18\x06 \x03(\t\x12\x13\n\x06radius\x18\x07 \x01(\x03H\x01\x88\x01\x01\x12k\n\x0cradius_units\x18\x04 \x01(\x0e\x32U.google.ads.googleads.v14.enums.LocationGroupRadiusUnitsEnum.LocationGroupRadiusUnits\x12\x16\n\x0e\x66\x65\x65\x64_item_sets\x18\x08 \x03(\t\x12\x35\n(enable_customer_level_location_asset_set\x18\t \x01(\x08H\x02\x88\x01\x01\x12!\n\x19location_group_asset_sets\x18\n \x03(\tB\x07\n\x05_feedB\t\n\x07_radiusB+\n)_enable_customer_level_location_asset_set\"-\n\x12\x43ustomAudienceInfo\x12\x17\n\x0f\x63ustom_audience\x18\x01 \x01(\t\"1\n\x14\x43ombinedAudienceInfo\x12\x19\n\x11\x63ombined_audience\x18\x01 \x01(\t\" \n\x0c\x41udienceInfo\x12\x10\n\x08\x61udience\x18\x01 \x01(\t\"h\n\x10KeywordThemeInfo\x12 \n\x16keyword_theme_constant\x18\x01 \x01(\tH\x00\x12!\n\x17\x66ree_form_keyword_theme\x18\x02 \x01(\tH\x00\x42\x0f\n\rkeyword_theme\"(\n\x12LocalServiceIdInfo\x12\x12\n\nservice_id\x18\x01 \x01(\tB\xed\x01\n#com.google.ads.googleads.v14.commonB\rCriteriaProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Common\xea\x02#Google::Ads::GoogleAds::V14::Commonb\x06proto3"

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
        module Common
          KeywordInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.KeywordInfo").msgclass
          PlacementInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.PlacementInfo").msgclass
          NegativeKeywordListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.NegativeKeywordListInfo").msgclass
          MobileAppCategoryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.MobileAppCategoryInfo").msgclass
          MobileApplicationInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.MobileApplicationInfo").msgclass
          LocationInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.LocationInfo").msgclass
          DeviceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.DeviceInfo").msgclass
          ListingGroupInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ListingGroupInfo").msgclass
          ListingScopeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ListingScopeInfo").msgclass
          ListingDimensionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ListingDimensionInfo").msgclass
          HotelIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelIdInfo").msgclass
          HotelClassInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelClassInfo").msgclass
          HotelCountryRegionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelCountryRegionInfo").msgclass
          HotelStateInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelStateInfo").msgclass
          HotelCityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelCityInfo").msgclass
          ProductBiddingCategoryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductBiddingCategoryInfo").msgclass
          ProductBrandInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductBrandInfo").msgclass
          ProductChannelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductChannelInfo").msgclass
          ProductChannelExclusivityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductChannelExclusivityInfo").msgclass
          ProductConditionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductConditionInfo").msgclass
          ProductCustomAttributeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductCustomAttributeInfo").msgclass
          ProductItemIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductItemIdInfo").msgclass
          ProductTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductTypeInfo").msgclass
          ProductGroupingInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductGroupingInfo").msgclass
          ProductLabelsInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductLabelsInfo").msgclass
          ProductLegacyConditionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductLegacyConditionInfo").msgclass
          ProductTypeFullInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProductTypeFullInfo").msgclass
          UnknownListingDimensionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.UnknownListingDimensionInfo").msgclass
          HotelDateSelectionTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelDateSelectionTypeInfo").msgclass
          HotelAdvanceBookingWindowInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelAdvanceBookingWindowInfo").msgclass
          HotelLengthOfStayInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelLengthOfStayInfo").msgclass
          HotelCheckInDateRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelCheckInDateRangeInfo").msgclass
          HotelCheckInDayInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.HotelCheckInDayInfo").msgclass
          ActivityIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ActivityIdInfo").msgclass
          ActivityRatingInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ActivityRatingInfo").msgclass
          ActivityCountryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ActivityCountryInfo").msgclass
          InteractionTypeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.InteractionTypeInfo").msgclass
          AdScheduleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.AdScheduleInfo").msgclass
          AgeRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.AgeRangeInfo").msgclass
          GenderInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.GenderInfo").msgclass
          IncomeRangeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.IncomeRangeInfo").msgclass
          ParentalStatusInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ParentalStatusInfo").msgclass
          YouTubeVideoInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.YouTubeVideoInfo").msgclass
          YouTubeChannelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.YouTubeChannelInfo").msgclass
          UserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.UserListInfo").msgclass
          ProximityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ProximityInfo").msgclass
          GeoPointInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.GeoPointInfo").msgclass
          AddressInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.AddressInfo").msgclass
          TopicInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.TopicInfo").msgclass
          LanguageInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.LanguageInfo").msgclass
          IpBlockInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.IpBlockInfo").msgclass
          ContentLabelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.ContentLabelInfo").msgclass
          CarrierInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.CarrierInfo").msgclass
          UserInterestInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.UserInterestInfo").msgclass
          WebpageInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.WebpageInfo").msgclass
          WebpageConditionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.WebpageConditionInfo").msgclass
          WebpageSampleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.WebpageSampleInfo").msgclass
          OperatingSystemVersionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.OperatingSystemVersionInfo").msgclass
          AppPaymentModelInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.AppPaymentModelInfo").msgclass
          MobileDeviceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.MobileDeviceInfo").msgclass
          CustomAffinityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.CustomAffinityInfo").msgclass
          CustomIntentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.CustomIntentInfo").msgclass
          LocationGroupInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.LocationGroupInfo").msgclass
          CustomAudienceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.CustomAudienceInfo").msgclass
          CombinedAudienceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.CombinedAudienceInfo").msgclass
          AudienceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.AudienceInfo").msgclass
          KeywordThemeInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.KeywordThemeInfo").msgclass
          LocalServiceIdInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.LocalServiceIdInfo").msgclass
        end
      end
    end
  end
end
