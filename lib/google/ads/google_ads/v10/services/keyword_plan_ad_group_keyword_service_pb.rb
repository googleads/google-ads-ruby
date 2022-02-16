# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/services/keyword_plan_ad_group_keyword_service.proto

require 'google/ads/google_ads/v10/resources/keyword_plan_ad_group_keyword_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/services/keyword_plan_ad_group_keyword_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordsRequest" do
      optional :customer_id, :string, 1
      repeated :operations, :message, 2, "google.ads.googleads.v10.services.KeywordPlanAdGroupKeywordOperation"
      optional :partial_failure, :bool, 3
      optional :validate_only, :bool, 4
    end
    add_message "google.ads.googleads.v10.services.KeywordPlanAdGroupKeywordOperation" do
      optional :update_mask, :message, 4, "google.protobuf.FieldMask"
      oneof :operation do
        optional :create, :message, 1, "google.ads.googleads.v10.resources.KeywordPlanAdGroupKeyword"
        optional :update, :message, 2, "google.ads.googleads.v10.resources.KeywordPlanAdGroupKeyword"
        optional :remove, :string, 3
      end
    end
    add_message "google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordsResponse" do
      optional :partial_failure_error, :message, 3, "google.rpc.Status"
      repeated :results, :message, 2, "google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordResult"
    end
    add_message "google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordResult" do
      optional :resource_name, :string, 1
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Services
          MutateKeywordPlanAdGroupKeywordsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordsRequest").msgclass
          KeywordPlanAdGroupKeywordOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.KeywordPlanAdGroupKeywordOperation").msgclass
          MutateKeywordPlanAdGroupKeywordsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordsResponse").msgclass
          MutateKeywordPlanAdGroupKeywordResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.services.MutateKeywordPlanAdGroupKeywordResult").msgclass
        end
      end
    end
  end
end
