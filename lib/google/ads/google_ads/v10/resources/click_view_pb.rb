# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/click_view.proto

require 'google/ads/google_ads/v10/common/click_location_pb'
require 'google/ads/google_ads/v10/common/criteria_pb'
require 'google/api/annotations_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/click_view.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.ClickView" do
      optional :resource_name, :string, 1
      proto3_optional :gclid, :string, 8
      optional :area_of_interest, :message, 3, "google.ads.googleads.v10.common.ClickLocation"
      optional :location_of_presence, :message, 4, "google.ads.googleads.v10.common.ClickLocation"
      proto3_optional :page_number, :int64, 9
      proto3_optional :ad_group_ad, :string, 10
      proto3_optional :campaign_location_target, :string, 11
      proto3_optional :user_list, :string, 12
      optional :keyword, :string, 13
      optional :keyword_info, :message, 14, "google.ads.googleads.v10.common.KeywordInfo"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          ClickView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.ClickView").msgclass
        end
      end
    end
  end
end
