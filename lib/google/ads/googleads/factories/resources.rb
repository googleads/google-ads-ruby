module Google
  module Ads
    module GoogleAds
      module Factories
        module Resource
          
          def policy_violation_key
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyViolationKey.new
          end
          
          def policy_validation_parameter
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyValidationParameter.new
          end
          
          def policy_topic_entry
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEntry.new
          end
          
          def policy_topic_evidence
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence.new
          end
          
          def text_list
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::TextList.new
          end
          
          def website_list
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::WebsiteList.new
          end
          
          def destination_text_list
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::DestinationTextList.new
          end
          
          def destination_mismatch
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::DestinationMismatch.new
          end
          
          def policy_topic_constraint
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint.new
          end
          
          def country_constraint_list
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::CountryConstraintList.new
          end
          
          def reseller_constraint
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::ResellerConstraint.new
          end
          
          def country_constraint
            require "/lib/google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::CountryConstraint.new
          end
          
          def ad_text_asset
            require "/lib/google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdTextAsset.new
          end
          
          def ad_image_asset
            require "/lib/google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdImageAsset.new
          end
          
          def ad_video_asset
            require "/lib/google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdVideoAsset.new
          end
          
          def ad_media_bundle_asset
            require "/lib/google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdMediaBundleAsset.new
          end
          
          def text_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextAdInfo.new
          end
          
          def expanded_text_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpandedTextAdInfo.new
          end
          
          def call_only_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CallOnlyAdInfo.new
          end
          
          def expanded_dynamic_search_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpandedDynamicSearchAdInfo.new
          end
          
          def hotel_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelAdInfo.new
          end
          
          def shopping_smart_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ShoppingSmartAdInfo.new
          end
          
          def shopping_product_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ShoppingProductAdInfo.new
          end
          
          def gmail_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GmailAdInfo.new
          end
          
          def gmail_teaser
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GmailTeaser.new
          end
          
          def display_call_to_action
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DisplayCallToAction.new
          end
          
          def product_image
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductImage.new
          end
          
          def product_video
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductVideo.new
          end
          
          def image_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageAdInfo.new
          end
          
          def video_bumper_in_stream_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoBumperInStreamAdInfo.new
          end
          
          def video_non_skippable_in_stream_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoNonSkippableInStreamAdInfo.new
          end
          
          def video_true_view_in_stream_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoTrueViewInStreamAdInfo.new
          end
          
          def video_outstream_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoOutstreamAdInfo.new
          end
          
          def video_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoAdInfo.new
          end
          
          def responsive_search_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ResponsiveSearchAdInfo.new
          end
          
          def legacy_responsive_display_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LegacyResponsiveDisplayAdInfo.new
          end
          
          def app_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppAdInfo.new
          end
          
          def legacy_app_install_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LegacyAppInstallAdInfo.new
          end
          
          def responsive_display_ad_info
            require "/lib/google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ResponsiveDisplayAdInfo.new
          end
          
          def custom_parameter
            require "/lib/google/ads/google_ads/v1/common/custom_parameter_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomParameter.new
          end
          
          def url_collection
            require "/lib/google/ads/google_ads/v1/common/url_collection_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UrlCollection.new
          end
          
          def ad
            require "/lib/google/ads/google_ads/v1/resources/ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Ad.new
          end
          
          def ad_group_ad
            require "/lib/google/ads/google_ads/v1/resources/ad_group_ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAd.new
          end
          
          def ad_group_ad_policy_summary
            require "/lib/google/ads/google_ads/v1/resources/ad_group_ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAdPolicySummary.new
          end
          
          def customer_client_link
            require "/lib/google/ads/google_ads/v1/resources/customer_client_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerClientLink.new
          end
          
          def change_status
            require "/lib/google/ads/google_ads/v1/resources/change_status_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ChangeStatus.new
          end
          
          def carrier_constant
            require "/lib/google/ads/google_ads/v1/resources/carrier_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CarrierConstant.new
          end
          
          def customer_manager_link
            require "/lib/google/ads/google_ads/v1/resources/customer_manager_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerManagerLink.new
          end
          
          def ad_schedule_view
            require "/lib/google/ads/google_ads/v1/resources/ad_schedule_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdScheduleView.new
          end
          
          def hotel_group_view
            require "/lib/google/ads/google_ads/v1/resources/hotel_group_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::HotelGroupView.new
          end
          
          def shared_set
            require "/lib/google/ads/google_ads/v1/resources/shared_set_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SharedSet.new
          end
          
          def merchant_center_link
            require "/lib/google/ads/google_ads/v1/resources/merchant_center_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MerchantCenterLink.new
          end
          
          def shopping_performance_view
            require "/lib/google/ads/google_ads/v1/resources/shopping_performance_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ShoppingPerformanceView.new
          end
          
          def keyword_plan_ad_group
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_ad_group_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanAdGroup.new
          end
          
          def age_range_view
            require "/lib/google/ads/google_ads/v1/resources/age_range_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AgeRangeView.new
          end
          
          def customer_extension_setting
            require "/lib/google/ads/google_ads/v1/resources/customer_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerExtensionSetting.new
          end
          
          def managed_placement_view
            require "/lib/google/ads/google_ads/v1/resources/managed_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ManagedPlacementView.new
          end
          
          def campaign_label
            require "/lib/google/ads/google_ads/v1/resources/campaign_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignLabel.new
          end
          
          def click_location
            require "/lib/google/ads/google_ads/v1/common/click_location_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ClickLocation.new
          end
          
          def click_view
            require "/lib/google/ads/google_ads/v1/resources/click_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ClickView.new
          end
          
          def ad_parameter
            require "/lib/google/ads/google_ads/v1/resources/ad_parameter_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdParameter.new
          end
          
          def custom_interest
            require "/lib/google/ads/google_ads/v1/resources/custom_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomInterest.new
          end
          
          def custom_interest_member
            require "/lib/google/ads/google_ads/v1/resources/custom_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomInterestMember.new
          end
          
          def location_view
            require "/lib/google/ads/google_ads/v1/resources/location_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::LocationView.new
          end
          
          def youtube_video_asset
            require "/lib/google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YoutubeVideoAsset.new
          end
          
          def media_bundle_asset
            require "/lib/google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MediaBundleAsset.new
          end
          
          def image_asset
            require "/lib/google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageAsset.new
          end
          
          def image_dimension
            require "/lib/google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageDimension.new
          end
          
          def asset
            require "/lib/google/ads/google_ads/v1/resources/asset_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Asset.new
          end
          
          def parental_status_view
            require "/lib/google/ads/google_ads/v1/resources/parental_status_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ParentalStatusView.new
          end
          
          def domain_category
            require "/lib/google/ads/google_ads/v1/resources/domain_category_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DomainCategory.new
          end
          
          def video
            require "/lib/google/ads/google_ads/v1/resources/video_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Video.new
          end
          
          def feed
            require "/lib/google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed.new
          end
          
          def places_location_feed_data
            require "/lib/google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::PlacesLocationFeedData.new
          end
          
          def o_auth_info
            require "/lib/google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::PlacesLocationFeedData::OAuthInfo.new
          end
          
          def affiliate_location_feed_data
            require "/lib/google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::AffiliateLocationFeedData.new
          end
          
          def feed_attribute
            require "/lib/google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedAttribute.new
          end
          
          def keyword_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::KeywordInfo.new
          end
          
          def placement_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PlacementInfo.new
          end
          
          def mobile_app_category_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileAppCategoryInfo.new
          end
          
          def mobile_application_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileApplicationInfo.new
          end
          
          def location_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LocationInfo.new
          end
          
          def device_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DeviceInfo.new
          end
          
          def preferred_content_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PreferredContentInfo.new
          end
          
          def listing_group_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingGroupInfo.new
          end
          
          def listing_scope_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingScopeInfo.new
          end
          
          def listing_dimension_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingDimensionInfo.new
          end
          
          def listing_brand_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingBrandInfo.new
          end
          
          def hotel_id_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelIdInfo.new
          end
          
          def hotel_class_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelClassInfo.new
          end
          
          def hotel_country_region_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCountryRegionInfo.new
          end
          
          def hotel_state_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelStateInfo.new
          end
          
          def hotel_city_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCityInfo.new
          end
          
          def listing_custom_attribute_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingCustomAttributeInfo.new
          end
          
          def product_bidding_category_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductBiddingCategoryInfo.new
          end
          
          def product_channel_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductChannelInfo.new
          end
          
          def product_channel_exclusivity_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductChannelExclusivityInfo.new
          end
          
          def product_condition_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductConditionInfo.new
          end
          
          def product_item_id_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductItemIdInfo.new
          end
          
          def product_type_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductTypeInfo.new
          end
          
          def unknown_listing_dimension_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UnknownListingDimensionInfo.new
          end
          
          def hotel_date_selection_type_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelDateSelectionTypeInfo.new
          end
          
          def hotel_advance_booking_window_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelAdvanceBookingWindowInfo.new
          end
          
          def hotel_length_of_stay_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelLengthOfStayInfo.new
          end
          
          def hotel_check_in_day_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCheckInDayInfo.new
          end
          
          def interaction_type_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::InteractionTypeInfo.new
          end
          
          def ad_schedule_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdScheduleInfo.new
          end
          
          def age_range_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AgeRangeInfo.new
          end
          
          def gender_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GenderInfo.new
          end
          
          def income_range_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::IncomeRangeInfo.new
          end
          
          def parental_status_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ParentalStatusInfo.new
          end
          
          def you_tube_video_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YouTubeVideoInfo.new
          end
          
          def you_tube_channel_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YouTubeChannelInfo.new
          end
          
          def user_list_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListInfo.new
          end
          
          def proximity_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProximityInfo.new
          end
          
          def geo_point_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GeoPointInfo.new
          end
          
          def address_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AddressInfo.new
          end
          
          def topic_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TopicInfo.new
          end
          
          def language_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LanguageInfo.new
          end
          
          def ip_block_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::IpBlockInfo.new
          end
          
          def content_label_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ContentLabelInfo.new
          end
          
          def carrier_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CarrierInfo.new
          end
          
          def user_interest_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserInterestInfo.new
          end
          
          def webpage_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::WebpageInfo.new
          end
          
          def webpage_condition_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::WebpageConditionInfo.new
          end
          
          def operating_system_version_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::OperatingSystemVersionInfo.new
          end
          
          def app_payment_model_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppPaymentModelInfo.new
          end
          
          def mobile_device_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileDeviceInfo.new
          end
          
          def custom_affinity_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomAffinityInfo.new
          end
          
          def custom_intent_info
            require "/lib/google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomIntentInfo.new
          end
          
          def recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation.new
          end
          
          def recommendation_impact
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::RecommendationImpact.new
          end
          
          def recommendation_metrics
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::RecommendationMetrics.new
          end
          
          def campaign_budget_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::CampaignBudgetRecommendation.new
          end
          
          def campaign_budget_recommendation_option
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption.new
          end
          
          def keyword_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::KeywordRecommendation.new
          end
          
          def text_ad_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TextAdRecommendation.new
          end
          
          def optimize_ad_rotation_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::OptimizeAdRotationRecommendation.new
          end
          
          def target_cpa_opt_in_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TargetCpaOptInRecommendation.new
          end
          
          def target_cpa_opt_in_recommendation_option
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption.new
          end
          
          def maximize_conversions_opt_in_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MaximizeConversionsOptInRecommendation.new
          end
          
          def enhanced_cpc_opt_in_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::EnhancedCpcOptInRecommendation.new
          end
          
          def search_partners_opt_in_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::SearchPartnersOptInRecommendation.new
          end
          
          def maximize_clicks_opt_in_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MaximizeClicksOptInRecommendation.new
          end
          
          def keyword_match_type_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::KeywordMatchTypeRecommendation.new
          end
          
          def move_unused_budget_recommendation
            require "/lib/google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MoveUnusedBudgetRecommendation.new
          end
          
          def money
            require "/lib/google/ads/google_ads/v1/common/feed_common_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Money.new
          end
          
          def feed_item
            require "/lib/google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItem.new
          end
          
          def feed_item_attribute_value
            require "/lib/google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemAttributeValue.new
          end
          
          def feed_item_placeholder_policy_info
            require "/lib/google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemPlaceholderPolicyInfo.new
          end
          
          def feed_item_validation_error
            require "/lib/google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemValidationError.new
          end
          
          def app_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppFeedItem.new
          end
          
          def call_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CallFeedItem.new
          end
          
          def callout_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CalloutFeedItem.new
          end
          
          def text_message_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextMessageFeedItem.new
          end
          
          def price_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PriceFeedItem.new
          end
          
          def price_offer
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PriceOffer.new
          end
          
          def promotion_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PromotionFeedItem.new
          end
          
          def structured_snippet_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::StructuredSnippetFeedItem.new
          end
          
          def sitelink_feed_item
            require "/lib/google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::SitelinkFeedItem.new
          end
          
          def extension_feed_item
            require "/lib/google/ads/google_ads/v1/resources/extension_feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ExtensionFeedItem.new
          end
          
          def account_budget_proposal
            require "/lib/google/ads/google_ads/v1/resources/account_budget_proposal_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudgetProposal.new
          end
          
          def geo_target_constant
            require "/lib/google/ads/google_ads/v1/resources/geo_target_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GeoTargetConstant.new
          end
          
          def ad_group_extension_setting
            require "/lib/google/ads/google_ads/v1/resources/ad_group_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupExtensionSetting.new
          end
          
          def matching_function
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MatchingFunction.new
          end
          
          def operand
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand.new
          end
          
          def constant_operand
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::ConstantOperand.new
          end
          
          def feed_attribute_operand
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::FeedAttributeOperand.new
          end
          
          def function_operand
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::FunctionOperand.new
          end
          
          def request_context_operand
            require "/lib/google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::RequestContextOperand.new
          end
          
          def campaign_feed
            require "/lib/google/ads/google_ads/v1/resources/campaign_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignFeed.new
          end
          
          def criterion_category_availability
            require "/lib/google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryAvailability.new
          end
          
          def criterion_category_channel_availability
            require "/lib/google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryChannelAvailability.new
          end
          
          def criterion_category_locale_availability
            require "/lib/google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryLocaleAvailability.new
          end
          
          def user_interest
            require "/lib/google/ads/google_ads/v1/resources/user_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::UserInterest.new
          end
          
          def keyword_plan_keyword
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_keyword_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanKeyword.new
          end
          
          def hotel_performance_view
            require "/lib/google/ads/google_ads/v1/resources/hotel_performance_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::HotelPerformanceView.new
          end
          
          def product_group_view
            require "/lib/google/ads/google_ads/v1/resources/product_group_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ProductGroupView.new
          end
          
          def payments_account
            require "/lib/google/ads/google_ads/v1/resources/payments_account_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::PaymentsAccount.new
          end
          
          def keyword_view
            require "/lib/google/ads/google_ads/v1/resources/keyword_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordView.new
          end
          
          def mobile_app_category_constant
            require "/lib/google/ads/google_ads/v1/resources/mobile_app_category_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MobileAppCategoryConstant.new
          end
          
          def mutate_job
            require "/lib/google/ads/google_ads/v1/resources/mutate_job_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MutateJob.new
          end
          
          def mutate_job_metadata
            require "/lib/google/ads/google_ads/v1/resources/mutate_job_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MutateJob::MutateJobMetadata.new
          end
          
          def ad_group_audience_view
            require "/lib/google/ads/google_ads/v1/resources/ad_group_audience_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAudienceView.new
          end
          
          def keyword_plan_campaign
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanCampaign.new
          end
          
          def keyword_plan_geo_target
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanGeoTarget.new
          end
          
          def geographic_view
            require "/lib/google/ads/google_ads/v1/resources/geographic_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GeographicView.new
          end
          
          def account_budget
            require "/lib/google/ads/google_ads/v1/resources/account_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudget.new
          end
          
          def pending_account_budget_proposal
            require "/lib/google/ads/google_ads/v1/resources/account_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudget::PendingAccountBudgetProposal.new
          end
          
          def tag_snippet
            require "/lib/google/ads/google_ads/v1/common/tag_snippet_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TagSnippet.new
          end
          
          def conversion_action
            require "/lib/google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction.new
          end
          
          def attribution_model_settings
            require "/lib/google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction::AttributionModelSettings.new
          end
          
          def value_settings
            require "/lib/google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction::ValueSettings.new
          end
          
          def date_range
            require "/lib/google/ads/google_ads/v1/common/dates_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DateRange.new
          end
          
          def keyword_plan
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlan.new
          end
          
          def keyword_plan_forecast_period
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanForecastPeriod.new
          end
          
          def keyword_plan_negative_keyword
            require "/lib/google/ads/google_ads/v1/resources/keyword_plan_negative_keyword_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanNegativeKeyword.new
          end
          
          def commission
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Commission.new
          end
          
          def enhanced_cpc
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::EnhancedCpc.new
          end
          
          def manual_cpc
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpc.new
          end
          
          def manual_cpm
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpm.new
          end
          
          def manual_cpv
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpv.new
          end
          
          def maximize_conversions
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MaximizeConversions.new
          end
          
          def maximize_conversion_value
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MaximizeConversionValue.new
          end
          
          def page_one_promoted
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PageOnePromoted.new
          end
          
          def target_cpa
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetCpa.new
          end
          
          def target_cpm
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetCpm.new
          end
          
          def target_impression_share
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetImpressionShare.new
          end
          
          def target_outrank_share
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetOutrankShare.new
          end
          
          def target_roas
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetRoas.new
          end
          
          def target_spend
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetSpend.new
          end
          
          def percent_cpc
            require "/lib/google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PercentCpc.new
          end
          
          def frequency_cap_entry
            require "/lib/google/ads/google_ads/v1/common/frequency_cap_pb.rb"
            Google::Ads::GoogleAds::V1::Common::FrequencyCapEntry.new
          end
          
          def frequency_cap_key
            require "/lib/google/ads/google_ads/v1/common/frequency_cap_pb.rb"
            Google::Ads::GoogleAds::V1::Common::FrequencyCapKey.new
          end
          
          def real_time_bidding_setting
            require "/lib/google/ads/google_ads/v1/common/real_time_bidding_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::RealTimeBiddingSetting.new
          end
          
          def targeting_setting
            require "/lib/google/ads/google_ads/v1/common/targeting_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetingSetting.new
          end
          
          def target_restriction
            require "/lib/google/ads/google_ads/v1/common/targeting_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetRestriction.new
          end
          
          def campaign
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign.new
          end
          
          def network_settings
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::NetworkSettings.new
          end
          
          def hotel_setting_info
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::HotelSettingInfo.new
          end
          
          def vanity_pharma
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::VanityPharma.new
          end
          
          def dynamic_search_ads_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::DynamicSearchAdsSetting.new
          end
          
          def selective_optimization
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::SelectiveOptimization.new
          end
          
          def shopping_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::ShoppingSetting.new
          end
          
          def tracking_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::TrackingSetting.new
          end
          
          def geo_target_type_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::GeoTargetTypeSetting.new
          end
          
          def app_campaign_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::AppCampaignSetting.new
          end
          
          def display_keyword_view
            require "/lib/google/ads/google_ads/v1/resources/display_keyword_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DisplayKeywordView.new
          end
          
          def product_bidding_category_constant
            require "/lib/google/ads/google_ads/v1/resources/product_bidding_category_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ProductBiddingCategoryConstant.new
          end
          
          def operating_system_version_constant
            require "/lib/google/ads/google_ads/v1/resources/operating_system_version_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::OperatingSystemVersionConstant.new
          end
          
          def feed_mapping
            require "/lib/google/ads/google_ads/v1/resources/feed_mapping_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedMapping.new
          end
          
          def attribute_field_mapping
            require "/lib/google/ads/google_ads/v1/resources/feed_mapping_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AttributeFieldMapping.new
          end
          
          def mobile_device_constant
            require "/lib/google/ads/google_ads/v1/resources/mobile_device_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MobileDeviceConstant.new
          end
          
          def media_file
            require "/lib/google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaFile.new
          end
          
          def media_image
            require "/lib/google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaImage.new
          end
          
          def media_bundle
            require "/lib/google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaBundle.new
          end
          
          def media_audio
            require "/lib/google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaAudio.new
          end
          
          def media_video
            require "/lib/google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaVideo.new
          end
          
          def google_ads_field
            require "/lib/google/ads/google_ads/v1/resources/google_ads_field_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GoogleAdsField.new
          end
          
          def ad_group_criterion
            require "/lib/google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion.new
          end
          
          def quality_info
            require "/lib/google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion::QualityInfo.new
          end
          
          def position_estimates
            require "/lib/google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion::PositionEstimates.new
          end
          
          def campaign_bid_modifier
            require "/lib/google/ads/google_ads/v1/resources/campaign_bid_modifier_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignBidModifier.new
          end
          
          def ad_group_label
            require "/lib/google/ads/google_ads/v1/resources/ad_group_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupLabel.new
          end
          
          def billing_setup
            require "/lib/google/ads/google_ads/v1/resources/billing_setup_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BillingSetup.new
          end
          
          def payments_account_info
            require "/lib/google/ads/google_ads/v1/resources/billing_setup_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BillingSetup::PaymentsAccountInfo.new
          end
          
          def customer_negative_criterion
            require "/lib/google/ads/google_ads/v1/resources/customer_negative_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerNegativeCriterion.new
          end
          
          def search_term_view
            require "/lib/google/ads/google_ads/v1/resources/search_term_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SearchTermView.new
          end
          
          def dynamic_search_ads_search_term_view
            require "/lib/google/ads/google_ads/v1/resources/dynamic_search_ads_search_term_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DynamicSearchAdsSearchTermView.new
          end
          
          def customer
            require "/lib/google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Customer.new
          end
          
          def call_reporting_setting
            require "/lib/google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CallReportingSetting.new
          end
          
          def conversion_tracking_setting
            require "/lib/google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionTrackingSetting.new
          end
          
          def remarketing_setting
            require "/lib/google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::RemarketingSetting.new
          end
          
          def customer_feed
            require "/lib/google/ads/google_ads/v1/resources/customer_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerFeed.new
          end
          
          def shared_criterion
            require "/lib/google/ads/google_ads/v1/resources/shared_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SharedCriterion.new
          end
          
          def ad_group_criterion_label
            require "/lib/google/ads/google_ads/v1/resources/ad_group_criterion_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterionLabel.new
          end
          
          def customer_label
            require "/lib/google/ads/google_ads/v1/resources/customer_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerLabel.new
          end
          
          def detail_placement_view
            require "/lib/google/ads/google_ads/v1/resources/detail_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DetailPlacementView.new
          end
          
          def gender_view
            require "/lib/google/ads/google_ads/v1/resources/gender_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GenderView.new
          end
          
          def bidding_strategy
            require "/lib/google/ads/google_ads/v1/resources/bidding_strategy_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BiddingStrategy.new
          end
          
          def remarketing_action
            require "/lib/google/ads/google_ads/v1/resources/remarketing_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::RemarketingAction.new
          end
          
          def campaign_shared_set
            require "/lib/google/ads/google_ads/v1/resources/campaign_shared_set_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignSharedSet.new
          end
          
          def topic_view
            require "/lib/google/ads/google_ads/v1/resources/topic_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::TopicView.new
          end
          
          def campaign_criterion
            require "/lib/google/ads/google_ads/v1/resources/campaign_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignCriterion.new
          end
          
          def feed_placeholder_view
            require "/lib/google/ads/google_ads/v1/resources/feed_placeholder_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedPlaceholderView.new
          end
          
          def similar_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::SimilarUserListInfo.new
          end
          
          def crm_based_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CrmBasedUserListInfo.new
          end
          
          def user_list_rule_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleInfo.new
          end
          
          def user_list_rule_item_group_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleItemGroupInfo.new
          end
          
          def user_list_rule_item_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleItemInfo.new
          end
          
          def user_list_date_rule_item_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListDateRuleItemInfo.new
          end
          
          def user_list_number_rule_item_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListNumberRuleItemInfo.new
          end
          
          def user_list_string_rule_item_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListStringRuleItemInfo.new
          end
          
          def combined_rule_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CombinedRuleUserListInfo.new
          end
          
          def date_specific_rule_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DateSpecificRuleUserListInfo.new
          end
          
          def expression_rule_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpressionRuleUserListInfo.new
          end
          
          def rule_based_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::RuleBasedUserListInfo.new
          end
          
          def logical_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LogicalUserListInfo.new
          end
          
          def user_list_logical_rule_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListLogicalRuleInfo.new
          end
          
          def logical_user_list_operand_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LogicalUserListOperandInfo.new
          end
          
          def basic_user_list_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::BasicUserListInfo.new
          end
          
          def user_list_action_info
            require "/lib/google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListActionInfo.new
          end
          
          def user_list
            require "/lib/google/ads/google_ads/v1/resources/user_list_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::UserList.new
          end
          
          def group_placement_view
            require "/lib/google/ads/google_ads/v1/resources/group_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GroupPlacementView.new
          end
          
          def ad_group_feed
            require "/lib/google/ads/google_ads/v1/resources/ad_group_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupFeed.new
          end
          
          def topic_constant
            require "/lib/google/ads/google_ads/v1/resources/topic_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::TopicConstant.new
          end
          
          def explorer_auto_optimizer_setting
            require "/lib/google/ads/google_ads/v1/common/explorer_auto_optimizer_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExplorerAutoOptimizerSetting.new
          end
          
          def ad_group
            require "/lib/google/ads/google_ads/v1/resources/ad_group_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroup.new
          end
          
          def ad_group_bid_modifier
            require "/lib/google/ads/google_ads/v1/resources/ad_group_bid_modifier_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupBidModifier.new
          end
          
          def customer_client
            require "/lib/google/ads/google_ads/v1/resources/customer_client_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerClient.new
          end
          
          def text_label
            require "/lib/google/ads/google_ads/v1/common/text_label_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextLabel.new
          end
          
          def label
            require "/lib/google/ads/google_ads/v1/resources/label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Label.new
          end
          
          def campaign_budget
            require "/lib/google/ads/google_ads/v1/resources/campaign_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignBudget.new
          end
          
          def language_constant
            require "/lib/google/ads/google_ads/v1/resources/language_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::LanguageConstant.new
          end
          
          def campaign_audience_view
            require "/lib/google/ads/google_ads/v1/resources/campaign_audience_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignAudienceView.new
          end
          
          def campaign_extension_setting
            require "/lib/google/ads/google_ads/v1/resources/campaign_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignExtensionSetting.new
          end
          
          def ad_group_ad_label
            require "/lib/google/ads/google_ads/v1/resources/ad_group_ad_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAdLabel.new
          end
          
          def feed_item_target
            require "/lib/google/ads/google_ads/v1/resources/feed_item_target_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemTarget.new
          end
          
          def mutate_ad_group_feed_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_feed_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupFeedResult.new
          end
          
          def conversion_adjustment
            require "/lib/google/ads/google_ads/v1/services/conversion_adjustment_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ConversionAdjustment.new
          end
          
          def restatement_value
            require "/lib/google/ads/google_ads/v1/services/conversion_adjustment_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::RestatementValue.new
          end
          
          def gclid_date_time_pair
            require "/lib/google/ads/google_ads/v1/services/conversion_adjustment_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::GclidDateTimePair.new
          end
          
          def conversion_adjustment_result
            require "/lib/google/ads/google_ads/v1/services/conversion_adjustment_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ConversionAdjustmentResult.new
          end
          
          def mutate_customer_manager_link_result
            require "/lib/google/ads/google_ads/v1/services/customer_manager_link_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerManagerLinkResult.new
          end
          
          def mutate_keyword_plan_keyword_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_keyword_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateKeywordPlanKeywordResult.new
          end
          
          def mutate_campaign_budget_result
            require "/lib/google/ads/google_ads/v1/services/campaign_budget_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignBudgetResult.new
          end
          
          def mutate_ad_group_ad_label_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_ad_label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupAdLabelResult.new
          end
          
          def mutate_campaign_label_result
            require "/lib/google/ads/google_ads/v1/services/campaign_label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignLabelResult.new
          end
          
          def mutate_ad_parameter_result
            require "/lib/google/ads/google_ads/v1/services/ad_parameter_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdParameterResult.new
          end
          
          def mutate_campaign_result
            require "/lib/google/ads/google_ads/v1/services/campaign_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignResult.new
          end
          
          def mutate_ad_group_criterion_label_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_criterion_label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupCriterionLabelResult.new
          end
          
          def mutate_label_result
            require "/lib/google/ads/google_ads/v1/services/label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateLabelResult.new
          end
          
          def mutate_bidding_strategy_result
            require "/lib/google/ads/google_ads/v1/services/bidding_strategy_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateBiddingStrategyResult.new
          end
          
          def mutate_campaign_feed_result
            require "/lib/google/ads/google_ads/v1/services/campaign_feed_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignFeedResult.new
          end
          
          def mutate_keyword_plan_campaign_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_campaign_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateKeywordPlanCampaignResult.new
          end
          
          def keyword_plan_historical_metrics
            require "/lib/google/ads/google_ads/v1/common/keyword_plan_common_pb.rb"
            Google::Ads::GoogleAds::V1::Common::KeywordPlanHistoricalMetrics.new
          end
          
          def mutate_keyword_plans_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateKeywordPlansResult.new
          end
          
          def keyword_plan_campaign_forecast
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordPlanCampaignForecast.new
          end
          
          def keyword_plan_ad_group_forecast
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordPlanAdGroupForecast.new
          end
          
          def keyword_plan_keyword_forecast
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordPlanKeywordForecast.new
          end
          
          def forecast_metrics
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ForecastMetrics.new
          end
          
          def keyword_plan_keyword_historical_metrics
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordPlanKeywordHistoricalMetrics.new
          end
          
          def mutate_billing_setup_result
            require "/lib/google/ads/google_ads/v1/services/billing_setup_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateBillingSetupResult.new
          end
          
          def mutate_feed_item_target_result
            require "/lib/google/ads/google_ads/v1/services/feed_item_target_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateFeedItemTargetResult.new
          end
          
          def mutate_merchant_center_link_result
            require "/lib/google/ads/google_ads/v1/services/merchant_center_link_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateMerchantCenterLinkResult.new
          end
          
          def location_names
            require "/lib/google/ads/google_ads/v1/services/geo_target_constant_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::SuggestGeoTargetConstantsRequest::LocationNames.new
          end
          
          def geo_targets
            require "/lib/google/ads/google_ads/v1/services/geo_target_constant_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::SuggestGeoTargetConstantsRequest::GeoTargets.new
          end
          
          def geo_target_constant_suggestion
            require "/lib/google/ads/google_ads/v1/services/geo_target_constant_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::GeoTargetConstantSuggestion.new
          end
          
          def mutate_user_list_result
            require "/lib/google/ads/google_ads/v1/services/user_list_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateUserListResult.new
          end
          
          def mutate_campaign_extension_setting_result
            require "/lib/google/ads/google_ads/v1/services/campaign_extension_setting_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignExtensionSettingResult.new
          end
          
          def mutate_shared_criterion_result
            require "/lib/google/ads/google_ads/v1/services/shared_criterion_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateSharedCriterionResult.new
          end
          
          def mutate_ad_group_ad_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_ad_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupAdResult.new
          end
          
          def mutate_customer_result
            require "/lib/google/ads/google_ads/v1/services/customer_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerResult.new
          end
          
          def click_conversion
            require "/lib/google/ads/google_ads/v1/services/conversion_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ClickConversion.new
          end
          
          def call_conversion
            require "/lib/google/ads/google_ads/v1/services/conversion_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::CallConversion.new
          end
          
          def external_attribution_data
            require "/lib/google/ads/google_ads/v1/services/conversion_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ExternalAttributionData.new
          end
          
          def click_conversion_result
            require "/lib/google/ads/google_ads/v1/services/conversion_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ClickConversionResult.new
          end
          
          def call_conversion_result
            require "/lib/google/ads/google_ads/v1/services/conversion_upload_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::CallConversionResult.new
          end
          
          def mutate_account_budget_proposal_result
            require "/lib/google/ads/google_ads/v1/services/account_budget_proposal_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAccountBudgetProposalResult.new
          end
          
          def mutate_asset_result
            require "/lib/google/ads/google_ads/v1/services/asset_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAssetResult.new
          end
          
          def metrics
            require "/lib/google/ads/google_ads/v1/common/metrics_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Metrics.new
          end
          
          def segments
            require "/lib/google/ads/google_ads/v1/common/segments_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Segments.new
          end
          
          def keyword
            require "/lib/google/ads/google_ads/v1/common/segments_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Keyword.new
          end
          
          def mutate_ad_group_bid_modifier_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_bid_modifier_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupBidModifierResult.new
          end
          
          def mutate_ad_group_criterion_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_criterion_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupCriterionResult.new
          end
          
          def mutate_ad_group_extension_setting_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_extension_setting_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupExtensionSettingResult.new
          end
          
          def mutate_ad_group_label_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupLabelResult.new
          end
          
          def mutate_ad_group_result
            require "/lib/google/ads/google_ads/v1/services/ad_group_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateAdGroupResult.new
          end
          
          def mutate_campaign_bid_modifier_result
            require "/lib/google/ads/google_ads/v1/services/campaign_bid_modifier_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignBidModifierResult.new
          end
          
          def mutate_campaign_criterion_result
            require "/lib/google/ads/google_ads/v1/services/campaign_criterion_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignCriterionResult.new
          end
          
          def mutate_campaign_shared_set_result
            require "/lib/google/ads/google_ads/v1/services/campaign_shared_set_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCampaignSharedSetResult.new
          end
          
          def mutate_conversion_action_result
            require "/lib/google/ads/google_ads/v1/services/conversion_action_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateConversionActionResult.new
          end
          
          def mutate_customer_extension_setting_result
            require "/lib/google/ads/google_ads/v1/services/customer_extension_setting_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerExtensionSettingResult.new
          end
          
          def mutate_customer_feed_result
            require "/lib/google/ads/google_ads/v1/services/customer_feed_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerFeedResult.new
          end
          
          def mutate_customer_label_result
            require "/lib/google/ads/google_ads/v1/services/customer_label_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerLabelResult.new
          end
          
          def mutate_customer_negative_criteria_result
            require "/lib/google/ads/google_ads/v1/services/customer_negative_criterion_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerNegativeCriteriaResult.new
          end
          
          def mutate_extension_feed_item_result
            require "/lib/google/ads/google_ads/v1/services/extension_feed_item_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateExtensionFeedItemResult.new
          end
          
          def mutate_feed_item_result
            require "/lib/google/ads/google_ads/v1/services/feed_item_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateFeedItemResult.new
          end
          
          def mutate_feed_mapping_result
            require "/lib/google/ads/google_ads/v1/services/feed_mapping_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateFeedMappingResult.new
          end
          
          def mutate_feed_result
            require "/lib/google/ads/google_ads/v1/services/feed_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateFeedResult.new
          end
          
          def mutate_media_file_result
            require "/lib/google/ads/google_ads/v1/services/media_file_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateMediaFileResult.new
          end
          
          def mutate_remarketing_action_result
            require "/lib/google/ads/google_ads/v1/services/remarketing_action_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateRemarketingActionResult.new
          end
          
          def mutate_shared_set_result
            require "/lib/google/ads/google_ads/v1/services/shared_set_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateSharedSetResult.new
          end
          
          def google_ads_row
            require "/lib/google/ads/google_ads/v1/services/google_ads_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::GoogleAdsRow.new
          end
          
          def mutate_job_result
            require "/lib/google/ads/google_ads/v1/services/mutate_job_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateJobResult.new
          end
          
          def mutate_keyword_plan_negative_keyword_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_negative_keyword_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateKeywordPlanNegativeKeywordResult.new
          end
          
          def campaign_budget_parameters
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationOperation::CampaignBudgetParameters.new
          end
          
          def text_ad_parameters
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationOperation::TextAdParameters.new
          end
          
          def keyword_parameters
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationOperation::KeywordParameters.new
          end
          
          def target_cpa_opt_in_parameters
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationOperation::TargetCpaOptInParameters.new
          end
          
          def move_unused_budget_parameters
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationOperation::MoveUnusedBudgetParameters.new
          end
          
          def apply_recommendation_result
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::ApplyRecommendationResult.new
          end
          
          def dismiss_recommendation_result
            require "/lib/google/ads/google_ads/v1/services/recommendation_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::DismissRecommendationResponse::DismissRecommendationResult.new
          end
          
          def keyword_and_url_seed
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_idea_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordAndUrlSeed.new
          end
          
          def keyword_seed
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_idea_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::KeywordSeed.new
          end
          
          def url_seed
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_idea_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::UrlSeed.new
          end
          
          def generate_keyword_idea_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_idea_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::GenerateKeywordIdeaResult.new
          end
          
          def mutate_custom_interest_result
            require "/lib/google/ads/google_ads/v1/services/custom_interest_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomInterestResult.new
          end
          
          def mutate_keyword_plan_ad_group_result
            require "/lib/google/ads/google_ads/v1/services/keyword_plan_ad_group_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateKeywordPlanAdGroupResult.new
          end
          
          def mutate_customer_client_link_result
            require "/lib/google/ads/google_ads/v1/services/customer_client_link_service_pb.rb"
            Google::Ads::GoogleAds::V1::Services::MutateCustomerClientLinkResult.new
          end
          
          def value
            require "/lib/google/ads/google_ads/v1/common/value_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Value.new
          end
          
          def google_ads_failure
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::GoogleAdsFailure.new
          end
          
          def google_ads_error
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::GoogleAdsError.new
          end
          
          def error_code
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::ErrorCode.new
          end
          
          def error_location
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::ErrorLocation.new
          end
          
          def field_path_element
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::ErrorLocation::FieldPathElement.new
          end
          
          def error_details
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::ErrorDetails.new
          end
          
          def policy_violation_details
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::PolicyViolationDetails.new
          end
          
          def policy_finding_details
            require "/lib/google/ads/google_ads/v1/errors/errors_pb.rb"
            Google::Ads::GoogleAds::V1::Errors::PolicyFindingDetails.new
          end
          
        end
      end
    end
  end
end
