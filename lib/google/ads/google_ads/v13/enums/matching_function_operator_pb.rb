# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/matching_function_operator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/matching_function_operator.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.MatchingFunctionOperatorEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.MatchingFunctionOperatorEnum.MatchingFunctionOperator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :IN, 2
      value :IDENTITY, 3
      value :EQUALS, 4
      value :AND, 5
      value :CONTAINS_ANY, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          MatchingFunctionOperatorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.MatchingFunctionOperatorEnum").msgclass
          MatchingFunctionOperatorEnum::MatchingFunctionOperator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.MatchingFunctionOperatorEnum.MatchingFunctionOperator").enummodule
        end
      end
    end
  end
end
