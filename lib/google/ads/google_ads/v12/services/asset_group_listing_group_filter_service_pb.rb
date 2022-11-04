# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/services/asset_group_listing_group_filter_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/response_content_type_pb'
require 'google/ads/google_ads/v12/resources/asset_group_listing_group_filter_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/services/asset_group_listing_group_filter_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.services.MutateAssetGroupListingGroupFiltersRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v12.services.AssetGroupListingGroupFilterOperation"
      optional :validate_only, :bool, 3
      optional :response_content_type, :enum, 4, "google.ads.googleads.v12.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v12.services.AssetGroupListingGroupFilterOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v12.resources.AssetGroupListingGroupFilter"
        optional :update, :message, 2, "google.ads.googleads.v12.resources.AssetGroupListingGroupFilter"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v12.services.MutateAssetGroupListingGroupFiltersResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v12.services.MutateAssetGroupListingGroupFilterResult"
    end
    add_message "google.ads.googleads.v12.services.MutateAssetGroupListingGroupFilterResult" do
      optional :resource_name, :string, 1
      optional :asset_group_listing_group_filter, :message, 2, "google.ads.googleads.v12.resources.AssetGroupListingGroupFilter"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          MutateAssetGroupListingGroupFiltersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateAssetGroupListingGroupFiltersRequest").msgclass
          AssetGroupListingGroupFilterOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.AssetGroupListingGroupFilterOperation").msgclass
          MutateAssetGroupListingGroupFiltersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateAssetGroupListingGroupFiltersResponse").msgclass
          MutateAssetGroupListingGroupFilterResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateAssetGroupListingGroupFilterResult").msgclass
        end
      end
    end
  end
end
