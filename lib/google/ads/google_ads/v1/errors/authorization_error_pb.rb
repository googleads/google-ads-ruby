# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/errors/authorization_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.errors.AuthorizationErrorEnum" do
  end
  add_enum "google.ads.googleads.v1.errors.AuthorizationErrorEnum.AuthorizationError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :USER_PERMISSION_DENIED, 2
    value :DEVELOPER_TOKEN_NOT_WHITELISTED, 3
    value :DEVELOPER_TOKEN_PROHIBITED, 4
    value :PROJECT_DISABLED, 5
    value :AUTHORIZATION_ERROR, 6
    value :ACTION_NOT_PERMITTED, 7
    value :INCOMPLETE_SIGNUP, 8
    value :CUSTOMER_NOT_ENABLED, 24
    value :MISSING_TOS, 9
    value :DEVELOPER_TOKEN_NOT_APPROVED, 10
  end
end

module Google::Ads::GoogleAds::V1::Errors
  AuthorizationErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.AuthorizationErrorEnum").msgclass
  AuthorizationErrorEnum::AuthorizationError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.AuthorizationErrorEnum.AuthorizationError").enummodule
end
