# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/services/custom_audience_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v8/resources/custom_audience_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/services/custom_audience_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.services.GetCustomAudienceRequest" do
      optional :resource_name, :string, 1
    end
    add_message "google.ads.googleads.v8.services.MutateCustomAudiencesRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v8.services.CustomAudienceOperation"
      optional :validate_only, :bool, 3
    end
    add_message "google.ads.googleads.v8.services.CustomAudienceOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v8.resources.CustomAudience"
        optional :update, :message, 2, "google.ads.googleads.v8.resources.CustomAudience"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v8.services.MutateCustomAudiencesResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v8.services.MutateCustomAudienceResult"
    end
    add_message "google.ads.googleads.v8.services.MutateCustomAudienceResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Services
          GetCustomAudienceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.GetCustomAudienceRequest").msgclass
          MutateCustomAudiencesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.MutateCustomAudiencesRequest").msgclass
          CustomAudienceOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.CustomAudienceOperation").msgclass
          MutateCustomAudiencesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.MutateCustomAudiencesResponse").msgclass
          MutateCustomAudienceResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.services.MutateCustomAudienceResult").msgclass
        end
      end
    end
  end
end
