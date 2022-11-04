# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/resources/user_interest.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/common/criterion_category_availability_pb'
require 'google/ads/google_ads/v12/enums/user_interest_taxonomy_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/resources/user_interest.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.resources.UserInterest" do
      optional :resource_name, :string, 1
      optional :taxonomy_type, :enum, 2, "google.ads.googleads.v12.enums.UserInterestTaxonomyTypeEnum.UserInterestTaxonomyType"
      proto3_optional :user_interest_id, :int64, 8
      proto3_optional :name, :string, 9
      proto3_optional :user_interest_parent, :string, 10
      proto3_optional :launched_to_all, :bool, 11
      repeated :availabilities, :message, 7, "google.ads.googleads.v12.common.CriterionCategoryAvailability"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Resources
          UserInterest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.resources.UserInterest").msgclass
        end
      end
    end
  end
end
