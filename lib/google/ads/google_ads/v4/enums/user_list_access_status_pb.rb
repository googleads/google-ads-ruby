# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/user_list_access_status.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.UserListAccessStatusEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.UserListAccessStatusEnum.UserListAccessStatus" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ENABLED, 2
    value :DISABLED, 3
  end
end

module Google::Ads::GoogleAds::V4::Enums
  UserListAccessStatusEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.UserListAccessStatusEnum").msgclass
  UserListAccessStatusEnum::UserListAccessStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.UserListAccessStatusEnum.UserListAccessStatus").enummodule
end
