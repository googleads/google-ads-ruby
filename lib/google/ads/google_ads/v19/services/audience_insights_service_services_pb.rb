# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v19/services/audience_insights_service.proto for package 'Google.Ads.GoogleAds.V19.Services'
# Original file comments:
# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/ads/google_ads/v19/services/audience_insights_service_pb'

module Google
  module Ads
    module GoogleAds
      module V19
        module Services
          module AudienceInsightsService
            # Proto file describing the audience insights service.
            #
            # Audience Insights Service helps users find information about groups of
            # people and how they can be reached with Google Ads. Accessible to
            # allowlisted customers only.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v19.services.AudienceInsightsService'

              # Creates a saved report that can be viewed in the Insights Finder tool.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :GenerateInsightsFinderReport, ::Google::Ads::GoogleAds::V19::Services::GenerateInsightsFinderReportRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateInsightsFinderReportResponse
              # Searches for audience attributes that can be used to generate insights.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :ListAudienceInsightsAttributes, ::Google::Ads::GoogleAds::V19::Services::ListAudienceInsightsAttributesRequest, ::Google::Ads::GoogleAds::V19::Services::ListAudienceInsightsAttributesResponse
              # Lists date ranges for which audience insights data can be requested.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :ListInsightsEligibleDates, ::Google::Ads::GoogleAds::V19::Services::ListInsightsEligibleDatesRequest, ::Google::Ads::GoogleAds::V19::Services::ListInsightsEligibleDatesResponse
              # Returns a collection of attributes that are represented in an audience of
              # interest, with metrics that compare each attribute's share of the audience
              # with its share of a baseline audience.
              #
              # List of thrown errors:
              #   [AudienceInsightsError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :GenerateAudienceCompositionInsights, ::Google::Ads::GoogleAds::V19::Services::GenerateAudienceCompositionInsightsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateAudienceCompositionInsightsResponse
              # Returns a collection of targeting insights (e.g. targetable audiences) that
              # are relevant to the requested audience.
              #
              # List of thrown errors:
              #   [AudienceInsightsError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :GenerateSuggestedTargetingInsights, ::Google::Ads::GoogleAds::V19::Services::GenerateSuggestedTargetingInsightsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateSuggestedTargetingInsightsResponse
              # Returns a collection of audience attributes along with estimates of the
              # overlap between their potential YouTube reach and that of a given input
              # attribute.
              #
              # List of thrown errors:
              #   [AudienceInsightsError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :GenerateAudienceOverlapInsights, ::Google::Ads::GoogleAds::V19::Services::GenerateAudienceOverlapInsightsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateAudienceOverlapInsightsResponse
              # Returns potential reach metrics for targetable audiences.
              #
              # This method helps answer questions like "How many Men aged 18+ interested
              # in Camping can be reached on YouTube?"
              #
              # List of thrown errors:
              #   [AudienceInsightsError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :GenerateTargetingSuggestionMetrics, ::Google::Ads::GoogleAds::V19::Services::GenerateTargetingSuggestionMetricsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateTargetingSuggestionMetricsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
