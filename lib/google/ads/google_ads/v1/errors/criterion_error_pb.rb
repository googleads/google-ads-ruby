# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/errors/criterion_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.errors.CriterionErrorEnum" do
  end
  add_enum "google.ads.googleads.v1.errors.CriterionErrorEnum.CriterionError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :CONCRETE_TYPE_REQUIRED, 2
    value :INVALID_EXCLUDED_CATEGORY, 3
    value :INVALID_KEYWORD_TEXT, 4
    value :KEYWORD_TEXT_TOO_LONG, 5
    value :KEYWORD_HAS_TOO_MANY_WORDS, 6
    value :KEYWORD_HAS_INVALID_CHARS, 7
    value :INVALID_PLACEMENT_URL, 8
    value :INVALID_USER_LIST, 9
    value :INVALID_USER_INTEREST, 10
    value :INVALID_FORMAT_FOR_PLACEMENT_URL, 11
    value :PLACEMENT_URL_IS_TOO_LONG, 12
    value :PLACEMENT_URL_HAS_ILLEGAL_CHAR, 13
    value :PLACEMENT_URL_HAS_MULTIPLE_SITES_IN_LINE, 14
    value :PLACEMENT_IS_NOT_AVAILABLE_FOR_TARGETING_OR_EXCLUSION, 15
    value :INVALID_TOPIC_PATH, 16
    value :INVALID_YOUTUBE_CHANNEL_ID, 17
    value :INVALID_YOUTUBE_VIDEO_ID, 18
    value :YOUTUBE_VERTICAL_CHANNEL_DEPRECATED, 19
    value :YOUTUBE_DEMOGRAPHIC_CHANNEL_DEPRECATED, 20
    value :YOUTUBE_URL_UNSUPPORTED, 21
    value :CANNOT_EXCLUDE_CRITERIA_TYPE, 22
    value :CANNOT_ADD_CRITERIA_TYPE, 23
    value :INVALID_PRODUCT_FILTER, 24
    value :PRODUCT_FILTER_TOO_LONG, 25
    value :CANNOT_EXCLUDE_SIMILAR_USER_LIST, 26
    value :CANNOT_ADD_CLOSED_USER_LIST, 27
    value :CANNOT_ADD_DISPLAY_ONLY_LISTS_TO_SEARCH_ONLY_CAMPAIGNS, 28
    value :CANNOT_ADD_DISPLAY_ONLY_LISTS_TO_SEARCH_CAMPAIGNS, 29
    value :CANNOT_ADD_DISPLAY_ONLY_LISTS_TO_SHOPPING_CAMPAIGNS, 30
    value :CANNOT_ADD_USER_INTERESTS_TO_SEARCH_CAMPAIGNS, 31
    value :CANNOT_SET_BIDS_ON_CRITERION_TYPE_IN_SEARCH_CAMPAIGNS, 32
    value :CANNOT_ADD_URLS_TO_CRITERION_TYPE_FOR_CAMPAIGN_TYPE, 33
    value :INVALID_CUSTOM_AFFINITY, 96
    value :INVALID_CUSTOM_INTENT, 97
    value :INVALID_IP_ADDRESS, 34
    value :INVALID_IP_FORMAT, 35
    value :INVALID_MOBILE_APP, 36
    value :INVALID_MOBILE_APP_CATEGORY, 37
    value :INVALID_CRITERION_ID, 38
    value :CANNOT_TARGET_CRITERION, 39
    value :CANNOT_TARGET_OBSOLETE_CRITERION, 40
    value :CRITERION_ID_AND_TYPE_MISMATCH, 41
    value :INVALID_PROXIMITY_RADIUS, 42
    value :INVALID_PROXIMITY_RADIUS_UNITS, 43
    value :INVALID_STREETADDRESS_LENGTH, 44
    value :INVALID_CITYNAME_LENGTH, 45
    value :INVALID_REGIONCODE_LENGTH, 46
    value :INVALID_REGIONNAME_LENGTH, 47
    value :INVALID_POSTALCODE_LENGTH, 48
    value :INVALID_COUNTRY_CODE, 49
    value :INVALID_LATITUDE, 50
    value :INVALID_LONGITUDE, 51
    value :PROXIMITY_GEOPOINT_AND_ADDRESS_BOTH_CANNOT_BE_NULL, 52
    value :INVALID_PROXIMITY_ADDRESS, 53
    value :INVALID_USER_DOMAIN_NAME, 54
    value :CRITERION_PARAMETER_TOO_LONG, 55
    value :AD_SCHEDULE_TIME_INTERVALS_OVERLAP, 56
    value :AD_SCHEDULE_INTERVAL_CANNOT_SPAN_MULTIPLE_DAYS, 57
    value :AD_SCHEDULE_INVALID_TIME_INTERVAL, 58
    value :AD_SCHEDULE_EXCEEDED_INTERVALS_PER_DAY_LIMIT, 59
    value :AD_SCHEDULE_CRITERION_ID_MISMATCHING_FIELDS, 60
    value :CANNOT_BID_MODIFY_CRITERION_TYPE, 61
    value :CANNOT_BID_MODIFY_CRITERION_CAMPAIGN_OPTED_OUT, 62
    value :CANNOT_BID_MODIFY_NEGATIVE_CRITERION, 63
    value :BID_MODIFIER_ALREADY_EXISTS, 64
    value :FEED_ID_NOT_ALLOWED, 65
    value :ACCOUNT_INELIGIBLE_FOR_CRITERIA_TYPE, 66
    value :CRITERIA_TYPE_INVALID_FOR_BIDDING_STRATEGY, 67
    value :CANNOT_EXCLUDE_CRITERION, 68
    value :CANNOT_REMOVE_CRITERION, 69
    value :PRODUCT_SCOPE_TOO_LONG, 70
    value :PRODUCT_SCOPE_TOO_MANY_DIMENSIONS, 71
    value :PRODUCT_PARTITION_TOO_LONG, 72
    value :PRODUCT_PARTITION_TOO_MANY_DIMENSIONS, 73
    value :INVALID_PRODUCT_DIMENSION, 74
    value :INVALID_PRODUCT_DIMENSION_TYPE, 75
    value :INVALID_PRODUCT_BIDDING_CATEGORY, 76
    value :MISSING_SHOPPING_SETTING, 77
    value :INVALID_MATCHING_FUNCTION, 78
    value :LOCATION_FILTER_NOT_ALLOWED, 79
    value :INVALID_FEED_FOR_LOCATION_FILTER, 98
    value :LOCATION_FILTER_INVALID, 80
    value :CANNOT_ATTACH_CRITERIA_AT_CAMPAIGN_AND_ADGROUP, 81
    value :HOTEL_LENGTH_OF_STAY_OVERLAPS_WITH_EXISTING_CRITERION, 82
    value :HOTEL_ADVANCE_BOOKING_WINDOW_OVERLAPS_WITH_EXISTING_CRITERION, 83
    value :FIELD_INCOMPATIBLE_WITH_NEGATIVE_TARGETING, 84
    value :INVALID_WEBPAGE_CONDITION, 85
    value :INVALID_WEBPAGE_CONDITION_URL, 86
    value :WEBPAGE_CONDITION_URL_CANNOT_BE_EMPTY, 87
    value :WEBPAGE_CONDITION_URL_UNSUPPORTED_PROTOCOL, 88
    value :WEBPAGE_CONDITION_URL_CANNOT_BE_IP_ADDRESS, 89
    value :WEBPAGE_CONDITION_URL_DOMAIN_NOT_CONSISTENT_WITH_CAMPAIGN_SETTING, 90
    value :WEBPAGE_CONDITION_URL_CANNOT_BE_PUBLIC_SUFFIX, 91
    value :WEBPAGE_CONDITION_URL_INVALID_PUBLIC_SUFFIX, 92
    value :WEBPAGE_CONDITION_URL_VALUE_TRACK_VALUE_NOT_SUPPORTED, 93
    value :WEBPAGE_CRITERION_URL_EQUALS_CAN_HAVE_ONLY_ONE_CONDITION, 94
    value :WEBPAGE_CRITERION_NOT_SUPPORTED_ON_NON_DSA_AD_GROUP, 95
  end
end

module Google::Ads::GoogleAds::V1::Errors
  CriterionErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.CriterionErrorEnum").msgclass
  CriterionErrorEnum::CriterionError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.CriterionErrorEnum.CriterionError").enummodule
end
