# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v0/services/carrier_constant_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v0/resources/carrier_constant_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.services.GetCarrierConstantRequest" do
    optional :resource_name, :string, 1
  end
end

module Google
  module Ads
    module GoogleAds
      module V0
        module Services
          GetCarrierConstantRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.services.GetCarrierConstantRequest").msgclass
        end
      end
    end
  end
end
