# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/services/customer_service.proto

require 'google/protobuf'

require 'google/ads/googleads/v0/resources/customer_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.services.GetCustomerRequest" do
    optional :resource_name, :string, 1
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Services
          GetCustomerRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.services.GetCustomerRequest").msgclass
        end
      end
    end
  end
end
