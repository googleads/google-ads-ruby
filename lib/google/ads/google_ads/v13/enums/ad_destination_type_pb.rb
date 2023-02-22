# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/ad_destination_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/ad_destination_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.AdDestinationTypeEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.AdDestinationTypeEnum.AdDestinationType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :NOT_APPLICABLE, 2
      value :WEBSITE, 3
      value :APP_DEEP_LINK, 4
      value :APP_STORE, 5
      value :PHONE_CALL, 6
      value :MAP_DIRECTIONS, 7
      value :LOCATION_LISTING, 8
      value :MESSAGE, 9
      value :LEAD_FORM, 10
      value :YOUTUBE, 11
      value :UNMODELED_FOR_CONVERSIONS, 12
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          AdDestinationTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AdDestinationTypeEnum").msgclass
          AdDestinationTypeEnum::AdDestinationType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AdDestinationTypeEnum.AdDestinationType").enummodule
        end
      end
    end
  end
end
