# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/services/audience_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/enums/response_content_type_pb'
require 'google/ads/google_ads/v11/resources/audience_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/services/audience_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.services.MutateAudiencesRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v11.services.AudienceOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v11.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v11.services.MutateAudiencesResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v11.services.MutateAudienceResult"
      optional :partial_failure_error, :message, 2, "google.rpc.Status"
    end
    add_message "google.ads.googleads.v11.services.AudienceOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v11.resources.Audience"
        optional :update, :message, 2, "google.ads.googleads.v11.resources.Audience"
      end
    end
    add_message "google.ads.googleads.v11.services.MutateAudienceResult" do
      optional :resource_name, :string, 1
      optional :audience, :message, 2, "google.ads.googleads.v11.resources.Audience"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Services
          MutateAudiencesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateAudiencesRequest").msgclass
          MutateAudiencesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateAudiencesResponse").msgclass
          AudienceOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceOperation").msgclass
          MutateAudienceResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateAudienceResult").msgclass
        end
      end
    end
  end
end
