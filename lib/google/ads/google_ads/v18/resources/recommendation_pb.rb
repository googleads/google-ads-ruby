# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/recommendation.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/criteria_pb'
require 'google/ads/google_ads/v18/enums/ad_strength_pb'
require 'google/ads/google_ads/v18/enums/app_bidding_goal_pb'
require 'google/ads/google_ads/v18/enums/keyword_match_type_pb'
require 'google/ads/google_ads/v18/enums/recommendation_type_pb'
require 'google/ads/google_ads/v18/enums/shopping_add_products_to_campaign_recommendation_enum_pb'
require 'google/ads/google_ads/v18/enums/target_cpa_opt_in_recommendation_goal_pb'
require 'google/ads/google_ads/v18/resources/ad_pb'
require 'google/ads/google_ads/v18/resources/asset_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n7google/ads/googleads/v18/resources/recommendation.proto\x12\"google.ads.googleads.v18.resources\x1a.google/ads/googleads/v18/common/criteria.proto\x1a\x30google/ads/googleads/v18/enums/ad_strength.proto\x1a\x35google/ads/googleads/v18/enums/app_bidding_goal.proto\x1a\x37google/ads/googleads/v18/enums/keyword_match_type.proto\x1a\x38google/ads/googleads/v18/enums/recommendation_type.proto\x1aZgoogle/ads/googleads/v18/enums/shopping_add_products_to_campaign_recommendation_enum.proto\x1aJgoogle/ads/googleads/v18/enums/target_cpa_opt_in_recommendation_goal.proto\x1a+google/ads/googleads/v18/resources/ad.proto\x1a.google/ads/googleads/v18/resources/asset.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xcf\x86\x01\n\x0eRecommendation\x12\x46\n\rresource_name\x18\x01 \x01(\tB/\xe0\x41\x05\xfa\x41)\n\'googleads.googleapis.com/Recommendation\x12\\\n\x04type\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v18.enums.RecommendationTypeEnum.RecommendationTypeB\x03\xe0\x41\x03\x12\\\n\x06impact\x18\x03 \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.RecommendationImpactB\x03\xe0\x41\x03\x12M\n\x0f\x63\x61mpaign_budget\x18\x18 \x01(\tB/\xe0\x41\x03\xfa\x41)\n\'googleads.googleapis.com/CampaignBudgetH\x01\x88\x01\x01\x12@\n\x08\x63\x61mpaign\x18\x19 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CampaignH\x02\x88\x01\x01\x12?\n\x08\x61\x64_group\x18\x1a \x01(\tB(\xe0\x41\x03\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x03\x88\x01\x01\x12\x1b\n\tdismissed\x18\x1b \x01(\x08\x42\x03\xe0\x41\x03H\x04\x88\x01\x01\x12<\n\tcampaigns\x18& \x03(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12~\n\x1e\x63\x61mpaign_budget_recommendation\x18\x04 \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n*forecasting_campaign_budget_recommendation\x18\x16 \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendationB\x03\xe0\x41\x03H\x00\x12o\n\x16keyword_recommendation\x18\x08 \x01(\x0b\x32H.google.ads.googleads.v18.resources.Recommendation.KeywordRecommendationB\x03\xe0\x41\x03H\x00\x12n\n\x16text_ad_recommendation\x18\t \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.TextAdRecommendationB\x03\xe0\x41\x03H\x00\x12\x80\x01\n target_cpa_opt_in_recommendation\x18\n \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.TargetCpaOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n*maximize_conversions_opt_in_recommendation\x18\x0b \x01(\x0b\x32Y.google.ads.googleads.v18.resources.Recommendation.MaximizeConversionsOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x84\x01\n\"enhanced_cpc_opt_in_recommendation\x18\x0c \x01(\x0b\x32Q.google.ads.googleads.v18.resources.Recommendation.EnhancedCpcOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n%search_partners_opt_in_recommendation\x18\x0e \x01(\x0b\x32T.google.ads.googleads.v18.resources.Recommendation.SearchPartnersOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n%maximize_clicks_opt_in_recommendation\x18\x0f \x01(\x0b\x32T.google.ads.googleads.v18.resources.Recommendation.MaximizeClicksOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x87\x01\n#optimize_ad_rotation_recommendation\x18\x10 \x01(\x0b\x32S.google.ads.googleads.v18.resources.Recommendation.OptimizeAdRotationRecommendationB\x03\xe0\x41\x03H\x00\x12\x83\x01\n!keyword_match_type_recommendation\x18\x14 \x01(\x0b\x32Q.google.ads.googleads.v18.resources.Recommendation.KeywordMatchTypeRecommendationB\x03\xe0\x41\x03H\x00\x12\x83\x01\n!move_unused_budget_recommendation\x18\x15 \x01(\x0b\x32Q.google.ads.googleads.v18.resources.Recommendation.MoveUnusedBudgetRecommendationB\x03\xe0\x41\x03H\x00\x12\x82\x01\n!target_roas_opt_in_recommendation\x18\x17 \x01(\x0b\x32P.google.ads.googleads.v18.resources.Recommendation.TargetRoasOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x87\x01\n#responsive_search_ad_recommendation\x18\x1c \x01(\x0b\x32S.google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdRecommendationB\x03\xe0\x41\x03H\x00\x12\x8b\x01\n+marginal_roi_campaign_budget_recommendation\x18\x1d \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendationB\x03\xe0\x41\x03H\x00\x12\x8c\x01\n&use_broad_match_keyword_recommendation\x18\x1e \x01(\x0b\x32U.google.ads.googleads.v18.resources.Recommendation.UseBroadMatchKeywordRecommendationB\x03\xe0\x41\x03H\x00\x12\x92\x01\n)responsive_search_ad_asset_recommendation\x18\x1f \x01(\x0b\x32X.google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdAssetRecommendationB\x03\xe0\x41\x03H\x00\x12\xbf\x01\nAupgrade_smart_shopping_campaign_to_performance_max_recommendation\x18  \x01(\x0b\x32m.google.ads.googleads.v18.resources.Recommendation.UpgradeSmartShoppingCampaignToPerformanceMaxRecommendationB\x03\xe0\x41\x03H\x00\x12\xac\x01\n7responsive_search_ad_improve_ad_strength_recommendation\x18! \x01(\x0b\x32\x64.google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdImproveAdStrengthRecommendationB\x03\xe0\x41\x03H\x00\x12\x8e\x01\n\'display_expansion_opt_in_recommendation\x18\" \x01(\x0b\x32V.google.ads.googleads.v18.resources.Recommendation.DisplayExpansionOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\xae\x01\n8upgrade_local_campaign_to_performance_max_recommendation\x18# \x01(\x0b\x32\x65.google.ads.googleads.v18.resources.Recommendation.UpgradeLocalCampaignToPerformanceMaxRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n+raise_target_cpa_bid_too_low_recommendation\x18$ \x01(\x0b\x32X.google.ads.googleads.v18.resources.Recommendation.RaiseTargetCpaBidTooLowRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n*forecasting_set_target_roas_recommendation\x18% \x01(\x0b\x32Y.google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetRoasRecommendationB\x03\xe0\x41\x03H\x00\x12z\n\x1c\x63\x61llout_asset_recommendation\x18\' \x01(\x0b\x32M.google.ads.googleads.v18.resources.Recommendation.CalloutAssetRecommendationB\x03\xe0\x41\x03H\x00\x12|\n\x1dsitelink_asset_recommendation\x18( \x01(\x0b\x32N.google.ads.googleads.v18.resources.Recommendation.SitelinkAssetRecommendationB\x03\xe0\x41\x03H\x00\x12t\n\x19\x63\x61ll_asset_recommendation\x18) \x01(\x0b\x32J.google.ads.googleads.v18.resources.Recommendation.CallAssetRecommendationB\x03\xe0\x41\x03H\x00\x12\x8d\x01\n%shopping_add_age_group_recommendation\x18* \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x89\x01\n!shopping_add_color_recommendation\x18+ \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n\"shopping_add_gender_recommendation\x18, \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x88\x01\n shopping_add_gtin_recommendation\x18- \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n,shopping_add_more_identifiers_recommendation\x18. \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x88\x01\n shopping_add_size_recommendation\x18/ \x01(\x0b\x32W.google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendationB\x03\xe0\x41\x03H\x00\x12\x9f\x01\n0shopping_add_products_to_campaign_recommendation\x18\x30 \x01(\x0b\x32^.google.ads.googleads.v18.resources.Recommendation.ShoppingAddProductsToCampaignRecommendationB\x03\xe0\x41\x03H\x00\x12\xa0\x01\n0shopping_fix_disapproved_products_recommendation\x18\x31 \x01(\x0b\x32_.google.ads.googleads.v18.resources.Recommendation.ShoppingFixDisapprovedProductsRecommendationB\x03\xe0\x41\x03H\x00\x12\x92\x01\n)shopping_target_all_offers_recommendation\x18\x32 \x01(\x0b\x32X.google.ads.googleads.v18.resources.Recommendation.ShoppingTargetAllOffersRecommendationB\x03\xe0\x41\x03H\x00\x12\xb6\x01\n=shopping_fix_suspended_merchant_center_account_recommendation\x18\x33 \x01(\x0b\x32h.google.ads.googleads.v18.resources.Recommendation.ShoppingMerchantCenterAccountSuspensionRecommendationB\x03\xe0\x41\x03H\x00\x12\xbf\x01\nFshopping_fix_merchant_center_account_suspension_warning_recommendation\x18\x34 \x01(\x0b\x32h.google.ads.googleads.v18.resources.Recommendation.ShoppingMerchantCenterAccountSuspensionRecommendationB\x03\xe0\x41\x03H\x00\x12\xe1\x01\nSshopping_migrate_regular_shopping_campaign_offers_to_performance_max_recommendation\x18\x35 \x01(\x0b\x32}.google.ads.googleads.v18.resources.Recommendation.ShoppingMigrateRegularShoppingCampaignOffersToPerformanceMaxRecommendationB\x03\xe0\x41\x03H\x00\x12\x99\x01\n-dynamic_image_extension_opt_in_recommendation\x18\x36 \x01(\x0b\x32[.google.ads.googleads.v18.resources.Recommendation.DynamicImageExtensionOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x7f\n\x1fraise_target_cpa_recommendation\x18\x37 \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.RaiseTargetCpaRecommendationB\x03\xe0\x41\x03H\x00\x12\x81\x01\n lower_target_roas_recommendation\x18\x38 \x01(\x0b\x32P.google.ads.googleads.v18.resources.Recommendation.LowerTargetRoasRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n%performance_max_opt_in_recommendation\x18\x39 \x01(\x0b\x32T.google.ads.googleads.v18.resources.Recommendation.PerformanceMaxOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\xa3\x01\n2improve_performance_max_ad_strength_recommendation\x18: \x01(\x0b\x32`.google.ads.googleads.v18.resources.Recommendation.ImprovePerformanceMaxAdStrengthRecommendationB\x03\xe0\x41\x03H\x00\x12\xc6\x01\nEmigrate_dynamic_search_ads_campaign_to_performance_max_recommendation\x18; \x01(\x0b\x32p.google.ads.googleads.v18.resources.Recommendation.MigrateDynamicSearchAdsCampaignToPerformanceMaxRecommendationB\x03\xe0\x41\x03H\x00\x12\x92\x01\n)forecasting_set_target_cpa_recommendation\x18< \x01(\x0b\x32X.google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetCpaRecommendationB\x03\xe0\x41\x03H\x00\x12\x86\x01\n\x1dset_target_cpa_recommendation\x18= \x01(\x0b\x32X.google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetCpaRecommendationB\x03\xe0\x41\x03H\x00\x12\x88\x01\n\x1eset_target_roas_recommendation\x18> \x01(\x0b\x32Y.google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetRoasRecommendationB\x03\xe0\x41\x03H\x00\x12\x9d\x01\n/maximize_conversion_value_opt_in_recommendation\x18? \x01(\x0b\x32].google.ads.googleads.v18.resources.Recommendation.MaximizeConversionValueOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n*improve_google_tag_coverage_recommendation\x18@ \x01(\x0b\x32Y.google.ads.googleads.v18.resources.Recommendation.ImproveGoogleTagCoverageRecommendationB\x03\xe0\x41\x03H\x00\x12\x9c\x01\n/performance_max_final_url_opt_in_recommendation\x18\x41 \x01(\x0b\x32\\.google.ads.googleads.v18.resources.Recommendation.PerformanceMaxFinalUrlOptInRecommendationB\x03\xe0\x41\x03H\x00\x12\x94\x01\n*refresh_customer_match_list_recommendation\x18\x42 \x01(\x0b\x32Y.google.ads.googleads.v18.resources.Recommendation.RefreshCustomerMatchListRecommendationB\x03\xe0\x41\x03H\x00\x12\x8a\x01\n%custom_audience_opt_in_recommendation\x18\x43 \x01(\x0b\x32T.google.ads.googleads.v18.resources.Recommendation.CustomAudienceOptInRecommendationB\x03\xe0\x41\x03H\x00\x12}\n\x1elead_form_asset_recommendation\x18\x44 \x01(\x0b\x32N.google.ads.googleads.v18.resources.Recommendation.LeadFormAssetRecommendationB\x03\xe0\x41\x03H\x00\x12\x99\x01\n-improve_demand_gen_ad_strength_recommendation\x18\x45 \x01(\x0b\x32[.google.ads.googleads.v18.resources.Recommendation.ImproveDemandGenAdStrengthRecommendationB\x03\xe0\x41\x03H\x00\x1aM\n\x0cMerchantInfo\x12\x0f\n\x02id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12\x11\n\x04name\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x19\n\x0cmulti_client\x18\x03 \x01(\x08\x42\x03\xe0\x41\x03\x1a\xe5\x01\n\x14RecommendationImpact\x12\x63\n\x0c\x62\x61se_metrics\x18\x01 \x01(\x0b\x32H.google.ads.googleads.v18.resources.Recommendation.RecommendationMetricsB\x03\xe0\x41\x03\x12h\n\x11potential_metrics\x18\x02 \x01(\x0b\x32H.google.ads.googleads.v18.resources.Recommendation.RecommendationMetricsB\x03\xe0\x41\x03\x1a\xb3\x02\n\x15RecommendationMetrics\x12\x1d\n\x0bimpressions\x18\x06 \x01(\x01\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x18\n\x06\x63licks\x18\x07 \x01(\x01\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1d\n\x0b\x63ost_micros\x18\x08 \x01(\x03\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1d\n\x0b\x63onversions\x18\t \x01(\x01\x42\x03\xe0\x41\x03H\x03\x88\x01\x01\x12#\n\x11\x63onversions_value\x18\x0b \x01(\x01\x42\x03\xe0\x41\x03H\x04\x88\x01\x01\x12\x1d\n\x0bvideo_views\x18\n \x01(\x01\x42\x03\xe0\x41\x03H\x05\x88\x01\x01\x42\x0e\n\x0c_impressionsB\t\n\x07_clicksB\x0e\n\x0c_cost_microsB\x0e\n\x0c_conversionsB\x14\n\x12_conversions_valueB\x0e\n\x0c_video_views\x1a\xa0\x04\n\x1c\x43\x61mpaignBudgetRecommendation\x12.\n\x1c\x63urrent_budget_amount_micros\x18\x07 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x32\n recommended_budget_amount_micros\x18\x08 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x8f\x01\n\x0e\x62udget_options\x18\x03 \x03(\x0b\x32r.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendation.CampaignBudgetRecommendationOptionB\x03\xe0\x41\x03\x1a\xc3\x01\n\"CampaignBudgetRecommendationOption\x12&\n\x14\x62udget_amount_micros\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\\\n\x06impact\x18\x02 \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.RecommendationImpactB\x03\xe0\x41\x03\x42\x17\n\x15_budget_amount_microsB\x1f\n\x1d_current_budget_amount_microsB#\n!_recommended_budget_amount_micros\x1a\xe5\x02\n\x15KeywordRecommendation\x12\x42\n\x07keyword\x18\x01 \x01(\x0b\x32,.google.ads.googleads.v18.common.KeywordInfoB\x03\xe0\x41\x03\x12n\n\x0csearch_terms\x18\x04 \x03(\x0b\x32S.google.ads.googleads.v18.resources.Recommendation.KeywordRecommendation.SearchTermB\x03\xe0\x41\x03\x12,\n\x1arecommended_cpc_bid_micros\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x1aK\n\nSearchTerm\x12\x11\n\x04text\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12*\n\x1d\x65stimated_weekly_search_count\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x42\x1d\n\x1b_recommended_cpc_bid_micros\x1a\xb9\x01\n\x14TextAdRecommendation\x12\x37\n\x02\x61\x64\x18\x01 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x12\x1f\n\rcreation_date\x18\x04 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12!\n\x0f\x61uto_apply_date\x18\x05 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x42\x10\n\x0e_creation_dateB\x12\n\x10_auto_apply_date\x1a\x9b\x05\n\x1cTargetCpaOptInRecommendation\x12\x88\x01\n\x07options\x18\x01 \x03(\x0b\x32r.google.ads.googleads.v18.resources.Recommendation.TargetCpaOptInRecommendation.TargetCpaOptInRecommendationOptionB\x03\xe0\x41\x03\x12/\n\x1drecommended_target_cpa_micros\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x1a\x9c\x03\n\"TargetCpaOptInRecommendationOption\x12x\n\x04goal\x18\x01 \x01(\x0e\x32\x65.google.ads.googleads.v18.enums.TargetCpaOptInRecommendationGoalEnum.TargetCpaOptInRecommendationGoalB\x03\xe0\x41\x03\x12#\n\x11target_cpa_micros\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x38\n&required_campaign_budget_amount_micros\x18\x06 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\\\n\x06impact\x18\x04 \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.RecommendationImpactB\x03\xe0\x41\x03\x42\x14\n\x12_target_cpa_microsB)\n\'_required_campaign_budget_amount_microsB \n\x1e_recommended_target_cpa_micros\x1a\x81\x01\n&MaximizeConversionsOptInRecommendation\x12\x32\n recommended_budget_amount_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x42#\n!_recommended_budget_amount_micros\x1a \n\x1e\x45nhancedCpcOptInRecommendation\x1a#\n!SearchPartnersOptInRecommendation\x1a|\n!MaximizeClicksOptInRecommendation\x12\x32\n recommended_budget_amount_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x42#\n!_recommended_budget_amount_micros\x1a\"\n OptimizeAdRotationRecommendation\x1a\xd6\x01\n\x1a\x43\x61lloutAssetRecommendation\x12[\n#recommended_campaign_callout_assets\x18\x01 \x03(\x0b\x32).google.ads.googleads.v18.resources.AssetB\x03\xe0\x41\x03\x12[\n#recommended_customer_callout_assets\x18\x02 \x03(\x0b\x32).google.ads.googleads.v18.resources.AssetB\x03\xe0\x41\x03\x1a\xd9\x01\n\x1bSitelinkAssetRecommendation\x12\\\n$recommended_campaign_sitelink_assets\x18\x01 \x03(\x0b\x32).google.ads.googleads.v18.resources.AssetB\x03\xe0\x41\x03\x12\\\n$recommended_customer_sitelink_assets\x18\x02 \x03(\x0b\x32).google.ads.googleads.v18.resources.AssetB\x03\xe0\x41\x03\x1a\x19\n\x17\x43\x61llAssetRecommendation\x1a\xd0\x01\n\x1eKeywordMatchTypeRecommendation\x12\x42\n\x07keyword\x18\x01 \x01(\x0b\x32,.google.ads.googleads.v18.common.KeywordInfoB\x03\xe0\x41\x03\x12j\n\x16recommended_match_type\x18\x02 \x01(\x0e\x32\x45.google.ads.googleads.v18.enums.KeywordMatchTypeEnum.KeywordMatchTypeB\x03\xe0\x41\x03\x1a\xda\x01\n\x1eMoveUnusedBudgetRecommendation\x12(\n\x16\x65xcess_campaign_budget\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12s\n\x15\x62udget_recommendation\x18\x02 \x01(\x0b\x32O.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendationB\x03\xe0\x41\x03\x42\x19\n\x17_excess_campaign_budget\x1a\xcb\x01\n\x1dTargetRoasOptInRecommendation\x12)\n\x17recommended_target_roas\x18\x01 \x01(\x01\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x38\n&required_campaign_budget_amount_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x42\x1a\n\x18_recommended_target_roasB)\n\'_required_campaign_budget_amount_micros\x1a\xb1\x01\n%ResponsiveSearchAdAssetRecommendation\x12?\n\ncurrent_ad\x18\x03 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x12G\n\x12recommended_assets\x18\x02 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x1a\xb9\x01\n1ResponsiveSearchAdImproveAdStrengthRecommendation\x12?\n\ncurrent_ad\x18\x01 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x12\x43\n\x0erecommended_ad\x18\x02 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x1a[\n ResponsiveSearchAdRecommendation\x12\x37\n\x02\x61\x64\x18\x01 \x01(\x0b\x32&.google.ads.googleads.v18.resources.AdB\x03\xe0\x41\x03\x1a\x94\x02\n\"UseBroadMatchKeywordRecommendation\x12\x42\n\x07keyword\x18\x01 \x03(\x0b\x32,.google.ads.googleads.v18.common.KeywordInfoB\x03\xe0\x41\x03\x12%\n\x18suggested_keywords_count\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12$\n\x17\x63\x61mpaign_keywords_count\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12(\n\x1b\x63\x61mpaign_uses_shared_budget\x18\x04 \x01(\x08\x42\x03\xe0\x41\x03\x12\x33\n&required_campaign_budget_amount_micros\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03\x1aw\n:UpgradeSmartShoppingCampaignToPerformanceMaxRecommendation\x12\x18\n\x0bmerchant_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12\x1f\n\x12sales_country_code\x18\x02 \x01(\tB\x03\xe0\x41\x03\x1a\xc5\x01\n%RaiseTargetCpaBidTooLowRecommendation\x12/\n\x1drecommended_target_multiplier\x18\x01 \x01(\x01\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12+\n\x19\x61verage_target_cpa_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x42 \n\x1e_recommended_target_multiplierB\x1c\n\x1a_average_target_cpa_micros\x1a%\n#DisplayExpansionOptInRecommendation\x1a\x34\n2UpgradeLocalCampaignToPerformanceMaxRecommendation\x1a\xaf\x01\n&ForecastingSetTargetRoasRecommendation\x12$\n\x17recommended_target_roas\x18\x01 \x01(\x01\x42\x03\xe0\x41\x03\x12_\n\x0f\x63\x61mpaign_budget\x18\x02 \x01(\x0b\x32\x41.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetB\x03\xe0\x41\x03\x1a\xd5\x01\n$ShoppingOfferAttributeRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x19\n\x0coffers_count\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12!\n\x14\x64\x65moted_offers_count\x18\x04 \x01(\x03\x42\x03\xe0\x41\x03\x1a\xe5\x01\n,ShoppingFixDisapprovedProductsRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x1b\n\x0eproducts_count\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12\'\n\x1a\x64isapproved_products_count\x18\x04 \x01(\x03\x42\x03\xe0\x41\x03\x1a\xbe\x01\n%ShoppingTargetAllOffersRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12$\n\x17untargeted_offers_count\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x03 \x01(\tB\x03\xe0\x41\x03\x1a\x8b\x02\n+ShoppingAddProductsToCampaignRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12k\n\x06reason\x18\x03 \x01(\x0e\x32V.google.ads.googleads.v18.enums.ShoppingAddProductsToCampaignRecommendationEnum.ReasonB\x03\xe0\x41\x03\x1a\xa8\x01\n5ShoppingMerchantCenterAccountSuspensionRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x03\x1a\xbd\x01\nJShoppingMigrateRegularShoppingCampaignOffersToPerformanceMaxRecommendation\x12V\n\x08merchant\x18\x01 \x01(\x0b\x32?.google.ads.googleads.v18.resources.Recommendation.MerchantInfoB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x02 \x01(\tB\x03\xe0\x41\x03\x1a\x9b\x01\n\x14TargetAdjustmentInfo\x12\x1c\n\nshared_set\x18\x01 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12*\n\x1drecommended_target_multiplier\x18\x02 \x01(\x01\x42\x03\xe0\x41\x03\x12*\n\x1d\x63urrent_average_target_micros\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x42\r\n\x0b_shared_set\x1a\x83\x02\n\x1cRaiseTargetCpaRecommendation\x12g\n\x11target_adjustment\x18\x01 \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.TargetAdjustmentInfoB\x03\xe0\x41\x03\x12\x65\n\x10\x61pp_bidding_goal\x18\x02 \x01(\x0e\x32\x41.google.ads.googleads.v18.enums.AppBiddingGoalEnum.AppBiddingGoalB\x03\xe0\x41\x03H\x00\x88\x01\x01\x42\x13\n\x11_app_bidding_goal\x1a\x88\x01\n\x1dLowerTargetRoasRecommendation\x12g\n\x11target_adjustment\x18\x01 \x01(\x0b\x32G.google.ads.googleads.v18.resources.Recommendation.TargetAdjustmentInfoB\x03\xe0\x41\x03\x1a*\n(DynamicImageExtensionOptInRecommendation\x1a}\n\x0e\x43\x61mpaignBudget\x12\"\n\x15\x63urrent_amount_micros\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12*\n\x1drecommended_new_amount_micros\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12\x1b\n\x0enew_start_date\x18\x03 \x01(\tB\x03\xe0\x41\x03\x1a#\n!PerformanceMaxOptInRecommendation\x1aI\n-ImprovePerformanceMaxAdStrengthRecommendation\x12\x18\n\x0b\x61sset_group\x18\x01 \x01(\tB\x03\xe0\x41\x03\x1aX\n=MigrateDynamicSearchAdsCampaignToPerformanceMaxRecommendation\x12\x17\n\napply_link\x18\x01 \x01(\tB\x03\xe0\x41\x03\x1a\xb4\x01\n%ForecastingSetTargetCpaRecommendation\x12*\n\x1drecommended_target_cpa_micros\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12_\n\x0f\x63\x61mpaign_budget\x18\x02 \x01(\x0b\x32\x41.google.ads.googleads.v18.resources.Recommendation.CampaignBudgetB\x03\xe0\x41\x03\x1a,\n*MaximizeConversionValueOptInRecommendation\x1a(\n&ImproveGoogleTagCoverageRecommendation\x1a+\n)PerformanceMaxFinalUrlOptInRecommendation\x1a\xec\x02\n&RefreshCustomerMatchListRecommendation\x12\x19\n\x0cuser_list_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12\x1b\n\x0euser_list_name\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12$\n\x17\x64\x61ys_since_last_refresh\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12\x61\n\x14top_spending_account\x18\x04 \x03(\x0b\x32>.google.ads.googleads.v18.resources.Recommendation.AccountInfoB\x03\xe0\x41\x03\x12%\n\x18targeting_accounts_count\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03\x12Z\n\rowner_account\x18\x06 \x01(\x0b\x32>.google.ads.googleads.v18.resources.Recommendation.AccountInfoB\x03\xe0\x41\x03\x1a\x46\n\x0b\x41\x63\x63ountInfo\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03\x12\x1d\n\x10\x64\x65scriptive_name\x18\x02 \x01(\tB\x03\xe0\x41\x03\x1ah\n!CustomAudienceOptInRecommendation\x12\x43\n\x08keywords\x18\x01 \x03(\x0b\x32,.google.ads.googleads.v18.common.KeywordInfoB\x03\xe0\x41\x03\x1a\x1d\n\x1bLeadFormAssetRecommendation\x1a\xbc\x01\n(ImproveDemandGenAdStrengthRecommendation\x12\x0f\n\x02\x61\x64\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12S\n\x0b\x61\x64_strength\x18\x02 \x01(\x0e\x32\x39.google.ads.googleads.v18.enums.AdStrengthEnum.AdStrengthB\x03\xe0\x41\x03\x12*\n\x1d\x64\x65mand_gen_asset_action_items\x18\x03 \x03(\tB\x03\xe0\x41\x03:i\xea\x41\x66\n\'googleads.googleapis.com/Recommendation\x12;customers/{customer_id}/recommendations/{recommendation_id}B\x10\n\x0erecommendationB\x12\n\x10_campaign_budgetB\x0b\n\t_campaignB\x0b\n\t_ad_groupB\x0c\n\n_dismissedB\x85\x02\n&com.google.ads.googleads.v18.resourcesB\x13RecommendationProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v18.common.KeywordInfo", "google/ads/googleads/v18/common/criteria.proto"],
    ["google.ads.googleads.v18.resources.Ad", "google/ads/googleads/v18/resources/ad.proto"],
    ["google.ads.googleads.v18.resources.Asset", "google/ads/googleads/v18/resources/asset.proto"],
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
      module V18
        module Resources
          Recommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation").msgclass
          Recommendation::MerchantInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MerchantInfo").msgclass
          Recommendation::RecommendationImpact = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.RecommendationImpact").msgclass
          Recommendation::RecommendationMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.RecommendationMetrics").msgclass
          Recommendation::CampaignBudgetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendation").msgclass
          Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CampaignBudgetRecommendation.CampaignBudgetRecommendationOption").msgclass
          Recommendation::KeywordRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.KeywordRecommendation").msgclass
          Recommendation::KeywordRecommendation::SearchTerm = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.KeywordRecommendation.SearchTerm").msgclass
          Recommendation::TextAdRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.TextAdRecommendation").msgclass
          Recommendation::TargetCpaOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.TargetCpaOptInRecommendation").msgclass
          Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.TargetCpaOptInRecommendation.TargetCpaOptInRecommendationOption").msgclass
          Recommendation::MaximizeConversionsOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MaximizeConversionsOptInRecommendation").msgclass
          Recommendation::EnhancedCpcOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.EnhancedCpcOptInRecommendation").msgclass
          Recommendation::SearchPartnersOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.SearchPartnersOptInRecommendation").msgclass
          Recommendation::MaximizeClicksOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MaximizeClicksOptInRecommendation").msgclass
          Recommendation::OptimizeAdRotationRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.OptimizeAdRotationRecommendation").msgclass
          Recommendation::CalloutAssetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CalloutAssetRecommendation").msgclass
          Recommendation::SitelinkAssetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.SitelinkAssetRecommendation").msgclass
          Recommendation::CallAssetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CallAssetRecommendation").msgclass
          Recommendation::KeywordMatchTypeRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.KeywordMatchTypeRecommendation").msgclass
          Recommendation::MoveUnusedBudgetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MoveUnusedBudgetRecommendation").msgclass
          Recommendation::TargetRoasOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.TargetRoasOptInRecommendation").msgclass
          Recommendation::ResponsiveSearchAdAssetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdAssetRecommendation").msgclass
          Recommendation::ResponsiveSearchAdImproveAdStrengthRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdImproveAdStrengthRecommendation").msgclass
          Recommendation::ResponsiveSearchAdRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ResponsiveSearchAdRecommendation").msgclass
          Recommendation::UseBroadMatchKeywordRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.UseBroadMatchKeywordRecommendation").msgclass
          Recommendation::UpgradeSmartShoppingCampaignToPerformanceMaxRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.UpgradeSmartShoppingCampaignToPerformanceMaxRecommendation").msgclass
          Recommendation::RaiseTargetCpaBidTooLowRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.RaiseTargetCpaBidTooLowRecommendation").msgclass
          Recommendation::DisplayExpansionOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.DisplayExpansionOptInRecommendation").msgclass
          Recommendation::UpgradeLocalCampaignToPerformanceMaxRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.UpgradeLocalCampaignToPerformanceMaxRecommendation").msgclass
          Recommendation::ForecastingSetTargetRoasRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetRoasRecommendation").msgclass
          Recommendation::ShoppingOfferAttributeRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingOfferAttributeRecommendation").msgclass
          Recommendation::ShoppingFixDisapprovedProductsRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingFixDisapprovedProductsRecommendation").msgclass
          Recommendation::ShoppingTargetAllOffersRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingTargetAllOffersRecommendation").msgclass
          Recommendation::ShoppingAddProductsToCampaignRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingAddProductsToCampaignRecommendation").msgclass
          Recommendation::ShoppingMerchantCenterAccountSuspensionRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingMerchantCenterAccountSuspensionRecommendation").msgclass
          Recommendation::ShoppingMigrateRegularShoppingCampaignOffersToPerformanceMaxRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ShoppingMigrateRegularShoppingCampaignOffersToPerformanceMaxRecommendation").msgclass
          Recommendation::TargetAdjustmentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.TargetAdjustmentInfo").msgclass
          Recommendation::RaiseTargetCpaRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.RaiseTargetCpaRecommendation").msgclass
          Recommendation::LowerTargetRoasRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.LowerTargetRoasRecommendation").msgclass
          Recommendation::DynamicImageExtensionOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.DynamicImageExtensionOptInRecommendation").msgclass
          Recommendation::CampaignBudget = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CampaignBudget").msgclass
          Recommendation::PerformanceMaxOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.PerformanceMaxOptInRecommendation").msgclass
          Recommendation::ImprovePerformanceMaxAdStrengthRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ImprovePerformanceMaxAdStrengthRecommendation").msgclass
          Recommendation::MigrateDynamicSearchAdsCampaignToPerformanceMaxRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MigrateDynamicSearchAdsCampaignToPerformanceMaxRecommendation").msgclass
          Recommendation::ForecastingSetTargetCpaRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ForecastingSetTargetCpaRecommendation").msgclass
          Recommendation::MaximizeConversionValueOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.MaximizeConversionValueOptInRecommendation").msgclass
          Recommendation::ImproveGoogleTagCoverageRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ImproveGoogleTagCoverageRecommendation").msgclass
          Recommendation::PerformanceMaxFinalUrlOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.PerformanceMaxFinalUrlOptInRecommendation").msgclass
          Recommendation::RefreshCustomerMatchListRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.RefreshCustomerMatchListRecommendation").msgclass
          Recommendation::AccountInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.AccountInfo").msgclass
          Recommendation::CustomAudienceOptInRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.CustomAudienceOptInRecommendation").msgclass
          Recommendation::LeadFormAssetRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.LeadFormAssetRecommendation").msgclass
          Recommendation::ImproveDemandGenAdStrengthRecommendation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.Recommendation.ImproveDemandGenAdStrengthRecommendation").msgclass
        end
      end
    end
  end
end