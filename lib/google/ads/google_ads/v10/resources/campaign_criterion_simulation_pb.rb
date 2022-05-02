# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/campaign_criterion_simulation.proto

require 'google/ads/google_ads/v10/common/simulation_pb'
require 'google/ads/google_ads/v10/enums/simulation_modification_method_pb'
require 'google/ads/google_ads/v10/enums/simulation_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/campaign_criterion_simulation.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.CampaignCriterionSimulation" do
      optional :resource_name, :string, 1
      proto3_optional :campaign_id, :int64, 9
      proto3_optional :criterion_id, :int64, 10
      optional :type, :enum, 4, "google.ads.googleads.v10.enums.SimulationTypeEnum.SimulationType"
      optional :modification_method, :enum, 5, "google.ads.googleads.v10.enums.SimulationModificationMethodEnum.SimulationModificationMethod"
      proto3_optional :start_date, :string, 11
      proto3_optional :end_date, :string, 12
      oneof :point_list do
        optional :bid_modifier_point_list, :message, 8, "google.ads.googleads.v10.common.BidModifierSimulationPointList"
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          CampaignCriterionSimulation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.CampaignCriterionSimulation").msgclass
        end
      end
    end
  end
end
