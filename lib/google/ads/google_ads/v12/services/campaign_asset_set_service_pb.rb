# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/services/campaign_asset_set_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/response_content_type_pb'
require 'google/ads/google_ads/v12/resources/campaign_asset_set_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/services/campaign_asset_set_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.services.MutateCampaignAssetSetsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v12.services.CampaignAssetSetOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v12.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v12.services.CampaignAssetSetOperation" do
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v12.resources.CampaignAssetSet"
        optional :remove, :string, 2
      end
    end
    add_message "google.ads.googleads.v12.services.MutateCampaignAssetSetsResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v12.services.MutateCampaignAssetSetResult"
      optional :partial_failure_error, :message, 2, "google.rpc.Status"
    end
    add_message "google.ads.googleads.v12.services.MutateCampaignAssetSetResult" do
      optional :resource_name, :string, 1
      optional :campaign_asset_set, :message, 2, "google.ads.googleads.v12.resources.CampaignAssetSet"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          MutateCampaignAssetSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCampaignAssetSetsRequest").msgclass
          CampaignAssetSetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.CampaignAssetSetOperation").msgclass
          MutateCampaignAssetSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCampaignAssetSetsResponse").msgclass
          MutateCampaignAssetSetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateCampaignAssetSetResult").msgclass
        end
      end
    end
  end
end
