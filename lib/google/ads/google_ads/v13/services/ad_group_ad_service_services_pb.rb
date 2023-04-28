# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v13/services/ad_group_ad_service.proto for package 'Google.Ads.GoogleAds.V13.Services'
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
require 'google/ads/google_ads/v13/services/ad_group_ad_service_pb'

module Google
  module Ads
    module GoogleAds
      module V13
        module Services
          module AdGroupAdService
            # Proto file describing the Ad Group Ad service.
            #
            # Service to manage ads in an ad group.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v13.services.AdGroupAdService'

              # Creates, updates, or removes ads. Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AdCustomizerError]()
              #   [AdError]()
              #   [AdGroupAdError]()
              #   [AdSharingError]()
              #   [AdxError]()
              #   [AssetError]()
              #   [AssetLinkError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [CollectionSizeError]()
              #   [ContextError]()
              #   [DatabaseError]()
              #   [DateError]()
              #   [DistinctError]()
              #   [FeedAttributeReferenceError]()
              #   [FieldError]()
              #   [FieldMaskError]()
              #   [FunctionError]()
              #   [FunctionParsingError]()
              #   [HeaderError]()
              #   [IdError]()
              #   [ImageError]()
              #   [InternalError]()
              #   [ListOperationError]()
              #   [MediaBundleError]()
              #   [MediaFileError]()
              #   [MutateError]()
              #   [NewResourceCreationError]()
              #   [NotEmptyError]()
              #   [NullError]()
              #   [OperationAccessDeniedError]()
              #   [OperatorError]()
              #   [PolicyFindingError]()
              #   [PolicyValidationParameterError]()
              #   [PolicyViolationError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              #   [ResourceCountLimitExceededError]()
              #   [SizeLimitError]()
              #   [StringFormatError]()
              #   [StringLengthError]()
              #   [UrlFieldError]()
              rpc :MutateAdGroupAds, ::Google::Ads::GoogleAds::V13::Services::MutateAdGroupAdsRequest, ::Google::Ads::GoogleAds::V13::Services::MutateAdGroupAdsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
