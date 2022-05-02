# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/ad_group_ad_asset_combination_view.proto

require 'google/ads/google_ads/v10/common/asset_usage_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/ad_group_ad_asset_combination_view.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.AdGroupAdAssetCombinationView" do
      optional :resource_name, :string, 1
      repeated :served_assets, :message, 2, "google.ads.googleads.v10.common.AssetUsage"
      proto3_optional :enabled, :bool, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          AdGroupAdAssetCombinationView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.AdGroupAdAssetCombinationView").msgclass
        end
      end
    end
  end
end
