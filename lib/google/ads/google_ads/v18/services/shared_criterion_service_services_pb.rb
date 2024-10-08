# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v18/services/shared_criterion_service.proto for package 'Google.Ads.GoogleAds.V18.Services'
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
require 'google/ads/google_ads/v18/services/shared_criterion_service_pb'

module Google
  module Ads
    module GoogleAds
      module V18
        module Services
          module SharedCriterionService
            # Proto file describing the Shared Criterion service.
            #
            # Service to manage shared criteria.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v18.services.SharedCriterionService'

              # Creates or removes shared criteria. Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [CriterionError]()
              #   [DatabaseError]()
              #   [DistinctError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [IdError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [NotEmptyError]()
              #   [NullError]()
              #   [OperatorError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              #   [ResourceCountLimitExceededError]()
              #   [SizeLimitError]()
              #   [StringFormatError]()
              #   [StringLengthError]()
              rpc :MutateSharedCriteria, ::Google::Ads::GoogleAds::V18::Services::MutateSharedCriteriaRequest, ::Google::Ads::GoogleAds::V18::Services::MutateSharedCriteriaResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
