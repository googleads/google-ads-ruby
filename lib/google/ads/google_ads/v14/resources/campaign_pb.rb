# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/campaign.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/bidding_pb'
require 'google/ads/google_ads/v14/common/custom_parameter_pb'
require 'google/ads/google_ads/v14/common/frequency_cap_pb'
require 'google/ads/google_ads/v14/common/real_time_bidding_setting_pb'
require 'google/ads/google_ads/v14/common/targeting_setting_pb'
require 'google/ads/google_ads/v14/enums/ad_serving_optimization_status_pb'
require 'google/ads/google_ads/v14/enums/advertising_channel_sub_type_pb'
require 'google/ads/google_ads/v14/enums/advertising_channel_type_pb'
require 'google/ads/google_ads/v14/enums/app_campaign_app_store_pb'
require 'google/ads/google_ads/v14/enums/app_campaign_bidding_strategy_goal_type_pb'
require 'google/ads/google_ads/v14/enums/asset_field_type_pb'
require 'google/ads/google_ads/v14/enums/asset_set_type_pb'
require 'google/ads/google_ads/v14/enums/bidding_strategy_system_status_pb'
require 'google/ads/google_ads/v14/enums/bidding_strategy_type_pb'
require 'google/ads/google_ads/v14/enums/brand_safety_suitability_pb'
require 'google/ads/google_ads/v14/enums/campaign_experiment_type_pb'
require 'google/ads/google_ads/v14/enums/campaign_primary_status_pb'
require 'google/ads/google_ads/v14/enums/campaign_primary_status_reason_pb'
require 'google/ads/google_ads/v14/enums/campaign_serving_status_pb'
require 'google/ads/google_ads/v14/enums/campaign_status_pb'
require 'google/ads/google_ads/v14/enums/listing_type_pb'
require 'google/ads/google_ads/v14/enums/location_source_type_pb'
require 'google/ads/google_ads/v14/enums/negative_geo_target_type_pb'
require 'google/ads/google_ads/v14/enums/optimization_goal_type_pb'
require 'google/ads/google_ads/v14/enums/payment_mode_pb'
require 'google/ads/google_ads/v14/enums/performance_max_upgrade_status_pb'
require 'google/ads/google_ads/v14/enums/positive_geo_target_type_pb'
require 'google/ads/google_ads/v14/enums/vanity_pharma_display_url_mode_pb'
require 'google/ads/google_ads/v14/enums/vanity_pharma_text_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n1google/ads/googleads/v14/resources/campaign.proto\x12\"google.ads.googleads.v14.resources\x1a-google/ads/googleads/v14/common/bidding.proto\x1a\x36google/ads/googleads/v14/common/custom_parameter.proto\x1a\x33google/ads/googleads/v14/common/frequency_cap.proto\x1a?google/ads/googleads/v14/common/real_time_bidding_setting.proto\x1a\x37google/ads/googleads/v14/common/targeting_setting.proto\x1a\x43google/ads/googleads/v14/enums/ad_serving_optimization_status.proto\x1a\x41google/ads/googleads/v14/enums/advertising_channel_sub_type.proto\x1a=google/ads/googleads/v14/enums/advertising_channel_type.proto\x1a;google/ads/googleads/v14/enums/app_campaign_app_store.proto\x1aLgoogle/ads/googleads/v14/enums/app_campaign_bidding_strategy_goal_type.proto\x1a\x35google/ads/googleads/v14/enums/asset_field_type.proto\x1a\x33google/ads/googleads/v14/enums/asset_set_type.proto\x1a\x43google/ads/googleads/v14/enums/bidding_strategy_system_status.proto\x1a:google/ads/googleads/v14/enums/bidding_strategy_type.proto\x1a=google/ads/googleads/v14/enums/brand_safety_suitability.proto\x1a=google/ads/googleads/v14/enums/campaign_experiment_type.proto\x1a<google/ads/googleads/v14/enums/campaign_primary_status.proto\x1a\x43google/ads/googleads/v14/enums/campaign_primary_status_reason.proto\x1a<google/ads/googleads/v14/enums/campaign_serving_status.proto\x1a\x34google/ads/googleads/v14/enums/campaign_status.proto\x1a\x31google/ads/googleads/v14/enums/listing_type.proto\x1a\x39google/ads/googleads/v14/enums/location_source_type.proto\x1a=google/ads/googleads/v14/enums/negative_geo_target_type.proto\x1a;google/ads/googleads/v14/enums/optimization_goal_type.proto\x1a\x31google/ads/googleads/v14/enums/payment_mode.proto\x1a\x43google/ads/googleads/v14/enums/performance_max_upgrade_status.proto\x1a=google/ads/googleads/v14/enums/positive_geo_target_type.proto\x1a\x43google/ads/googleads/v14/enums/vanity_pharma_display_url_mode.proto\x1a\x37google/ads/googleads/v14/enums/vanity_pharma_text.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xf7\x41\n\x08\x43\x61mpaign\x12@\n\rresource_name\x18\x01 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/Campaign\x12\x14\n\x02id\x18; \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x11\n\x04name\x18: \x01(\tH\x02\x88\x01\x01\x12l\n\x0eprimary_status\x18Q \x01(\x0e\x32O.google.ads.googleads.v14.enums.CampaignPrimaryStatusEnum.CampaignPrimaryStatusB\x03\xe0\x41\x03\x12\x80\x01\n\x16primary_status_reasons\x18R \x03(\x0e\x32[.google.ads.googleads.v14.enums.CampaignPrimaryStatusReasonEnum.CampaignPrimaryStatusReasonB\x03\xe0\x41\x03\x12Q\n\x06status\x18\x05 \x01(\x0e\x32\x41.google.ads.googleads.v14.enums.CampaignStatusEnum.CampaignStatus\x12l\n\x0eserving_status\x18\x15 \x01(\x0e\x32O.google.ads.googleads.v14.enums.CampaignServingStatusEnum.CampaignServingStatusB\x03\xe0\x41\x03\x12\x88\x01\n\x1e\x62idding_strategy_system_status\x18N \x01(\x0e\x32[.google.ads.googleads.v14.enums.BiddingStrategySystemStatusEnum.BiddingStrategySystemStatusB\x03\xe0\x41\x03\x12\x83\x01\n\x1e\x61\x64_serving_optimization_status\x18\x08 \x01(\x0e\x32[.google.ads.googleads.v14.enums.AdServingOptimizationStatusEnum.AdServingOptimizationStatus\x12x\n\x18\x61\x64vertising_channel_type\x18\t \x01(\x0e\x32Q.google.ads.googleads.v14.enums.AdvertisingChannelTypeEnum.AdvertisingChannelTypeB\x03\xe0\x41\x05\x12\x82\x01\n\x1c\x61\x64vertising_channel_sub_type\x18\n \x01(\x0e\x32W.google.ads.googleads.v14.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubTypeB\x03\xe0\x41\x05\x12\"\n\x15tracking_url_template\x18< \x01(\tH\x03\x88\x01\x01\x12O\n\x15url_custom_parameters\x18\x0c \x03(\x0b\x32\x30.google.ads.googleads.v14.common.CustomParameter\x12t\n local_services_campaign_settings\x18K \x01(\x0b\x32J.google.ads.googleads.v14.resources.Campaign.LocalServicesCampaignSettings\x12\x65\n\x18travel_campaign_settings\x18U \x01(\x0b\x32\x43.google.ads.googleads.v14.resources.Campaign.TravelCampaignSettings\x12Z\n\x19real_time_bidding_setting\x18\' \x01(\x0b\x32\x37.google.ads.googleads.v14.common.RealTimeBiddingSetting\x12V\n\x10network_settings\x18\x0e \x01(\x0b\x32<.google.ads.googleads.v14.resources.Campaign.NetworkSettings\x12Y\n\rhotel_setting\x18  \x01(\x0b\x32=.google.ads.googleads.v14.resources.Campaign.HotelSettingInfoB\x03\xe0\x41\x05\x12h\n\x1a\x64ynamic_search_ads_setting\x18! \x01(\x0b\x32\x44.google.ads.googleads.v14.resources.Campaign.DynamicSearchAdsSetting\x12V\n\x10shopping_setting\x18$ \x01(\x0b\x32<.google.ads.googleads.v14.resources.Campaign.ShoppingSetting\x12L\n\x11targeting_setting\x18+ \x01(\x0b\x32\x31.google.ads.googleads.v14.common.TargetingSetting\x12`\n\x10\x61udience_setting\x18I \x01(\x0b\x32<.google.ads.googleads.v14.resources.Campaign.AudienceSettingB\x03\xe0\x41\x05H\x04\x88\x01\x01\x12\x62\n\x17geo_target_type_setting\x18/ \x01(\x0b\x32\x41.google.ads.googleads.v14.resources.Campaign.GeoTargetTypeSetting\x12\x61\n\x16local_campaign_setting\x18\x32 \x01(\x0b\x32\x41.google.ads.googleads.v14.resources.Campaign.LocalCampaignSetting\x12]\n\x14\x61pp_campaign_setting\x18\x33 \x01(\x0b\x32?.google.ads.googleads.v14.resources.Campaign.AppCampaignSetting\x12>\n\x06labels\x18= \x03(\tB.\xe0\x41\x03\xfa\x41(\n&googleads.googleapis.com/CampaignLabel\x12o\n\x0f\x65xperiment_type\x18\x11 \x01(\x0e\x32Q.google.ads.googleads.v14.enums.CampaignExperimentTypeEnum.CampaignExperimentTypeB\x03\xe0\x41\x03\x12\x45\n\rbase_campaign\x18\x38 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CampaignH\x05\x88\x01\x01\x12J\n\x0f\x63\x61mpaign_budget\x18> \x01(\tB,\xfa\x41)\n\'googleads.googleapis.com/CampaignBudgetH\x06\x88\x01\x01\x12o\n\x15\x62idding_strategy_type\x18\x16 \x01(\x0e\x32K.google.ads.googleads.v14.enums.BiddingStrategyTypeEnum.BiddingStrategyTypeB\x03\xe0\x41\x03\x12_\n\x1b\x61\x63\x63\x65ssible_bidding_strategy\x18G \x01(\tB:\xe0\x41\x03\xfa\x41\x34\n2googleads.googleapis.com/AccessibleBiddingStrategy\x12\x17\n\nstart_date\x18? \x01(\tH\x07\x88\x01\x01\x12H\n\x0e\x63\x61mpaign_group\x18L \x01(\tB+\xfa\x41(\n&googleads.googleapis.com/CampaignGroupH\x08\x88\x01\x01\x12\x15\n\x08\x65nd_date\x18@ \x01(\tH\t\x88\x01\x01\x12\x1d\n\x10\x66inal_url_suffix\x18\x41 \x01(\tH\n\x88\x01\x01\x12J\n\x0e\x66requency_caps\x18( \x03(\x0b\x32\x32.google.ads.googleads.v14.common.FrequencyCapEntry\x12~\n\x1evideo_brand_safety_suitability\x18* \x01(\x0e\x32Q.google.ads.googleads.v14.enums.BrandSafetySuitabilityEnum.BrandSafetySuitabilityB\x03\xe0\x41\x03\x12P\n\rvanity_pharma\x18, \x01(\x0b\x32\x39.google.ads.googleads.v14.resources.Campaign.VanityPharma\x12\x62\n\x16selective_optimization\x18- \x01(\x0b\x32\x42.google.ads.googleads.v14.resources.Campaign.SelectiveOptimization\x12g\n\x19optimization_goal_setting\x18\x36 \x01(\x0b\x32\x44.google.ads.googleads.v14.resources.Campaign.OptimizationGoalSetting\x12[\n\x10tracking_setting\x18. \x01(\x0b\x32<.google.ads.googleads.v14.resources.Campaign.TrackingSettingB\x03\xe0\x41\x03\x12Q\n\x0cpayment_mode\x18\x34 \x01(\x0e\x32;.google.ads.googleads.v14.enums.PaymentModeEnum.PaymentMode\x12$\n\x12optimization_score\x18\x42 \x01(\x01\x42\x03\xe0\x41\x03H\x0b\x88\x01\x01\x12l\n!excluded_parent_asset_field_types\x18\x45 \x03(\x0e\x32\x41.google.ads.googleads.v14.enums.AssetFieldTypeEnum.AssetFieldType\x12\x66\n\x1f\x65xcluded_parent_asset_set_types\x18P \x03(\x0e\x32=.google.ads.googleads.v14.enums.AssetSetTypeEnum.AssetSetType\x12\"\n\x15url_expansion_opt_out\x18H \x01(\x08H\x0c\x88\x01\x01\x12h\n\x17performance_max_upgrade\x18M \x01(\x0b\x32\x42.google.ads.googleads.v14.resources.Campaign.PerformanceMaxUpgradeB\x03\xe0\x41\x03\x12P\n\x18hotel_property_asset_set\x18S \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/AssetSetH\r\x88\x01\x01\x12[\n\x0clisting_type\x18V \x01(\x0e\x32;.google.ads.googleads.v14.enums.ListingTypeEnum.ListingTypeB\x03\xe0\x41\x05H\x0e\x88\x01\x01\x12I\n\x10\x62idding_strategy\x18\x43 \x01(\tB-\xfa\x41*\n(googleads.googleapis.com/BiddingStrategyH\x00\x12\x41\n\ncommission\x18\x31 \x01(\x0b\x32+.google.ads.googleads.v14.common.CommissionH\x00\x12@\n\nmanual_cpa\x18J \x01(\x0b\x32*.google.ads.googleads.v14.common.ManualCpaH\x00\x12@\n\nmanual_cpc\x18\x18 \x01(\x0b\x32*.google.ads.googleads.v14.common.ManualCpcH\x00\x12@\n\nmanual_cpm\x18\x19 \x01(\x0b\x32*.google.ads.googleads.v14.common.ManualCpmH\x00\x12\x45\n\nmanual_cpv\x18% \x01(\x0b\x32*.google.ads.googleads.v14.common.ManualCpvB\x03\xe0\x41\x03H\x00\x12T\n\x14maximize_conversions\x18\x1e \x01(\x0b\x32\x34.google.ads.googleads.v14.common.MaximizeConversionsH\x00\x12]\n\x19maximize_conversion_value\x18\x1f \x01(\x0b\x32\x38.google.ads.googleads.v14.common.MaximizeConversionValueH\x00\x12@\n\ntarget_cpa\x18\x1a \x01(\x0b\x32*.google.ads.googleads.v14.common.TargetCpaH\x00\x12Y\n\x17target_impression_share\x18\x30 \x01(\x0b\x32\x36.google.ads.googleads.v14.common.TargetImpressionShareH\x00\x12\x42\n\x0btarget_roas\x18\x1d \x01(\x0b\x32+.google.ads.googleads.v14.common.TargetRoasH\x00\x12\x44\n\x0ctarget_spend\x18\x1b \x01(\x0b\x32,.google.ads.googleads.v14.common.TargetSpendH\x00\x12\x42\n\x0bpercent_cpc\x18\" \x01(\x0b\x32+.google.ads.googleads.v14.common.PercentCpcH\x00\x12@\n\ntarget_cpm\x18) \x01(\x0b\x32*.google.ads.googleads.v14.common.TargetCpmH\x00\x1a\x9f\x02\n\x15PerformanceMaxUpgrade\x12K\n\x18performance_max_campaign\x18\x01 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12G\n\x14pre_upgrade_campaign\x18\x02 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12p\n\x06status\x18\x03 \x01(\x0e\x32[.google.ads.googleads.v14.enums.PerformanceMaxUpgradeStatusEnum.PerformanceMaxUpgradeStatusB\x03\xe0\x41\x03\x1a\x99\x02\n\x0fNetworkSettings\x12!\n\x14target_google_search\x18\x05 \x01(\x08H\x00\x88\x01\x01\x12\"\n\x15target_search_network\x18\x06 \x01(\x08H\x01\x88\x01\x01\x12#\n\x16target_content_network\x18\x07 \x01(\x08H\x02\x88\x01\x01\x12*\n\x1dtarget_partner_search_network\x18\x08 \x01(\x08H\x03\x88\x01\x01\x42\x17\n\x15_target_google_searchB\x18\n\x16_target_search_networkB\x19\n\x17_target_content_networkB \n\x1e_target_partner_search_network\x1aI\n\x10HotelSettingInfo\x12!\n\x0fhotel_center_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x42\x12\n\x10_hotel_center_id\x1a\xc2\x01\n\x17\x44ynamicSearchAdsSetting\x12\x18\n\x0b\x64omain_name\x18\x06 \x01(\tB\x03\xe0\x41\x02\x12\x1a\n\rlanguage_code\x18\x07 \x01(\tB\x03\xe0\x41\x02\x12#\n\x16use_supplied_urls_only\x18\x08 \x01(\x08H\x00\x88\x01\x01\x12\x31\n\x05\x66\x65\x65\x64s\x18\t \x03(\tB\"\xfa\x41\x1f\n\x1dgoogleads.googleapis.com/FeedB\x19\n\x17_use_supplied_urls_only\x1a\x88\x02\n\x0fShoppingSetting\x12\x1d\n\x0bmerchant_id\x18\x05 \x01(\x03\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x12\x1a\n\rsales_country\x18\x06 \x01(\tH\x01\x88\x01\x01\x12\x12\n\nfeed_label\x18\n \x01(\t\x12\x1e\n\x11\x63\x61mpaign_priority\x18\x07 \x01(\x05H\x02\x88\x01\x01\x12\x19\n\x0c\x65nable_local\x18\x08 \x01(\x08H\x03\x88\x01\x01\x12\"\n\x15use_vehicle_inventory\x18\t \x01(\x08\x42\x03\xe0\x41\x05\x42\x0e\n\x0c_merchant_idB\x10\n\x0e_sales_countryB\x14\n\x12_campaign_priorityB\x0f\n\r_enable_local\x1a\x42\n\x0fTrackingSetting\x12\x1e\n\x0ctracking_url\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x42\x0f\n\r_tracking_url\x1a\xfc\x01\n\x14GeoTargetTypeSetting\x12q\n\x18positive_geo_target_type\x18\x01 \x01(\x0e\x32O.google.ads.googleads.v14.enums.PositiveGeoTargetTypeEnum.PositiveGeoTargetType\x12q\n\x18negative_geo_target_type\x18\x02 \x01(\x0e\x32O.google.ads.googleads.v14.enums.NegativeGeoTargetTypeEnum.NegativeGeoTargetType\x1a\x7f\n\x14LocalCampaignSetting\x12g\n\x14location_source_type\x18\x01 \x01(\x0e\x32I.google.ads.googleads.v14.enums.LocationSourceTypeEnum.LocationSourceType\x1a\xae\x02\n\x12\x41ppCampaignSetting\x12\x8d\x01\n\x1a\x62idding_strategy_goal_type\x18\x01 \x01(\x0e\x32i.google.ads.googleads.v14.enums.AppCampaignBiddingStrategyGoalTypeEnum.AppCampaignBiddingStrategyGoalType\x12\x18\n\x06\x61pp_id\x18\x04 \x01(\tB\x03\xe0\x41\x05H\x00\x88\x01\x01\x12\x63\n\tapp_store\x18\x03 \x01(\x0e\x32K.google.ads.googleads.v14.enums.AppCampaignAppStoreEnum.AppCampaignAppStoreB\x03\xe0\x41\x05\x42\t\n\x07_app_id\x1a\xf5\x01\n\x0cVanityPharma\x12\x81\x01\n\x1evanity_pharma_display_url_mode\x18\x01 \x01(\x0e\x32Y.google.ads.googleads.v14.enums.VanityPharmaDisplayUrlModeEnum.VanityPharmaDisplayUrlMode\x12\x61\n\x12vanity_pharma_text\x18\x02 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.VanityPharmaTextEnum.VanityPharmaText\x1a\x63\n\x15SelectiveOptimization\x12J\n\x12\x63onversion_actions\x18\x02 \x03(\tB.\xfa\x41+\n)googleads.googleapis.com/ConversionAction\x1a\x89\x01\n\x17OptimizationGoalSetting\x12n\n\x17optimization_goal_types\x18\x01 \x03(\x0e\x32M.google.ads.googleads.v14.enums.OptimizationGoalTypeEnum.OptimizationGoalType\x1aR\n\x0f\x41udienceSetting\x12&\n\x14use_audience_grouped\x18\x01 \x01(\x08\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x42\x17\n\x15_use_audience_grouped\x1ap\n\x1dLocalServicesCampaignSettings\x12O\n\rcategory_bids\x18\x01 \x03(\x0b\x32\x38.google.ads.googleads.v14.resources.Campaign.CategoryBid\x1au\n\x0b\x43\x61tegoryBid\x12\x18\n\x0b\x63\x61tegory_id\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\"\n\x15manual_cpa_bid_micros\x18\x02 \x01(\x03H\x01\x88\x01\x01\x42\x0e\n\x0c_category_idB\x18\n\x16_manual_cpa_bid_micros\x1aS\n\x16TravelCampaignSettings\x12#\n\x11travel_account_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x05H\x00\x88\x01\x01\x42\x14\n\x12_travel_account_id:W\xea\x41T\n!googleads.googleapis.com/Campaign\x12/customers/{customer_id}/campaigns/{campaign_id}B\x1b\n\x19\x63\x61mpaign_bidding_strategyB\x05\n\x03_idB\x07\n\x05_nameB\x18\n\x16_tracking_url_templateB\x13\n\x11_audience_settingB\x10\n\x0e_base_campaignB\x12\n\x10_campaign_budgetB\r\n\x0b_start_dateB\x11\n\x0f_campaign_groupB\x0b\n\t_end_dateB\x13\n\x11_final_url_suffixB\x15\n\x13_optimization_scoreB\x18\n\x16_url_expansion_opt_outB\x1b\n\x19_hotel_property_asset_setB\x0f\n\r_listing_typeB\xff\x01\n&com.google.ads.googleads.v14.resourcesB\rCampaignProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v14.common.CustomParameter", "google/ads/googleads/v14/common/custom_parameter.proto"],
    ["google.ads.googleads.v14.common.RealTimeBiddingSetting", "google/ads/googleads/v14/common/real_time_bidding_setting.proto"],
    ["google.ads.googleads.v14.common.TargetingSetting", "google/ads/googleads/v14/common/targeting_setting.proto"],
    ["google.ads.googleads.v14.common.FrequencyCapEntry", "google/ads/googleads/v14/common/frequency_cap.proto"],
    ["google.ads.googleads.v14.common.Commission", "google/ads/googleads/v14/common/bidding.proto"],
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
        module Resources
          Campaign = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign").msgclass
          Campaign::PerformanceMaxUpgrade = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.PerformanceMaxUpgrade").msgclass
          Campaign::NetworkSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.NetworkSettings").msgclass
          Campaign::HotelSettingInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.HotelSettingInfo").msgclass
          Campaign::DynamicSearchAdsSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.DynamicSearchAdsSetting").msgclass
          Campaign::ShoppingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.ShoppingSetting").msgclass
          Campaign::TrackingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.TrackingSetting").msgclass
          Campaign::GeoTargetTypeSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.GeoTargetTypeSetting").msgclass
          Campaign::LocalCampaignSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.LocalCampaignSetting").msgclass
          Campaign::AppCampaignSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.AppCampaignSetting").msgclass
          Campaign::VanityPharma = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.VanityPharma").msgclass
          Campaign::SelectiveOptimization = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.SelectiveOptimization").msgclass
          Campaign::OptimizationGoalSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.OptimizationGoalSetting").msgclass
          Campaign::AudienceSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.AudienceSetting").msgclass
          Campaign::LocalServicesCampaignSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.LocalServicesCampaignSettings").msgclass
          Campaign::CategoryBid = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.CategoryBid").msgclass
          Campaign::TravelCampaignSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.Campaign.TravelCampaignSettings").msgclass
        end
      end
    end
  end
end
