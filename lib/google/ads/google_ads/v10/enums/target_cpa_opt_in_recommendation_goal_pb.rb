# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/target_cpa_opt_in_recommendation_goal.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/target_cpa_opt_in_recommendation_goal.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.TargetCpaOptInRecommendationGoalEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.TargetCpaOptInRecommendationGoalEnum.TargetCpaOptInRecommendationGoal" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :SAME_COST, 2
      value :SAME_CONVERSIONS, 3
      value :SAME_CPA, 4
      value :CLOSEST_CPA, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          TargetCpaOptInRecommendationGoalEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.TargetCpaOptInRecommendationGoalEnum").msgclass
          TargetCpaOptInRecommendationGoalEnum::TargetCpaOptInRecommendationGoal = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.TargetCpaOptInRecommendationGoalEnum.TargetCpaOptInRecommendationGoal").enummodule
        end
      end
    end
  end
end
