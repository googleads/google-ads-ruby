# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/services/conversion_adjustment_upload_service.proto

require 'google/ads/google_ads/v10/common/offline_user_data_pb'
require 'google/ads/google_ads/v10/enums/conversion_adjustment_type_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/rpc/status_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/services/conversion_adjustment_upload_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.services.UploadConversionAdjustmentsRequest" do
      optional :customer_id, :string, 1
      repeated :conversion_adjustments, :message, 2, "google.ads.googleads.v10.services.ConversionAdjustment"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v10.services.UploadConversionAdjustmentsResponse" do
      optional :partial_failure_error, :message, 1, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v10.services.ConversionAdjustmentResult"
    end
    add_message "google.ads.googleads.v10.services.ConversionAdjustment" do
      optional :gclid_date_time_pair, :message, 12, "google.ads.googleads.v10.services.GclidDateTimePair"
      proto3_optional :order_id, :string, 13
      proto3_optional :conversion_action, :string, 8
      proto3_optional :adjustment_date_time, :string, 9
      optional :adjustment_type, :enum, 5, "google.ads.googleads.v10.enums.ConversionAdjustmentTypeEnum.ConversionAdjustmentType"
      optional :restatement_value, :message, 6, "google.ads.googleads.v10.services.RestatementValue"
      repeated :user_identifiers, :message, 10, "google.ads.googleads.v10.common.UserIdentifier"
      proto3_optional :user_agent, :string, 11
    end
    add_message "google.ads.googleads.v10.services.RestatementValue" do
      proto3_optional :adjusted_value, :double, 3
      proto3_optional :currency_code, :string, 4
    end
    add_message "google.ads.googleads.v10.services.GclidDateTimePair" do
      proto3_optional :gclid, :string, 3
      proto3_optional :conversion_date_time, :string, 4
    end
    add_message "google.ads.googleads.v10.services.ConversionAdjustmentResult" do
      optional :gclid_date_time_pair, :message, 9, "google.ads.googleads.v10.services.GclidDateTimePair"
      optional :order_id, :string, 10
      proto3_optional :conversion_action, :string, 7
      proto3_optional :adjustment_date_time, :string, 8
      optional :adjustment_type, :enum, 5, "google.ads.googleads.v10.enums.ConversionAdjustmentTypeEnum.ConversionAdjustmentType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Services
          UploadConversionAdjustmentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.UploadConversionAdjustmentsRequest").msgclass
          UploadConversionAdjustmentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.UploadConversionAdjustmentsResponse").msgclass
          ConversionAdjustment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.ConversionAdjustment").msgclass
          RestatementValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.RestatementValue").msgclass
          GclidDateTimePair = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.GclidDateTimePair").msgclass
          ConversionAdjustmentResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.ConversionAdjustmentResult").msgclass
        end
      end
    end
  end
end
