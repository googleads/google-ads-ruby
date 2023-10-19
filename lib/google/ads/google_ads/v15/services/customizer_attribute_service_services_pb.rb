# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v15/services/customizer_attribute_service.proto for package 'Google.Ads.GoogleAds.V15.Services'
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
require 'google/ads/google_ads/v15/services/customizer_attribute_service_pb'

module Google
  module Ads
    module GoogleAds
      module V15
        module Services
          module CustomizerAttributeService
            # Proto file describing the CustomizerAttribute service.
            #
            # Service to manage customizer attribute
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v15.services.CustomizerAttributeService'

              # Creates, updates or removes customizer attributes. Operation statuses are
              # returned.
              rpc :MutateCustomizerAttributes, ::Google::Ads::GoogleAds::V15::Services::MutateCustomizerAttributesRequest, ::Google::Ads::GoogleAds::V15::Services::MutateCustomizerAttributesResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
