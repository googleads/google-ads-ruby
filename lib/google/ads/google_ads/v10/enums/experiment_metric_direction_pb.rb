# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/experiment_metric_direction.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/experiment_metric_direction.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.ExperimentMetricDirectionEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.ExperimentMetricDirectionEnum.ExperimentMetricDirection" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :NO_CHANGE, 2
      value :INCREASE, 3
      value :DECREASE, 4
      value :NO_CHANGE_OR_INCREASE, 5
      value :NO_CHANGE_OR_DECREASE, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          ExperimentMetricDirectionEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.ExperimentMetricDirectionEnum").msgclass
          ExperimentMetricDirectionEnum::ExperimentMetricDirection = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.ExperimentMetricDirectionEnum.ExperimentMetricDirection").enummodule
        end
      end
    end
  end
end
