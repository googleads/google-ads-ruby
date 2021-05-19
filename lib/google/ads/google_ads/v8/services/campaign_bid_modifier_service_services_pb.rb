# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v8/services/campaign_bid_modifier_service.proto for package 'Google.Ads.GoogleAds.V8.Services'
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
require 'google/ads/google_ads/v8/services/campaign_bid_modifier_service_pb'

module Google
  module Ads
    module GoogleAds
      module V8
        module Services
          module CampaignBidModifierService
            # Proto file describing the Campaign Bid Modifier service.
            #
            # Service to manage campaign bid modifiers.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v8.services.CampaignBidModifierService'

              # Returns the requested campaign bid modifier in full detail.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :GetCampaignBidModifier, ::Google::Ads::GoogleAds::V8::Services::GetCampaignBidModifierRequest, ::Google::Ads::GoogleAds::V8::Resources::CampaignBidModifier
              # Creates, updates, or removes campaign bid modifiers.
              # Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ContextError]()
              #   [CriterionError]()
              #   [DatabaseError]()
              #   [DateError]()
              #   [DistinctError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [IdError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [NewResourceCreationError]()
              #   [NotEmptyError]()
              #   [NullError]()
              #   [OperatorError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              #   [SizeLimitError]()
              #   [StringFormatError]()
              #   [StringLengthError]()
              rpc :MutateCampaignBidModifiers, ::Google::Ads::GoogleAds::V8::Services::MutateCampaignBidModifiersRequest, ::Google::Ads::GoogleAds::V8::Services::MutateCampaignBidModifiersResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
