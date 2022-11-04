# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/common/simulation.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/common/simulation.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.common.BidModifierSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.BidModifierSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.CpcBidSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.CpcBidSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.CpvBidSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.CpvBidSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.TargetCpaSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.TargetCpaSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.TargetRoasSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.TargetRoasSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.PercentCpcBidSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.PercentCpcBidSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.BudgetSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.BudgetSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.TargetImpressionShareSimulationPointList" do
      repeated :points, :message, 1, "google.ads.googleads.v12.common.TargetImpressionShareSimulationPoint"
    end
    add_message "google.ads.googleads.v12.common.BidModifierSimulationPoint" do
      proto3_optional :bid_modifier, :double, 15
      proto3_optional :biddable_conversions, :double, 16
      proto3_optional :biddable_conversions_value, :double, 17
      proto3_optional :clicks, :int64, 18
      proto3_optional :cost_micros, :int64, 19
      proto3_optional :impressions, :int64, 20
      proto3_optional :top_slot_impressions, :int64, 21
      proto3_optional :parent_biddable_conversions, :double, 22
      proto3_optional :parent_biddable_conversions_value, :double, 23
      proto3_optional :parent_clicks, :int64, 24
      proto3_optional :parent_cost_micros, :int64, 25
      proto3_optional :parent_impressions, :int64, 26
      proto3_optional :parent_top_slot_impressions, :int64, 27
      proto3_optional :parent_required_budget_micros, :int64, 28
    end
    add_message "google.ads.googleads.v12.common.CpcBidSimulationPoint" do
      optional :required_budget_amount_micros, :int64, 17
      proto3_optional :biddable_conversions, :double, 9
      proto3_optional :biddable_conversions_value, :double, 10
      proto3_optional :clicks, :int64, 11
      proto3_optional :cost_micros, :int64, 12
      proto3_optional :impressions, :int64, 13
      proto3_optional :top_slot_impressions, :int64, 14
      oneof :cpc_simulation_key_value do
        optional :cpc_bid_micros, :int64, 15
        optional :cpc_bid_scaling_modifier, :double, 16
      end
    end
    add_message "google.ads.googleads.v12.common.CpvBidSimulationPoint" do
      proto3_optional :cpv_bid_micros, :int64, 5
      proto3_optional :cost_micros, :int64, 6
      proto3_optional :impressions, :int64, 7
      proto3_optional :views, :int64, 8
    end
    add_message "google.ads.googleads.v12.common.TargetCpaSimulationPoint" do
      optional :required_budget_amount_micros, :int64, 19
      proto3_optional :biddable_conversions, :double, 9
      proto3_optional :biddable_conversions_value, :double, 10
      optional :app_installs, :double, 15
      optional :in_app_actions, :double, 16
      proto3_optional :clicks, :int64, 11
      proto3_optional :cost_micros, :int64, 12
      proto3_optional :impressions, :int64, 13
      proto3_optional :top_slot_impressions, :int64, 14
      oneof :target_cpa_simulation_key_value do
        optional :target_cpa_micros, :int64, 17
        optional :target_cpa_scaling_modifier, :double, 18
      end
    end
    add_message "google.ads.googleads.v12.common.TargetRoasSimulationPoint" do
      proto3_optional :target_roas, :double, 8
      optional :required_budget_amount_micros, :int64, 15
      proto3_optional :biddable_conversions, :double, 9
      proto3_optional :biddable_conversions_value, :double, 10
      proto3_optional :clicks, :int64, 11
      proto3_optional :cost_micros, :int64, 12
      proto3_optional :impressions, :int64, 13
      proto3_optional :top_slot_impressions, :int64, 14
    end
    add_message "google.ads.googleads.v12.common.PercentCpcBidSimulationPoint" do
      proto3_optional :percent_cpc_bid_micros, :int64, 1
      proto3_optional :biddable_conversions, :double, 2
      proto3_optional :biddable_conversions_value, :double, 3
      proto3_optional :clicks, :int64, 4
      proto3_optional :cost_micros, :int64, 5
      proto3_optional :impressions, :int64, 6
      proto3_optional :top_slot_impressions, :int64, 7
    end
    add_message "google.ads.googleads.v12.common.BudgetSimulationPoint" do
      optional :budget_amount_micros, :int64, 1
      optional :required_cpc_bid_ceiling_micros, :int64, 2
      optional :biddable_conversions, :double, 3
      optional :biddable_conversions_value, :double, 4
      optional :clicks, :int64, 5
      optional :cost_micros, :int64, 6
      optional :impressions, :int64, 7
      optional :top_slot_impressions, :int64, 8
    end
    add_message "google.ads.googleads.v12.common.TargetImpressionShareSimulationPoint" do
      optional :target_impression_share_micros, :int64, 1
      optional :required_cpc_bid_ceiling_micros, :int64, 2
      optional :required_budget_amount_micros, :int64, 3
      optional :biddable_conversions, :double, 4
      optional :biddable_conversions_value, :double, 5
      optional :clicks, :int64, 6
      optional :cost_micros, :int64, 7
      optional :impressions, :int64, 8
      optional :top_slot_impressions, :int64, 9
      optional :absolute_top_impressions, :int64, 10
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Common
          BidModifierSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BidModifierSimulationPointList").msgclass
          CpcBidSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CpcBidSimulationPointList").msgclass
          CpvBidSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CpvBidSimulationPointList").msgclass
          TargetCpaSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetCpaSimulationPointList").msgclass
          TargetRoasSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetRoasSimulationPointList").msgclass
          PercentCpcBidSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PercentCpcBidSimulationPointList").msgclass
          BudgetSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BudgetSimulationPointList").msgclass
          TargetImpressionShareSimulationPointList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetImpressionShareSimulationPointList").msgclass
          BidModifierSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BidModifierSimulationPoint").msgclass
          CpcBidSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CpcBidSimulationPoint").msgclass
          CpvBidSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CpvBidSimulationPoint").msgclass
          TargetCpaSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetCpaSimulationPoint").msgclass
          TargetRoasSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetRoasSimulationPoint").msgclass
          PercentCpcBidSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.PercentCpcBidSimulationPoint").msgclass
          BudgetSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.BudgetSimulationPoint").msgclass
          TargetImpressionShareSimulationPoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.TargetImpressionShareSimulationPoint").msgclass
        end
      end
    end
  end
end
