# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/country_code_error.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/country_code_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.CountryCodeErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.CountryCodeErrorEnum.CountryCodeError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :INVALID_COUNTRY_CODE, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          CountryCodeErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.CountryCodeErrorEnum").msgclass
          CountryCodeErrorEnum::CountryCodeError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.CountryCodeErrorEnum.CountryCodeError").enummodule
        end
      end
    end
  end
end
