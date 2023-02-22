# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/services/campaign_draft_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v13/enums/response_content_type_pb'
require 'google/ads/google_ads/v13/resources/campaign_draft_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/services/campaign_draft_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.services.MutateCampaignDraftsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v13.services.CampaignDraftOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v13.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v13.services.PromoteCampaignDraftRequest" do
      optional :campaign_draft, :string, 1
      optional :validate_only, :bool, 2
    end
    add_message "google.ads.googleads.v13.services.CampaignDraftOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v13.resources.CampaignDraft"
        optional :update, :message, 2, "google.ads.googleads.v13.resources.CampaignDraft"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v13.services.MutateCampaignDraftsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v13.services.MutateCampaignDraftResult"
    end
    add_message "google.ads.googleads.v13.services.MutateCampaignDraftResult" do
      optional :resource_name, :string, 1
      optional :campaign_draft, :message, 2, "google.ads.googleads.v13.resources.CampaignDraft"
    end
    add_message "google.ads.googleads.v13.services.ListCampaignDraftAsyncErrorsRequest" do
      optional :resource_name, :string, 1
      optional :page_token, :string, 2
      optional :page_size, :int32, 3
    end
    add_message "google.ads.googleads.v13.services.ListCampaignDraftAsyncErrorsResponse" do
      repeated :errors, :message, 1, "google.rpc.Status"
      optional :next_page_token, :string, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          MutateCampaignDraftsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCampaignDraftsRequest").msgclass
          PromoteCampaignDraftRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.PromoteCampaignDraftRequest").msgclass
          CampaignDraftOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.CampaignDraftOperation").msgclass
          MutateCampaignDraftsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCampaignDraftsResponse").msgclass
          MutateCampaignDraftResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCampaignDraftResult").msgclass
          ListCampaignDraftAsyncErrorsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.ListCampaignDraftAsyncErrorsRequest").msgclass
          ListCampaignDraftAsyncErrorsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.ListCampaignDraftAsyncErrorsResponse").msgclass
        end
      end
    end
  end
end
