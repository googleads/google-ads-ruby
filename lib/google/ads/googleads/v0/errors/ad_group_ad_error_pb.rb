# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/errors/ad_group_ad_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.errors.AdGroupAdErrorEnum" do
  end
  add_enum "google.ads.googleads.v0.errors.AdGroupAdErrorEnum.AdGroupAdError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :AD_GROUP_AD_LABEL_DOES_NOT_EXIST, 2
    value :AD_GROUP_AD_LABEL_ALREADY_EXISTS, 3
    value :AD_NOT_UNDER_ADGROUP, 4
    value :CANNOT_OPERATE_ON_REMOVED_ADGROUPAD, 5
    value :CANNOT_CREATE_DEPRECATED_ADS, 6
    value :CANNOT_CREATE_TEXT_ADS, 7
    value :EMPTY_FIELD, 8
    value :RESOURCE_REFERENCED_IN_MULTIPLE_OPS, 9
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Errors
          AdGroupAdErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.AdGroupAdErrorEnum").msgclass
          AdGroupAdErrorEnum::AdGroupAdError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.AdGroupAdErrorEnum.AdGroupAdError").enummodule
        end
      end
    end
  end
end
