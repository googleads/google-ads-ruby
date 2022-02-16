# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/services/bidding_data_exclusion_service.proto

require 'google/ads/google_ads/v10/enums/response_content_type_pb'
require 'google/ads/google_ads/v10/resources/bidding_data_exclusion_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/services/bidding_data_exclusion_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.services.MutateBiddingDataExclusionsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v10.services.BiddingDataExclusionOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v10.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v10.services.BiddingDataExclusionOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v10.resources.BiddingDataExclusion"
        optional :update, :message, 2, "google.ads.googleads.v10.resources.BiddingDataExclusion"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v10.services.MutateBiddingDataExclusionsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v10.services.MutateBiddingDataExclusionsResult"
    end
    add_message "google.ads.googleads.v10.services.MutateBiddingDataExclusionsResult" do
      optional :resource_name, :string, 1
      optional :bidding_data_exclusion, :message, 2, "google.ads.googleads.v10.resources.BiddingDataExclusion"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Services
          MutateBiddingDataExclusionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateBiddingDataExclusionsRequest").msgclass
          BiddingDataExclusionOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.BiddingDataExclusionOperation").msgclass
          MutateBiddingDataExclusionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateBiddingDataExclusionsResponse").msgclass
          MutateBiddingDataExclusionsResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateBiddingDataExclusionsResult").msgclass
        end
      end
    end
  end
end
