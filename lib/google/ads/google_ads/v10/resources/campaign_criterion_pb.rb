# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/campaign_criterion.proto

require 'google/ads/google_ads/v10/common/criteria_pb'
require 'google/ads/google_ads/v10/enums/campaign_criterion_status_pb'
require 'google/ads/google_ads/v10/enums/criterion_type_pb'
require 'google/api/annotations_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/campaign_criterion.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.CampaignCriterion" do
      optional :resource_name, :string, 1
      proto3_optional :campaign, :string, 37
      proto3_optional :criterion_id, :int64, 38
      optional :display_name, :string, 43
      proto3_optional :bid_modifier, :float, 39
      proto3_optional :negative, :bool, 40
      optional :type, :enum, 6, "google.ads.googleads.v10.enums.CriterionTypeEnum.CriterionType"
      optional :status, :enum, 35, "google.ads.googleads.v10.enums.CampaignCriterionStatusEnum.CampaignCriterionStatus"
      oneof :criterion do
        optional :keyword, :message, 8, "google.ads.googleads.v10.common.KeywordInfo"
        optional :placement, :message, 9, "google.ads.googleads.v10.common.PlacementInfo"
        optional :mobile_app_category, :message, 10, "google.ads.googleads.v10.common.MobileAppCategoryInfo"
        optional :mobile_application, :message, 11, "google.ads.googleads.v10.common.MobileApplicationInfo"
        optional :location, :message, 12, "google.ads.googleads.v10.common.LocationInfo"
        optional :device, :message, 13, "google.ads.googleads.v10.common.DeviceInfo"
        optional :ad_schedule, :message, 15, "google.ads.googleads.v10.common.AdScheduleInfo"
        optional :age_range, :message, 16, "google.ads.googleads.v10.common.AgeRangeInfo"
        optional :gender, :message, 17, "google.ads.googleads.v10.common.GenderInfo"
        optional :income_range, :message, 18, "google.ads.googleads.v10.common.IncomeRangeInfo"
        optional :parental_status, :message, 19, "google.ads.googleads.v10.common.ParentalStatusInfo"
        optional :user_list, :message, 22, "google.ads.googleads.v10.common.UserListInfo"
        optional :youtube_video, :message, 20, "google.ads.googleads.v10.common.YouTubeVideoInfo"
        optional :youtube_channel, :message, 21, "google.ads.googleads.v10.common.YouTubeChannelInfo"
        optional :proximity, :message, 23, "google.ads.googleads.v10.common.ProximityInfo"
        optional :topic, :message, 24, "google.ads.googleads.v10.common.TopicInfo"
        optional :listing_scope, :message, 25, "google.ads.googleads.v10.common.ListingScopeInfo"
        optional :language, :message, 26, "google.ads.googleads.v10.common.LanguageInfo"
        optional :ip_block, :message, 27, "google.ads.googleads.v10.common.IpBlockInfo"
        optional :content_label, :message, 28, "google.ads.googleads.v10.common.ContentLabelInfo"
        optional :carrier, :message, 29, "google.ads.googleads.v10.common.CarrierInfo"
        optional :user_interest, :message, 30, "google.ads.googleads.v10.common.UserInterestInfo"
        optional :webpage, :message, 31, "google.ads.googleads.v10.common.WebpageInfo"
        optional :operating_system_version, :message, 32, "google.ads.googleads.v10.common.OperatingSystemVersionInfo"
        optional :mobile_device, :message, 33, "google.ads.googleads.v10.common.MobileDeviceInfo"
        optional :location_group, :message, 34, "google.ads.googleads.v10.common.LocationGroupInfo"
        optional :custom_affinity, :message, 36, "google.ads.googleads.v10.common.CustomAffinityInfo"
        optional :custom_audience, :message, 41, "google.ads.googleads.v10.common.CustomAudienceInfo"
        optional :combined_audience, :message, 42, "google.ads.googleads.v10.common.CombinedAudienceInfo"
        optional :keyword_theme, :message, 45, "google.ads.googleads.v10.common.KeywordThemeInfo"
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          CampaignCriterion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.CampaignCriterion").msgclass
        end
      end
    end
  end
end
