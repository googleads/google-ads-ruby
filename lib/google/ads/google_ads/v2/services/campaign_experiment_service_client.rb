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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v2/services/campaign_experiment_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"
require "google/gax/operation"
require "google/longrunning/operations_client"

require "google/ads/google_ads/v2/services/campaign_experiment_service_pb"
require "google/ads/google_ads/v2/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V2
        module Services
          # CampaignExperimentService manages the life cycle of campaign experiments.
          # It is used to create new experiments from drafts, modify experiment
          # properties, promote changes in an experiment back to its base campaign,
          # graduate experiments into new stand-alone campaigns, and to remove an
          # experiment.
          #
          # An experiment consists of two variants or arms - the base campaign and the
          # experiment campaign, directing a fixed share of traffic to each arm.
          # A campaign experiment is created from a draft of changes to the base campaign
          # and will be a snapshot of changes in the draft at the time of creation.
          #
          # @!attribute [r] campaign_experiment_service_stub
          #   @return [Google::Ads::GoogleAds::V2::Services::CampaignExperimentService::Stub]
          class CampaignExperimentServiceClient
            attr_reader :campaign_experiment_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            # The default set of gRPC interceptors.
            GRPC_INTERCEPTORS = []

            DEFAULT_TIMEOUT = 30

            PAGE_DESCRIPTORS = {
              "list_campaign_experiment_async_errors" => Google::Gax::PageDescriptor.new(
                "page_token",
                "next_page_token",
                "errors")
            }.freeze

            private_constant :PAGE_DESCRIPTORS

            # The scopes needed to make gRPC calls to all of the methods defined in
            # this service.
            ALL_SCOPES = [
            ].freeze

            class OperationsClient < Google::Longrunning::OperationsClient
              self::SERVICE_ADDRESS = CampaignExperimentServiceClient::SERVICE_ADDRESS
              self::GRPC_INTERCEPTORS = CampaignExperimentServiceClient::GRPC_INTERCEPTORS
            end

            CAMPAIGN_EXPERIMENT_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/campaignExperiments/{campaign_experiment}"
            )

            private_constant :CAMPAIGN_EXPERIMENT_PATH_TEMPLATE

            # Returns a fully-qualified campaign_experiment resource name string.
            # @param customer [String]
            # @param campaign_experiment [String]
            # @return [String]
            def self.campaign_experiment_path customer, campaign_experiment
              CAMPAIGN_EXPERIMENT_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"campaign_experiment" => campaign_experiment
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
              require "google/ads/google_ads/v2/services/campaign_experiment_service_services_pb"

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
                "campaign_experiment_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v2.services.CampaignExperimentService",
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
              @campaign_experiment_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V2::Services::CampaignExperimentService::Stub.method(:new)
              )

              @get_campaign_experiment = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:get_campaign_experiment),
                defaults["get_campaign_experiment"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @create_campaign_experiment = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:create_campaign_experiment),
                defaults["create_campaign_experiment"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @mutate_campaign_experiments = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:mutate_campaign_experiments),
                defaults["mutate_campaign_experiments"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @graduate_campaign_experiment = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:graduate_campaign_experiment),
                defaults["graduate_campaign_experiment"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'campaign_experiment' => request.campaign_experiment}
                end
              )
              @promote_campaign_experiment = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:promote_campaign_experiment),
                defaults["promote_campaign_experiment"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'campaign_experiment' => request.campaign_experiment}
                end
              )
              @end_campaign_experiment = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:end_campaign_experiment),
                defaults["end_campaign_experiment"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'campaign_experiment' => request.campaign_experiment}
                end
              )
              @list_campaign_experiment_async_errors = Google::Gax.create_api_call(
                @campaign_experiment_service_stub.method(:list_campaign_experiment_async_errors),
                defaults["list_campaign_experiment_async_errors"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
            end

            # Service calls

            # Returns the requested campaign experiment in full detail.
            #
            # @param resource_name [String]
            #   The resource name of the campaign experiment to fetch.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Resources::CampaignExperiment]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Resources::CampaignExperiment]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::CampaignExperimentServiceClient.campaign_experiment_path("[CUSTOMER]", "[CAMPAIGN_EXPERIMENT]")
            #   response = campaign_experiment_client.get_campaign_experiment(formatted_resource_name)

            def get_campaign_experiment \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::GetCampaignExperimentRequest)
              @get_campaign_experiment.call(req, options, &block)
            end

            # Creates a campaign experiment based on a campaign draft. The draft campaign
            # will be forked into a real campaign (called the experiment campaign) that
            # will begin serving ads if successfully created.
            #
            # The campaign experiment is created immediately with status INITIALIZING.
            # This method return a long running operation that tracks the forking of the
            # draft campaign. If the forking fails, a list of errors can be retrieved
            # using the ListCampaignExperimentAsyncErrors method. The operation's
            # metadata will be a StringValue containing the resource name of the created
            # campaign experiment.
            #
            # @param customer_id [String]
            #   The ID of the customer whose campaign experiment is being created.
            # @param campaign_experiment [Google::Ads::GoogleAds::V2::Resources::CampaignExperiment | Hash]
            #   The campaign experiment to be created.
            #   A hash of the same form as `Google::Ads::GoogleAds::V2::Resources::CampaignExperiment`
            #   can also be provided.
            # @param validate_only [true, false]
            #   If true, the request is validated but not executed. Only errors are
            #   returned, not results.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @return [Google::Gax::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `campaign_experiment`:
            #   campaign_experiment = {}
            #
            #   # Register a callback during the method call.
            #   operation = campaign_experiment_client.create_campaign_experiment(customer_id, campaign_experiment) do |op|
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

            def create_campaign_experiment \
                customer_id,
                campaign_experiment,
                validate_only: nil,
                options: nil
              req = {
                customer_id: customer_id,
                campaign_experiment: campaign_experiment,
                validate_only: validate_only
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::CreateCampaignExperimentRequest)
              operation = Google::Gax::Operation.new(
                @create_campaign_experiment.call(req, options),
                @operations_client,
                Google::Protobuf::Empty,
                Google::Ads::GoogleAds::V2::Services::CreateCampaignExperimentMetadata,
                call_options: options
              )
              operation.on_done { |operation| yield(operation) } if block_given?
              operation
            end

            # Updates campaign experiments. Operation statuses are returned.
            #
            # @param customer_id [String]
            #   The ID of the customer whose campaign experiments are being modified.
            # @param operations [Array<Google::Ads::GoogleAds::V2::Services::CampaignExperimentOperation | Hash>]
            #   The list of operations to perform on individual campaign experiments.
            #   A hash of the same form as `Google::Ads::GoogleAds::V2::Services::CampaignExperimentOperation`
            #   can also be provided.
            # @param partial_failure [true, false]
            #   If true, successful operations will be carried out and invalid
            #   operations will return errors. If false, all operations will be carried
            #   out in one transaction if and only if they are all valid.
            #   Default is false.
            # @param validate_only [true, false]
            #   If true, the request is validated but not executed. Only errors are
            #   returned, not results.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Services::MutateCampaignExperimentsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Services::MutateCampaignExperimentsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `operations`:
            #   operations = []
            #   response = campaign_experiment_client.mutate_campaign_experiments(customer_id, operations)

            def mutate_campaign_experiments \
                customer_id,
                operations,
                partial_failure: nil,
                validate_only: nil,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                operations: operations,
                partial_failure: partial_failure,
                validate_only: validate_only
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::MutateCampaignExperimentsRequest)
              @mutate_campaign_experiments.call(req, options, &block)
            end

            # Graduates a campaign experiment to a full campaign. The base and experiment
            # campaigns will start running independently with their own budgets.
            #
            # @param campaign_experiment [String]
            #   The resource name of the campaign experiment to graduate.
            # @param campaign_budget [String]
            #   Resource name of the budget to attach to the campaign graduated from the
            #   experiment.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Services::GraduateCampaignExperimentResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Services::GraduateCampaignExperimentResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #   formatted_campaign_experiment = Google::Ads::GoogleAds::V2::Services::CampaignExperimentServiceClient.campaign_experiment_path("[CUSTOMER]", "[CAMPAIGN_EXPERIMENT]")
            #
            #   # TODO: Initialize `campaign_budget`:
            #   campaign_budget = ''
            #   response = campaign_experiment_client.graduate_campaign_experiment(formatted_campaign_experiment, campaign_budget)

            def graduate_campaign_experiment \
                campaign_experiment,
                campaign_budget,
                options: nil,
                &block
              req = {
                campaign_experiment: campaign_experiment,
                campaign_budget: campaign_budget
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::GraduateCampaignExperimentRequest)
              @graduate_campaign_experiment.call(req, options, &block)
            end

            # Promotes the changes in a experiment campaign back to the base campaign.
            #
            # The campaign experiment is updated immediately with status PROMOTING.
            # This method return a long running operation that tracks the promoting of
            # the experiment campaign. If the promoting fails, a list of errors can be
            # retrieved using the ListCampaignExperimentAsyncErrors method.
            #
            # @param campaign_experiment [String]
            #   The resource name of the campaign experiment to promote.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @return [Google::Gax::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #   formatted_campaign_experiment = Google::Ads::GoogleAds::V2::Services::CampaignExperimentServiceClient.campaign_experiment_path("[CUSTOMER]", "[CAMPAIGN_EXPERIMENT]")
            #
            #   # Register a callback during the method call.
            #   operation = campaign_experiment_client.promote_campaign_experiment(formatted_campaign_experiment) do |op|
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

            def promote_campaign_experiment \
                campaign_experiment,
                options: nil
              req = {
                campaign_experiment: campaign_experiment
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::PromoteCampaignExperimentRequest)
              operation = Google::Gax::Operation.new(
                @promote_campaign_experiment.call(req, options),
                @operations_client,
                Google::Protobuf::Empty,
                Google::Protobuf::Empty,
                call_options: options
              )
              operation.on_done { |operation| yield(operation) } if block_given?
              operation
            end

            # Immediately ends a campaign experiment, changing the experiment's scheduled
            # end date and without waiting for end of day. End date is updated to be the
            # time of the request.
            #
            # @param campaign_experiment [String]
            #   The resource name of the campaign experiment to end.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result []
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #   formatted_campaign_experiment = Google::Ads::GoogleAds::V2::Services::CampaignExperimentServiceClient.campaign_experiment_path("[CUSTOMER]", "[CAMPAIGN_EXPERIMENT]")
            #   campaign_experiment_client.end_campaign_experiment(formatted_campaign_experiment)

            def end_campaign_experiment \
                campaign_experiment,
                options: nil,
                &block
              req = {
                campaign_experiment: campaign_experiment
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::EndCampaignExperimentRequest)
              @end_campaign_experiment.call(req, options, &block)
              nil
            end

            # Returns all errors that occurred during CampaignExperiment create or
            # promote (whichever occurred last).
            # Supports standard list paging.
            #
            # @param resource_name [String]
            #   The name of the campaign experiment from which to retrieve the async
            #   errors.
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
            # @yieldparam result [Google::Gax::PagedEnumerable<Google::Rpc::Status>]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Gax::PagedEnumerable<Google::Rpc::Status>]
            #   An enumerable of Google::Rpc::Status instances.
            #   See Google::Gax::PagedEnumerable documentation for other
            #   operations such as per-page iteration or access to the response
            #   object.
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_experiment_client = Google::Ads::GoogleAds::CampaignExperiment.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::CampaignExperimentServiceClient.campaign_experiment_path("[CUSTOMER]", "[CAMPAIGN_EXPERIMENT]")
            #
            #   # Iterate over all results.
            #   campaign_experiment_client.list_campaign_experiment_async_errors(formatted_resource_name).each do |element|
            #     # Process element.
            #   end
            #
            #   # Or iterate over results one page at a time.
            #   campaign_experiment_client.list_campaign_experiment_async_errors(formatted_resource_name).each_page do |page|
            #     # Process each page at a time.
            #     page.each do |element|
            #       # Process element.
            #     end
            #   end

            def list_campaign_experiment_async_errors \
                resource_name,
                page_size: nil,
                options: nil,
                &block
              req = {
                resource_name: resource_name,
                page_size: page_size
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::ListCampaignExperimentAsyncErrorsRequest)
              @list_campaign_experiment_async_errors.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
