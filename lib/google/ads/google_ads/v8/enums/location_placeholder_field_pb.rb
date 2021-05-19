# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v8/enums/location_placeholder_field.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v8/enums/location_placeholder_field.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v8.enums.LocationPlaceholderFieldEnum" do
    end
    add_enum "google.ads.googleads.v8.enums.LocationPlaceholderFieldEnum.LocationPlaceholderField" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :BUSINESS_NAME, 2
      value :ADDRESS_LINE_1, 3
      value :ADDRESS_LINE_2, 4
      value :CITY, 5
      value :PROVINCE, 6
      value :POSTAL_CODE, 7
      value :COUNTRY_CODE, 8
      value :PHONE_NUMBER, 9
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V8
        module Enums
          LocationPlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.LocationPlaceholderFieldEnum").msgclass
          LocationPlaceholderFieldEnum::LocationPlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v8.enums.LocationPlaceholderFieldEnum.LocationPlaceholderField").enummodule
        end
      end
    end
  end
end
