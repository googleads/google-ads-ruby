# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/enums/advertising_channel_sub_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.enums.AdvertisingChannelSubTypeEnum" do
  end
  add_enum "google.ads.googleads.v0.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubType" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :SEARCH_MOBILE_APP, 2
    value :SEARCH_EXPRESS, 4
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Enums
          AdvertisingChannelSubTypeEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.enums.AdvertisingChannelSubTypeEnum").msgclass
          AdvertisingChannelSubTypeEnum::AdvertisingChannelSubType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.enums.AdvertisingChannelSubTypeEnum.AdvertisingChannelSubType").enummodule
        end
      end
    end
  end
end
