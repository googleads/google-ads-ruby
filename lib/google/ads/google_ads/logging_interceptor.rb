# Encoding: utf-8
#
# Copyright 2018 Google LLC
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
# Interceptor to log outgoing requests and incoming responses.

require 'grpc/generic/interceptors'
require 'json'

module Google
  module Ads
    module GoogleAds
      class LoggingInterceptor < GRPC::ClientInterceptor
        def initialize(logger, inspect_strategy)
          super()
          @logger = logger
          @inspect_strategy = method(inspect_strategy)
        end

        def r_inspect(request)
          # calling #to_json on some protos (specifically those with non-UTF8
          # encodable byte values) causes a segfault, however #inspect works
          # so we check if the proto contains a bytevalue, and if it does
          # we #inspect instead of #to_json
          ri = request.inspect
          request_inspect = if /Google::Protobuf::BytesValue/ === ri
            ri
          else
            request.to_json
          end

          request_inspect
        end

        def r_threequal(request)
          if Google::Ads::GoogleAds::V1::Services::MutateMediaFilesRequest === request
            request.inspect
          else
            request.to_json
          end
        end

        def r_bytes_inspect(request)
          if contains_bytes_field(request.class.descriptor)
            request.inspect
          else
            request.to_json
          end
        end

        def contains_bytes_field(descriptor)
          return false if descriptor.nil?
          descriptor.map { |x| x.type == :bytes || (x.type == :message && contains_bytes_field(x.subtype)) }.any?
        end

        def request_response(request:, call:, method:, metadata: {})
          customer_id = "N/A"
          customer_id = request.customer_id if request.respond_to?(:customer_id)
          # CustomerService get requests have a different format.
          if request.respond_to?(:resource_name)
            customer_id = request.resource_name.split('/').last
          end
          summary_message =
              sprintf("CID: %s, Host: %s, Method: %s",
                customer_id,
                call.instance_variable_get('@wrapped').peer,
                method
              )

          request_inspect = @inspect_strategy.call(request)
          request_message = sprintf(
            "Outgoing request: Headers: %s Payload: %s",
            metadata.to_json,
            request_inspect,
          )
          begin
            response = yield
            summary_message += ", IsFault: no"
            response_message = sprintf("Incoming response: Payload: %s",
                response.to_json)

            @logger.info(summary_message)
            @logger.debug(request_message)
            @logger.debug(response_message)
            return response
          rescue Exception => e
            summary_message += sprintf(", IsFault: yes")
            response_message = "Incoming response (errors): \n"

            most_recent_error = Google::Gax::GaxError.new('')
            most_recent_error.status_details && most_recent_error.status_details.each do |detail|
              if detail.is_a?(
                  Google::Ads::GoogleAds::V0::Errors::GoogleAdsFailure)
                detail.errors.each_with_index do |error, i|
                  response_message +=
                      sprintf("Error %d: %s\n", i + 1, error.to_json)
                end
              end
            end

            @logger.warn(summary_message)
            @logger.info(request_message)
            @logger.info(response_message)
            raise
          end
        end
      end
    end
  end
end
