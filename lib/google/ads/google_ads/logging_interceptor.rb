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

require 'google/ads/google_ads'
require 'grpc/generic/interceptors'
require 'json'

module Google
  module Ads
    module GoogleAds
      class LoggingInterceptor < GRPC::ClientInterceptor
        INTERESTING_ERROR_CLASSES = ::Google::Ads::GoogleAds::KNOWN_API_VERSIONS.map { |v|
          require "google/ads/google_ads/#{v.downcase}/errors/errors_pb"
          const_get("Google::Ads::GoogleAds::#{v}::Errors::GoogleAdsFailure")
        }

        def initialize(logger)
          super()
          @logger = logger
        end

        def request_response(request:, call:, method:, metadata: {})
          begin
            response = yield
            response_message = sprintf("Incoming response: Payload: %s",
                                       response.to_json)

            @logger.info(build_summary_message(request, call, method, false))
            @logger.debug(build_request_message(metadata, request))
            @logger.debug(response_message)
            return response
          rescue Exception
            response_message = "Incoming response (errors): \n"

            most_recent_error = Google::Gax::GaxError.new('')
            most_recent_error.status_details && most_recent_error.status_details.each do |detail|
              if INTERESTING_ERROR_CLASSES.include?(detail.class)
                response_message = add_response_message_from_detail(
                  response_message,
                  detail,
                )
              end
            end

            @logger.warn(build_summary_message(request, call, method, true))
            @logger.info(build_request_message(metadata, request))
            @logger.info(response_message)
            raise
          end
        end

        private

        def build_request_message(metadata, request)
          # calling #to_json on some protos (specifically those with non-UTF8
          # encodable byte values) causes a segfault, however #inspect works
          # so we check if the proto contains a bytevalue, and if it does
          # we #inspect instead of #to_json
          request_inspect = if use_bytes_inspect?(request)
                              request.inspect
                            else
                              request.to_json
                            end
          "Outgoing request: Headers: #{metadata.to_json} Payload: #{request_inspect}"
        end

        def build_summary_message(request, call, method, is_fault)
          customer_id = "N/A"
          customer_id = request.customer_id if request.respond_to?(:customer_id)
          # CustomerService get requests have a different format.
          if request.respond_to?(:resource_name)
            customer_id = request.resource_name.split('/').last
          end

          is_fault_string = if is_fault
            "yes"
          else
            "no"
          end

          [
            "CID: #{customer_id}",
            "Host: #{call.instance_variable_get('@wrapped').peer}",
            "Method: #{method}",
            "IsFault: #{is_fault_string}",
          ].join(", ")
        end

        def add_response_message_from_detail(response_message, detail)
          detail.errors.each_with_index do |error, i|
            response_message += sprintf("Error %d: %s\n", i + 1, error.to_json)
          end
          response_message
        end

        def use_bytes_inspect?(request)
          contains_bytes_field?(request.class.descriptor)
        end

        def contains_bytes_field?(descriptor)
          return false if descriptor.nil?
          descriptor.map { |x| x.type == :bytes || (x.type == :message && contains_bytes_field?(x.subtype)) }.any?
        end
      end
    end
  end
end
