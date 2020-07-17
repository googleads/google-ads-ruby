# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/errors/ad_group_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.errors.AdGroupErrorEnum" do
  end
  add_enum "google.ads.googleads.v4.errors.AdGroupErrorEnum.AdGroupError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :DUPLICATE_ADGROUP_NAME, 2
    value :INVALID_ADGROUP_NAME, 3
    value :ADVERTISER_NOT_ON_CONTENT_NETWORK, 5
    value :BID_TOO_BIG, 6
    value :BID_TYPE_AND_BIDDING_STRATEGY_MISMATCH, 7
    value :MISSING_ADGROUP_NAME, 8
    value :ADGROUP_LABEL_DOES_NOT_EXIST, 9
    value :ADGROUP_LABEL_ALREADY_EXISTS, 10
    value :INVALID_CONTENT_BID_CRITERION_TYPE_GROUP, 11
    value :AD_GROUP_TYPE_NOT_VALID_FOR_ADVERTISING_CHANNEL_TYPE, 12
    value :ADGROUP_TYPE_NOT_SUPPORTED_FOR_CAMPAIGN_SALES_COUNTRY, 13
    value :CANNOT_ADD_ADGROUP_OF_TYPE_DSA_TO_CAMPAIGN_WITHOUT_DSA_SETTING, 14
    value :PROMOTED_HOTEL_AD_GROUPS_NOT_AVAILABLE_FOR_CUSTOMER, 15
  end
end

module Google::Ads::GoogleAds::V4::Errors
  AdGroupErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.AdGroupErrorEnum").msgclass
  AdGroupErrorEnum::AdGroupError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.AdGroupErrorEnum.AdGroupError").enummodule
end
