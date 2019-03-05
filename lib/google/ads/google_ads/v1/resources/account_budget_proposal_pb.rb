# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/resources/account_budget_proposal.proto

require 'google/protobuf'

require 'google/ads/google_ads/v1/enums/account_budget_proposal_status_pb'
require 'google/ads/google_ads/v1/enums/account_budget_proposal_type_pb'
require 'google/ads/google_ads/v1/enums/spending_limit_type_pb'
require 'google/ads/google_ads/v1/enums/time_type_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.resources.AccountBudgetProposal" do
    optional :resource_name, :string, 1
    optional :id, :message, 14, "google.protobuf.Int64Value"
    optional :billing_setup, :message, 2, "google.protobuf.StringValue"
    optional :account_budget, :message, 3, "google.protobuf.StringValue"
    optional :proposal_type, :enum, 4, "google.ads.googleads.v1.enums.AccountBudgetProposalTypeEnum.AccountBudgetProposalType"
    optional :status, :enum, 15, "google.ads.googleads.v1.enums.AccountBudgetProposalStatusEnum.AccountBudgetProposalStatus"
    optional :proposed_name, :message, 5, "google.protobuf.StringValue"
    optional :approved_start_date_time, :message, 20, "google.protobuf.StringValue"
    optional :proposed_purchase_order_number, :message, 12, "google.protobuf.StringValue"
    optional :proposed_notes, :message, 13, "google.protobuf.StringValue"
    optional :creation_date_time, :message, 16, "google.protobuf.StringValue"
    optional :approval_date_time, :message, 17, "google.protobuf.StringValue"
    oneof :proposed_start_time do
      optional :proposed_start_date_time, :message, 18, "google.protobuf.StringValue"
      optional :proposed_start_time_type, :enum, 7, "google.ads.googleads.v1.enums.TimeTypeEnum.TimeType"
    end
    oneof :proposed_end_time do
      optional :proposed_end_date_time, :message, 19, "google.protobuf.StringValue"
      optional :proposed_end_time_type, :enum, 9, "google.ads.googleads.v1.enums.TimeTypeEnum.TimeType"
    end
    oneof :approved_end_time do
      optional :approved_end_date_time, :message, 21, "google.protobuf.StringValue"
      optional :approved_end_time_type, :enum, 22, "google.ads.googleads.v1.enums.TimeTypeEnum.TimeType"
    end
    oneof :proposed_spending_limit do
      optional :proposed_spending_limit_micros, :message, 10, "google.protobuf.Int64Value"
      optional :proposed_spending_limit_type, :enum, 11, "google.ads.googleads.v1.enums.SpendingLimitTypeEnum.SpendingLimitType"
    end
    oneof :approved_spending_limit do
      optional :approved_spending_limit_micros, :message, 23, "google.protobuf.Int64Value"
      optional :approved_spending_limit_type, :enum, 24, "google.ads.googleads.v1.enums.SpendingLimitTypeEnum.SpendingLimitType"
    end
  end
end

module Google::Ads::GoogleAds::V1::Resources
  AccountBudgetProposal = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.resources.AccountBudgetProposal").msgclass
end
