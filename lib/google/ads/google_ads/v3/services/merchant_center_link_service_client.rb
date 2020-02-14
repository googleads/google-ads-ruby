# Copyright 2019 Google LLC
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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v3/services/merchant_center_link_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"

require "google/ads/google_ads/v3/services/merchant_center_link_service_pb"
require "google/ads/google_ads/v3/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          # This service allows management of links between Google Ads and Google
          # Merchant Center.
          #
          # @!attribute [r] merchant_center_link_service_stub
          #   @return [Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Stub]
          class MerchantCenterLinkServiceClient
            attr_reader :merchant_center_link_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            # The default set of gRPC interceptors.
            GRPC_INTERCEPTORS = []

            DEFAULT_TIMEOUT = 30

            # The scopes needed to make gRPC calls to all of the methods defined in
            # this service.
            ALL_SCOPES = [
            ].freeze


            MERCHANT_CENTER_LINK_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/merchantCenterLinks/{merchant_center_link}"
            )

            private_constant :MERCHANT_CENTER_LINK_PATH_TEMPLATE

            # Returns a fully-qualified merchant_center_link resource name string.
            # @param customer [String]
            # @param merchant_center_link [String]
            # @return [String]
            def self.merchant_center_link_path customer, merchant_center_link
              MERCHANT_CENTER_LINK_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"merchant_center_link" => merchant_center_link
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
              require "google/ads/google_ads/v3/services/merchant_center_link_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V3::Services::Credentials.default

              if credentials.is_a?(String) || credentials.is_a?(Hash)
                updater_proc = Google::Ads::GoogleAds::V3::Services::Credentials.new(credentials).updater_proc
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
                "merchant_center_link_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v3.services.MerchantCenterLinkService",
                  JSON.parse(f.read),
                  client_config,
                  Google::Gax::Grpc::STATUS_CODE_NAMES,
                  timeout,
                  errors: Google::Gax::Grpc::API_ERRORS,
                  metadata: headers
                )
              end

              # Allow overriding the service path/port in subclasses.
              service_path = self.class::SERVICE_ADDRESS
              port = self.class::DEFAULT_SERVICE_PORT
              interceptors = self.class::GRPC_INTERCEPTORS
              @merchant_center_link_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkService::Stub.method(:new)
              )

              @list_merchant_center_links = Google::Gax.create_api_call(
                @merchant_center_link_service_stub.method(:list_merchant_center_links),
                defaults["list_merchant_center_links"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @get_merchant_center_link = Google::Gax.create_api_call(
                @merchant_center_link_service_stub.method(:get_merchant_center_link),
                defaults["get_merchant_center_link"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @mutate_merchant_center_link = Google::Gax.create_api_call(
                @merchant_center_link_service_stub.method(:mutate_merchant_center_link),
                defaults["mutate_merchant_center_link"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
            end

            # Service calls

            # Returns Merchant Center links available for this customer.
            #
            # @param customer_id [String]
            #   Required. The ID of the customer onto which to apply the Merchant Center link list
            #   operation.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Services::ListMerchantCenterLinksResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Services::ListMerchantCenterLinksResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   merchant_center_link_client = Google::Ads::GoogleAds::MerchantCenterLink.new(version: :v3)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #   response = merchant_center_link_client.list_merchant_center_links(customer_id)

            def list_merchant_center_links \
                customer_id,
                options: nil,
                &block
              req = {
                customer_id: customer_id
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::ListMerchantCenterLinksRequest)
              @list_merchant_center_links.call(req, options, &block)
            end

            # Returns the Merchant Center link in full detail.
            #
            # @param resource_name [String]
            #   Required. Resource name of the Merchant Center link.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Resources::MerchantCenterLink]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Resources::MerchantCenterLink]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   merchant_center_link_client = Google::Ads::GoogleAds::MerchantCenterLink.new(version: :v3)
            #   formatted_resource_name = Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkServiceClient.merchant_center_link_path("[CUSTOMER]", "[MERCHANT_CENTER_LINK]")
            #   response = merchant_center_link_client.get_merchant_center_link(formatted_resource_name)

            def get_merchant_center_link \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::GetMerchantCenterLinkRequest)
              @get_merchant_center_link.call(req, options, &block)
            end

            # Updates status or removes a Merchant Center link.
            #
            # @param customer_id [String]
            #   Required. The ID of the customer being modified.
            # @param operation [Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkOperation | Hash]
            #   Required. The operation to perform on the link
            #   A hash of the same form as `Google::Ads::GoogleAds::V3::Services::MerchantCenterLinkOperation`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Services::MutateMerchantCenterLinkResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Services::MutateMerchantCenterLinkResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   merchant_center_link_client = Google::Ads::GoogleAds::MerchantCenterLink.new(version: :v3)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `operation`:
            #   operation = {}
            #   response = merchant_center_link_client.mutate_merchant_center_link(customer_id, operation)

            def mutate_merchant_center_link \
                customer_id,
                operation,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                operation: operation
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::MutateMerchantCenterLinkRequest)
              @mutate_merchant_center_link.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
