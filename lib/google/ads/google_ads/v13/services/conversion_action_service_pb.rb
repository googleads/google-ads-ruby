# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/services/conversion_action_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v13/enums/response_content_type_pb'
require 'google/ads/google_ads/v13/resources/conversion_action_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/services/conversion_action_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.services.MutateConversionActionsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v13.services.ConversionActionOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v13.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v13.services.ConversionActionOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v13.resources.ConversionAction"
        optional :update, :message, 2, "google.ads.googleads.v13.resources.ConversionAction"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v13.services.MutateConversionActionsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v13.services.MutateConversionActionResult"
    end
    add_message "google.ads.googleads.v13.services.MutateConversionActionResult" do
      optional :resource_name, :string, 1
      optional :conversion_action, :message, 2, "google.ads.googleads.v13.resources.ConversionAction"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          MutateConversionActionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateConversionActionsRequest").msgclass
          ConversionActionOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.ConversionActionOperation").msgclass
          MutateConversionActionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateConversionActionsResponse").msgclass
          MutateConversionActionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateConversionActionResult").msgclass
        end
      end
    end
  end
end
