# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/resources/customizer_attribute.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/customizer_attribute_status_pb'
require 'google/ads/google_ads/v12/enums/customizer_attribute_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/resources/customizer_attribute.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.resources.CustomizerAttribute" do
      optional :resource_name, :string, 1
      optional :id, :int64, 2
      optional :name, :string, 3
      optional :type, :enum, 4, "google.ads.googleads.v12.enums.CustomizerAttributeTypeEnum.CustomizerAttributeType"
      optional :status, :enum, 5, "google.ads.googleads.v12.enums.CustomizerAttributeStatusEnum.CustomizerAttributeStatus"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Resources
          CustomizerAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.resources.CustomizerAttribute").msgclass
        end
      end
    end
  end
end
