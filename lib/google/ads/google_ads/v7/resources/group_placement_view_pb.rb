# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/resources/group_placement_view.proto

require 'google/protobuf'

require 'google/ads/google_ads/v7/enums/placement_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/resources/group_placement_view.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.resources.GroupPlacementView" do
      optional :resource_name, :string, 1
      proto3_optional :placement, :string, 6
      proto3_optional :display_name, :string, 7
      proto3_optional :target_url, :string, 8
      optional :placement_type, :enum, 5, "google.ads.googleads.v7.enums.PlacementTypeEnum.PlacementType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Resources
          GroupPlacementView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.resources.GroupPlacementView").msgclass
        end
      end
    end
  end
end
