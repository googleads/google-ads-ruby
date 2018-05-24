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
# https://github.com/googleapis/googleapis/blob/master/google/ads/googleads/v0/services/campaign_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"

require "google/ads/googleads/v0/services/campaign_service_pb"
require "google/ads/googleads/credentials"

module Google
  module Ads
    module Googleads
      module V0
        module Services
          # Service to manage campaigns.
          #
          # @!attribute [r] campaign_service_stub
          #   @return [Google::Ads::Googleads::V0::Services::CampaignService::Stub]
          class CampaignServiceClient
            attr_reader :campaign_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            DEFAULT_TIMEOUT = 30

            # The scopes needed to make gRPC calls to all of the methods defined in
            # this service.
            ALL_SCOPES = [
            ].freeze


            CAMPAIGN_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/campaigns/{campaign}"
            )

            private_constant :CAMPAIGN_PATH_TEMPLATE

            # Returns a fully-qualified campaign resource name string.
            # @param customer [String]
            # @param campaign [String]
            # @return [String]
            def self.campaign_path customer, campaign
              CAMPAIGN_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"campaign" => campaign
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
              require "google/ads/googleads/v0/services/campaign_service_services_pb"

              credentials ||= Google::Ads::Googleads::Credentials.default

              if credentials.is_a?(String) || credentials.is_a?(Hash)
                updater_proc = Google::Ads::Googleads::Credentials.new(credentials).updater_proc
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
                "campaign_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v0.services.CampaignService",
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
              @campaign_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                &Google::Ads::Googleads::V0::Services::CampaignService::Stub.method(:new)
              )

              @get_campaign = Google::Gax.create_api_call(
                @campaign_service_stub.method(:get_campaign),
                defaults["get_campaign"],
                exception_transformer: exception_transformer
              )
              @mutate_campaigns = Google::Gax.create_api_call(
                @campaign_service_stub.method(:mutate_campaigns),
                defaults["mutate_campaigns"],
                exception_transformer: exception_transformer
              )
            end

            # Service calls

            # Returns the requested campaign in full detail.
            #
            # @param resource_name [String]
            #   The resource name of the campaign to fetch.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::Googleads::V0::Resources::Campaign]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::Googleads::V0::Resources::Campaign]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/googleads/v0/services"
            #
            #   campaign_service_client = Google::Ads::Googleads::V0::Services::Campaign.new
            #   formatted_resource_name = Google::Ads::Googleads::V0::Services::CampaignServiceClient.campaign_path("[CUSTOMER]", "[CAMPAIGN]")
            #   response = campaign_service_client.get_campaign(formatted_resource_name)

            def get_campaign \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::Googleads::V0::Services::GetCampaignRequest)
              @get_campaign.call(req, options, &block)
            end

            # Creates, updates, or removes campaigns. Operation statuses are returned.
            #
            # @param customer_id [String]
            #   The ID of the customer whose campaigns are being modified.
            # @param operations [Array<Google::Ads::Googleads::V0::Services::CampaignOperation | Hash>]
            #   The list of operations to perform on individual campaigns.
            #   A hash of the same form as `Google::Ads::Googleads::V0::Services::CampaignOperation`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::Googleads::V0::Services::MutateCampaignsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::Googleads::V0::Services::MutateCampaignsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/googleads/v0/services"
            #
            #   campaign_service_client = Google::Ads::Googleads::V0::Services::Campaign.new
            #
            #   # TODO: Initialize +customer_id+:
            #   customer_id = ''
            #
            #   # TODO: Initialize +operations+:
            #   operations = []
            #   response = campaign_service_client.mutate_campaigns(customer_id, operations)

            def mutate_campaigns \
                customer_id,
                operations,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                operations: operations
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::Googleads::V0::Services::MutateCampaignsRequest)
              @mutate_campaigns.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
