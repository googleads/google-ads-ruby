# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/errors/bidding_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/errors/bidding_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.errors.BiddingErrorEnum" do
    end
    add_enum "google.ads.googleads.v8.errors.BiddingErrorEnum.BiddingError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :BIDDING_STRATEGY_TRANSITION_NOT_ALLOWED, 2
      value :CANNOT_ATTACH_BIDDING_STRATEGY_TO_CAMPAIGN, 7
      value :INVALID_ANONYMOUS_BIDDING_STRATEGY_TYPE, 10
      value :INVALID_BIDDING_STRATEGY_TYPE, 14
      value :INVALID_BID, 17
      value :BIDDING_STRATEGY_NOT_AVAILABLE_FOR_ACCOUNT_TYPE, 18
      value :CONVERSION_TRACKING_NOT_ENABLED, 19
      value :NOT_ENOUGH_CONVERSIONS, 20
      value :CANNOT_CREATE_CAMPAIGN_WITH_BIDDING_STRATEGY, 21
      value :CANNOT_TARGET_CONTENT_NETWORK_ONLY_WITH_CAMPAIGN_LEVEL_POP_BIDDING_STRATEGY, 23
      value :BIDDING_STRATEGY_NOT_SUPPORTED_WITH_AD_SCHEDULE, 24
      value :PAY_PER_CONVERSION_NOT_AVAILABLE_FOR_CUSTOMER, 25
      value :PAY_PER_CONVERSION_NOT_ALLOWED_WITH_TARGET_CPA, 26
      value :BIDDING_STRATEGY_NOT_ALLOWED_FOR_SEARCH_ONLY_CAMPAIGNS, 27
      value :BIDDING_STRATEGY_NOT_SUPPORTED_IN_DRAFTS_OR_EXPERIMENTS, 28
      value :BIDDING_STRATEGY_TYPE_DOES_NOT_SUPPORT_PRODUCT_TYPE_ADGROUP_CRITERION, 29
      value :BID_TOO_SMALL, 30
      value :BID_TOO_BIG, 31
      value :BID_TOO_MANY_FRACTIONAL_DIGITS, 32
      value :INVALID_DOMAIN_NAME, 33
      value :NOT_COMPATIBLE_WITH_PAYMENT_MODE, 34
      value :NOT_COMPATIBLE_WITH_BUDGET_TYPE, 35
      value :NOT_COMPATIBLE_WITH_BIDDING_STRATEGY_TYPE, 36
      value :BIDDING_STRATEGY_TYPE_INCOMPATIBLE_WITH_SHARED_BUDGET, 37
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Errors
          BiddingErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.BiddingErrorEnum").msgclass
          BiddingErrorEnum::BiddingError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.BiddingErrorEnum.BiddingError").enummodule
        end
      end
    end
  end
end
