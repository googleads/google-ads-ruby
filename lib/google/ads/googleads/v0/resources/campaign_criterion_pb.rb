# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/resources/campaign_criterion.proto

require 'google/protobuf'

require 'google/ads/googleads/v0/common/criteria_pb'
require 'google/ads/googleads/v0/enums/criterion_type_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.resources.CampaignCriterion" do
    optional :resource_name, :string, 1
    optional :campaign, :message, 4, "google.protobuf.StringValue"
    optional :criterion_id, :message, 5, "google.protobuf.Int64Value"
    optional :negative, :message, 7, "google.protobuf.BoolValue"
    optional :type, :enum, 6, "google.ads.googleads.v0.enums.CriterionTypeEnum.CriterionType"
    oneof :criterion do
      optional :keyword, :message, 8, "google.ads.googleads.v0.common.KeywordInfo"
    end
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Resources
          CampaignCriterion = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.resources.CampaignCriterion").msgclass
        end
      end
    end
  end
end
