# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v12/services/ad_group_service.proto for package 'Google.Ads.GoogleAds.V12.Services'
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
require 'google/ads/google_ads/v12/services/ad_group_service_pb'

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          module AdGroupService
            # Proto file describing the Ad Group service.
            #
            # Service to manage ad groups.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v12.services.AdGroupService'

              # Creates, updates, or removes ad groups. Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AdGroupError]()
              #   [AdxError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [BiddingError]()
              #   [BiddingStrategyError]()
              #   [DatabaseError]()
              #   [DateError]()
              #   [DistinctError]()
              #   [FieldError]()
              #   [FieldMaskError]()
              #   [HeaderError]()
              #   [IdError]()
              #   [InternalError]()
              #   [ListOperationError]()
              #   [MultiplierError]()
              #   [MutateError]()
              #   [NewResourceCreationError]()
              #   [NotEmptyError]()
              #   [NullError]()
              #   [OperationAccessDeniedError]()
              #   [OperatorError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              #   [ResourceCountLimitExceededError]()
              #   [SettingError]()
              #   [SizeLimitError]()
              #   [StringFormatError]()
              #   [StringLengthError]()
              #   [UrlFieldError]()
              rpc :MutateAdGroups, ::Google::Ads::GoogleAds::V12::Services::MutateAdGroupsRequest, ::Google::Ads::GoogleAds::V12::Services::MutateAdGroupsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
