# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/enums/access_role.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.enums.AccessRoleEnum" do
  end
  add_enum "google.ads.googleads.v4.enums.AccessRoleEnum.AccessRole" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :ADMIN, 2
    value :STANDARD, 3
    value :READ_ONLY, 4
  end
end

module Google::Ads::GoogleAds::V4::Enums
  AccessRoleEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.AccessRoleEnum").msgclass
  AccessRoleEnum::AccessRole = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.enums.AccessRoleEnum.AccessRole").enummodule
end
