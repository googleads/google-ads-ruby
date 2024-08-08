# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/common/segments.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/common/criteria_pb'
require 'google/ads/google_ads/v17/enums/ad_destination_type_pb'
require 'google/ads/google_ads/v17/enums/ad_format_type_pb'
require 'google/ads/google_ads/v17/enums/ad_network_type_pb'
require 'google/ads/google_ads/v17/enums/budget_campaign_association_status_pb'
require 'google/ads/google_ads/v17/enums/click_type_pb'
require 'google/ads/google_ads/v17/enums/conversion_action_category_pb'
require 'google/ads/google_ads/v17/enums/conversion_attribution_event_type_pb'
require 'google/ads/google_ads/v17/enums/conversion_lag_bucket_pb'
require 'google/ads/google_ads/v17/enums/conversion_or_adjustment_lag_bucket_pb'
require 'google/ads/google_ads/v17/enums/conversion_value_rule_primary_dimension_pb'
require 'google/ads/google_ads/v17/enums/converting_user_prior_engagement_type_and_ltv_bucket_pb'
require 'google/ads/google_ads/v17/enums/day_of_week_pb'
require 'google/ads/google_ads/v17/enums/device_pb'
require 'google/ads/google_ads/v17/enums/external_conversion_source_pb'
require 'google/ads/google_ads/v17/enums/hotel_date_selection_type_pb'
require 'google/ads/google_ads/v17/enums/hotel_price_bucket_pb'
require 'google/ads/google_ads/v17/enums/hotel_rate_type_pb'
require 'google/ads/google_ads/v17/enums/month_of_year_pb'
require 'google/ads/google_ads/v17/enums/placeholder_type_pb'
require 'google/ads/google_ads/v17/enums/product_channel_pb'
require 'google/ads/google_ads/v17/enums/product_channel_exclusivity_pb'
require 'google/ads/google_ads/v17/enums/product_condition_pb'
require 'google/ads/google_ads/v17/enums/recommendation_type_pb'
require 'google/ads/google_ads/v17/enums/search_engine_results_page_type_pb'
require 'google/ads/google_ads/v17/enums/search_term_match_type_pb'
require 'google/ads/google_ads/v17/enums/sk_ad_network_ad_event_type_pb'
require 'google/ads/google_ads/v17/enums/sk_ad_network_attribution_credit_pb'
require 'google/ads/google_ads/v17/enums/sk_ad_network_coarse_conversion_value_pb'
require 'google/ads/google_ads/v17/enums/sk_ad_network_source_type_pb'
require 'google/ads/google_ads/v17/enums/sk_ad_network_user_type_pb'
require 'google/ads/google_ads/v17/enums/slot_pb'
require 'google/api/resource_pb'


descriptor_data = "\n.google/ads/googleads/v17/common/segments.proto\x12\x1fgoogle.ads.googleads.v17.common\x1a.google/ads/googleads/v17/common/criteria.proto\x1a\x38google/ads/googleads/v17/enums/ad_destination_type.proto\x1a\x33google/ads/googleads/v17/enums/ad_format_type.proto\x1a\x34google/ads/googleads/v17/enums/ad_network_type.proto\x1aGgoogle/ads/googleads/v17/enums/budget_campaign_association_status.proto\x1a/google/ads/googleads/v17/enums/click_type.proto\x1a?google/ads/googleads/v17/enums/conversion_action_category.proto\x1a\x46google/ads/googleads/v17/enums/conversion_attribution_event_type.proto\x1a:google/ads/googleads/v17/enums/conversion_lag_bucket.proto\x1aHgoogle/ads/googleads/v17/enums/conversion_or_adjustment_lag_bucket.proto\x1aLgoogle/ads/googleads/v17/enums/conversion_value_rule_primary_dimension.proto\x1aYgoogle/ads/googleads/v17/enums/converting_user_prior_engagement_type_and_ltv_bucket.proto\x1a\x30google/ads/googleads/v17/enums/day_of_week.proto\x1a+google/ads/googleads/v17/enums/device.proto\x1a?google/ads/googleads/v17/enums/external_conversion_source.proto\x1a>google/ads/googleads/v17/enums/hotel_date_selection_type.proto\x1a\x37google/ads/googleads/v17/enums/hotel_price_bucket.proto\x1a\x34google/ads/googleads/v17/enums/hotel_rate_type.proto\x1a\x32google/ads/googleads/v17/enums/month_of_year.proto\x1a\x35google/ads/googleads/v17/enums/placeholder_type.proto\x1a\x34google/ads/googleads/v17/enums/product_channel.proto\x1a@google/ads/googleads/v17/enums/product_channel_exclusivity.proto\x1a\x36google/ads/googleads/v17/enums/product_condition.proto\x1a\x38google/ads/googleads/v17/enums/recommendation_type.proto\x1a\x44google/ads/googleads/v17/enums/search_engine_results_page_type.proto\x1a;google/ads/googleads/v17/enums/search_term_match_type.proto\x1a@google/ads/googleads/v17/enums/sk_ad_network_ad_event_type.proto\x1a\x45google/ads/googleads/v17/enums/sk_ad_network_attribution_credit.proto\x1aJgoogle/ads/googleads/v17/enums/sk_ad_network_coarse_conversion_value.proto\x1a>google/ads/googleads/v17/enums/sk_ad_network_source_type.proto\x1a<google/ads/googleads/v17/enums/sk_ad_network_user_type.proto\x1a)google/ads/googleads/v17/enums/slot.proto\x1a\x19google/api/resource.proto\"\xe7>\n\x08Segments\x12!\n\x13\x61\x63tivity_account_id\x18\x94\x01 \x01(\x03H\x00\x88\x01\x01\x12\x1b\n\ractivity_city\x18\xb9\x01 \x01(\tH\x01\x88\x01\x01\x12\x1e\n\x10\x61\x63tivity_country\x18\xba\x01 \x01(\tH\x02\x88\x01\x01\x12\x1d\n\x0f\x61\x63tivity_rating\x18\x95\x01 \x01(\x03H\x03\x88\x01\x01\x12\x1c\n\x0e\x61\x63tivity_state\x18\xbb\x01 \x01(\tH\x04\x88\x01\x01\x12\"\n\x14\x65xternal_activity_id\x18\x96\x01 \x01(\tH\x05\x88\x01\x01\x12\x65\n\x13\x61\x64_destination_type\x18\x88\x01 \x01(\x0e\x32G.google.ads.googleads.v17.enums.AdDestinationTypeEnum.AdDestinationType\x12V\n\x0e\x61\x64_format_type\x18\xbf\x01 \x01(\x0e\x32=.google.ads.googleads.v17.enums.AdFormatTypeEnum.AdFormatType\x12X\n\x0f\x61\x64_network_type\x18\x03 \x01(\x0e\x32?.google.ads.googleads.v17.enums.AdNetworkTypeEnum.AdNetworkType\x12\x16\n\x08\x61\x64_group\x18\x9e\x01 \x01(\tH\x06\x88\x01\x01\x12\x19\n\x0b\x61sset_group\x18\x9f\x01 \x01(\tH\x07\x88\x01\x01\x12$\n\x16\x61uction_insight_domain\x18\x91\x01 \x01(\tH\x08\x88\x01\x01\x12m\n\"budget_campaign_association_status\x18\x86\x01 \x01(\x0b\x32@.google.ads.googleads.v17.common.BudgetCampaignAssociationStatus\x12\x16\n\x08\x63\x61mpaign\x18\x9d\x01 \x01(\tH\t\x88\x01\x01\x12K\n\nclick_type\x18\x1a \x01(\x0e\x32\x37.google.ads.googleads.v17.enums.ClickTypeEnum.ClickType\x12N\n\x11\x63onversion_action\x18q \x01(\tB.\xfa\x41+\n)googleads.googleapis.com/ConversionActionH\n\x88\x01\x01\x12y\n\x1a\x63onversion_action_category\x18\x35 \x01(\x0e\x32U.google.ads.googleads.v17.enums.ConversionActionCategoryEnum.ConversionActionCategory\x12#\n\x16\x63onversion_action_name\x18r \x01(\tH\x0b\x88\x01\x01\x12\"\n\x15\x63onversion_adjustment\x18s \x01(\x08H\x0c\x88\x01\x01\x12\x8c\x01\n!conversion_attribution_event_type\x18\x02 \x01(\x0e\x32\x61.google.ads.googleads.v17.enums.ConversionAttributionEventTypeEnum.ConversionAttributionEventType\x12j\n\x15\x63onversion_lag_bucket\x18\x32 \x01(\x0e\x32K.google.ads.googleads.v17.enums.ConversionLagBucketEnum.ConversionLagBucket\x12\x90\x01\n#conversion_or_adjustment_lag_bucket\x18\x33 \x01(\x0e\x32\x63.google.ads.googleads.v17.enums.ConversionOrAdjustmentLagBucketEnum.ConversionOrAdjustmentLagBucket\x12\x11\n\x04\x64\x61te\x18O \x01(\tH\r\x88\x01\x01\x12L\n\x0b\x64\x61y_of_week\x18\x05 \x01(\x0e\x32\x37.google.ads.googleads.v17.enums.DayOfWeekEnum.DayOfWeek\x12\x41\n\x06\x64\x65vice\x18\x01 \x01(\x0e\x32\x31.google.ads.googleads.v17.enums.DeviceEnum.Device\x12y\n\x1a\x65xternal_conversion_source\x18\x37 \x01(\x0e\x32U.google.ads.googleads.v17.enums.ExternalConversionSourceEnum.ExternalConversionSource\x12\x1f\n\x12geo_target_airport\x18t \x01(\tH\x0e\x88\x01\x01\x12\x1e\n\x11geo_target_canton\x18u \x01(\tH\x0f\x88\x01\x01\x12\x1c\n\x0fgeo_target_city\x18v \x01(\tH\x10\x88\x01\x01\x12\x1f\n\x12geo_target_country\x18w \x01(\tH\x11\x88\x01\x01\x12\x1e\n\x11geo_target_county\x18x \x01(\tH\x12\x88\x01\x01\x12 \n\x13geo_target_district\x18y \x01(\tH\x13\x88\x01\x01\x12\x1d\n\x10geo_target_metro\x18z \x01(\tH\x14\x88\x01\x01\x12.\n!geo_target_most_specific_location\x18{ \x01(\tH\x15\x88\x01\x01\x12#\n\x16geo_target_postal_code\x18| \x01(\tH\x16\x88\x01\x01\x12 \n\x13geo_target_province\x18} \x01(\tH\x17\x88\x01\x01\x12\x1e\n\x11geo_target_region\x18~ \x01(\tH\x18\x88\x01\x01\x12\x1d\n\x10geo_target_state\x18\x7f \x01(\tH\x19\x88\x01\x01\x12\'\n\x19hotel_booking_window_days\x18\x87\x01 \x01(\x03H\x1a\x88\x01\x01\x12\x1c\n\x0fhotel_center_id\x18P \x01(\x03H\x1b\x88\x01\x01\x12 \n\x13hotel_check_in_date\x18Q \x01(\tH\x1c\x88\x01\x01\x12[\n\x1ahotel_check_in_day_of_week\x18\t \x01(\x0e\x32\x37.google.ads.googleads.v17.enums.DayOfWeekEnum.DayOfWeek\x12\x17\n\nhotel_city\x18R \x01(\tH\x1d\x88\x01\x01\x12\x18\n\x0bhotel_class\x18S \x01(\x05H\x1e\x88\x01\x01\x12\x1a\n\rhotel_country\x18T \x01(\tH\x1f\x88\x01\x01\x12t\n\x19hotel_date_selection_type\x18\r \x01(\x0e\x32Q.google.ads.googleads.v17.enums.HotelDateSelectionTypeEnum.HotelDateSelectionType\x12!\n\x14hotel_length_of_stay\x18U \x01(\x05H \x88\x01\x01\x12\x1f\n\x12hotel_rate_rule_id\x18V \x01(\tH!\x88\x01\x01\x12X\n\x0fhotel_rate_type\x18J \x01(\x0e\x32?.google.ads.googleads.v17.enums.HotelRateTypeEnum.HotelRateType\x12\x61\n\x12hotel_price_bucket\x18N \x01(\x0e\x32\x45.google.ads.googleads.v17.enums.HotelPriceBucketEnum.HotelPriceBucket\x12\x18\n\x0bhotel_state\x18W \x01(\tH\"\x88\x01\x01\x12\x11\n\x04hour\x18X \x01(\x05H#\x88\x01\x01\x12*\n\x1dinteraction_on_this_extension\x18Y \x01(\x08H$\x88\x01\x01\x12\x39\n\x07keyword\x18= \x01(\x0b\x32(.google.ads.googleads.v17.common.Keyword\x12\x12\n\x05month\x18Z \x01(\tH%\x88\x01\x01\x12R\n\rmonth_of_year\x18\x12 \x01(\x0e\x32;.google.ads.googleads.v17.enums.MonthOfYearEnum.MonthOfYear\x12\x1d\n\x10partner_hotel_id\x18[ \x01(\tH&\x88\x01\x01\x12]\n\x10placeholder_type\x18\x14 \x01(\x0e\x32\x43.google.ads.googleads.v17.enums.PlaceholderTypeEnum.PlaceholderType\x12#\n\x15product_aggregator_id\x18\x84\x01 \x01(\x03H\'\x88\x01\x01\x12%\n\x17product_category_level1\x18\xa1\x01 \x01(\tH(\x88\x01\x01\x12%\n\x17product_category_level2\x18\xa2\x01 \x01(\tH)\x88\x01\x01\x12%\n\x17product_category_level3\x18\xa3\x01 \x01(\tH*\x88\x01\x01\x12%\n\x17product_category_level4\x18\xa4\x01 \x01(\tH+\x88\x01\x01\x12%\n\x17product_category_level5\x18\xa5\x01 \x01(\tH,\x88\x01\x01\x12\x1a\n\rproduct_brand\x18\x61 \x01(\tH-\x88\x01\x01\x12Z\n\x0fproduct_channel\x18\x1e \x01(\x0e\x32\x41.google.ads.googleads.v17.enums.ProductChannelEnum.ProductChannel\x12|\n\x1bproduct_channel_exclusivity\x18\x1f \x01(\x0e\x32W.google.ads.googleads.v17.enums.ProductChannelExclusivityEnum.ProductChannelExclusivity\x12`\n\x11product_condition\x18  \x01(\x0e\x32\x45.google.ads.googleads.v17.enums.ProductConditionEnum.ProductCondition\x12\x1c\n\x0fproduct_country\x18\x62 \x01(\tH.\x88\x01\x01\x12&\n\x19product_custom_attribute0\x18\x63 \x01(\tH/\x88\x01\x01\x12&\n\x19product_custom_attribute1\x18\x64 \x01(\tH0\x88\x01\x01\x12&\n\x19product_custom_attribute2\x18\x65 \x01(\tH1\x88\x01\x01\x12&\n\x19product_custom_attribute3\x18\x66 \x01(\tH2\x88\x01\x01\x12&\n\x19product_custom_attribute4\x18g \x01(\tH3\x88\x01\x01\x12 \n\x12product_feed_label\x18\x93\x01 \x01(\tH4\x88\x01\x01\x12\x1c\n\x0fproduct_item_id\x18h \x01(\tH5\x88\x01\x01\x12\x1d\n\x10product_language\x18i \x01(\tH6\x88\x01\x01\x12!\n\x13product_merchant_id\x18\x85\x01 \x01(\x03H7\x88\x01\x01\x12\x1d\n\x10product_store_id\x18j \x01(\tH8\x88\x01\x01\x12\x1a\n\rproduct_title\x18k \x01(\tH9\x88\x01\x01\x12\x1c\n\x0fproduct_type_l1\x18l \x01(\tH:\x88\x01\x01\x12\x1c\n\x0fproduct_type_l2\x18m \x01(\tH;\x88\x01\x01\x12\x1c\n\x0fproduct_type_l3\x18n \x01(\tH<\x88\x01\x01\x12\x1c\n\x0fproduct_type_l4\x18o \x01(\tH=\x88\x01\x01\x12\x1c\n\x0fproduct_type_l5\x18p \x01(\tH>\x88\x01\x01\x12\x15\n\x07quarter\x18\x80\x01 \x01(\tH?\x88\x01\x01\x12g\n\x13recommendation_type\x18\x8c\x01 \x01(\x0e\x32I.google.ads.googleads.v17.enums.RecommendationTypeEnum.RecommendationType\x12\x84\x01\n\x1fsearch_engine_results_page_type\x18\x46 \x01(\x0e\x32[.google.ads.googleads.v17.enums.SearchEngineResultsPageTypeEnum.SearchEngineResultsPageType\x12 \n\x12search_subcategory\x18\x9b\x01 \x01(\tH@\x88\x01\x01\x12\x19\n\x0bsearch_term\x18\x9c\x01 \x01(\tHA\x88\x01\x01\x12k\n\x16search_term_match_type\x18\x16 \x01(\x0e\x32K.google.ads.googleads.v17.enums.SearchTermMatchTypeEnum.SearchTermMatchType\x12;\n\x04slot\x18\x17 \x01(\x0e\x32-.google.ads.googleads.v17.enums.SlotEnum.Slot\x12\x9d\x01\n\'conversion_value_rule_primary_dimension\x18\x8a\x01 \x01(\x0e\x32k.google.ads.googleads.v17.enums.ConversionValueRulePrimaryDimensionEnum.ConversionValueRulePrimaryDimension\x12\x15\n\x07webpage\x18\x81\x01 \x01(\tHB\x88\x01\x01\x12\x12\n\x04week\x18\x82\x01 \x01(\tHC\x88\x01\x01\x12\x12\n\x04year\x18\x83\x01 \x01(\x05HD\x88\x01\x01\x12\x31\n#sk_ad_network_fine_conversion_value\x18\x89\x01 \x01(\x03HE\x88\x01\x01\x12?\n1sk_ad_network_redistributed_fine_conversion_value\x18\xbe\x01 \x01(\x03HF\x88\x01\x01\x12m\n\x17sk_ad_network_user_type\x18\x8d\x01 \x01(\x0e\x32K.google.ads.googleads.v17.enums.SkAdNetworkUserTypeEnum.SkAdNetworkUserType\x12w\n\x1bsk_ad_network_ad_event_type\x18\x8e\x01 \x01(\x0e\x32Q.google.ads.googleads.v17.enums.SkAdNetworkAdEventTypeEnum.SkAdNetworkAdEventType\x12]\n\x18sk_ad_network_source_app\x18\x8f\x01 \x01(\x0b\x32\x35.google.ads.googleads.v17.common.SkAdNetworkSourceAppHG\x88\x01\x01\x12\x88\x01\n sk_ad_network_attribution_credit\x18\x90\x01 \x01(\x0e\x32].google.ads.googleads.v17.enums.SkAdNetworkAttributionCreditEnum.SkAdNetworkAttributionCredit\x12\x95\x01\n%sk_ad_network_coarse_conversion_value\x18\x97\x01 \x01(\x0e\x32\x65.google.ads.googleads.v17.enums.SkAdNetworkCoarseConversionValueEnum.SkAdNetworkCoarseConversionValue\x12)\n\x1bsk_ad_network_source_domain\x18\x98\x01 \x01(\tHH\x88\x01\x01\x12s\n\x19sk_ad_network_source_type\x18\x99\x01 \x01(\x0e\x32O.google.ads.googleads.v17.enums.SkAdNetworkSourceTypeEnum.SkAdNetworkSourceType\x12\x33\n%sk_ad_network_postback_sequence_index\x18\x9a\x01 \x01(\x03HI\x88\x01\x01\x12#\n\x15sk_ad_network_version\x18\xc0\x01 \x01(\tHJ\x88\x01\x01\x12_\n\x18\x61sset_interaction_target\x18\x8b\x01 \x01(\x0b\x32\x37.google.ads.googleads.v17.common.AssetInteractionTargetHK\x88\x01\x01\x12\xa8\x01\n\x1enew_versus_returning_customers\x18\xa0\x01 \x01(\x0e\x32\x7f.google.ads.googleads.v17.enums.ConvertingUserPriorEngagementTypeAndLtvBucketEnum.ConvertingUserPriorEngagementTypeAndLtvBucketB\x16\n\x14_activity_account_idB\x10\n\x0e_activity_cityB\x13\n\x11_activity_countryB\x12\n\x10_activity_ratingB\x11\n\x0f_activity_stateB\x17\n\x15_external_activity_idB\x0b\n\t_ad_groupB\x0e\n\x0c_asset_groupB\x19\n\x17_auction_insight_domainB\x0b\n\t_campaignB\x14\n\x12_conversion_actionB\x19\n\x17_conversion_action_nameB\x18\n\x16_conversion_adjustmentB\x07\n\x05_dateB\x15\n\x13_geo_target_airportB\x14\n\x12_geo_target_cantonB\x12\n\x10_geo_target_cityB\x15\n\x13_geo_target_countryB\x14\n\x12_geo_target_countyB\x16\n\x14_geo_target_districtB\x13\n\x11_geo_target_metroB$\n\"_geo_target_most_specific_locationB\x19\n\x17_geo_target_postal_codeB\x16\n\x14_geo_target_provinceB\x14\n\x12_geo_target_regionB\x13\n\x11_geo_target_stateB\x1c\n\x1a_hotel_booking_window_daysB\x12\n\x10_hotel_center_idB\x16\n\x14_hotel_check_in_dateB\r\n\x0b_hotel_cityB\x0e\n\x0c_hotel_classB\x10\n\x0e_hotel_countryB\x17\n\x15_hotel_length_of_stayB\x15\n\x13_hotel_rate_rule_idB\x0e\n\x0c_hotel_stateB\x07\n\x05_hourB \n\x1e_interaction_on_this_extensionB\x08\n\x06_monthB\x13\n\x11_partner_hotel_idB\x18\n\x16_product_aggregator_idB\x1a\n\x18_product_category_level1B\x1a\n\x18_product_category_level2B\x1a\n\x18_product_category_level3B\x1a\n\x18_product_category_level4B\x1a\n\x18_product_category_level5B\x10\n\x0e_product_brandB\x12\n\x10_product_countryB\x1c\n\x1a_product_custom_attribute0B\x1c\n\x1a_product_custom_attribute1B\x1c\n\x1a_product_custom_attribute2B\x1c\n\x1a_product_custom_attribute3B\x1c\n\x1a_product_custom_attribute4B\x15\n\x13_product_feed_labelB\x12\n\x10_product_item_idB\x13\n\x11_product_languageB\x16\n\x14_product_merchant_idB\x13\n\x11_product_store_idB\x10\n\x0e_product_titleB\x12\n\x10_product_type_l1B\x12\n\x10_product_type_l2B\x12\n\x10_product_type_l3B\x12\n\x10_product_type_l4B\x12\n\x10_product_type_l5B\n\n\x08_quarterB\x15\n\x13_search_subcategoryB\x0e\n\x0c_search_termB\n\n\x08_webpageB\x07\n\x05_weekB\x07\n\x05_yearB&\n$_sk_ad_network_fine_conversion_valueB4\n2_sk_ad_network_redistributed_fine_conversion_valueB\x1b\n\x19_sk_ad_network_source_appB\x1e\n\x1c_sk_ad_network_source_domainB(\n&_sk_ad_network_postback_sequence_indexB\x18\n\x16_sk_ad_network_versionB\x1b\n\x19_asset_interaction_target\"}\n\x07Keyword\x12\x1f\n\x12\x61\x64_group_criterion\x18\x03 \x01(\tH\x00\x88\x01\x01\x12:\n\x04info\x18\x02 \x01(\x0b\x32,.google.ads.googleads.v17.common.KeywordInfoB\x15\n\x13_ad_group_criterion\"\xba\x01\n\x1f\x42udgetCampaignAssociationStatus\x12\x15\n\x08\x63\x61mpaign\x18\x01 \x01(\tH\x00\x88\x01\x01\x12s\n\x06status\x18\x02 \x01(\x0e\x32\x63.google.ads.googleads.v17.enums.BudgetCampaignAssociationStatusEnum.BudgetCampaignAssociationStatusB\x0b\n\t_campaign\"J\n\x16\x41ssetInteractionTarget\x12\r\n\x05\x61sset\x18\x01 \x01(\t\x12!\n\x19interaction_on_this_asset\x18\x02 \x01(\x08\"`\n\x14SkAdNetworkSourceApp\x12(\n\x1bsk_ad_network_source_app_id\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x1e\n\x1c_sk_ad_network_source_app_idB\xed\x01\n#com.google.ads.googleads.v17.commonB\rSegmentsProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v17/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V17.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V17\\Common\xea\x02#Google::Ads::GoogleAds::V17::Commonb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.ads.googleads.v17.common.KeywordInfo", "google/ads/googleads/v17/common/criteria.proto"],
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
      module V17
        module Common
          Segments = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.Segments").msgclass
          Keyword = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.Keyword").msgclass
          BudgetCampaignAssociationStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.BudgetCampaignAssociationStatus").msgclass
          AssetInteractionTarget = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.AssetInteractionTarget").msgclass
          SkAdNetworkSourceApp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.common.SkAdNetworkSourceApp").msgclass
        end
      end
    end
  end
end
