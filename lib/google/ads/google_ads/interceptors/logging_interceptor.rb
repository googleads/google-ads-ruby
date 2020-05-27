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

require 'google/ads/google_ads/api_versions'
require 'google/ads/google_ads/partial_failure_error_decoder'
require 'grpc/generic/interceptors'
require 'json'

module Google
  module Ads
    module GoogleAds
      module Interceptors
        class LoggingInterceptor < GRPC::ClientInterceptor

          def initialize(logger)
            # Don't propagate args, parens are necessary
            super()
            @logger = logger
          end

          def request_response(request:, call:, method:, metadata: {})
            begin
              response = yield

              @logger.info { build_summary_message(request, call, method, false) }
              @logger.debug { build_request_message(metadata, request) }
              @logger.debug { build_success_response_message(response) }
              if response.respond_to?(:partial_failure_error) && response.partial_failure_error
                @logger.debug { build_partial_failure_message(response) }
              end
              response
            rescue Exception
              @logger.warn { build_summary_message(request, call, method, true) }
              @logger.info { build_request_message(metadata, request) }
              @logger.info { build_error_response_message }
              raise
            end
          end

          def server_streamer(request:, call:, method:, metadata: {})
            begin
              @logger.info { build_summary_message(request, call, method, false) }
              responses = yield
              Enumerator.new do |y|
                responses.each { |response|
                  @logger.debug { build_request_message(metadata, request) }
                  @logger.debug { build_success_response_message(response) }
                  if response.respond_to?(:partial_failure_error) && response.partial_failure_error
                    @logger.debug { build_partial_failure_message(response) }
                  end
                  y << response
                }
                @logger.debug {
                  request_id = call
                    .instance_variable_get(:@wrapped)
                    .instance_variable_get(:@call)
                    .trailing_metadata["request-id"]
                  "Request ID for preceding streaming request: #{request_id}"
                }
              rescue Exception
                handle_error(request, call, method, metadata)
              end
            rescue Exception
              handle_error(request, call, method, metadata)
            end
          end

          private

          def handle_error(request, call, method, metadata)
            @logger.warn { build_summary_message(request, call, method, true) }
            @logger.info { build_request_message(metadata, request) }
            @logger.info { build_error_response_message }
            raise
          end

          def build_partial_failure_message(response)
            errors = PartialFailureErrorDecoder.decode(
              response.partial_failure_error
            )
            errors.reduce("Partial failure errors: ") do |accum, error|
              accum += error.to_json + "\n"
              accum
            end
          end

          def build_error_response_message
            exception = $!
            response_message = ""
            response_message << "Incoming response (errors): \n"
            response_message << error_details(exception).join
            response_message
          end

          def error_details(exception)
            last_user_line = CallerFilter.first_non_google_ads_line
            exception_details = [
              "  ",
              exception.class,
              "(",
              exception.message,
              "): "
            ]

            case exception
            when Google::Ads::GoogleAds::Errors::GoogleAdsError
              exception_details << exception.failure.message
            when GRPC::InvalidArgument
              exception_details << exception.details
            end

            exception_details << [
              "\n",
              "  called from: ",
              last_user_line
            ]

            exception_details
          end

          def build_success_response_message(response)
            "Incoming response: Payload: #{response.to_json}"
          end

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

          def response_error_from_detail(detail)
            detail.errors.map.with_index { |error, i|
              "Error #{i + 1}: #{error.to_json}"
            }.join("\n")
          end

          def use_bytes_inspect?(request)
            @cycle_finder = CycleFinder.new
            contains_bytes_field?(request.class.descriptor)
          end

          def contains_bytes_field?(descriptor)
            return false if descriptor.nil?
            return false if @cycle_finder.is_cycle?(descriptor)

            @cycle_finder.add_object(descriptor)

            descriptor.map { |x| x.type == :bytes || (x.type == :message && contains_bytes_field?(x.subtype)) }.any?
          end

          def interesting_error_classes
            @interesting_error_classes ||= Google::Ads::GoogleAds::Errors.namespaces.map do |namespace|
              namespace.const_get(:GoogleAdsFailure)
            end
          end

          class CycleFinder
            def initialize
              @objects_seen = Set.new
            end

            def is_cycle?(object)
              @objects_seen.include?(object.object_id)
            end

            def add_object(object)
              @objects_seen.add(object.object_id)
            end
          end
        end
      end
    end
  end
end
