# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/app_payment_model_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/app_payment_model_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.AppPaymentModelTypeEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.AppPaymentModelTypeEnum.AppPaymentModelType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PAID, 30
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          AppPaymentModelTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AppPaymentModelTypeEnum").msgclass
          AppPaymentModelTypeEnum::AppPaymentModelType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AppPaymentModelTypeEnum.AppPaymentModelType").enummodule
        end
      end
    end
  end
end
