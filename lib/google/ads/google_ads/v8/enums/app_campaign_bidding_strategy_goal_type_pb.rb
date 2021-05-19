# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/app_campaign_bidding_strategy_goal_type.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/app_campaign_bidding_strategy_goal_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.AppCampaignBiddingStrategyGoalTypeEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.AppCampaignBiddingStrategyGoalTypeEnum.AppCampaignBiddingStrategyGoalType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :OPTIMIZE_INSTALLS_TARGET_INSTALL_COST, 2
      value :OPTIMIZE_IN_APP_CONVERSIONS_TARGET_INSTALL_COST, 3
      value :OPTIMIZE_IN_APP_CONVERSIONS_TARGET_CONVERSION_COST, 4
      value :OPTIMIZE_RETURN_ON_ADVERTISING_SPEND, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          AppCampaignBiddingStrategyGoalTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.AppCampaignBiddingStrategyGoalTypeEnum").msgclass
          AppCampaignBiddingStrategyGoalTypeEnum::AppCampaignBiddingStrategyGoalType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.AppCampaignBiddingStrategyGoalTypeEnum.AppCampaignBiddingStrategyGoalType").enummodule
        end
      end
    end
  end
end
