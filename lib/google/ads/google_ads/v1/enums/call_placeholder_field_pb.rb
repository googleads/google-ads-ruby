# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/call_placeholder_field.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.CallPlaceholderFieldEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.CallPlaceholderFieldEnum.CallPlaceholderField" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :PHONE_NUMBER, 2
    value :COUNTRY_CODE, 3
    value :TRACKED, 4
    value :CONVERSION_TYPE_ID, 5
    value :CONVERSION_REPORTING_STATE, 6
  end
end

module Google::Ads::GoogleAds::V1::Enums
  CallPlaceholderFieldEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.CallPlaceholderFieldEnum").msgclass
  CallPlaceholderFieldEnum::CallPlaceholderField = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.CallPlaceholderFieldEnum.CallPlaceholderField").enummodule
end
