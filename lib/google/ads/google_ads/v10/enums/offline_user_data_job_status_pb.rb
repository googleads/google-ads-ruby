# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/offline_user_data_job_status.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/offline_user_data_job_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.OfflineUserDataJobStatusEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.OfflineUserDataJobStatusEnum.OfflineUserDataJobStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PENDING, 2
      value :RUNNING, 3
      value :SUCCESS, 4
      value :FAILED, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          OfflineUserDataJobStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.OfflineUserDataJobStatusEnum").msgclass
          OfflineUserDataJobStatusEnum::OfflineUserDataJobStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.OfflineUserDataJobStatusEnum.OfflineUserDataJobStatus").enummodule
        end
      end
    end
  end
end
