# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v7/services/keyword_plan_idea_service.proto for package 'Google.Ads.GoogleAds.V7.Services'
# Original file comments:
# Copyright 2021 Google LLC
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
require 'google/ads/google_ads/v7/services/keyword_plan_idea_service_pb'

module Google
  module Ads
    module GoogleAds
      module V7
        module Services
          module KeywordPlanIdeaService
            # Proto file describing the keyword plan idea service.
            #
            # Service to generate keyword ideas.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v7.services.KeywordPlanIdeaService'

              # Returns a list of keyword ideas.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [CollectionSizeError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [KeywordPlanIdeaError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :GenerateKeywordIdeas, ::Google::Ads::GoogleAds::V7::Services::GenerateKeywordIdeasRequest, ::Google::Ads::GoogleAds::V7::Services::GenerateKeywordIdeaResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
