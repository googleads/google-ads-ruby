# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/enums/call_conversion_reporting_state.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/enums/call_conversion_reporting_state.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.enums.CallConversionReportingStateEnum" do
    end
    add_enum "google.ads.googleads.v11.enums.CallConversionReportingStateEnum.CallConversionReportingState" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :DISABLED, 2
      value :USE_ACCOUNT_LEVEL_CALL_CONVERSION_ACTION, 3
      value :USE_RESOURCE_LEVEL_CALL_CONVERSION_ACTION, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Enums
          CallConversionReportingStateEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.CallConversionReportingStateEnum").msgclass
          CallConversionReportingStateEnum::CallConversionReportingState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.enums.CallConversionReportingStateEnum.CallConversionReportingState").enummodule
        end
      end
    end
  end
end
