# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/operator_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/operator_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.OperatorErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.OperatorErrorEnum.OperatorError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :OPERATOR_NOT_SUPPORTED, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          OperatorErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.OperatorErrorEnum").msgclass
          OperatorErrorEnum::OperatorError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.OperatorErrorEnum.OperatorError").enummodule
        end
      end
    end
  end
end
