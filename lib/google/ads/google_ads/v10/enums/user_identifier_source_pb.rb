# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/user_identifier_source.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/user_identifier_source.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.UserIdentifierSourceEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.UserIdentifierSourceEnum.UserIdentifierSource" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :FIRST_PARTY, 2
      value :THIRD_PARTY, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          UserIdentifierSourceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.UserIdentifierSourceEnum").msgclass
          UserIdentifierSourceEnum::UserIdentifierSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.UserIdentifierSourceEnum.UserIdentifierSource").enummodule
        end
      end
    end
  end
end
