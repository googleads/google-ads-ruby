# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/services/custom_conversion_goal_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/response_content_type_pb'
require 'google/ads/google_ads/v12/resources/custom_conversion_goal_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/services/custom_conversion_goal_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.services.MutateCustomConversionGoalsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v12.services.CustomConversionGoalOperation"
      optional :validate_only, :bool, 3
      optional :response_content_type, :enum, 4, "google.ads.googleads.v12.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v12.services.CustomConversionGoalOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v12.resources.CustomConversionGoal"
        optional :update, :message, 2, "google.ads.googleads.v12.resources.CustomConversionGoal"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v12.services.MutateCustomConversionGoalsResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v12.services.MutateCustomConversionGoalResult"
    end
    add_message "google.ads.googleads.v12.services.MutateCustomConversionGoalResult" do
      optional :resource_name, :string, 1
      optional :custom_conversion_goal, :message, 2, "google.ads.googleads.v12.resources.CustomConversionGoal"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          MutateCustomConversionGoalsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCustomConversionGoalsRequest").msgclass
          CustomConversionGoalOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.CustomConversionGoalOperation").msgclass
          MutateCustomConversionGoalsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCustomConversionGoalsResponse").msgclass
          MutateCustomConversionGoalResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCustomConversionGoalResult").msgclass
        end
      end
    end
  end
end
