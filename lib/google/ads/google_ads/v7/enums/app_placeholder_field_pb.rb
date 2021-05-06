# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/enums/app_placeholder_field.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/enums/app_placeholder_field.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.enums.AppPlaceholderFieldEnum" do
    end
    add_enum "google.ads.googleads.v7.enums.AppPlaceholderFieldEnum.AppPlaceholderField" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :STORE, 2
      value :ID, 3
      value :LINK_TEXT, 4
      value :URL, 5
      value :FINAL_URLS, 6
      value :FINAL_MOBILE_URLS, 7
      value :TRACKING_URL, 8
      value :FINAL_URL_SUFFIX, 9
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Enums
          AppPlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.enums.AppPlaceholderFieldEnum").msgclass
          AppPlaceholderFieldEnum::AppPlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.enums.AppPlaceholderFieldEnum.AppPlaceholderField").enummodule
        end
      end
    end
  end
end
