# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v7/resources/carrier_constant.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v7/resources/carrier_constant.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v7.resources.CarrierConstant" do
      optional :resource_name, :string, 1
      proto3_optional :id, :int64, 5
      proto3_optional :name, :string, 6
      proto3_optional :country_code, :string, 7
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V7
        module Resources
          CarrierConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v7.resources.CarrierConstant").msgclass
        end
      end
    end
  end
end
