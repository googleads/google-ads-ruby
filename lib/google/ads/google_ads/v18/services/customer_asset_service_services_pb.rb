# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v18/services/customer_asset_service.proto for package 'Google.Ads.GoogleAds.V18.Services'
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
require 'google/ads/google_ads/v18/services/customer_asset_service_pb'

module Google
  module Ads
    module GoogleAds
      module V18
        module Services
          module CustomerAssetService
            # Proto file describing the CustomerAsset service.
            #
            # Service to manage customer assets.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v18.services.CustomerAssetService'

              # Creates, updates, or removes customer assets. Operation statuses are
              # returned.
              #
              # List of thrown errors:
              #   [AssetLinkError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :MutateCustomerAssets, ::Google::Ads::GoogleAds::V18::Services::MutateCustomerAssetsRequest, ::Google::Ads::GoogleAds::V18::Services::MutateCustomerAssetsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
