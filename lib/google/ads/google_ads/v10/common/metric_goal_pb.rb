# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/common/metric_goal.proto

require 'google/ads/google_ads/v10/enums/experiment_metric_pb'
require 'google/ads/google_ads/v10/enums/experiment_metric_direction_pb'
require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/common/metric_goal.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.common.MetricGoal" do
      optional :metric, :enum, 1, "google.ads.googleads.v10.enums.ExperimentMetricEnum.ExperimentMetric"
      optional :direction, :enum, 2, "google.ads.googleads.v10.enums.ExperimentMetricDirectionEnum.ExperimentMetricDirection"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Common
          MetricGoal = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.common.MetricGoal").msgclass
        end
      end
    end
  end
end
