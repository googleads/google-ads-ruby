# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/experiment.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/common/metric_goal_pb'
require 'google/ads/google_ads/v16/enums/async_action_status_pb'
require 'google/ads/google_ads/v16/enums/experiment_status_pb'
require 'google/ads/google_ads/v16/enums/experiment_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n3google/ads/googleads/v16/resources/experiment.proto\x12\"google.ads.googleads.v16.resources\x1a\x31google/ads/googleads/v16/common/metric_goal.proto\x1a\x38google/ads/googleads/v16/enums/async_action_status.proto\x1a\x36google/ads/googleads/v16/enums/experiment_status.proto\x1a\x34google/ads/googleads/v16/enums/experiment_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xa6\x06\n\nExperiment\x12\x42\n\rresource_name\x18\x01 \x01(\tB+\xe0\x41\x05\xfa\x41%\n#googleads.googleapis.com/Experiment\x12\x1f\n\rexperiment_id\x18\t \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x11\n\x04name\x18\n \x01(\tB\x03\xe0\x41\x02\x12\x13\n\x0b\x64\x65scription\x18\x0b \x01(\t\x12\x0e\n\x06suffix\x18\x0c \x01(\t\x12T\n\x04type\x18\r \x01(\x0e\x32\x41.google.ads.googleads.v16.enums.ExperimentTypeEnum.ExperimentTypeB\x03\xe0\x41\x02\x12U\n\x06status\x18\x0e \x01(\x0e\x32\x45.google.ads.googleads.v16.enums.ExperimentStatusEnum.ExperimentStatus\x12\x17\n\nstart_date\x18\x0f \x01(\tH\x01\x88\x01\x01\x12\x15\n\x08\x65nd_date\x18\x10 \x01(\tH\x02\x88\x01\x01\x12:\n\x05goals\x18\x11 \x03(\x0b\x32+.google.ads.googleads.v16.common.MetricGoal\x12(\n\x16long_running_operation\x18\x12 \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12\x64\n\x0epromote_status\x18\x13 \x01(\x0e\x32G.google.ads.googleads.v16.enums.AsyncActionStatusEnum.AsyncActionStatusB\x03\xe0\x41\x03\x12\x1e\n\x0csync_enabled\x18\x14 \x01(\x08\x42\x03\xe0\x41\x05H\x04\x88\x01\x01:X\xea\x41U\n#googleads.googleapis.com/Experiment\x12.customers/{customer_id}/experiments/{trial_id}B\x10\n\x0e_experiment_idB\r\n\x0b_start_dateB\x0b\n\t_end_dateB\x19\n\x17_long_running_operationB\x0f\n\r_sync_enabledB\x81\x02\n&com.google.ads.googleads.v16.resourcesB\x0f\x45xperimentProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.ads.googleads.v16.common.MetricGoal", "google/ads/googleads/v16/common/metric_goal.proto"],
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Ads
    module GoogleAds
      module V16
        module Resources
          Experiment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.Experiment").msgclass
        end
      end
    end
  end
end
