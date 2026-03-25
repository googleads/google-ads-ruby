# Encoding: utf-8
#
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Interceptor to add metadata headers to requests.

require 'grpc/generic/interceptors'
require 'google/protobuf'

module Google
  module Ads
    module GoogleAds
      module Interceptors
        class MetadataInterceptor < GRPC::ClientInterceptor
          def initialize(developer_token, login_customer_id, linked_customer_id, use_cloud_org_for_api_access, ads_assistant)
            super()
            @developer_token = developer_token
            @login_customer_id = login_customer_id
            @linked_customer_id = linked_customer_id
            @use_cloud_org_for_api_access = use_cloud_org_for_api_access
            @ads_assistant = ads_assistant
          end

          def request_response(request:, call:, method:, metadata: {})
            update_metadata(metadata)
            yield
          end

          def server_streamer(request:, call:, method:, metadata: {})
            update_metadata(metadata)
            yield
          end

          private

          def update_metadata(metadata)
            if !@use_cloud_org_for_api_access
              metadata[:"developer-token"] = @developer_token
            end

            if @login_customer_id
              metadata[:"login-customer-id"] = @login_customer_id.to_s
            end

            if @linked_customer_id
              metadata[:"linked-customer-id"] = @linked_customer_id.to_s
            end

            # The python library iterates over metadata and modifies x-goog-api-client
            # Here we can directly access it.
            if metadata.key?(:"x-goog-api-client")
              if @ads_assistant
                 metadata[:"x-goog-api-client"] += " gaada/#{@ads_assistant}"
              end

              # Check if "pb" is already in the header
              unless metadata[:"x-goog-api-client"].include?("pb")
                metadata[:"x-goog-api-client"] += " pb/#{Gem.loaded_specs["google-protobuf"].version}"
              end
            end
          end
        end
      end
    end
  end
end
