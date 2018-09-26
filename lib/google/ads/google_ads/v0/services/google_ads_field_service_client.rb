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
# EDITING INSTRUCTIONS
# This file was generated from the file
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v0/services/google_ads_field_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"

require "google/ads/google_ads/v0/services/google_ads_field_service_pb"
require "google/ads/google_ads/v0/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V0
        module Services
          # Service to fetch Google Ads API fields.
          #
          # @!attribute [r] google_ads_field_service_stub
          #   @return [Google::Ads::GoogleAds::V0::Services::GoogleAdsFieldService::Stub]
          class GoogleAdsFieldServiceClient
            attr_reader :google_ads_field_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            # The default set of gRPC interceptors.
            GRPC_INTERCEPTORS = []

            DEFAULT_TIMEOUT = 30

            PAGE_DESCRIPTORS = {
              "search_google_ads_fields" => Google::Gax::PageDescriptor.new(
                "page_token",
                "next_page_token",
                "results")
            }.freeze

            private_constant :PAGE_DESCRIPTORS

            # The scopes needed to make gRPC calls to all of the methods defined in
            # this service.
            ALL_SCOPES = [
            ].freeze


            GOOGLE_ADS_FIELD_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "googleAdsFields/{google_ads_field}"
            )

            private_constant :GOOGLE_ADS_FIELD_PATH_TEMPLATE

            # Returns a fully-qualified google_ads_field resource name string.
            # @param google_ads_field [String]
            # @return [String]
            def self.google_ads_field_path google_ads_field
              GOOGLE_ADS_FIELD_PATH_TEMPLATE.render(
                :"google_ads_field" => google_ads_field
              )
            end

            # @param credentials [Google::Auth::Credentials, String, Hash, GRPC::Core::Channel, GRPC::Core::ChannelCredentials, Proc]
            #   Provides the means for authenticating requests made by the client. This parameter can
            #   be many types.
            #   A `Google::Auth::Credentials` uses a the properties of its represented keyfile for
            #   authenticating requests made by this client.
            #   A `String` will be treated as the path to the keyfile to be used for the construction of
            #   credentials for this client.
            #   A `Hash` will be treated as the contents of a keyfile to be used for the construction of
            #   credentials for this client.
            #   A `GRPC::Core::Channel` will be used to make calls through.
            #   A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The channel credentials
            #   should already be composed with a `GRPC::Core::CallCredentials` object.
            #   A `Proc` will be used as an updater_proc for the Grpc channel. The proc transforms the
            #   metadata for requests, generally, to give OAuth credentials.
            # @param scopes [Array<String>]
            #   The OAuth scopes for this service. This parameter is ignored if
            #   an updater_proc is supplied.
            # @param client_config [Hash]
            #   A Hash for call options for each method. See
            #   Google::Gax#construct_settings for the structure of
            #   this data. Falls back to the default config if not specified
            #   or the specified config is missing data points.
            # @param timeout [Numeric]
            #   The default timeout, in seconds, for calls made through this client.
            # @param metadata [Hash]
            #   Default metadata to be sent with each request. This can be overridden on a per call basis.
            # @param exception_transformer [Proc]
            #   An optional proc that intercepts any exceptions raised during an API call to inject
            #   custom error handling.
            def initialize \
                credentials: nil,
                scopes: ALL_SCOPES,
                client_config: {},
                timeout: DEFAULT_TIMEOUT,
                metadata: nil,
                exception_transformer: nil,
                lib_name: nil,
                lib_version: ""
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "google/gax/grpc"
              require "google/ads/google_ads/v0/services/google_ads_field_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V0::Services::Credentials.default

              if credentials.is_a?(String) || credentials.is_a?(Hash)
                updater_proc = Google::Ads::GoogleAds::V0::Services::Credentials.new(credentials).updater_proc
              end
              if credentials.is_a?(GRPC::Core::Channel)
                channel = credentials
              end
              if credentials.is_a?(GRPC::Core::ChannelCredentials)
                chan_creds = credentials
              end
              if credentials.is_a?(Proc)
                updater_proc = credentials
              end
              if credentials.is_a?(Google::Auth::Credentials)
                updater_proc = credentials.updater_proc
              end

              package_version = Gem.loaded_specs['google-ads-googleads'].version.version

              google_api_client = "gl-ruby/#{RUBY_VERSION}"
              google_api_client << " #{lib_name}/#{lib_version}" if lib_name
              google_api_client << " gapic/#{package_version} gax/#{Google::Gax::VERSION}"
              google_api_client << " grpc/#{GRPC::VERSION}"
              google_api_client.freeze

              headers = { :"x-goog-api-client" => google_api_client }
              headers.merge!(metadata) unless metadata.nil?
              client_config_file = Pathname.new(__dir__).join(
                "google_ads_field_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v0.services.GoogleAdsFieldService",
                  JSON.parse(f.read),
                  client_config,
                  Google::Gax::Grpc::STATUS_CODE_NAMES,
                  timeout,
                  page_descriptors: PAGE_DESCRIPTORS,
                  errors: Google::Gax::Grpc::API_ERRORS,
                  metadata: headers
                )
              end

              # Allow overriding the service path/port in subclasses.
              service_path = self.class::SERVICE_ADDRESS
              port = self.class::DEFAULT_SERVICE_PORT
              interceptors = self.class::GRPC_INTERCEPTORS
              @google_ads_field_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V0::Services::GoogleAdsFieldService::Stub.method(:new)
              )

              @get_google_ads_field = Google::Gax.create_api_call(
                @google_ads_field_service_stub.method(:get_google_ads_field),
                defaults["get_google_ads_field"],
                exception_transformer: exception_transformer
              )
              @search_google_ads_fields = Google::Gax.create_api_call(
                @google_ads_field_service_stub.method(:search_google_ads_fields),
                defaults["search_google_ads_fields"],
                exception_transformer: exception_transformer
              )
            end

            # Service calls

            # Returns just the requested field.
            #
            # @param resource_name [String]
            #   The resource name of the field to get.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V0::Resources::GoogleAdsField]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V0::Resources::GoogleAdsField]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   google_ads_field_service_client = Google::Ads::GoogleAds::GoogleAdsField.new(version: :v0)
            #   formatted_resource_name = Google::Ads::GoogleAds::V0::Services::GoogleAdsFieldServiceClient.google_ads_field_path("[GOOGLE_ADS_FIELD]")
            #   response = google_ads_field_service_client.get_google_ads_field(formatted_resource_name)

            def get_google_ads_field \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V0::Services::GetGoogleAdsFieldRequest)
              @get_google_ads_field.call(req, options, &block)
            end

            # Returns all fields that match the search query.
            #
            # @param query [String]
            #   The query string.
            # @param page_size [Integer]
            #   The maximum number of resources contained in the underlying API
            #   response. If page streaming is performed per-resource, this
            #   parameter does not affect the return value. If page streaming is
            #   performed per-page, this determines the maximum number of
            #   resources in a page.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Gax::PagedEnumerable<Google::Ads::GoogleAds::V0::Resources::GoogleAdsField>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Gax::PagedEnumerable<Google::Ads::GoogleAds::V0::Resources::GoogleAdsField>]
            #   An enumerable of Google::Ads::GoogleAds::V0::Resources::GoogleAdsField instances.
            #   See Google::Gax::PagedEnumerable documentation for other
            #   operations such as per-page iteration or access to the response
            #   object.
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   google_ads_field_service_client = Google::Ads::GoogleAds::GoogleAdsField.new(version: :v0)
            #
            #   # TODO: Initialize +query+:
            #   query = ''
            #
            #   # Iterate over all results.
            #   google_ads_field_service_client.search_google_ads_fields(query).each do |element|
            #     # Process element.
            #   end
            #
            #   # Or iterate over results one page at a time.
            #   google_ads_field_service_client.search_google_ads_fields(query).each_page do |page|
            #     # Process each page at a time.
            #     page.each do |element|
            #       # Process element.
            #     end
            #   end

            def search_google_ads_fields \
                query,
                page_size: nil,
                options: nil,
                &block
              req = {
                query: query,
                page_size: page_size
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V0::Services::SearchGoogleAdsFieldsRequest)
              @search_google_ads_fields.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
