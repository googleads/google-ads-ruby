# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/common/value.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.common.Value" do
    oneof :value do
      optional :boolean_value, :bool, 1
      optional :int64_value, :int64, 2
      optional :float_value, :float, 3
      optional :double_value, :double, 4
      optional :string_value, :string, 5
    end
  end
end

module Google::Ads::GoogleAds::V4::Common
  Value = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.common.Value").msgclass
end
