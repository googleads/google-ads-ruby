# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/campaign_draft_status.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/campaign_draft_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CampaignDraftStatusEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CampaignDraftStatusEnum.CampaignDraftStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PROPOSED, 2
      value :REMOVED, 3
      value :PROMOTING, 5
      value :PROMOTED, 4
      value :PROMOTE_FAILED, 6
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CampaignDraftStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CampaignDraftStatusEnum").msgclass
          CampaignDraftStatusEnum::CampaignDraftStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CampaignDraftStatusEnum.CampaignDraftStatus").enummodule
        end
      end
    end
  end
end
