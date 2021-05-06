# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/services/customer_asset_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v7/resources/customer_asset_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/services/customer_asset_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.services.GetCustomerAssetRequest" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v7.services.MutateCustomerAssetsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v7.services.CustomerAssetOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v7.services.CustomerAssetOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v7.resources.CustomerAsset"
        optional :update, :message, 3, "google.ads.googleads.v7.resources.CustomerAsset"
        optional :remove, :string, 2
      end
    end
    add_message "google.ads.googleads.v7.services.MutateCustomerAssetsResponse" do
      optional :partial_failure_error, :message, 1, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v7.services.MutateCustomerAssetResult"
    end
    add_message "google.ads.googleads.v7.services.MutateCustomerAssetResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Services
          GetCustomerAssetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.services.GetCustomerAssetRequest").msgclass
          MutateCustomerAssetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.services.MutateCustomerAssetsRequest").msgclass
          CustomerAssetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.services.CustomerAssetOperation").msgclass
          MutateCustomerAssetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.services.MutateCustomerAssetsResponse").msgclass
          MutateCustomerAssetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.services.MutateCustomerAssetResult").msgclass
        end
      end
    end
  end
end
