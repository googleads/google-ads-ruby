# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/spending_limit_type.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/spending_limit_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.SpendingLimitTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.SpendingLimitTypeEnum.SpendingLimitType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :INFINITE, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          SpendingLimitTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SpendingLimitTypeEnum").msgclass
          SpendingLimitTypeEnum::SpendingLimitType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SpendingLimitTypeEnum.SpendingLimitType").enummodule
        end
      end
    end
  end
end
