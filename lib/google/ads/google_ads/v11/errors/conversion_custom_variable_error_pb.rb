# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/errors/conversion_custom_variable_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/errors/conversion_custom_variable_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.errors.ConversionCustomVariableErrorEnum" do
    end
    add_enum "google.ads.googleads.v11.errors.ConversionCustomVariableErrorEnum.ConversionCustomVariableError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :DUPLICATE_NAME, 2
      value :DUPLICATE_TAG, 3
      value :RESERVED_TAG, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Errors
          ConversionCustomVariableErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.errors.ConversionCustomVariableErrorEnum").msgclass
          ConversionCustomVariableErrorEnum::ConversionCustomVariableError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.errors.ConversionCustomVariableErrorEnum.ConversionCustomVariableError").enummodule
        end
      end
    end
  end
end
