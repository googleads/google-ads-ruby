# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/resources/ad_parameter.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/resources/ad_parameter.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.resources.AdParameter" do
      optional :resource_name, :string, 1
      proto3_optional :ad_group_criterion, :string, 5
      proto3_optional :parameter_index, :int64, 6
      proto3_optional :insertion_text, :string, 7
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Resources
          AdParameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.resources.AdParameter").msgclass
        end
      end
    end
  end
end
