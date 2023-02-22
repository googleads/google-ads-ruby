# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/services/customer_label_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v13/resources/customer_label_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/services/customer_label_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.services.MutateCustomerLabelsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v13.services.CustomerLabelOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v13.services.CustomerLabelOperation" do
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v13.resources.CustomerLabel"
        optional :remove, :string, 2
      end
    end
    add_message "google.ads.googleads.v13.services.MutateCustomerLabelsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v13.services.MutateCustomerLabelResult"
    end
    add_message "google.ads.googleads.v13.services.MutateCustomerLabelResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          MutateCustomerLabelsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCustomerLabelsRequest").msgclass
          CustomerLabelOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.CustomerLabelOperation").msgclass
          MutateCustomerLabelsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCustomerLabelsResponse").msgclass
          MutateCustomerLabelResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.services.MutateCustomerLabelResult").msgclass
        end
      end
    end
  end
end
