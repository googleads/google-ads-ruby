# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v16/services/customer_client_link_service.proto for package 'Google.Ads.GoogleAds.V16.Services'
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
require 'google/ads/google_ads/v16/services/customer_client_link_service_pb'

module Google
  module Ads
    module GoogleAds
      module V16
        module Services
          module CustomerClientLinkService
            # Service to manage customer client links.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v16.services.CustomerClientLinkService'

              # Creates or updates a customer client link. Operation statuses are returned.
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
              #   [NewResourceCreationError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :MutateCustomerClientLink, ::Google::Ads::GoogleAds::V16::Services::MutateCustomerClientLinkRequest, ::Google::Ads::GoogleAds::V16::Services::MutateCustomerClientLinkResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
