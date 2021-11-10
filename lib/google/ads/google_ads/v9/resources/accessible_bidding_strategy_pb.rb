# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v9/resources/accessible_bidding_strategy.proto

require 'google/ads/google_ads/v9/enums/bidding_strategy_type_pb'
require 'google/ads/google_ads/v9/enums/target_impression_share_location_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v9/resources/accessible_bidding_strategy.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy" do
      optional :resource_name, :string, 1
      optional :id, :int64, 2
      optional :name, :string, 3
      optional :type, :enum, 4, "google.ads.googleads.v9.enums.BiddingStrategyTypeEnum.BiddingStrategyType"
      optional :owner_customer_id, :int64, 5
      optional :owner_descriptive_name, :string, 6
      oneof :scheme do
        optional :maximize_conversion_value, :message, 7, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversionValue"
        optional :maximize_conversions, :message, 8, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversions"
        optional :target_cpa, :message, 9, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetCpa"
        optional :target_impression_share, :message, 10, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetImpressionShare"
        optional :target_roas, :message, 11, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetRoas"
        optional :target_spend, :message, 12, "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetSpend"
      end
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversionValue" do
      optional :target_roas, :double, 1
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversions" do
      optional :target_cpa, :int64, 1
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetImpressionShare" do
      optional :location, :enum, 1, "google.ads.googleads.v9.enums.TargetImpressionShareLocationEnum.TargetImpressionShareLocation"
      proto3_optional :location_fraction_micros, :int64, 2
      proto3_optional :cpc_bid_ceiling_micros, :int64, 3
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetCpa" do
      proto3_optional :target_cpa_micros, :int64, 1
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetRoas" do
      proto3_optional :target_roas, :double, 1
    end
    add_message "google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetSpend" do
      proto3_optional :target_spend_micros, :int64, 1
      proto3_optional :cpc_bid_ceiling_micros, :int64, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V9
        module Resources
          AccessibleBiddingStrategy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy").msgclass
          AccessibleBiddingStrategy::MaximizeConversionValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversionValue").msgclass
          AccessibleBiddingStrategy::MaximizeConversions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.MaximizeConversions").msgclass
          AccessibleBiddingStrategy::TargetImpressionShare = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetImpressionShare").msgclass
          AccessibleBiddingStrategy::TargetCpa = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetCpa").msgclass
          AccessibleBiddingStrategy::TargetRoas = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetRoas").msgclass
          AccessibleBiddingStrategy::TargetSpend = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.resources.AccessibleBiddingStrategy.TargetSpend").msgclass
        end
      end
    end
  end
end
