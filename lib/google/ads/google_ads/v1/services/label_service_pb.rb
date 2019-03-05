# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/services/label_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v1/resources/label_pb'
require 'google/api/annotations_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/wrappers_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.services.GetLabelRequest" do
    optional :resource_name, :string, 1
  end
  add_message "google.ads.googleads.v1.services.MutateLabelsRequest" do
    optional :customer_id, :string, 1
    repeated :operations, :message, 2, "google.ads.googleads.v1.services.LabelOperation"
    optional :partial_failure, :bool, 3
    optional :validate_only, :bool, 4
  end
  add_message "google.ads.googleads.v1.services.LabelOperation" do
    optional :update_mask, :message, 4, "google.protobuf.FieldMask"
    oneof :operation do
      optional :create, :message, 1, "google.ads.googleads.v1.resources.Label"
      optional :update, :message, 2, "google.ads.googleads.v1.resources.Label"
      optional :remove, :string, 3
    end
  end
  add_message "google.ads.googleads.v1.services.MutateLabelsResponse" do
    optional :partial_failure_error, :message, 3, "google.rpc.Status"
    repeated :results, :message, 2, "google.ads.googleads.v1.services.MutateLabelResult"
  end
  add_message "google.ads.googleads.v1.services.MutateLabelResult" do
    optional :resource_name, :string, 1
  end
end

module Google::Ads::GoogleAds::V1::Services
  GetLabelRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.services.GetLabelRequest").msgclass
  MutateLabelsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.services.MutateLabelsRequest").msgclass
  LabelOperation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.services.LabelOperation").msgclass
  MutateLabelsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.services.MutateLabelsResponse").msgclass
  MutateLabelResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.services.MutateLabelResult").msgclass
end
