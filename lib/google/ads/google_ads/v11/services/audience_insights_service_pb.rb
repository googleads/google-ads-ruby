# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/services/audience_insights_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/common/criteria_pb'
require 'google/ads/google_ads/v11/enums/audience_insights_dimension_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/services/audience_insights_service.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.services.GenerateInsightsFinderReportRequest" do
      optional :customer_id, :string, 1
      optional :baseline_audience, :message, 2, "google.ads.googleads.v11.services.BasicInsightsAudience"
      optional :specific_audience, :message, 3, "google.ads.googleads.v11.services.BasicInsightsAudience"
      optional :customer_insights_group, :string, 4
    end
    add_message "google.ads.googleads.v11.services.GenerateInsightsFinderReportResponse" do
      optional :saved_report_url, :string, 1
    end
    add_message "google.ads.googleads.v11.services.GenerateAudienceCompositionInsightsRequest" do
      optional :customer_id, :string, 1
      optional :audience, :message, 2, "google.ads.googleads.v11.services.InsightsAudience"
      optional :data_month, :string, 3
      repeated :dimensions, :enum, 4, "google.ads.googleads.v11.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension"
      optional :customer_insights_group, :string, 5
    end
    add_message "google.ads.googleads.v11.services.GenerateAudienceCompositionInsightsResponse" do
      repeated :sections, :message, 1, "google.ads.googleads.v11.services.AudienceCompositionSection"
    end
    add_message "google.ads.googleads.v11.services.ListAudienceInsightsAttributesRequest" do
      optional :customer_id, :string, 1
      repeated :dimensions, :enum, 2, "google.ads.googleads.v11.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension"
      optional :query_text, :string, 3
      optional :customer_insights_group, :string, 4
    end
    add_message "google.ads.googleads.v11.services.ListAudienceInsightsAttributesResponse" do
      repeated :attributes, :message, 1, "google.ads.googleads.v11.services.AudienceInsightsAttributeMetadata"
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsAttribute" do
      oneof :attribute do
        optional :age_range, :message, 1, "google.ads.googleads.v11.common.AgeRangeInfo"
        optional :gender, :message, 2, "google.ads.googleads.v11.common.GenderInfo"
        optional :location, :message, 3, "google.ads.googleads.v11.common.LocationInfo"
        optional :user_interest, :message, 4, "google.ads.googleads.v11.common.UserInterestInfo"
        optional :entity, :message, 5, "google.ads.googleads.v11.services.AudienceInsightsEntity"
        optional :category, :message, 6, "google.ads.googleads.v11.services.AudienceInsightsCategory"
        optional :dynamic_lineup, :message, 7, "google.ads.googleads.v11.services.AudienceInsightsDynamicLineup"
        optional :parental_status, :message, 8, "google.ads.googleads.v11.common.ParentalStatusInfo"
        optional :income_range, :message, 9, "google.ads.googleads.v11.common.IncomeRangeInfo"
        optional :youtube_channel, :message, 10, "google.ads.googleads.v11.common.YouTubeChannelInfo"
      end
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsTopic" do
      oneof :topic do
        optional :entity, :message, 1, "google.ads.googleads.v11.services.AudienceInsightsEntity"
        optional :category, :message, 2, "google.ads.googleads.v11.services.AudienceInsightsCategory"
      end
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsEntity" do
      optional :knowledge_graph_machine_id, :string, 1
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsCategory" do
      optional :category_id, :string, 1
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsDynamicLineup" do
      optional :dynamic_lineup_id, :string, 1
    end
    add_message "google.ads.googleads.v11.services.BasicInsightsAudience" do
      repeated :country_location, :message, 1, "google.ads.googleads.v11.common.LocationInfo"
      repeated :sub_country_locations, :message, 2, "google.ads.googleads.v11.common.LocationInfo"
      optional :gender, :message, 3, "google.ads.googleads.v11.common.GenderInfo"
      repeated :age_ranges, :message, 4, "google.ads.googleads.v11.common.AgeRangeInfo"
      repeated :user_interests, :message, 5, "google.ads.googleads.v11.common.UserInterestInfo"
      repeated :topics, :message, 6, "google.ads.googleads.v11.services.AudienceInsightsTopic"
    end
    add_message "google.ads.googleads.v11.services.AudienceInsightsAttributeMetadata" do
      optional :dimension, :enum, 1, "google.ads.googleads.v11.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension"
      optional :attribute, :message, 2, "google.ads.googleads.v11.services.AudienceInsightsAttribute"
      optional :display_name, :string, 3
      optional :score, :double, 4
      optional :display_info, :string, 5
      oneof :dimension_metadata do
        optional :youtube_channel_metadata, :message, 6, "google.ads.googleads.v11.services.YouTubeChannelAttributeMetadata"
        optional :dynamic_attribute_metadata, :message, 7, "google.ads.googleads.v11.services.DynamicLineupAttributeMetadata"
      end
    end
    add_message "google.ads.googleads.v11.services.YouTubeChannelAttributeMetadata" do
      optional :subscriber_count, :int64, 1
    end
    add_message "google.ads.googleads.v11.services.DynamicLineupAttributeMetadata" do
      optional :inventory_country, :message, 1, "google.ads.googleads.v11.common.LocationInfo"
      proto3_optional :median_monthly_inventory, :int64, 2
      proto3_optional :channel_count_lower_bound, :int64, 3
      proto3_optional :channel_count_upper_bound, :int64, 4
    end
    add_message "google.ads.googleads.v11.services.InsightsAudience" do
      repeated :country_locations, :message, 1, "google.ads.googleads.v11.common.LocationInfo"
      repeated :sub_country_locations, :message, 2, "google.ads.googleads.v11.common.LocationInfo"
      optional :gender, :message, 3, "google.ads.googleads.v11.common.GenderInfo"
      repeated :age_ranges, :message, 4, "google.ads.googleads.v11.common.AgeRangeInfo"
      optional :parental_status, :message, 5, "google.ads.googleads.v11.common.ParentalStatusInfo"
      repeated :income_ranges, :message, 6, "google.ads.googleads.v11.common.IncomeRangeInfo"
      repeated :dynamic_lineups, :message, 7, "google.ads.googleads.v11.services.AudienceInsightsDynamicLineup"
      repeated :topic_audience_combinations, :message, 8, "google.ads.googleads.v11.services.InsightsAudienceAttributeGroup"
    end
    add_message "google.ads.googleads.v11.services.InsightsAudienceAttributeGroup" do
      repeated :attributes, :message, 1, "google.ads.googleads.v11.services.AudienceInsightsAttribute"
    end
    add_message "google.ads.googleads.v11.services.AudienceCompositionSection" do
      optional :dimension, :enum, 1, "google.ads.googleads.v11.enums.AudienceInsightsDimensionEnum.AudienceInsightsDimension"
      repeated :top_attributes, :message, 3, "google.ads.googleads.v11.services.AudienceCompositionAttribute"
      repeated :clustered_attributes, :message, 4, "google.ads.googleads.v11.services.AudienceCompositionAttributeCluster"
    end
    add_message "google.ads.googleads.v11.services.AudienceCompositionAttributeCluster" do
      optional :cluster_display_name, :string, 1
      optional :cluster_metrics, :message, 3, "google.ads.googleads.v11.services.AudienceCompositionMetrics"
      repeated :attributes, :message, 4, "google.ads.googleads.v11.services.AudienceCompositionAttribute"
    end
    add_message "google.ads.googleads.v11.services.AudienceCompositionMetrics" do
      optional :baseline_audience_share, :double, 1
      optional :audience_share, :double, 2
      optional :index, :double, 3
      optional :score, :double, 4
    end
    add_message "google.ads.googleads.v11.services.AudienceCompositionAttribute" do
      optional :attribute_metadata, :message, 1, "google.ads.googleads.v11.services.AudienceInsightsAttributeMetadata"
      optional :metrics, :message, 2, "google.ads.googleads.v11.services.AudienceCompositionMetrics"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Services
          GenerateInsightsFinderReportRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.GenerateInsightsFinderReportRequest").msgclass
          GenerateInsightsFinderReportResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.GenerateInsightsFinderReportResponse").msgclass
          GenerateAudienceCompositionInsightsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.GenerateAudienceCompositionInsightsRequest").msgclass
          GenerateAudienceCompositionInsightsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.GenerateAudienceCompositionInsightsResponse").msgclass
          ListAudienceInsightsAttributesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.ListAudienceInsightsAttributesRequest").msgclass
          ListAudienceInsightsAttributesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.ListAudienceInsightsAttributesResponse").msgclass
          AudienceInsightsAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsAttribute").msgclass
          AudienceInsightsTopic = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsTopic").msgclass
          AudienceInsightsEntity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsEntity").msgclass
          AudienceInsightsCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsCategory").msgclass
          AudienceInsightsDynamicLineup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsDynamicLineup").msgclass
          BasicInsightsAudience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.BasicInsightsAudience").msgclass
          AudienceInsightsAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceInsightsAttributeMetadata").msgclass
          YouTubeChannelAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.YouTubeChannelAttributeMetadata").msgclass
          DynamicLineupAttributeMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.DynamicLineupAttributeMetadata").msgclass
          InsightsAudience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.InsightsAudience").msgclass
          InsightsAudienceAttributeGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.InsightsAudienceAttributeGroup").msgclass
          AudienceCompositionSection = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceCompositionSection").msgclass
          AudienceCompositionAttributeCluster = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceCompositionAttributeCluster").msgclass
          AudienceCompositionMetrics = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceCompositionMetrics").msgclass
          AudienceCompositionAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.services.AudienceCompositionAttribute").msgclass
        end
      end
    end
  end
end