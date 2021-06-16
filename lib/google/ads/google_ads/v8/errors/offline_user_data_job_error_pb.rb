# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/errors/offline_user_data_job_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/errors/offline_user_data_job_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.errors.OfflineUserDataJobErrorEnum" do
    end
    add_enum "google.ads.googleads.v8.errors.OfflineUserDataJobErrorEnum.OfflineUserDataJobError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :INVALID_USER_LIST_ID, 3
      value :INVALID_USER_LIST_TYPE, 4
      value :NOT_ON_ALLOWLIST_FOR_USER_ID, 33
      value :INCOMPATIBLE_UPLOAD_KEY_TYPE, 6
      value :MISSING_USER_IDENTIFIER, 7
      value :INVALID_MOBILE_ID_FORMAT, 8
      value :TOO_MANY_USER_IDENTIFIERS, 9
      value :NOT_ON_ALLOWLIST_FOR_STORE_SALES_DIRECT, 31
      value :NOT_ON_ALLOWLIST_FOR_UNIFIED_STORE_SALES, 32
      value :INVALID_PARTNER_ID, 11
      value :INVALID_ENCODING, 12
      value :INVALID_COUNTRY_CODE, 13
      value :INCOMPATIBLE_USER_IDENTIFIER, 14
      value :FUTURE_TRANSACTION_TIME, 15
      value :INVALID_CONVERSION_ACTION, 16
      value :MOBILE_ID_NOT_SUPPORTED, 17
      value :INVALID_OPERATION_ORDER, 18
      value :CONFLICTING_OPERATION, 19
      value :EXTERNAL_UPDATE_ID_ALREADY_EXISTS, 21
      value :JOB_ALREADY_STARTED, 22
      value :REMOVE_NOT_SUPPORTED, 23
      value :REMOVE_ALL_NOT_SUPPORTED, 24
      value :INVALID_SHA256_FORMAT, 25
      value :CUSTOM_KEY_DISABLED, 26
      value :CUSTOM_KEY_NOT_PREDEFINED, 27
      value :CUSTOM_KEY_NOT_SET, 29
      value :CUSTOMER_NOT_ACCEPTED_CUSTOMER_DATA_TERMS, 30
      value :ATTRIBUTES_NOT_APPLICABLE_FOR_CUSTOMER_MATCH_USER_LIST, 34
      value :LIFETIME_VALUE_BUCKET_NOT_IN_RANGE, 35
      value :INCOMPATIBLE_USER_IDENTIFIER_FOR_ATTRIBUTES, 36
      value :FUTURE_TIME_NOT_ALLOWED, 37
      value :LAST_PURCHASE_TIME_LESS_THAN_ACQUISITION_TIME, 38
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Errors
          OfflineUserDataJobErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.OfflineUserDataJobErrorEnum").msgclass
          OfflineUserDataJobErrorEnum::OfflineUserDataJobError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.OfflineUserDataJobErrorEnum.OfflineUserDataJobError").enummodule
        end
      end
    end
  end
end
