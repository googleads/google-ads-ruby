# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/common/asset_types.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/common/criteria_pb'
require 'google/ads/google_ads/v12/common/feed_common_pb'
require 'google/ads/google_ads/v12/enums/call_conversion_reporting_state_pb'
require 'google/ads/google_ads/v12/enums/call_to_action_type_pb'
require 'google/ads/google_ads/v12/enums/lead_form_call_to_action_type_pb'
require 'google/ads/google_ads/v12/enums/lead_form_desired_intent_pb'
require 'google/ads/google_ads/v12/enums/lead_form_field_user_input_type_pb'
require 'google/ads/google_ads/v12/enums/lead_form_post_submit_call_to_action_type_pb'
require 'google/ads/google_ads/v12/enums/location_ownership_type_pb'
require 'google/ads/google_ads/v12/enums/mime_type_pb'
require 'google/ads/google_ads/v12/enums/mobile_app_vendor_pb'
require 'google/ads/google_ads/v12/enums/price_extension_price_qualifier_pb'
require 'google/ads/google_ads/v12/enums/price_extension_price_unit_pb'
require 'google/ads/google_ads/v12/enums/price_extension_type_pb'
require 'google/ads/google_ads/v12/enums/promotion_extension_discount_modifier_pb'
require 'google/ads/google_ads/v12/enums/promotion_extension_occasion_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/common/asset_types.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.common.YoutubeVideoAsset" do
      proto3_optional :youtube_video_id, :string, 2
      optional :youtube_video_title, :string, 3
    end
    add_message "google.ads.googleads.v12.common.MediaBundleAsset" do
      proto3_optional :data, :bytes, 2
    end
    add_message "google.ads.googleads.v12.common.ImageAsset" do
      proto3_optional :data, :bytes, 5
      proto3_optional :file_size, :int64, 6
      optional :mime_type, :enum, 3, "google.ads.googleads.v12.enums.MimeTypeEnum.MimeType"
      optional :full_size, :message, 4, "google.ads.googleads.v12.common.ImageDimension"
    end
    add_message "google.ads.googleads.v12.common.ImageDimension" do
      proto3_optional :height_pixels, :int64, 4
      proto3_optional :width_pixels, :int64, 5
      proto3_optional :url, :string, 6
    end
    add_message "google.ads.googleads.v12.common.TextAsset" do
      proto3_optional :text, :string, 2
    end
    add_message "google.ads.googleads.v12.common.LeadFormAsset" do
      optional :business_name, :string, 10
      optional :call_to_action_type, :enum, 17, "google.ads.googleads.v12.enums.LeadFormCallToActionTypeEnum.LeadFormCallToActionType"
      optional :call_to_action_description, :string, 18
      optional :headline, :string, 12
      optional :description, :string, 13
      optional :privacy_policy_url, :string, 14
      proto3_optional :post_submit_headline, :string, 15
      proto3_optional :post_submit_description, :string, 16
      repeated :fields, :message, 8, "google.ads.googleads.v12.common.LeadFormField"
      repeated :custom_question_fields, :message, 23, "google.ads.googleads.v12.common.LeadFormCustomQuestionField"
      repeated :delivery_methods, :message, 9, "google.ads.googleads.v12.common.LeadFormDeliveryMethod"
      optional :post_submit_call_to_action_type, :enum, 19, "google.ads.googleads.v12.enums.LeadFormPostSubmitCallToActionTypeEnum.LeadFormPostSubmitCallToActionType"
      proto3_optional :background_image_asset, :string, 20
      optional :desired_intent, :enum, 21, "google.ads.googleads.v12.enums.LeadFormDesiredIntentEnum.LeadFormDesiredIntent"
      proto3_optional :custom_disclosure, :string, 22
    end
    add_message "google.ads.googleads.v12.common.LeadFormField" do
      optional :input_type, :enum, 1, "google.ads.googleads.v12.enums.LeadFormFieldUserInputTypeEnum.LeadFormFieldUserInputType"
      oneof :answers do
        optional :single_choice_answers, :message, 2, "google.ads.googleads.v12.common.LeadFormSingleChoiceAnswers"
      end
    end
    add_message "google.ads.googleads.v12.common.LeadFormCustomQuestionField" do
      optional :custom_question_text, :string, 1
      oneof :answers do
        optional :single_choice_answers, :message, 2, "google.ads.googleads.v12.common.LeadFormSingleChoiceAnswers"
      end
    end
    add_message "google.ads.googleads.v12.common.LeadFormSingleChoiceAnswers" do
      repeated :answers, :string, 1
    end
    add_message "google.ads.googleads.v12.common.LeadFormDeliveryMethod" do
      oneof :delivery_details do
        optional :webhook, :message, 1, "google.ads.googleads.v12.common.WebhookDelivery"
      end
    end
    add_message "google.ads.googleads.v12.common.WebhookDelivery" do
      proto3_optional :advertiser_webhook_url, :string, 4
      proto3_optional :google_secret, :string, 5
      proto3_optional :payload_schema_version, :int64, 6
    end
    add_message "google.ads.googleads.v12.common.BookOnGoogleAsset" do
    end
    add_message "google.ads.googleads.v12.common.PromotionAsset" do
      optional :promotion_target, :string, 1
      optional :discount_modifier, :enum, 2, "google.ads.googleads.v12.enums.PromotionExtensionDiscountModifierEnum.PromotionExtensionDiscountModifier"
      optional :redemption_start_date, :string, 7
      optional :redemption_end_date, :string, 8
      optional :occasion, :enum, 9, "google.ads.googleads.v12.enums.PromotionExtensionOccasionEnum.PromotionExtensionOccasion"
      optional :language_code, :string, 10
      optional :start_date, :string, 11
      optional :end_date, :string, 12
      repeated :ad_schedule_targets, :message, 13, "google.ads.googleads.v12.common.AdScheduleInfo"
      oneof :discount_type do
        optional :percent_off, :int64, 3
        optional :money_amount_off, :message, 4, "google.ads.googleads.v12.common.Money"
      end
      oneof :promotion_trigger do
        optional :promotion_code, :string, 5
        optional :orders_over_amount, :message, 6, "google.ads.googleads.v12.common.Money"
      end
    end
    add_message "google.ads.googleads.v12.common.CalloutAsset" do
      optional :callout_text, :string, 1
      optional :start_date, :string, 2
      optional :end_date, :string, 3
      repeated :ad_schedule_targets, :message, 4, "google.ads.googleads.v12.common.AdScheduleInfo"
    end
    add_message "google.ads.googleads.v12.common.StructuredSnippetAsset" do
      optional :header, :string, 1
      repeated :values, :string, 2
    end
    add_message "google.ads.googleads.v12.common.SitelinkAsset" do
      optional :link_text, :string, 1
      optional :description1, :string, 2
      optional :description2, :string, 3
      optional :start_date, :string, 4
      optional :end_date, :string, 5
      repeated :ad_schedule_targets, :message, 6, "google.ads.googleads.v12.common.AdScheduleInfo"
    end
    add_message "google.ads.googleads.v12.common.PageFeedAsset" do
      optional :page_url, :string, 1
      repeated :labels, :string, 2
    end
    add_message "google.ads.googleads.v12.common.DynamicEducationAsset" do
      optional :program_id, :string, 1
      optional :location_id, :string, 2
      optional :program_name, :string, 3
      optional :subject, :string, 4
      optional :program_description, :string, 5
      optional :school_name, :string, 6
      optional :address, :string, 7
      repeated :contextual_keywords, :string, 8
      optional :android_app_link, :string, 9
      repeated :similar_program_ids, :string, 10
      optional :ios_app_link, :string, 11
      optional :ios_app_store_id, :int64, 12
      optional :thumbnail_image_url, :string, 13
      optional :image_url, :string, 14
    end
    add_message "google.ads.googleads.v12.common.MobileAppAsset" do
      optional :app_id, :string, 1
      optional :app_store, :enum, 2, "google.ads.googleads.v12.enums.MobileAppVendorEnum.MobileAppVendor"
      optional :link_text, :string, 3
      optional :start_date, :string, 4
      optional :end_date, :string, 5
    end
    add_message "google.ads.googleads.v12.common.HotelCalloutAsset" do
      optional :text, :string, 1
      optional :language_code, :string, 2
    end
    add_message "google.ads.googleads.v12.common.CallAsset" do
      optional :country_code, :string, 1
      optional :phone_number, :string, 2
      optional :call_conversion_reporting_state, :enum, 3, "google.ads.googleads.v12.enums.CallConversionReportingStateEnum.CallConversionReportingState"
      optional :call_conversion_action, :string, 4
      repeated :ad_schedule_targets, :message, 5, "google.ads.googleads.v12.common.AdScheduleInfo"
    end
    add_message "google.ads.googleads.v12.common.PriceAsset" do
      optional :type, :enum, 1, "google.ads.googleads.v12.enums.PriceExtensionTypeEnum.PriceExtensionType"
      optional :price_qualifier, :enum, 2, "google.ads.googleads.v12.enums.PriceExtensionPriceQualifierEnum.PriceExtensionPriceQualifier"
      optional :language_code, :string, 3
      repeated :price_offerings, :message, 4, "google.ads.googleads.v12.common.PriceOffering"
    end
    add_message "google.ads.googleads.v12.common.PriceOffering" do
      optional :header, :string, 1
      optional :description, :string, 2
      optional :price, :message, 3, "google.ads.googleads.v12.common.Money"
      optional :unit, :enum, 4, "google.ads.googleads.v12.enums.PriceExtensionPriceUnitEnum.PriceExtensionPriceUnit"
      optional :final_url, :string, 5
      optional :final_mobile_url, :string, 6
    end
    add_message "google.ads.googleads.v12.common.CallToActionAsset" do
      optional :call_to_action, :enum, 1, "google.ads.googleads.v12.enums.CallToActionTypeEnum.CallToActionType"
    end
    add_message "google.ads.googleads.v12.common.DynamicRealEstateAsset" do
      optional :listing_id, :string, 1
      optional :listing_name, :string, 2
      optional :city_name, :string, 3
      optional :description, :string, 4
      optional :address, :string, 5
      optional :price, :string, 6
      optional :image_url, :string, 7
      optional :property_type, :string, 8
      optional :listing_type, :string, 9
      repeated :contextual_keywords, :string, 10
      optional :formatted_price, :string, 11
      optional :android_app_link, :string, 12
      optional :ios_app_link, :string, 13
      optional :ios_app_store_id, :int64, 14
      repeated :similar_listing_ids, :string, 15
    end
    add_message "google.ads.googleads.v12.common.DynamicCustomAsset" do
      optional :id, :string, 1
      optional :id2, :string, 2
      optional :item_title, :string, 3
      optional :item_subtitle, :string, 4
      optional :item_description, :string, 5
      optional :item_address, :string, 6
      optional :item_category, :string, 7
      optional :price, :string, 8
      optional :sale_price, :string, 9
      optional :formatted_price, :string, 10
      optional :formatted_sale_price, :string, 11
      optional :image_url, :string, 12
      repeated :contextual_keywords, :string, 13
      optional :android_app_link, :string, 14
      optional :ios_app_link, :string, 16
      optional :ios_app_store_id, :int64, 17
      repeated :similar_ids, :string, 15
    end
    add_message "google.ads.googleads.v12.common.DynamicHotelsAndRentalsAsset" do
      optional :property_id, :string, 1
      optional :property_name, :string, 2
      optional :image_url, :string, 3
      optional :destination_name, :string, 4
      optional :description, :string, 5
      optional :price, :string, 6
      optional :sale_price, :string, 7
      optional :star_rating, :int64, 8
      optional :category, :string, 9
      repeated :contextual_keywords, :string, 10
      optional :address, :string, 11
      optional :android_app_link, :string, 12
      optional :ios_app_link, :string, 13
      optional :ios_app_store_id, :int64, 14
      optional :formatted_price, :string, 15
      optional :formatted_sale_price, :string, 16
      repeated :similar_property_ids, :string, 17
    end
    add_message "google.ads.googleads.v12.common.DynamicFlightsAsset" do
      optional :destination_id, :string, 1
      optional :origin_id, :string, 2
      optional :flight_description, :string, 3
      optional :image_url, :string, 4
      optional :destination_name, :string, 5
      optional :origin_name, :string, 6
      optional :flight_price, :string, 7
      optional :flight_sale_price, :string, 8
      optional :formatted_price, :string, 9
      optional :formatted_sale_price, :string, 10
      optional :android_app_link, :string, 11
      optional :ios_app_link, :string, 12
      optional :ios_app_store_id, :int64, 13
      repeated :similar_destination_ids, :string, 14
      optional :custom_mapping, :string, 15
    end
    add_message "google.ads.googleads.v12.common.DiscoveryCarouselCardAsset" do
      optional :marketing_image_asset, :string, 1
      optional :square_marketing_image_asset, :string, 2
      optional :portrait_marketing_image_asset, :string, 3
      optional :headline, :string, 4
      optional :call_to_action_text, :string, 5
    end
    add_message "google.ads.googleads.v12.common.DynamicTravelAsset" do
      optional :destination_id, :string, 1
      optional :origin_id, :string, 2
      optional :title, :string, 3
      optional :destination_name, :string, 4
      optional :destination_address, :string, 5
      optional :origin_name, :string, 6
      optional :price, :string, 7
      optional :sale_price, :string, 8
      optional :formatted_price, :string, 9
      optional :formatted_sale_price, :string, 10
      optional :category, :string, 11
      repeated :contextual_keywords, :string, 12
      repeated :similar_destination_ids, :string, 13
      optional :image_url, :string, 14
      optional :android_app_link, :string, 15
      optional :ios_app_link, :string, 16
      optional :ios_app_store_id, :int64, 17
    end
    add_message "google.ads.googleads.v12.common.DynamicLocalAsset" do
      optional :deal_id, :string, 1
      optional :deal_name, :string, 2
      optional :subtitle, :string, 3
      optional :description, :string, 4
      optional :price, :string, 5
      optional :sale_price, :string, 6
      optional :image_url, :string, 7
      optional :address, :string, 8
      optional :category, :string, 9
      repeated :contextual_keywords, :string, 10
      optional :formatted_price, :string, 11
      optional :formatted_sale_price, :string, 12
      optional :android_app_link, :string, 13
      repeated :similar_deal_ids, :string, 14
      optional :ios_app_link, :string, 15
      optional :ios_app_store_id, :int64, 16
    end
    add_message "google.ads.googleads.v12.common.DynamicJobsAsset" do
      optional :job_id, :string, 1
      optional :location_id, :string, 2
      optional :job_title, :string, 3
      optional :job_subtitle, :string, 4
      optional :description, :string, 5
      optional :image_url, :string, 6
      optional :job_category, :string, 7
      repeated :contextual_keywords, :string, 8
      optional :address, :string, 9
      optional :salary, :string, 10
      optional :android_app_link, :string, 11
      repeated :similar_job_ids, :string, 12
      optional :ios_app_link, :string, 13
      optional :ios_app_store_id, :int64, 14
    end
    add_message "google.ads.googleads.v12.common.LocationAsset" do
      optional :place_id, :string, 1
      repeated :business_profile_locations, :message, 2, "google.ads.googleads.v12.common.BusinessProfileLocation"
      optional :location_ownership_type, :enum, 3, "google.ads.googleads.v12.enums.LocationOwnershipTypeEnum.LocationOwnershipType"
    end
    add_message "google.ads.googleads.v12.common.BusinessProfileLocation" do
      repeated :labels, :string, 1
      optional :store_code, :string, 2
      optional :listing_id, :int64, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Common
          YoutubeVideoAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.YoutubeVideoAsset").msgclass
          MediaBundleAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.MediaBundleAsset").msgclass
          ImageAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.ImageAsset").msgclass
          ImageDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.ImageDimension").msgclass
          TextAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TextAsset").msgclass
          LeadFormAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LeadFormAsset").msgclass
          LeadFormField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LeadFormField").msgclass
          LeadFormCustomQuestionField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LeadFormCustomQuestionField").msgclass
          LeadFormSingleChoiceAnswers = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LeadFormSingleChoiceAnswers").msgclass
          LeadFormDeliveryMethod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LeadFormDeliveryMethod").msgclass
          WebhookDelivery = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.WebhookDelivery").msgclass
          BookOnGoogleAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BookOnGoogleAsset").msgclass
          PromotionAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PromotionAsset").msgclass
          CalloutAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CalloutAsset").msgclass
          StructuredSnippetAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.StructuredSnippetAsset").msgclass
          SitelinkAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.SitelinkAsset").msgclass
          PageFeedAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PageFeedAsset").msgclass
          DynamicEducationAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicEducationAsset").msgclass
          MobileAppAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.MobileAppAsset").msgclass
          HotelCalloutAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.HotelCalloutAsset").msgclass
          CallAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CallAsset").msgclass
          PriceAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PriceAsset").msgclass
          PriceOffering = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PriceOffering").msgclass
          CallToActionAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CallToActionAsset").msgclass
          DynamicRealEstateAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicRealEstateAsset").msgclass
          DynamicCustomAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicCustomAsset").msgclass
          DynamicHotelsAndRentalsAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicHotelsAndRentalsAsset").msgclass
          DynamicFlightsAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicFlightsAsset").msgclass
          DiscoveryCarouselCardAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DiscoveryCarouselCardAsset").msgclass
          DynamicTravelAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicTravelAsset").msgclass
          DynamicLocalAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicLocalAsset").msgclass
          DynamicJobsAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.DynamicJobsAsset").msgclass
          LocationAsset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.LocationAsset").msgclass
          BusinessProfileLocation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BusinessProfileLocation").msgclass
        end
      end
    end
  end
end
