# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/errors/setting_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.errors.SettingErrorEnum" do
  end
  add_enum "google.ads.googleads.v4.errors.SettingErrorEnum.SettingError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :SETTING_TYPE_IS_NOT_AVAILABLE, 3
    value :SETTING_TYPE_IS_NOT_COMPATIBLE_WITH_CAMPAIGN, 4
    value :TARGETING_SETTING_CONTAINS_INVALID_CRITERION_TYPE_GROUP, 5
    value :TARGETING_SETTING_DEMOGRAPHIC_CRITERION_TYPE_GROUPS_MUST_BE_SET_TO_TARGET_ALL, 6
    value :TARGETING_SETTING_CANNOT_CHANGE_TARGET_ALL_TO_FALSE_FOR_DEMOGRAPHIC_CRITERION_TYPE_GROUP, 7
    value :DYNAMIC_SEARCH_ADS_SETTING_AT_LEAST_ONE_FEED_ID_MUST_BE_PRESENT, 8
    value :DYNAMIC_SEARCH_ADS_SETTING_CONTAINS_INVALID_DOMAIN_NAME, 9
    value :DYNAMIC_SEARCH_ADS_SETTING_CONTAINS_SUBDOMAIN_NAME, 10
    value :DYNAMIC_SEARCH_ADS_SETTING_CONTAINS_INVALID_LANGUAGE_CODE, 11
    value :TARGET_ALL_IS_NOT_ALLOWED_FOR_PLACEMENT_IN_SEARCH_CAMPAIGN, 12
    value :SETTING_VALUE_NOT_COMPATIBLE_WITH_CAMPAIGN, 20
  end
end

module Google::Ads::GoogleAds::V4::Errors
  SettingErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.SettingErrorEnum").msgclass
  SettingErrorEnum::SettingError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.errors.SettingErrorEnum.SettingError").enummodule
end
