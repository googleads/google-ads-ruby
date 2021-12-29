# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# Interceptor to transform error responses to GoogleAdsErrors.

require 'grpc/generic/interceptors'

module Google
  module Ads
    module GoogleAds
      module Interceptors
        class ErrorInterceptor < GRPC::ClientInterceptor
          ERROR_TRANSFORMER = lambda do |gax_error|
            begin
              gax_error.status_details.each do |detail|
                # If there is an underlying GoogleAdsFailure, throw that one.
                if detail.class.name.start_with?("Google::Ads::GoogleAds") &&
                    detail.class.name.end_with?("GoogleAdsFailure")
                  return Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                    detail
                  )
                elsif detail.is_a?(Google::Protobuf::Any)
                  type = Google::Protobuf::DescriptorPool.generated_pool.lookup(
                    detail.type_name
                  ).msgclass
                  failure = detail.unpack(type)

                  return Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                    failure
                  )
                end
              end
            rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
              return e
            rescue NoMethodError
              # Sometimes status_details is just a String; in that case, we should
              # just raise the original exception.
            end
            # If we don't find an error of the correct type, or if we run into an
            # error while processing, just throw the original.
            gax_error
          end

          def initialize()
            # Don't propagate args, parens are necessary
            super()
            @error_transformer = ERROR_TRANSFORMER
          end

          def request_response(request:, call:, method:, metadata: {})
            begin
              yield
            rescue Exception => e
              raise @error_transformer.call(e)
            end
          end

          def server_streamer(request:, call:, method:, metadata: {})
            responses = yield
            Enumerator.new do |y|
              responses.each { |response| y << response }
            rescue BasicObject => e
              raise @error_transformer.call(e)
            end
          end
        end
      end
    end
  end
end

