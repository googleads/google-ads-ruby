# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v11/services/asset_set_asset_service.proto for package 'Google.Ads.GoogleAds.V11.Services'
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
require 'google/ads/google_ads/v11/services/asset_set_asset_service_pb'

module Google
  module Ads
    module GoogleAds
      module V11
        module Services
          module AssetSetAssetService
            # Proto file describing the AssetSetAsset service.
            #
            # Service to manage asset set asset.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v11.services.AssetSetAssetService'

              # Creates, updates or removes asset set assets. Operation statuses are
              # returned.
              rpc :MutateAssetSetAssets, ::Google::Ads::GoogleAds::V11::Services::MutateAssetSetAssetsRequest, ::Google::Ads::GoogleAds::V11::Services::MutateAssetSetAssetsResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
