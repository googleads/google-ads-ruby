# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/google_ads/v0/services/video_service.proto for package 'google.ads.googleads.v0.services'
# Original file comments:
# Copyright 2018 Google LLC.
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
#

require 'grpc'
require 'google/ads/google_ads/v0/services/video_service_pb'

module Google
  module Ads
    module GoogleAds
      module V0
        module Services
          module VideoService
            # Service to manage videos.
            class Service

              include GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v0.services.VideoService'

              # Returns the requested video in full detail.
              rpc :GetVideo, GetVideoRequest, Google::Ads::GoogleAds::V0::Resources::Video
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
