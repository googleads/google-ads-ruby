# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/common/dates.proto

require 'google/protobuf'

require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.common.DateRange" do
    optional :start_date, :message, 1, "google.protobuf.StringValue"
    optional :end_date, :message, 2, "google.protobuf.StringValue"
  end
end

module Google::Ads::GoogleAds::V4::Common
  DateRange = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.common.DateRange").msgclass
end
