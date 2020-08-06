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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v3/services/offline_user_data_job_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"
require "google/gax/operation"
require "google/longrunning/operations_client"

require "google/ads/google_ads/v3/services/offline_user_data_job_service_pb"
require "google/ads/google_ads/v3/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V3
        module Services
          # Service to manage offline user data jobs.
          #
          # @!attribute [r] offline_user_data_job_service_stub
          #   @return [Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobService::Stub]
          class OfflineUserDataJobServiceClient
            attr_reader :offline_user_data_job_service_stub

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

            class OperationsClient < Google::Longrunning::OperationsClient
              self::SERVICE_ADDRESS = OfflineUserDataJobServiceClient::SERVICE_ADDRESS
              self::GRPC_INTERCEPTORS = OfflineUserDataJobServiceClient::GRPC_INTERCEPTORS
            end

            OFFLINE_USER_DATA_JOB_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/offlineUserDataJobs/{offline_user_data_job}"
            )

            private_constant :OFFLINE_USER_DATA_JOB_PATH_TEMPLATE

            # Returns a fully-qualified offline_user_data_job resource name string.
            # @param customer [String]
            # @param offline_user_data_job [String]
            # @return [String]
            def self.offline_user_data_job_path customer, offline_user_data_job
              OFFLINE_USER_DATA_JOB_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"offline_user_data_job" => offline_user_data_job
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
              require "google/ads/google_ads/v3/services/offline_user_data_job_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V3::Services::Credentials.default

              @operations_client = OperationsClient.new(
                credentials: credentials,
                scopes: scopes,
                client_config: client_config,
                timeout: timeout,
                lib_name: lib_name,
                lib_version: lib_version,
              )

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
                "offline_user_data_job_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v3.services.OfflineUserDataJobService",
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
              @offline_user_data_job_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobService::Stub.method(:new)
              )

              @create_offline_user_data_job = Google::Gax.create_api_call(
                @offline_user_data_job_service_stub.method(:create_offline_user_data_job),
                defaults["create_offline_user_data_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @get_offline_user_data_job = Google::Gax.create_api_call(
                @offline_user_data_job_service_stub.method(:get_offline_user_data_job),
                defaults["get_offline_user_data_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @add_offline_user_data_job_operations = Google::Gax.create_api_call(
                @offline_user_data_job_service_stub.method(:add_offline_user_data_job_operations),
                defaults["add_offline_user_data_job_operations"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @run_offline_user_data_job = Google::Gax.create_api_call(
                @offline_user_data_job_service_stub.method(:run_offline_user_data_job),
                defaults["run_offline_user_data_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
            end

            # Service calls

            # Creates an offline user data job.
            #
            # @param customer_id [String]
            #   Required. The ID of the customer for which to create an offline user data job.
            # @param job [Google::Ads::GoogleAds::V3::Resources::OfflineUserDataJob | Hash]
            #   Required. The offline user data job to be created.
            #   A hash of the same form as `Google::Ads::GoogleAds::V3::Resources::OfflineUserDataJob`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Services::CreateOfflineUserDataJobResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Services::CreateOfflineUserDataJobResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   offline_user_data_job_client = Google::Ads::GoogleAds::OfflineUserDataJob.new(version: :v3)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `job`:
            #   job = {}
            #   response = offline_user_data_job_client.create_offline_user_data_job(customer_id, job)

            def create_offline_user_data_job \
                customer_id,
                job,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                job: job
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::CreateOfflineUserDataJobRequest)
              @create_offline_user_data_job.call(req, options, &block)
            end

            # Returns the offline user data job.
            #
            # @param resource_name [String]
            #   Required. The resource name of the OfflineUserDataJob to get.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Resources::OfflineUserDataJob]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Resources::OfflineUserDataJob]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   offline_user_data_job_client = Google::Ads::GoogleAds::OfflineUserDataJob.new(version: :v3)
            #   formatted_resource_name = Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobServiceClient.offline_user_data_job_path("[CUSTOMER]", "[OFFLINE_USER_DATA_JOB]")
            #   response = offline_user_data_job_client.get_offline_user_data_job(formatted_resource_name)

            def get_offline_user_data_job \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::GetOfflineUserDataJobRequest)
              @get_offline_user_data_job.call(req, options, &block)
            end

            # Adds operations to the offline user data job.
            #
            # @param resource_name [String]
            #   Required. The resource name of the OfflineUserDataJob.
            # @param enable_partial_failure [Google::Protobuf::BoolValue | Hash]
            #   True to enable partial failure for the offline user data job.
            #   A hash of the same form as `Google::Protobuf::BoolValue`
            #   can also be provided.
            # @param operations [Array<Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobOperation | Hash>]
            #   Required. The list of operations to be done.
            #   A hash of the same form as `Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobOperation`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V3::Services::AddOfflineUserDataJobOperationsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V3::Services::AddOfflineUserDataJobOperationsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   offline_user_data_job_client = Google::Ads::GoogleAds::OfflineUserDataJob.new(version: :v3)
            #   formatted_resource_name = Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobServiceClient.offline_user_data_job_path("[CUSTOMER]", "[OFFLINE_USER_DATA_JOB]")
            #
            #   # TODO: Initialize `enable_partial_failure`:
            #   enable_partial_failure = {}
            #
            #   # TODO: Initialize `operations`:
            #   operations = []
            #   response = offline_user_data_job_client.add_offline_user_data_job_operations(formatted_resource_name, enable_partial_failure, operations)

            def add_offline_user_data_job_operations \
                resource_name,
                enable_partial_failure,
                operations,
                options: nil,
                &block
              req = {
                resource_name: resource_name,
                enable_partial_failure: enable_partial_failure,
                operations: operations
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::AddOfflineUserDataJobOperationsRequest)
              @add_offline_user_data_job_operations.call(req, options, &block)
            end

            # Runs the offline user data job.
            #
            # When finished, the long running operation will contain the processing
            # result or failure information, if any.
            #
            # @param resource_name [String]
            #   Required. The resource name of the OfflineUserDataJob to run.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @return [Google::Gax::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   offline_user_data_job_client = Google::Ads::GoogleAds::OfflineUserDataJob.new(version: :v3)
            #   formatted_resource_name = Google::Ads::GoogleAds::V3::Services::OfflineUserDataJobServiceClient.offline_user_data_job_path("[CUSTOMER]", "[OFFLINE_USER_DATA_JOB]")
            #
            #   # Register a callback during the method call.
            #   operation = offline_user_data_job_client.run_offline_user_data_job(formatted_resource_name) do |op|
            #     raise op.results.message if op.error?
            #     op_results = op.results
            #     # Process the results.
            #
            #     metadata = op.metadata
            #     # Process the metadata.
            #   end
            #
            #   # Or use the return value to register a callback.
            #   operation.on_done do |op|
            #     raise op.results.message if op.error?
            #     op_results = op.results
            #     # Process the results.
            #
            #     metadata = op.metadata
            #     # Process the metadata.
            #   end
            #
            #   # Manually reload the operation.
            #   operation.reload!
            #
            #   # Or block until the operation completes, triggering callbacks on
            #   # completion.
            #   operation.wait_until_done!

            def run_offline_user_data_job \
                resource_name,
                options: nil
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V3::Services::RunOfflineUserDataJobRequest)
              operation = Google::Gax::Operation.new(
                @run_offline_user_data_job.call(req, options),
                @operations_client,
                Google::Protobuf::Empty,
                Google::Protobuf::Empty,
                call_options: options
              )
              operation.on_done { |operation| yield(operation) } if block_given?
              operation
            end
          end
        end
      end
    end
  end
end
