# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/call_tracking_display_location.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/call_tracking_display_location.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CallTrackingDisplayLocationEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CallTrackingDisplayLocationEnum.CallTrackingDisplayLocation" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :AD, 2
      value :LANDING_PAGE, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CallTrackingDisplayLocationEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CallTrackingDisplayLocationEnum").msgclass
          CallTrackingDisplayLocationEnum::CallTrackingDisplayLocation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CallTrackingDisplayLocationEnum.CallTrackingDisplayLocation").enummodule
        end
      end
    end
  end
end
