# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v6/errors/invoice_error.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v6/errors/invoice_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v6.errors.InvoiceErrorEnum" do
    end
    add_enum "google.ads.googleads.v6.errors.InvoiceErrorEnum.InvoiceError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :YEAR_MONTH_TOO_OLD, 2
      value :NOT_INVOICED_CUSTOMER, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V6
        module Errors
          InvoiceErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.errors.InvoiceErrorEnum").msgclass
          InvoiceErrorEnum::InvoiceError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.errors.InvoiceErrorEnum.InvoiceError").enummodule
        end
      end
    end
  end
end
