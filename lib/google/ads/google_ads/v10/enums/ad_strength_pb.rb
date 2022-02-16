# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/ad_strength.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/ad_strength.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.AdStrengthEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.AdStrengthEnum.AdStrength" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PENDING, 2
      value :NO_ADS, 3
      value :POOR, 4
      value :AVERAGE, 5
      value :GOOD, 6
      value :EXCELLENT, 7
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          AdStrengthEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AdStrengthEnum").msgclass
          AdStrengthEnum::AdStrength = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.AdStrengthEnum.AdStrength").enummodule
        end
      end
    end
  end
end
