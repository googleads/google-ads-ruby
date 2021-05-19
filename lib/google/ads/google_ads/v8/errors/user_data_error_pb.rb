# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/errors/user_data_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/errors/user_data_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.errors.UserDataErrorEnum" do
    end
    add_enum "google.ads.googleads.v8.errors.UserDataErrorEnum.UserDataError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :OPERATIONS_FOR_CUSTOMER_MATCH_NOT_ALLOWED, 2
      value :TOO_MANY_USER_IDENTIFIERS, 3
      value :USER_LIST_NOT_APPLICABLE, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Errors
          UserDataErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.UserDataErrorEnum").msgclass
          UserDataErrorEnum::UserDataError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.errors.UserDataErrorEnum.UserDataError").enummodule
        end
      end
    end
  end
end
