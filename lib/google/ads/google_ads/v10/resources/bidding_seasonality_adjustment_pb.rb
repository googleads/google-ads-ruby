# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/bidding_seasonality_adjustment.proto

require 'google/ads/google_ads/v10/enums/advertising_channel_type_pb'
require 'google/ads/google_ads/v10/enums/device_pb'
require 'google/ads/google_ads/v10/enums/seasonality_event_scope_pb'
require 'google/ads/google_ads/v10/enums/seasonality_event_status_pb'
require 'google/api/annotations_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/bidding_seasonality_adjustment.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.BiddingSeasonalityAdjustment" do
      optional :resource_name, :string, 1
      optional :seasonality_adjustment_id, :int64, 2
      optional :scope, :enum, 3, "google.ads.googleads.v10.enums.SeasonalityEventScopeEnum.SeasonalityEventScope"
      optional :status, :enum, 4, "google.ads.googleads.v10.enums.SeasonalityEventStatusEnum.SeasonalityEventStatus"
      optional :start_date_time, :string, 5
      optional :end_date_time, :string, 6
      optional :name, :string, 7
      optional :description, :string, 8
      repeated :devices, :enum, 9, "google.ads.googleads.v10.enums.DeviceEnum.Device"
      optional :conversion_rate_modifier, :double, 10
      repeated :campaigns, :string, 11
      repeated :advertising_channel_types, :enum, 12, "google.ads.googleads.v10.enums.AdvertisingChannelTypeEnum.AdvertisingChannelType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          BiddingSeasonalityAdjustment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.BiddingSeasonalityAdjustment").msgclass
        end
      end
    end
  end
end
