# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/detail_placement_view.proto

require 'google/ads/google_ads/v10/enums/placement_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/detail_placement_view.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.DetailPlacementView" do
      optional :resource_name, :string, 1
      proto3_optional :placement, :string, 7
      proto3_optional :display_name, :string, 8
      proto3_optional :group_placement_target_url, :string, 9
      proto3_optional :target_url, :string, 10
      optional :placement_type, :enum, 6, "google.ads.googleads.v10.enums.PlacementTypeEnum.PlacementType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          DetailPlacementView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.DetailPlacementView").msgclass
        end
      end
    end
  end
end
