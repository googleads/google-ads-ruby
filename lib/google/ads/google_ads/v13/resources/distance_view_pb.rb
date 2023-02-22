# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/resources/distance_view.proto

require 'google/protobuf'

require 'google/ads/google_ads/v13/enums/distance_bucket_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/resources/distance_view.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.resources.DistanceView" do
      optional :resource_name, :string, 1
      optional :distance_bucket, :enum, 2, "google.ads.googleads.v13.enums.DistanceBucketEnum.DistanceBucket"
      proto3_optional :metric_system, :bool, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Resources
          DistanceView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.resources.DistanceView").msgclass
        end
      end
    end
  end
end
