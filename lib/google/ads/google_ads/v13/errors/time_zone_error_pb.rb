# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/errors/time_zone_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/errors/time_zone_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.errors.TimeZoneErrorEnum" do
    end
    add_enum "google.ads.googleads.v13.errors.TimeZoneErrorEnum.TimeZoneError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :INVALID_TIME_ZONE, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Errors
          TimeZoneErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.TimeZoneErrorEnum").msgclass
          TimeZoneErrorEnum::TimeZoneError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.TimeZoneErrorEnum.TimeZoneError").enummodule
        end
      end
    end
  end
end