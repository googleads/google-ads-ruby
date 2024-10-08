# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v16/services/keyword_plan_campaign_keyword_service.proto for package 'Google.Ads.GoogleAds.V16.Services'
# Original file comments:
# Copyright 2023 Google LLC
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
require 'google/ads/google_ads/v16/services/keyword_plan_campaign_keyword_service_pb'

module Google
  module Ads
    module GoogleAds
      module V16
        module Services
          module KeywordPlanCampaignKeywordService
            # Proto file describing the keyword plan campaign keyword service.
            #
            # Service to manage Keyword Plan campaign keywords. KeywordPlanCampaign is
            # required to add the campaign keywords. Only negative keywords are supported.
            # A maximum of 1000 negative keywords are allowed per plan. This includes both
            # campaign negative keywords and ad group negative keywords.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v16.services.KeywordPlanCampaignKeywordService'

              # Creates, updates, or removes Keyword Plan campaign keywords. Operation
              # statuses are returned.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [DatabaseError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [KeywordPlanAdGroupKeywordError]()
              #   [KeywordPlanCampaignKeywordError]()
              #   [QuotaError]()
              #   [RequestError]()
              #   [ResourceCountLimitExceededError]()
              rpc :MutateKeywordPlanCampaignKeywords, ::Google::Ads::GoogleAds::V16::Services::MutateKeywordPlanCampaignKeywordsRequest, ::Google::Ads::GoogleAds::V16::Services::MutateKeywordPlanCampaignKeywordsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end