# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v19/services/content_creator_insights_service.proto for package 'Google.Ads.GoogleAds.V19.Services'
# Original file comments:
# Copyright 2024 Google LLC
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
require 'google/ads/google_ads/v19/services/content_creator_insights_service_pb'

module Google
  module Ads
    module GoogleAds
      module V19
        module Services
          module ContentCreatorInsightsService
            # Proto file describing the content creator insights service.
            #
            # Content Creator Insights Service helps users find information about YouTube
            # Creators and their content and how these creators and their audiences can be
            # reached with Google Ads. Accessible to allowlisted customers only.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v19.services.ContentCreatorInsightsService'

              # Returns insights for a collection of YouTube Creators and Channels.
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
              rpc :GenerateCreatorInsights, ::Google::Ads::GoogleAds::V19::Services::GenerateCreatorInsightsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateCreatorInsightsResponse
              # Returns insights for trending content on YouTube.
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
              rpc :GenerateTrendingInsights, ::Google::Ads::GoogleAds::V19::Services::GenerateTrendingInsightsRequest, ::Google::Ads::GoogleAds::V19::Services::GenerateTrendingInsightsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
