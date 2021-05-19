# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/conversion_action_category.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/conversion_action_category.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.ConversionActionCategoryEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.ConversionActionCategoryEnum.ConversionActionCategory" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :DEFAULT, 2
      value :PAGE_VIEW, 3
      value :PURCHASE, 4
      value :SIGNUP, 5
      value :LEAD, 6
      value :DOWNLOAD, 7
      value :ADD_TO_CART, 8
      value :BEGIN_CHECKOUT, 9
      value :SUBSCRIBE_PAID, 10
      value :PHONE_CALL_LEAD, 11
      value :IMPORTED_LEAD, 12
      value :SUBMIT_LEAD_FORM, 13
      value :BOOK_APPOINTMENT, 14
      value :REQUEST_QUOTE, 15
      value :GET_DIRECTIONS, 16
      value :OUTBOUND_CLICK, 17
      value :CONTACT, 18
      value :ENGAGEMENT, 19
      value :STORE_VISIT, 20
      value :STORE_SALE, 21
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          ConversionActionCategoryEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.ConversionActionCategoryEnum").msgclass
          ConversionActionCategoryEnum::ConversionActionCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.ConversionActionCategoryEnum.ConversionActionCategory").enummodule
        end
      end
    end
  end
end
