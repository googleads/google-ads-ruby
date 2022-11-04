# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/services/experiment_arm_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/response_content_type_pb'
require 'google/ads/google_ads/v12/resources/experiment_arm_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/services/experiment_arm_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.services.MutateExperimentArmsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v12.services.ExperimentArmOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
      optional :response_content_type, :enum, 5, "google.ads.googleads.v12.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v12.services.ExperimentArmOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v12.resources.ExperimentArm"
        optional :update, :message, 2, "google.ads.googleads.v12.resources.ExperimentArm"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v12.services.MutateExperimentArmsResponse" do
      optional :partial_failure_error, :message, 1, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v12.services.MutateExperimentArmResult"
    end
    add_message "google.ads.googleads.v12.services.MutateExperimentArmResult" do
      optional :resource_name, :string, 1
      optional :experiment_arm, :message, 2, "google.ads.googleads.v12.resources.ExperimentArm"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          MutateExperimentArmsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateExperimentArmsRequest").msgclass
          ExperimentArmOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.ExperimentArmOperation").msgclass
          MutateExperimentArmsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateExperimentArmsResponse").msgclass
          MutateExperimentArmResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.services.MutateExperimentArmResult").msgclass
        end
      end
    end
  end
end
