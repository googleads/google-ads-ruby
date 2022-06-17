# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/resources/campaign_group.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/enums/campaign_group_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/resources/campaign_group.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.resources.CampaignGroup" do
      optional :resource_name, :string, 1
      optional :id, :int64, 3
      optional :name, :string, 4
      optional :status, :enum, 5, "google.ads.googleads.v11.enums.CampaignGroupStatusEnum.CampaignGroupStatus"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Resources
          CampaignGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.resources.CampaignGroup").msgclass
        end
      end
    end
  end
end
