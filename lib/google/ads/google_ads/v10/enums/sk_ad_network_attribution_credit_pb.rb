# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/sk_ad_network_attribution_credit.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/sk_ad_network_attribution_credit.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.SkAdNetworkAttributionCreditEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.SkAdNetworkAttributionCreditEnum.SkAdNetworkAttributionCredit" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :UNAVAILABLE, 2
      value :WON, 3
      value :CONTRIBUTED, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          SkAdNetworkAttributionCreditEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SkAdNetworkAttributionCreditEnum").msgclass
          SkAdNetworkAttributionCreditEnum::SkAdNetworkAttributionCredit = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SkAdNetworkAttributionCreditEnum.SkAdNetworkAttributionCredit").enummodule
        end
      end
    end
  end
end
