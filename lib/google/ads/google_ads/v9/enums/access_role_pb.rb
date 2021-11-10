# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v9/enums/access_role.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v9/enums/access_role.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v9.enums.AccessRoleEnum" do
    end
    add_enum "google.ads.googleads.v9.enums.AccessRoleEnum.AccessRole" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ADMIN, 2
      value :STANDARD, 3
      value :READ_ONLY, 4
      value :EMAIL_ONLY, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V9
        module Enums
          AccessRoleEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.enums.AccessRoleEnum").msgclass
          AccessRoleEnum::AccessRole = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.enums.AccessRoleEnum.AccessRole").enummodule
        end
      end
    end
  end
end
