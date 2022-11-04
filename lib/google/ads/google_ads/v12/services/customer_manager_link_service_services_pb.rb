# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v12/services/customer_manager_link_service.proto for package 'Google.Ads.GoogleAds.V12.Services'
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
require 'google/ads/google_ads/v12/services/customer_manager_link_service_pb'

module Google
  module Ads
    module GoogleAds
      module V12
        module Services
          module CustomerManagerLinkService
            # Service to manage customer-manager links.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v12.services.CustomerManagerLinkService'

              # Updates customer manager links. Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [DatabaseError]()
              #   [FieldError]()
              #   [FieldMaskError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [ManagerLinkError]()
              #   [MutateError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :MutateCustomerManagerLink, ::Google::Ads::GoogleAds::V12::Services::MutateCustomerManagerLinkRequest, ::Google::Ads::GoogleAds::V12::Services::MutateCustomerManagerLinkResponse
              # Moves a client customer to a new manager customer.
              # This simplifies the complex request that requires two operations to move
              # a client customer to a new manager, for example:
              # 1. Update operation with Status INACTIVE (previous manager) and,
              # 2. Update operation with Status ACTIVE (new manager).
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [DatabaseError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :MoveManagerLink, ::Google::Ads::GoogleAds::V12::Services::MoveManagerLinkRequest, ::Google::Ads::GoogleAds::V12::Services::MoveManagerLinkResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
