# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/enums/change_status_operation.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/enums/change_status_operation.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.enums.ChangeStatusOperationEnum" do
    end
    add_enum "google.ads.googleads.v7.enums.ChangeStatusOperationEnum.ChangeStatusOperation" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ADDED, 2
      value :CHANGED, 3
      value :REMOVED, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Enums
          ChangeStatusOperationEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.enums.ChangeStatusOperationEnum").msgclass
          ChangeStatusOperationEnum::ChangeStatusOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.enums.ChangeStatusOperationEnum.ChangeStatusOperation").enummodule
        end
      end
    end
  end
end
