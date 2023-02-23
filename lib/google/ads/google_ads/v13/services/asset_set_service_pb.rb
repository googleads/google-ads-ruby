# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/services/asset_set_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v13/enums/response_content_type_pb'
require 'google/ads/google_ads/v13/resources/asset_set_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/services/asset_set_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.services.MutateAssetSetsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v13.services.AssetSetOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v13.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v13.services.AssetSetOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v13.resources.AssetSet"
        optional :update, :message, 2, "google.ads.googleads.v13.resources.AssetSet"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v13.services.MutateAssetSetsResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v13.services.MutateAssetSetResult"
      optional :partial_failure_error, :message, 2, "google.rpc.Status"
    end
    add_message "google.ads.googleads.v13.services.MutateAssetSetResult" do
      optional :resource_name, :string, 1
      optional :asset_set, :message, 2, "google.ads.googleads.v13.resources.AssetSet"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          MutateAssetSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateAssetSetsRequest").msgclass
          AssetSetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.AssetSetOperation").msgclass
          MutateAssetSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateAssetSetsResponse").msgclass
          MutateAssetSetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateAssetSetResult").msgclass
        end
      end
    end
  end
end