# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v9/enums/asset_performance_label.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v9/enums/asset_performance_label.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v9.enums.AssetPerformanceLabelEnum" do
    end
    add_enum "google.ads.googleads.v9.enums.AssetPerformanceLabelEnum.AssetPerformanceLabel" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PENDING, 2
      value :LEARNING, 3
      value :LOW, 4
      value :GOOD, 5
      value :BEST, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V9
        module Enums
          AssetPerformanceLabelEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.enums.AssetPerformanceLabelEnum").msgclass
          AssetPerformanceLabelEnum::AssetPerformanceLabel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.enums.AssetPerformanceLabelEnum.AssetPerformanceLabel").enummodule
        end
      end
    end
  end
end
