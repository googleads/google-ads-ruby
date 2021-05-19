# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/common/criterion_category_availability.proto

require 'google/protobuf'

require 'google/ads/google_ads/v8/enums/advertising_channel_sub_type_pb'
require 'google/ads/google_ads/v8/enums/advertising_channel_type_pb'
require 'google/ads/google_ads/v8/enums/criterion_category_channel_availability_mode_pb'
require 'google/ads/google_ads/v8/enums/criterion_category_locale_availability_mode_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/common/criterion_category_availability.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.common.CriterionCategoryAvailability" do
      optional :channel, :message, 1, "google.ads.googleads.v8.common.CriterionCategoryChannelAvailability"
      repeated :locale, :message, 2, "google.ads.googleads.v8.common.CriterionCategoryLocaleAvailability"
    end
    add_message "google.ads.googleads.v8.common.CriterionCategoryChannelAvailability" do
      optional :availability_mode, :enum, 1, "google.ads.googleads.v8.enums.CriterionCategoryChannelAvailabilityModeEnum.CriterionCategoryChannelAvailabilityMode"
      optional :advertising_channel_type, :enum, 2, "google.ads.googleads.v8.enums.AdvertisingChannelTypeEnum.AdvertisingChannelType"
      repeated :advertising_channel_sub_type, :enum, 3, "google.ads.googleads.v8.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubType"
      proto3_optional :include_default_channel_sub_type, :bool, 5
    end
    add_message "google.ads.googleads.v8.common.CriterionCategoryLocaleAvailability" do
      optional :availability_mode, :enum, 1, "google.ads.googleads.v8.enums.CriterionCategoryLocaleAvailabilityModeEnum.CriterionCategoryLocaleAvailabilityMode"
      proto3_optional :country_code, :string, 4
      proto3_optional :language_code, :string, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Common
          CriterionCategoryAvailability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.common.CriterionCategoryAvailability").msgclass
          CriterionCategoryChannelAvailability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.common.CriterionCategoryChannelAvailability").msgclass
          CriterionCategoryLocaleAvailability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.common.CriterionCategoryLocaleAvailability").msgclass
        end
      end
    end
  end
end
