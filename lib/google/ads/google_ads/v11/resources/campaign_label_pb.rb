# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/resources/campaign_label.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/resources/campaign_label.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.resources.CampaignLabel" do
      optional :resource_name, :string, 1
      proto3_optional :campaign, :string, 4
      proto3_optional :label, :string, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Resources
          CampaignLabel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.resources.CampaignLabel").msgclass
        end
      end
    end
  end
end
