# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/common/customizer_value.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/customizer_attribute_type_pb'
require 'google/api/field_behavior_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/common/customizer_value.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.common.CustomizerValue" do
      optional :type, :enum, 1, "google.ads.googleads.v12.enums.CustomizerAttributeTypeEnum.CustomizerAttributeType"
      optional :string_value, :string, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Common
          CustomizerValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.common.CustomizerValue").msgclass
        end
      end
    end
  end
end
