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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v2/services/mutate_job_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"
require "google/gax/operation"
require "google/longrunning/operations_client"

require "google/ads/google_ads/v2/services/mutate_job_service_pb"
require "google/ads/google_ads/v2/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V2
        module Services
          # Service to manage mutate jobs.
          #
          # @!attribute [r] mutate_job_service_stub
          #   @return [Google::Ads::GoogleAds::V2::Services::MutateJobService::Stub]
          class MutateJobServiceClient
            attr_reader :mutate_job_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            # The default set of gRPC interceptors.
            GRPC_INTERCEPTORS = []

            DEFAULT_TIMEOUT = 30

            PAGE_DESCRIPTORS = {
              "list_mutate_job_results" => Google::Gax::PageDescriptor.new(
                "page_token",
                "next_page_token",
                "results")
            }.freeze

            private_constant :PAGE_DESCRIPTORS

            # The scopes needed to make gRPC calls to all of the methods defined in
            # this service.
            ALL_SCOPES = [
            ].freeze

            class OperationsClient < Google::Longrunning::OperationsClient
              self::SERVICE_ADDRESS = MutateJobServiceClient::SERVICE_ADDRESS
              self::GRPC_INTERCEPTORS = MutateJobServiceClient::GRPC_INTERCEPTORS
            end

            MUTATE_JOB_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/mutateJobs/{mutate_job}"
            )

            private_constant :MUTATE_JOB_PATH_TEMPLATE

            # Returns a fully-qualified mutate_job resource name string.
            # @param customer [String]
            # @param mutate_job [String]
            # @return [String]
            def self.mutate_job_path customer, mutate_job
              MUTATE_JOB_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"mutate_job" => mutate_job
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
              require "google/ads/google_ads/v2/services/mutate_job_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V2::Services::Credentials.default

              @operations_client = OperationsClient.new(
                credentials: credentials,
                scopes: scopes,
                client_config: client_config,
                timeout: timeout,
                lib_name: lib_name,
                lib_version: lib_version,
                metadata: metadata,
              )

              if credentials.is_a?(String) || credentials.is_a?(Hash)
                updater_proc = Google::Ads::GoogleAds::V2::Services::Credentials.new(credentials).updater_proc
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
                "mutate_job_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v2.services.MutateJobService",
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
              @mutate_job_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V2::Services::MutateJobService::Stub.method(:new)
              )

              @create_mutate_job = Google::Gax.create_api_call(
                @mutate_job_service_stub.method(:create_mutate_job),
                defaults["create_mutate_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @get_mutate_job = Google::Gax.create_api_call(
                @mutate_job_service_stub.method(:get_mutate_job),
                defaults["get_mutate_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @list_mutate_job_results = Google::Gax.create_api_call(
                @mutate_job_service_stub.method(:list_mutate_job_results),
                defaults["list_mutate_job_results"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @run_mutate_job = Google::Gax.create_api_call(
                @mutate_job_service_stub.method(:run_mutate_job),
                defaults["run_mutate_job"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @add_mutate_job_operations = Google::Gax.create_api_call(
                @mutate_job_service_stub.method(:add_mutate_job_operations),
                defaults["add_mutate_job_operations"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
            end

            # Service calls

            # Creates a mutate job.
            #
            # @param customer_id [String]
            #   The ID of the customer for which to create a mutate job.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Services::CreateMutateJobResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Services::CreateMutateJobResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   mutate_job_client = Google::Ads::GoogleAds::MutateJob.new(version: :v2)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #   response = mutate_job_client.create_mutate_job(customer_id)

            def create_mutate_job \
                customer_id,
                options: nil,
                &block
              req = {
                customer_id: customer_id
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::CreateMutateJobRequest)
              @create_mutate_job.call(req, options, &block)
            end

            # Returns the mutate job.
            #
            # @param resource_name [String]
            #   The resource name of the MutateJob to get.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Resources::MutateJob]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Resources::MutateJob]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   mutate_job_client = Google::Ads::GoogleAds::MutateJob.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::MutateJobServiceClient.mutate_job_path("[CUSTOMER]", "[MUTATE_JOB]")
            #   response = mutate_job_client.get_mutate_job(formatted_resource_name)

            def get_mutate_job \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::GetMutateJobRequest)
              @get_mutate_job.call(req, options, &block)
            end

            # Returns the results of the mutate job. The job must be done.
            # Supports standard list paging.
            #
            # @param resource_name [String]
            #   The resource name of the MutateJob whose results are being listed.
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
            # @yieldparam result [Google::Gax::PagedEnumerable<Google::Ads::GoogleAds::V2::Services::MutateJobResult>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Gax::PagedEnumerable<Google::Ads::GoogleAds::V2::Services::MutateJobResult>]
            #   An enumerable of Google::Ads::GoogleAds::V2::Services::MutateJobResult instances.
            #   See Google::Gax::PagedEnumerable documentation for other
            #   operations such as per-page iteration or access to the response
            #   object.
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   mutate_job_client = Google::Ads::GoogleAds::MutateJob.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::MutateJobServiceClient.mutate_job_path("[CUSTOMER]", "[MUTATE_JOB]")
            #
            #   # Iterate over all results.
            #   mutate_job_client.list_mutate_job_results(formatted_resource_name).each do |element|
            #     # Process element.
            #   end
            #
            #   # Or iterate over results one page at a time.
            #   mutate_job_client.list_mutate_job_results(formatted_resource_name).each_page do |page|
            #     # Process each page at a time.
            #     page.each do |element|
            #       # Process element.
            #     end
            #   end

            def list_mutate_job_results \
                resource_name,
                page_size: nil,
                options: nil,
                &block
              req = {
                resource_name: resource_name,
                page_size: page_size
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::ListMutateJobResultsRequest)
              @list_mutate_job_results.call(req, options, &block)
            end

            # Runs the mutate job.
            #
            # The Operation.metadata field type is MutateJobMetadata. When finished, the
            # long running operation will not contain errors or a response. Instead, use
            # ListMutateJobResults to get the results of the job.
            #
            # @param resource_name [String]
            #   The resource name of the MutateJob to run.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @return [Google::Gax::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   mutate_job_client = Google::Ads::GoogleAds::MutateJob.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::MutateJobServiceClient.mutate_job_path("[CUSTOMER]", "[MUTATE_JOB]")
            #
            #   # Register a callback during the method call.
            #   operation = mutate_job_client.run_mutate_job(formatted_resource_name) do |op|
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

            def run_mutate_job \
                resource_name,
                options: nil
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::RunMutateJobRequest)
              operation = Google::Gax::Operation.new(
                @run_mutate_job.call(req, options),
                @operations_client,
                Google::Protobuf::Empty,
                Google::Ads::GoogleAds::V2::Resources::MutateJob::MutateJobMetadata,
                call_options: options
              )
              operation.on_done { |operation| yield(operation) } if block_given?
              operation
            end

            # Add operations to the mutate job.
            #
            # @param resource_name [String]
            #   The resource name of the MutateJob.
            # @param sequence_token [String]
            #   A token used to enforce sequencing.
            #
            #   The first AddMutateJobOperations request for a MutateJob should not set
            #   sequence_token. Subsequent requests must set sequence_token to the value of
            #   next_sequence_token received in the previous AddMutateJobOperations
            #   response.
            # @param mutate_operations [Array<Google::Ads::GoogleAds::V2::Services::MutateOperation | Hash>]
            #   The list of mutates being added.
            #
            #   Operations can use negative integers as temp ids to signify dependencies
            #   between entities created in this MutateJob. For example, a customer with
            #   id = 1234 can create a campaign and an ad group in that same campaign by
            #   creating a campaign in the first operation with the resource name
            #   explicitly set to "customers/1234/campaigns/-1", and creating an ad group
            #   in the second operation with the campaign field also set to
            #   "customers/1234/campaigns/-1".
            #   A hash of the same form as `Google::Ads::GoogleAds::V2::Services::MutateOperation`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Services::AddMutateJobOperationsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Services::AddMutateJobOperationsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   mutate_job_client = Google::Ads::GoogleAds::MutateJob.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::MutateJobServiceClient.mutate_job_path("[CUSTOMER]", "[MUTATE_JOB]")
            #
            #   # TODO: Initialize `sequence_token`:
            #   sequence_token = ''
            #
            #   # TODO: Initialize `mutate_operations`:
            #   mutate_operations = []
            #   response = mutate_job_client.add_mutate_job_operations(formatted_resource_name, sequence_token, mutate_operations)

            def add_mutate_job_operations \
                resource_name,
                sequence_token,
                mutate_operations,
                options: nil,
                &block
              req = {
                resource_name: resource_name,
                sequence_token: sequence_token,
                mutate_operations: mutate_operations
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::AddMutateJobOperationsRequest)
              @add_mutate_job_operations.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
