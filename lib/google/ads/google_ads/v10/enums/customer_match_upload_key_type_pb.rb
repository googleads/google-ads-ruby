# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/customer_match_upload_key_type.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/customer_match_upload_key_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CustomerMatchUploadKeyTypeEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CustomerMatchUploadKeyTypeEnum.CustomerMatchUploadKeyType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CONTACT_INFO, 2
      value :CRM_ID, 3
      value :MOBILE_ADVERTISING_ID, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CustomerMatchUploadKeyTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomerMatchUploadKeyTypeEnum").msgclass
          CustomerMatchUploadKeyTypeEnum::CustomerMatchUploadKeyType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomerMatchUploadKeyTypeEnum.CustomerMatchUploadKeyType").enummodule
        end
      end
    end
  end
end
