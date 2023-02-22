# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v13/services/smart_campaign_suggest_service.proto for package 'Google.Ads.GoogleAds.V13.Services'
# Original file comments:
# Copyright 2022 Google LLC
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
require 'google/ads/google_ads/v13/services/smart_campaign_suggest_service_pb'

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          module SmartCampaignSuggestService
            # Service to get suggestions for Smart Campaigns.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v13.services.SmartCampaignSuggestService'

              # Returns BudgetOption suggestions.
              rpc :SuggestSmartCampaignBudgetOptions, ::Google::Ads::GoogleAds::V13::Services::SuggestSmartCampaignBudgetOptionsRequest, ::Google::Ads::GoogleAds::V13::Services::SuggestSmartCampaignBudgetOptionsResponse
              # Suggests a Smart campaign ad compatible with the Ad family of resources,
              # based on data points such as targeting and the business to advertise.
              rpc :SuggestSmartCampaignAd, ::Google::Ads::GoogleAds::V13::Services::SuggestSmartCampaignAdRequest, ::Google::Ads::GoogleAds::V13::Services::SuggestSmartCampaignAdResponse
              # Suggests keyword themes to advertise on.
              rpc :SuggestKeywordThemes, ::Google::Ads::GoogleAds::V13::Services::SuggestKeywordThemesRequest, ::Google::Ads::GoogleAds::V13::Services::SuggestKeywordThemesResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
