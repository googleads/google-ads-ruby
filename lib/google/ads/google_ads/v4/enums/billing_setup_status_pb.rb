# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/billing_setup_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.BillingSetupStatusEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.BillingSetupStatusEnum.BillingSetupStatus" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :PENDING, 2
    value :APPROVED_HELD, 3
    value :APPROVED, 4
    value :CANCELLED, 5
  end
end

module Google::Ads::GoogleAds::V4::Enums
  BillingSetupStatusEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.BillingSetupStatusEnum").msgclass
  BillingSetupStatusEnum::BillingSetupStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.BillingSetupStatusEnum.BillingSetupStatus").enummodule
end
