# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v1/enums/tracking_code_page_format.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v1.enums.TrackingCodePageFormatEnum" do
  end
  add_enum "google.ads.googleads.v1.enums.TrackingCodePageFormatEnum.TrackingCodePageFormat" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :HTML, 2
    value :AMP, 3
  end
end

module Google::Ads::GoogleAds::V1::Enums
  TrackingCodePageFormatEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.TrackingCodePageFormatEnum").msgclass
  TrackingCodePageFormatEnum::TrackingCodePageFormat = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v1.enums.TrackingCodePageFormatEnum.TrackingCodePageFormat").enummodule
end
