# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/customizer_value_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/customizer_value_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CustomizerValueStatusEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CustomizerValueStatusEnum.CustomizerValueStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ENABLED, 2
      value :REMOVED, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CustomizerValueStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomizerValueStatusEnum").msgclass
          CustomizerValueStatusEnum::CustomizerValueStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CustomizerValueStatusEnum.CustomizerValueStatus").enummodule
        end
      end
    end
  end
end
