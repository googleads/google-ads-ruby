# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/enums/webpage_condition_operator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/enums/webpage_condition_operator.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.enums.WebpageConditionOperatorEnum" do
    end
    add_enum "google.ads.googleads.v12.enums.WebpageConditionOperatorEnum.WebpageConditionOperator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :EQUALS, 2
      value :CONTAINS, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Enums
          WebpageConditionOperatorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.WebpageConditionOperatorEnum").msgclass
          WebpageConditionOperatorEnum::WebpageConditionOperator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.WebpageConditionOperatorEnum.WebpageConditionOperator").enummodule
        end
      end
    end
  end
end
