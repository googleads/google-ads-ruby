# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/errors/policy_validation_parameter_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.errors.PolicyValidationParameterErrorEnum" do
  end
  add_enum "google.ads.googleads.v1.errors.PolicyValidationParameterErrorEnum.PolicyValidationParameterError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :UNSUPPORTED_AD_TYPE_FOR_IGNORABLE_POLICY_TOPICS, 2
    value :UNSUPPORTED_AD_TYPE_FOR_EXEMPT_POLICY_VIOLATION_KEYS, 3
    value :CANNOT_SET_BOTH_IGNORABLE_POLICY_TOPICS_AND_EXEMPT_POLICY_VIOLATION_KEYS, 4
  end
end

module Google::Ads::GoogleAds::V1::Errors
  PolicyValidationParameterErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.PolicyValidationParameterErrorEnum").msgclass
  PolicyValidationParameterErrorEnum::PolicyValidationParameterError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.errors.PolicyValidationParameterErrorEnum.PolicyValidationParameterError").enummodule
end
