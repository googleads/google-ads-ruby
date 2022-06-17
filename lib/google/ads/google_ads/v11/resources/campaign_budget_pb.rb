# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/resources/campaign_budget.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/enums/budget_delivery_method_pb'
require 'google/ads/google_ads/v11/enums/budget_period_pb'
require 'google/ads/google_ads/v11/enums/budget_status_pb'
require 'google/ads/google_ads/v11/enums/budget_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/resources/campaign_budget.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.resources.CampaignBudget" do
      optional :resource_name, :string, 1
      proto3_optional :id, :int64, 19
      proto3_optional :name, :string, 20
      proto3_optional :amount_micros, :int64, 21
      proto3_optional :total_amount_micros, :int64, 22
      optional :status, :enum, 6, "google.ads.googleads.v11.enums.BudgetStatusEnum.BudgetStatus"
      optional :delivery_method, :enum, 7, "google.ads.googleads.v11.enums.BudgetDeliveryMethodEnum.BudgetDeliveryMethod"
      proto3_optional :explicitly_shared, :bool, 23
      proto3_optional :reference_count, :int64, 24
      proto3_optional :has_recommended_budget, :bool, 25
      proto3_optional :recommended_budget_amount_micros, :int64, 26
      optional :period, :enum, 13, "google.ads.googleads.v11.enums.BudgetPeriodEnum.BudgetPeriod"
      proto3_optional :recommended_budget_estimated_change_weekly_clicks, :int64, 27
      proto3_optional :recommended_budget_estimated_change_weekly_cost_micros, :int64, 28
      proto3_optional :recommended_budget_estimated_change_weekly_interactions, :int64, 29
      proto3_optional :recommended_budget_estimated_change_weekly_views, :int64, 30
      optional :type, :enum, 18, "google.ads.googleads.v11.enums.BudgetTypeEnum.BudgetType"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Resources
          CampaignBudget = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.resources.CampaignBudget").msgclass
        end
      end
    end
  end
end
