# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/search_term_targeting_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/search_term_targeting_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.SearchTermTargetingStatusEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.SearchTermTargetingStatusEnum.SearchTermTargetingStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ADDED, 2
      value :EXCLUDED, 3
      value :ADDED_EXCLUDED, 4
      value :NONE, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          SearchTermTargetingStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SearchTermTargetingStatusEnum").msgclass
          SearchTermTargetingStatusEnum::SearchTermTargetingStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.SearchTermTargetingStatusEnum.SearchTermTargetingStatus").enummodule
        end
      end
    end
  end
end
