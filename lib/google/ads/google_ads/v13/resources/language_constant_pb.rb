# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/resources/language_constant.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/resources/language_constant.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.resources.LanguageConstant" do
      optional :resource_name, :string, 1
      proto3_optional :id, :int64, 6
      proto3_optional :code, :string, 7
      proto3_optional :name, :string, 8
      proto3_optional :targetable, :bool, 9
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Resources
          LanguageConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.resources.LanguageConstant").msgclass
        end
      end
    end
  end
end
