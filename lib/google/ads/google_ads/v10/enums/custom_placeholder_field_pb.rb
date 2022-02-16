# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/custom_placeholder_field.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/custom_placeholder_field.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CustomPlaceholderFieldEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CustomPlaceholderFieldEnum.CustomPlaceholderField" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ID, 2
      value :ID2, 3
      value :ITEM_TITLE, 4
      value :ITEM_SUBTITLE, 5
      value :ITEM_DESCRIPTION, 6
      value :ITEM_ADDRESS, 7
      value :PRICE, 8
      value :FORMATTED_PRICE, 9
      value :SALE_PRICE, 10
      value :FORMATTED_SALE_PRICE, 11
      value :IMAGE_URL, 12
      value :ITEM_CATEGORY, 13
      value :FINAL_URLS, 14
      value :FINAL_MOBILE_URLS, 15
      value :TRACKING_URL, 16
      value :CONTEXTUAL_KEYWORDS, 17
      value :ANDROID_APP_LINK, 18
      value :SIMILAR_IDS, 19
      value :IOS_APP_LINK, 20
      value :IOS_APP_STORE_ID, 21
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CustomPlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomPlaceholderFieldEnum").msgclass
          CustomPlaceholderFieldEnum::CustomPlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomPlaceholderFieldEnum.CustomPlaceholderField").enummodule
        end
      end
    end
  end
end
