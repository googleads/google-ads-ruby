module Google
  module Ads
    module GoogleAds
      def self.resource
        @resource ||= Module.new do
        
          def self.http
            require "google/api/http_pb.rb"
            Google::Api::Http.new
          end
        
          def self.http_rule
            require "google/api/http_pb.rb"
            Google::Api::HttpRule.new
          end
        
          def self.custom_http_pattern
            require "google/api/http_pb.rb"
            Google::Api::CustomHttpPattern.new
          end
        
          def self.double_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::DoubleValue.new
          end
        
          def self.float_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::FloatValue.new
          end
        
          def self.int64_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::Int64Value.new
          end
        
          def self.u_int64_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::UInt64Value.new
          end
        
          def self.int32_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::Int32Value.new
          end
        
          def self.u_int32_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::UInt32Value.new
          end
        
          def self.bool_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::BoolValue.new
          end
        
          def self.string_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::StringValue.new
          end
        
          def self.bytes_value
            require "google/protobuf/wrappers_pb.rb"
            Google::Protobuf::BytesValue.new
          end
        
          def self.policy_violation_key
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyViolationKey.new
          end
        
          def self.policy_validation_parameter
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyValidationParameter.new
          end
        
          def self.policy_topic_entry
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEntry.new
          end
        
          def self.policy_topic_evidence
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence.new
          end
        
          def self.text_list
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::TextList.new
          end
        
          def self.website_list
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::WebsiteList.new
          end
        
          def self.destination_text_list
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::DestinationTextList.new
          end
        
          def self.destination_mismatch
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicEvidence::DestinationMismatch.new
          end
        
          def self.policy_topic_constraint
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint.new
          end
        
          def self.country_constraint_list
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::CountryConstraintList.new
          end
        
          def self.reseller_constraint
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::ResellerConstraint.new
          end
        
          def self.country_constraint
            require "google/ads/google_ads/v1/common/policy_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PolicyTopicConstraint::CountryConstraint.new
          end
        
          def self.ad_text_asset
            require "google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdTextAsset.new
          end
        
          def self.ad_image_asset
            require "google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdImageAsset.new
          end
        
          def self.ad_video_asset
            require "google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdVideoAsset.new
          end
        
          def self.ad_media_bundle_asset
            require "google/ads/google_ads/v1/common/ad_asset_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdMediaBundleAsset.new
          end
        
          def self.text_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextAdInfo.new
          end
        
          def self.expanded_text_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpandedTextAdInfo.new
          end
        
          def self.call_only_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CallOnlyAdInfo.new
          end
        
          def self.expanded_dynamic_search_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpandedDynamicSearchAdInfo.new
          end
        
          def self.hotel_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelAdInfo.new
          end
        
          def self.shopping_smart_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ShoppingSmartAdInfo.new
          end
        
          def self.shopping_product_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ShoppingProductAdInfo.new
          end
        
          def self.gmail_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GmailAdInfo.new
          end
        
          def self.gmail_teaser
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GmailTeaser.new
          end
        
          def self.display_call_to_action
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DisplayCallToAction.new
          end
        
          def self.product_image
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductImage.new
          end
        
          def self.product_video
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductVideo.new
          end
        
          def self.image_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageAdInfo.new
          end
        
          def self.video_bumper_in_stream_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoBumperInStreamAdInfo.new
          end
        
          def self.video_non_skippable_in_stream_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoNonSkippableInStreamAdInfo.new
          end
        
          def self.video_true_view_in_stream_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoTrueViewInStreamAdInfo.new
          end
        
          def self.video_outstream_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoOutstreamAdInfo.new
          end
        
          def self.video_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::VideoAdInfo.new
          end
        
          def self.responsive_search_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ResponsiveSearchAdInfo.new
          end
        
          def self.legacy_responsive_display_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LegacyResponsiveDisplayAdInfo.new
          end
        
          def self.app_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppAdInfo.new
          end
        
          def self.legacy_app_install_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LegacyAppInstallAdInfo.new
          end
        
          def self.responsive_display_ad_info
            require "google/ads/google_ads/v1/common/ad_type_infos_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ResponsiveDisplayAdInfo.new
          end
        
          def self.custom_parameter
            require "google/ads/google_ads/v1/common/custom_parameter_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomParameter.new
          end
        
          def self.url_collection
            require "google/ads/google_ads/v1/common/url_collection_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UrlCollection.new
          end
        
          def self.ad
            require "google/ads/google_ads/v1/resources/ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Ad.new
          end
        
          def self.ad_group_ad
            require "google/ads/google_ads/v1/resources/ad_group_ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAd.new
          end
        
          def self.ad_group_ad_policy_summary
            require "google/ads/google_ads/v1/resources/ad_group_ad_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAdPolicySummary.new
          end
        
          def self.customer_client_link
            require "google/ads/google_ads/v1/resources/customer_client_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerClientLink.new
          end
        
          def self.change_status
            require "google/ads/google_ads/v1/resources/change_status_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ChangeStatus.new
          end
        
          def self.carrier_constant
            require "google/ads/google_ads/v1/resources/carrier_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CarrierConstant.new
          end
        
          def self.customer_manager_link
            require "google/ads/google_ads/v1/resources/customer_manager_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerManagerLink.new
          end
        
          def self.ad_schedule_view
            require "google/ads/google_ads/v1/resources/ad_schedule_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdScheduleView.new
          end
        
          def self.hotel_group_view
            require "google/ads/google_ads/v1/resources/hotel_group_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::HotelGroupView.new
          end
        
          def self.shared_set
            require "google/ads/google_ads/v1/resources/shared_set_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SharedSet.new
          end
        
          def self.merchant_center_link
            require "google/ads/google_ads/v1/resources/merchant_center_link_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MerchantCenterLink.new
          end
        
          def self.shopping_performance_view
            require "google/ads/google_ads/v1/resources/shopping_performance_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ShoppingPerformanceView.new
          end
        
          def self.keyword_plan_ad_group
            require "google/ads/google_ads/v1/resources/keyword_plan_ad_group_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanAdGroup.new
          end
        
          def self.age_range_view
            require "google/ads/google_ads/v1/resources/age_range_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AgeRangeView.new
          end
        
          def self.customer_extension_setting
            require "google/ads/google_ads/v1/resources/customer_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerExtensionSetting.new
          end
        
          def self.managed_placement_view
            require "google/ads/google_ads/v1/resources/managed_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ManagedPlacementView.new
          end
        
          def self.campaign_label
            require "google/ads/google_ads/v1/resources/campaign_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignLabel.new
          end
        
          def self.click_location
            require "google/ads/google_ads/v1/common/click_location_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ClickLocation.new
          end
        
          def self.click_view
            require "google/ads/google_ads/v1/resources/click_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ClickView.new
          end
        
          def self.ad_parameter
            require "google/ads/google_ads/v1/resources/ad_parameter_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdParameter.new
          end
        
          def self.custom_interest
            require "google/ads/google_ads/v1/resources/custom_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomInterest.new
          end
        
          def self.custom_interest_member
            require "google/ads/google_ads/v1/resources/custom_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomInterestMember.new
          end
        
          def self.location_view
            require "google/ads/google_ads/v1/resources/location_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::LocationView.new
          end
        
          def self.youtube_video_asset
            require "google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YoutubeVideoAsset.new
          end
        
          def self.media_bundle_asset
            require "google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MediaBundleAsset.new
          end
        
          def self.image_asset
            require "google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageAsset.new
          end
        
          def self.image_dimension
            require "google/ads/google_ads/v1/common/asset_types_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ImageDimension.new
          end
        
          def self.asset
            require "google/ads/google_ads/v1/resources/asset_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Asset.new
          end
        
          def self.parental_status_view
            require "google/ads/google_ads/v1/resources/parental_status_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ParentalStatusView.new
          end
        
          def self.domain_category
            require "google/ads/google_ads/v1/resources/domain_category_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DomainCategory.new
          end
        
          def self.video
            require "google/ads/google_ads/v1/resources/video_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Video.new
          end
        
          def self.feed
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed.new
          end
        
          def self.places_location_feed_data
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::PlacesLocationFeedData.new
          end
        
          def self.o_auth_info
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::PlacesLocationFeedData::OAuthInfo.new
          end
        
          def self.affiliate_location_feed_data
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Feed::AffiliateLocationFeedData.new
          end
        
          def self.feed_attribute
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedAttribute.new
          end
        
          def self.feed_attribute_operation
            require "google/ads/google_ads/v1/resources/feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedAttributeOperation.new
          end
        
          def self.keyword_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::KeywordInfo.new
          end
        
          def self.placement_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PlacementInfo.new
          end
        
          def self.mobile_app_category_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileAppCategoryInfo.new
          end
        
          def self.mobile_application_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileApplicationInfo.new
          end
        
          def self.location_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LocationInfo.new
          end
        
          def self.device_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DeviceInfo.new
          end
        
          def self.preferred_content_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PreferredContentInfo.new
          end
        
          def self.listing_group_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingGroupInfo.new
          end
        
          def self.listing_scope_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingScopeInfo.new
          end
        
          def self.listing_dimension_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingDimensionInfo.new
          end
        
          def self.listing_brand_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingBrandInfo.new
          end
        
          def self.hotel_id_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelIdInfo.new
          end
        
          def self.hotel_class_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelClassInfo.new
          end
        
          def self.hotel_country_region_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCountryRegionInfo.new
          end
        
          def self.hotel_state_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelStateInfo.new
          end
        
          def self.hotel_city_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCityInfo.new
          end
        
          def self.listing_custom_attribute_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ListingCustomAttributeInfo.new
          end
        
          def self.product_bidding_category_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductBiddingCategoryInfo.new
          end
        
          def self.product_channel_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductChannelInfo.new
          end
        
          def self.product_channel_exclusivity_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductChannelExclusivityInfo.new
          end
        
          def self.product_condition_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductConditionInfo.new
          end
        
          def self.product_item_id_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductItemIdInfo.new
          end
        
          def self.product_type_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProductTypeInfo.new
          end
        
          def self.unknown_listing_dimension_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UnknownListingDimensionInfo.new
          end
        
          def self.hotel_date_selection_type_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelDateSelectionTypeInfo.new
          end
        
          def self.hotel_advance_booking_window_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelAdvanceBookingWindowInfo.new
          end
        
          def self.hotel_length_of_stay_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelLengthOfStayInfo.new
          end
        
          def self.hotel_check_in_day_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::HotelCheckInDayInfo.new
          end
        
          def self.interaction_type_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::InteractionTypeInfo.new
          end
        
          def self.ad_schedule_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AdScheduleInfo.new
          end
        
          def self.age_range_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AgeRangeInfo.new
          end
        
          def self.gender_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GenderInfo.new
          end
        
          def self.income_range_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::IncomeRangeInfo.new
          end
        
          def self.parental_status_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ParentalStatusInfo.new
          end
        
          def self.you_tube_video_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YouTubeVideoInfo.new
          end
        
          def self.you_tube_channel_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::YouTubeChannelInfo.new
          end
        
          def self.user_list_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListInfo.new
          end
        
          def self.proximity_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ProximityInfo.new
          end
        
          def self.geo_point_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::GeoPointInfo.new
          end
        
          def self.address_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AddressInfo.new
          end
        
          def self.topic_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TopicInfo.new
          end
        
          def self.language_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LanguageInfo.new
          end
        
          def self.ip_block_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::IpBlockInfo.new
          end
        
          def self.content_label_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ContentLabelInfo.new
          end
        
          def self.carrier_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CarrierInfo.new
          end
        
          def self.user_interest_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserInterestInfo.new
          end
        
          def self.webpage_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::WebpageInfo.new
          end
        
          def self.webpage_condition_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::WebpageConditionInfo.new
          end
        
          def self.operating_system_version_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::OperatingSystemVersionInfo.new
          end
        
          def self.app_payment_model_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppPaymentModelInfo.new
          end
        
          def self.mobile_device_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MobileDeviceInfo.new
          end
        
          def self.custom_affinity_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomAffinityInfo.new
          end
        
          def self.custom_intent_info
            require "google/ads/google_ads/v1/common/criteria_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CustomIntentInfo.new
          end
        
          def self.recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation.new
          end
        
          def self.recommendation_impact
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::RecommendationImpact.new
          end
        
          def self.recommendation_metrics
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::RecommendationMetrics.new
          end
        
          def self.campaign_budget_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::CampaignBudgetRecommendation.new
          end
        
          def self.campaign_budget_recommendation_option
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::CampaignBudgetRecommendation::CampaignBudgetRecommendationOption.new
          end
        
          def self.keyword_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::KeywordRecommendation.new
          end
        
          def self.text_ad_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TextAdRecommendation.new
          end
        
          def self.optimize_ad_rotation_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::OptimizeAdRotationRecommendation.new
          end
        
          def self.target_cpa_opt_in_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TargetCpaOptInRecommendation.new
          end
        
          def self.target_cpa_opt_in_recommendation_option
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::TargetCpaOptInRecommendation::TargetCpaOptInRecommendationOption.new
          end
        
          def self.maximize_conversions_opt_in_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MaximizeConversionsOptInRecommendation.new
          end
        
          def self.enhanced_cpc_opt_in_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::EnhancedCpcOptInRecommendation.new
          end
        
          def self.search_partners_opt_in_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::SearchPartnersOptInRecommendation.new
          end
        
          def self.maximize_clicks_opt_in_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MaximizeClicksOptInRecommendation.new
          end
        
          def self.keyword_match_type_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::KeywordMatchTypeRecommendation.new
          end
        
          def self.move_unused_budget_recommendation
            require "google/ads/google_ads/v1/resources/recommendation_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Recommendation::MoveUnusedBudgetRecommendation.new
          end
        
          def self.money
            require "google/ads/google_ads/v1/common/feed_common_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Money.new
          end
        
          def self.feed_item
            require "google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItem.new
          end
        
          def self.feed_item_attribute_value
            require "google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemAttributeValue.new
          end
        
          def self.feed_item_placeholder_policy_info
            require "google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemPlaceholderPolicyInfo.new
          end
        
          def self.feed_item_validation_error
            require "google/ads/google_ads/v1/resources/feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemValidationError.new
          end
        
          def self.app_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::AppFeedItem.new
          end
        
          def self.call_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CallFeedItem.new
          end
        
          def self.callout_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CalloutFeedItem.new
          end
        
          def self.text_message_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextMessageFeedItem.new
          end
        
          def self.price_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PriceFeedItem.new
          end
        
          def self.price_offer
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PriceOffer.new
          end
        
          def self.promotion_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PromotionFeedItem.new
          end
        
          def self.structured_snippet_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::StructuredSnippetFeedItem.new
          end
        
          def self.sitelink_feed_item
            require "google/ads/google_ads/v1/common/extensions_pb.rb"
            Google::Ads::GoogleAds::V1::Common::SitelinkFeedItem.new
          end
        
          def self.extension_feed_item
            require "google/ads/google_ads/v1/resources/extension_feed_item_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ExtensionFeedItem.new
          end
        
          def self.account_budget_proposal
            require "google/ads/google_ads/v1/resources/account_budget_proposal_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudgetProposal.new
          end
        
          def self.geo_target_constant
            require "google/ads/google_ads/v1/resources/geo_target_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GeoTargetConstant.new
          end
        
          def self.ad_group_extension_setting
            require "google/ads/google_ads/v1/resources/ad_group_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupExtensionSetting.new
          end
        
          def self.matching_function
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MatchingFunction.new
          end
        
          def self.operand
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand.new
          end
        
          def self.constant_operand
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::ConstantOperand.new
          end
        
          def self.feed_attribute_operand
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::FeedAttributeOperand.new
          end
        
          def self.function_operand
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::FunctionOperand.new
          end
        
          def self.request_context_operand
            require "google/ads/google_ads/v1/common/matching_function_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Operand::RequestContextOperand.new
          end
        
          def self.campaign_feed
            require "google/ads/google_ads/v1/resources/campaign_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignFeed.new
          end
        
          def self.criterion_category_availability
            require "google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryAvailability.new
          end
        
          def self.criterion_category_channel_availability
            require "google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryChannelAvailability.new
          end
        
          def self.criterion_category_locale_availability
            require "google/ads/google_ads/v1/common/criterion_category_availability_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CriterionCategoryLocaleAvailability.new
          end
        
          def self.user_interest
            require "google/ads/google_ads/v1/resources/user_interest_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::UserInterest.new
          end
        
          def self.keyword_plan_keyword
            require "google/ads/google_ads/v1/resources/keyword_plan_keyword_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanKeyword.new
          end
        
          def self.hotel_performance_view
            require "google/ads/google_ads/v1/resources/hotel_performance_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::HotelPerformanceView.new
          end
        
          def self.product_group_view
            require "google/ads/google_ads/v1/resources/product_group_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ProductGroupView.new
          end
        
          def self.payments_account
            require "google/ads/google_ads/v1/resources/payments_account_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::PaymentsAccount.new
          end
        
          def self.keyword_view
            require "google/ads/google_ads/v1/resources/keyword_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordView.new
          end
        
          def self.mobile_app_category_constant
            require "google/ads/google_ads/v1/resources/mobile_app_category_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MobileAppCategoryConstant.new
          end
        
          def self.mutate_job
            require "google/ads/google_ads/v1/resources/mutate_job_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MutateJob.new
          end
        
          def self.mutate_job_metadata
            require "google/ads/google_ads/v1/resources/mutate_job_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MutateJob::MutateJobMetadata.new
          end
        
          def self.ad_group_audience_view
            require "google/ads/google_ads/v1/resources/ad_group_audience_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAudienceView.new
          end
        
          def self.keyword_plan_campaign
            require "google/ads/google_ads/v1/resources/keyword_plan_campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanCampaign.new
          end
        
          def self.keyword_plan_geo_target
            require "google/ads/google_ads/v1/resources/keyword_plan_campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanGeoTarget.new
          end
        
          def self.geographic_view
            require "google/ads/google_ads/v1/resources/geographic_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GeographicView.new
          end
        
          def self.account_budget
            require "google/ads/google_ads/v1/resources/account_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudget.new
          end
        
          def self.pending_account_budget_proposal
            require "google/ads/google_ads/v1/resources/account_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AccountBudget::PendingAccountBudgetProposal.new
          end
        
          def self.tag_snippet
            require "google/ads/google_ads/v1/common/tag_snippet_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TagSnippet.new
          end
        
          def self.conversion_action
            require "google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction.new
          end
        
          def self.attribution_model_settings
            require "google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction::AttributionModelSettings.new
          end
        
          def self.value_settings
            require "google/ads/google_ads/v1/resources/conversion_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionAction::ValueSettings.new
          end
        
          def self.date_range
            require "google/ads/google_ads/v1/common/dates_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DateRange.new
          end
        
          def self.keyword_plan
            require "google/ads/google_ads/v1/resources/keyword_plan_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlan.new
          end
        
          def self.keyword_plan_forecast_period
            require "google/ads/google_ads/v1/resources/keyword_plan_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanForecastPeriod.new
          end
        
          def self.keyword_plan_negative_keyword
            require "google/ads/google_ads/v1/resources/keyword_plan_negative_keyword_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::KeywordPlanNegativeKeyword.new
          end
        
          def self.commission
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::Commission.new
          end
        
          def self.enhanced_cpc
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::EnhancedCpc.new
          end
        
          def self.manual_cpc
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpc.new
          end
        
          def self.manual_cpm
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpm.new
          end
        
          def self.manual_cpv
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ManualCpv.new
          end
        
          def self.maximize_conversions
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MaximizeConversions.new
          end
        
          def self.maximize_conversion_value
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::MaximizeConversionValue.new
          end
        
          def self.page_one_promoted
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PageOnePromoted.new
          end
        
          def self.target_cpa
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetCpa.new
          end
        
          def self.target_cpm
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetCpm.new
          end
        
          def self.target_impression_share
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetImpressionShare.new
          end
        
          def self.target_outrank_share
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetOutrankShare.new
          end
        
          def self.target_roas
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetRoas.new
          end
        
          def self.target_spend
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetSpend.new
          end
        
          def self.percent_cpc
            require "google/ads/google_ads/v1/common/bidding_pb.rb"
            Google::Ads::GoogleAds::V1::Common::PercentCpc.new
          end
        
          def self.frequency_cap_entry
            require "google/ads/google_ads/v1/common/frequency_cap_pb.rb"
            Google::Ads::GoogleAds::V1::Common::FrequencyCapEntry.new
          end
        
          def self.frequency_cap_key
            require "google/ads/google_ads/v1/common/frequency_cap_pb.rb"
            Google::Ads::GoogleAds::V1::Common::FrequencyCapKey.new
          end
        
          def self.real_time_bidding_setting
            require "google/ads/google_ads/v1/common/real_time_bidding_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::RealTimeBiddingSetting.new
          end
        
          def self.targeting_setting
            require "google/ads/google_ads/v1/common/targeting_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetingSetting.new
          end
        
          def self.target_restriction
            require "google/ads/google_ads/v1/common/targeting_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TargetRestriction.new
          end
        
          def self.campaign
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign.new
          end
        
          def self.network_settings
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::NetworkSettings.new
          end
        
          def self.hotel_setting_info
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::HotelSettingInfo.new
          end
        
          def self.vanity_pharma
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::VanityPharma.new
          end
        
          def self.dynamic_search_ads_setting
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::DynamicSearchAdsSetting.new
          end
        
          def self.selective_optimization
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::SelectiveOptimization.new
          end
        
          def self.shopping_setting
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::ShoppingSetting.new
          end
        
          def self.tracking_setting
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::TrackingSetting.new
          end
        
          def self.geo_target_type_setting
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::GeoTargetTypeSetting.new
          end
        
          def self.app_campaign_setting
            require "google/ads/google_ads/v1/resources/campaign_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Campaign::AppCampaignSetting.new
          end
        
          def self.display_keyword_view
            require "google/ads/google_ads/v1/resources/display_keyword_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DisplayKeywordView.new
          end
        
          def self.product_bidding_category_constant
            require "google/ads/google_ads/v1/resources/product_bidding_category_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ProductBiddingCategoryConstant.new
          end
        
          def self.operating_system_version_constant
            require "google/ads/google_ads/v1/resources/operating_system_version_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::OperatingSystemVersionConstant.new
          end
        
          def self.feed_mapping
            require "google/ads/google_ads/v1/resources/feed_mapping_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedMapping.new
          end
        
          def self.attribute_field_mapping
            require "google/ads/google_ads/v1/resources/feed_mapping_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AttributeFieldMapping.new
          end
        
          def self.mobile_device_constant
            require "google/ads/google_ads/v1/resources/mobile_device_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MobileDeviceConstant.new
          end
        
          def self.media_file
            require "google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaFile.new
          end
        
          def self.media_image
            require "google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaImage.new
          end
        
          def self.media_bundle
            require "google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaBundle.new
          end
        
          def self.media_audio
            require "google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaAudio.new
          end
        
          def self.media_video
            require "google/ads/google_ads/v1/resources/media_file_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::MediaVideo.new
          end
        
          def self.google_ads_field
            require "google/ads/google_ads/v1/resources/google_ads_field_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GoogleAdsField.new
          end
        
          def self.ad_group_criterion
            require "google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion.new
          end
        
          def self.quality_info
            require "google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion::QualityInfo.new
          end
        
          def self.position_estimates
            require "google/ads/google_ads/v1/resources/ad_group_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterion::PositionEstimates.new
          end
        
          def self.campaign_bid_modifier
            require "google/ads/google_ads/v1/resources/campaign_bid_modifier_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignBidModifier.new
          end
        
          def self.ad_group_label
            require "google/ads/google_ads/v1/resources/ad_group_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupLabel.new
          end
        
          def self.billing_setup
            require "google/ads/google_ads/v1/resources/billing_setup_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BillingSetup.new
          end
        
          def self.payments_account_info
            require "google/ads/google_ads/v1/resources/billing_setup_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BillingSetup::PaymentsAccountInfo.new
          end
        
          def self.customer_negative_criterion
            require "google/ads/google_ads/v1/resources/customer_negative_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerNegativeCriterion.new
          end
        
          def self.search_term_view
            require "google/ads/google_ads/v1/resources/search_term_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SearchTermView.new
          end
        
          def self.dynamic_search_ads_search_term_view
            require "google/ads/google_ads/v1/resources/dynamic_search_ads_search_term_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DynamicSearchAdsSearchTermView.new
          end
        
          def self.customer
            require "google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Customer.new
          end
        
          def self.call_reporting_setting
            require "google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CallReportingSetting.new
          end
        
          def self.conversion_tracking_setting
            require "google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::ConversionTrackingSetting.new
          end
        
          def self.remarketing_setting
            require "google/ads/google_ads/v1/resources/customer_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::RemarketingSetting.new
          end
        
          def self.customer_feed
            require "google/ads/google_ads/v1/resources/customer_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerFeed.new
          end
        
          def self.shared_criterion
            require "google/ads/google_ads/v1/resources/shared_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::SharedCriterion.new
          end
        
          def self.ad_group_criterion_label
            require "google/ads/google_ads/v1/resources/ad_group_criterion_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupCriterionLabel.new
          end
        
          def self.customer_label
            require "google/ads/google_ads/v1/resources/customer_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerLabel.new
          end
        
          def self.detail_placement_view
            require "google/ads/google_ads/v1/resources/detail_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::DetailPlacementView.new
          end
        
          def self.gender_view
            require "google/ads/google_ads/v1/resources/gender_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GenderView.new
          end
        
          def self.bidding_strategy
            require "google/ads/google_ads/v1/resources/bidding_strategy_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::BiddingStrategy.new
          end
        
          def self.remarketing_action
            require "google/ads/google_ads/v1/resources/remarketing_action_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::RemarketingAction.new
          end
        
          def self.campaign_shared_set
            require "google/ads/google_ads/v1/resources/campaign_shared_set_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignSharedSet.new
          end
        
          def self.topic_view
            require "google/ads/google_ads/v1/resources/topic_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::TopicView.new
          end
        
          def self.campaign_criterion
            require "google/ads/google_ads/v1/resources/campaign_criterion_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignCriterion.new
          end
        
          def self.feed_placeholder_view
            require "google/ads/google_ads/v1/resources/feed_placeholder_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedPlaceholderView.new
          end
        
          def self.similar_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::SimilarUserListInfo.new
          end
        
          def self.crm_based_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CrmBasedUserListInfo.new
          end
        
          def self.user_list_rule_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleInfo.new
          end
        
          def self.user_list_rule_item_group_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleItemGroupInfo.new
          end
        
          def self.user_list_rule_item_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListRuleItemInfo.new
          end
        
          def self.user_list_date_rule_item_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListDateRuleItemInfo.new
          end
        
          def self.user_list_number_rule_item_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListNumberRuleItemInfo.new
          end
        
          def self.user_list_string_rule_item_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListStringRuleItemInfo.new
          end
        
          def self.combined_rule_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::CombinedRuleUserListInfo.new
          end
        
          def self.date_specific_rule_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::DateSpecificRuleUserListInfo.new
          end
        
          def self.expression_rule_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExpressionRuleUserListInfo.new
          end
        
          def self.rule_based_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::RuleBasedUserListInfo.new
          end
        
          def self.logical_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LogicalUserListInfo.new
          end
        
          def self.user_list_logical_rule_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListLogicalRuleInfo.new
          end
        
          def self.logical_user_list_operand_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::LogicalUserListOperandInfo.new
          end
        
          def self.basic_user_list_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::BasicUserListInfo.new
          end
        
          def self.user_list_action_info
            require "google/ads/google_ads/v1/common/user_lists_pb.rb"
            Google::Ads::GoogleAds::V1::Common::UserListActionInfo.new
          end
        
          def self.user_list
            require "google/ads/google_ads/v1/resources/user_list_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::UserList.new
          end
        
          def self.group_placement_view
            require "google/ads/google_ads/v1/resources/group_placement_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::GroupPlacementView.new
          end
        
          def self.ad_group_feed
            require "google/ads/google_ads/v1/resources/ad_group_feed_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupFeed.new
          end
        
          def self.topic_constant
            require "google/ads/google_ads/v1/resources/topic_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::TopicConstant.new
          end
        
          def self.explorer_auto_optimizer_setting
            require "google/ads/google_ads/v1/common/explorer_auto_optimizer_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Common::ExplorerAutoOptimizerSetting.new
          end
        
          def self.ad_group
            require "google/ads/google_ads/v1/resources/ad_group_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroup.new
          end
        
          def self.ad_group_bid_modifier
            require "google/ads/google_ads/v1/resources/ad_group_bid_modifier_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupBidModifier.new
          end
        
          def self.customer_client
            require "google/ads/google_ads/v1/resources/customer_client_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CustomerClient.new
          end
        
          def self.text_label
            require "google/ads/google_ads/v1/common/text_label_pb.rb"
            Google::Ads::GoogleAds::V1::Common::TextLabel.new
          end
        
          def self.label
            require "google/ads/google_ads/v1/resources/label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::Label.new
          end
        
          def self.campaign_budget
            require "google/ads/google_ads/v1/resources/campaign_budget_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignBudget.new
          end
        
          def self.language_constant
            require "google/ads/google_ads/v1/resources/language_constant_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::LanguageConstant.new
          end
        
          def self.campaign_audience_view
            require "google/ads/google_ads/v1/resources/campaign_audience_view_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignAudienceView.new
          end
        
          def self.campaign_extension_setting
            require "google/ads/google_ads/v1/resources/campaign_extension_setting_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::CampaignExtensionSetting.new
          end
        
          def self.ad_group_ad_label
            require "google/ads/google_ads/v1/resources/ad_group_ad_label_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::AdGroupAdLabel.new
          end
        
          def self.feed_item_target
            require "google/ads/google_ads/v1/resources/feed_item_target_pb.rb"
            Google::Ads::GoogleAds::V1::Resources::FeedItemTarget.new
          end
        
        end
      end
    end
  end
end
