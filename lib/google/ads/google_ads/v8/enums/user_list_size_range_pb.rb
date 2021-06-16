# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/user_list_size_range.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/user_list_size_range.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.UserListSizeRangeEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.UserListSizeRangeEnum.UserListSizeRange" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :LESS_THAN_FIVE_HUNDRED, 2
      value :LESS_THAN_ONE_THOUSAND, 3
      value :ONE_THOUSAND_TO_TEN_THOUSAND, 4
      value :TEN_THOUSAND_TO_FIFTY_THOUSAND, 5
      value :FIFTY_THOUSAND_TO_ONE_HUNDRED_THOUSAND, 6
      value :ONE_HUNDRED_THOUSAND_TO_THREE_HUNDRED_THOUSAND, 7
      value :THREE_HUNDRED_THOUSAND_TO_FIVE_HUNDRED_THOUSAND, 8
      value :FIVE_HUNDRED_THOUSAND_TO_ONE_MILLION, 9
      value :ONE_MILLION_TO_TWO_MILLION, 10
      value :TWO_MILLION_TO_THREE_MILLION, 11
      value :THREE_MILLION_TO_FIVE_MILLION, 12
      value :FIVE_MILLION_TO_TEN_MILLION, 13
      value :TEN_MILLION_TO_TWENTY_MILLION, 14
      value :TWENTY_MILLION_TO_THIRTY_MILLION, 15
      value :THIRTY_MILLION_TO_FIFTY_MILLION, 16
      value :OVER_FIFTY_MILLION, 17
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          UserListSizeRangeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.UserListSizeRangeEnum").msgclass
          UserListSizeRangeEnum::UserListSizeRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.UserListSizeRangeEnum.UserListSizeRange").enummodule
        end
      end
    end
  end
end
