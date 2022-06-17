# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/services/conversion_value_rule_set_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/enums/response_content_type_pb'
require 'google/ads/google_ads/v11/resources/conversion_value_rule_set_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/services/conversion_value_rule_set_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.services.MutateConversionValueRuleSetsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v11.services.ConversionValueRuleSetOperation"
      optional :partial_failure, :bool, 5
      optional :validate_only, :bool, 3
      optional :response_content_type, :enum, 4, "google.ads.googleads.v11.enums.ResponseContentTypeEnum.ResponseContentType"
    end
    add_message "google.ads.googleads.v11.services.ConversionValueRuleSetOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v11.resources.ConversionValueRuleSet"
        optional :update, :message, 2, "google.ads.googleads.v11.resources.ConversionValueRuleSet"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v11.services.MutateConversionValueRuleSetsResponse" do
      repeated :results, :message, 1, "google.ads.googleads.v11.services.MutateConversionValueRuleSetResult"
      optional :partial_failure_error, :message, 2, "google.rpc.Status"
    end
    add_message "google.ads.googleads.v11.services.MutateConversionValueRuleSetResult" do
      optional :resource_name, :string, 1
      optional :conversion_value_rule_set, :message, 2, "google.ads.googleads.v11.resources.ConversionValueRuleSet"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Services
          MutateConversionValueRuleSetsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateConversionValueRuleSetsRequest").msgclass
          ConversionValueRuleSetOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.ConversionValueRuleSetOperation").msgclass
          MutateConversionValueRuleSetsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateConversionValueRuleSetsResponse").msgclass
          MutateConversionValueRuleSetResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.MutateConversionValueRuleSetResult").msgclass
        end
      end
    end
  end
end
