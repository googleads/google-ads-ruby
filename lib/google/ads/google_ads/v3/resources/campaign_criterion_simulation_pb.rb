# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v3/resources/campaign_criterion_simulation.proto

require 'google/protobuf'

require 'google/ads/google_ads/v3/common/simulation_pb'
require 'google/ads/google_ads/v3/enums/simulation_modification_method_pb'
require 'google/ads/google_ads/v3/enums/simulation_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/wrappers_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v3.resources.CampaignCriterionSimulation" do
    optional :resource_name, :string, 1
    optional :campaign_id, :message, 2, "google.protobuf.Int64Value"
    optional :criterion_id, :message, 3, "google.protobuf.Int64Value"
    optional :type, :enum, 4, "google.ads.googleads.v3.enums.SimulationTypeEnum.SimulationType"
    optional :modification_method, :enum, 5, "google.ads.googleads.v3.enums.SimulationModificationMethodEnum.SimulationModificationMethod"
    optional :start_date, :message, 6, "google.protobuf.StringValue"
    optional :end_date, :message, 7, "google.protobuf.StringValue"
    oneof :point_list do
      optional :bid_modifier_point_list, :message, 8, "google.ads.googleads.v3.common.BidModifierSimulationPointList"
    end
  end
end

module Google::Ads::GoogleAds::V3::Resources
  CampaignCriterionSimulation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.resources.CampaignCriterionSimulation").msgclass
end
