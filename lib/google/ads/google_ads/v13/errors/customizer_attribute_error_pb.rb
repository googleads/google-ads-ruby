# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/errors/customizer_attribute_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/errors/customizer_attribute_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.errors.CustomizerAttributeErrorEnum" do
    end
    add_enum "google.ads.googleads.v13.errors.CustomizerAttributeErrorEnum.CustomizerAttributeError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :DUPLICATE_CUSTOMIZER_ATTRIBUTE_NAME, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Errors
          CustomizerAttributeErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.CustomizerAttributeErrorEnum").msgclass
          CustomizerAttributeErrorEnum::CustomizerAttributeError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.errors.CustomizerAttributeErrorEnum.CustomizerAttributeError").enummodule
        end
      end
    end
  end
end
