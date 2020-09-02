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
# File for all errors that will be used by the Google Ads API Library.

module Google
  module Ads
    module GoogleAds
      module Errors

        # Generic error class for non-specific errors.
        class Error < ::StandardError
        end

        # Raised when encountering an API-specific error, such as an entity
        # not found or a malformed query.
        class GoogleAdsError < Error
          attr_reader :failure

          def initialize(failure)
            @failure = failure
          end

          def inspect
            "#<#{self.class.name}: #{object_id} #{failure.inspect}>"
          end
        end

        def self.namespaces
          ERROR_NAMESPACES.values
        end

        # takes a Google::Ads::GoogleAds::VX::Errors::GoogleAdsError error
        # and extracts its index in the list of mutations
        #
        # Return nil if not found
        # Return Integer: index of the error
        def self.index(error)
          path = error.location.field_path_elements.find {|elt| elt.field_name == OPERATIONS }
          if path
            path.index.value
          else
            nil
          end
        end

        # takes a Google::Ads::GoogleAds::VX::Errors::GoogleAdsError error
        # and extracts a full error message based on the message and the different paths
        # describing the source of the error
        #
        # Returns a string describing the error
        def self.message(error)
          error.location.field_path_elements.inject(error.message) do |string, path|
            unless MEANINGLESS_PATHS.include?(path.field_name)
              string = "#{path.field_name} - #{string}"
            end
            string
          end
        end

        # takes a Google::Ads::GoogleAds::VX::Errors::GoogleAdsError error
        # and extracts error code in the form of a hash
        #
        # Returns a Hash { name:, value:}
        def self.code(error, version = nil)
          error_version = error.class.name.split("::")[3]
          if error_version.nil?
            raise RuntimeError, "passed error is not a google ads class"
          end

          error_version = error_version.upcase.to_sym

          if version != nil
            Deprecation.new(false, false).deprecate(
              "Passing explicit versions to #code is deprecated, instead" \
              " we now infer it from the passed object."
            )
          end

          if version != nil && error_version.to_s != version.to_s
            raise ArgumentError,
              "passed version must match verison class of error"
          end

          version = error_version

          mapping = ERROR_CODES_MAPPING.fetch(version)
          match = mapping.find do |error_name|
            error.error_code.send(error_name) != :UNSPECIFIED
          end
          if match
            { name: match, value: error.error_code.send(match) }
          else
            {  }
          end
        end

        ERROR_NAMESPACES = Google::Ads::GoogleAds.known_api_versions.each_with_object({}) do |v, h|
          require "google/ads/google_ads/#{v.downcase}/errors/errors_pb"
          h[v] = const_get("Google::Ads::GoogleAds::#{v}::Errors")
        end

        ERROR_CODES_MAPPING = ERROR_NAMESPACES.each_with_object({}) do |(version, klass), hash|
          hash[version] = klass.const_get(:ErrorCode).descriptor.lookup_oneof('error_code').map(&:name)
        end
        MEANINGLESS_PATHS = %w(operations create update remove)
        OPERATIONS = "operations"
      end
    end
  end
end
