# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/custom_audience.proto

require 'google/ads/google_ads/v10/enums/custom_audience_member_type_pb'
require 'google/ads/google_ads/v10/enums/custom_audience_status_pb'
require 'google/ads/google_ads/v10/enums/custom_audience_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/custom_audience.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.CustomAudience" do
      optional :resource_name, :string, 1
      optional :id, :int64, 2
      optional :status, :enum, 3, "google.ads.googleads.v10.enums.CustomAudienceStatusEnum.CustomAudienceStatus"
      optional :name, :string, 4
      optional :type, :enum, 5, "google.ads.googleads.v10.enums.CustomAudienceTypeEnum.CustomAudienceType"
      optional :description, :string, 6
      repeated :members, :message, 7, "google.ads.googleads.v10.resources.CustomAudienceMember"
    end
    add_message "google.ads.googleads.v10.resources.CustomAudienceMember" do
      optional :member_type, :enum, 1, "google.ads.googleads.v10.enums.CustomAudienceMemberTypeEnum.CustomAudienceMemberType"
      oneof :value do
        optional :keyword, :string, 2
        optional :url, :string, 3
        optional :place_category, :int64, 4
        optional :app, :string, 5
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          CustomAudience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.CustomAudience").msgclass
          CustomAudienceMember = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.CustomAudienceMember").msgclass
        end
      end
    end
  end
end
