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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v2/services/campaign_draft_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"
require "google/gax/operation"
require "google/longrunning/operations_client"

require "google/ads/google_ads/v2/services/campaign_draft_service_pb"
require "google/ads/google_ads/v2/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V2
        module Services
          # Service to manage campaign drafts.
          #
          # @!attribute [r] campaign_draft_service_stub
          #   @return [Google::Ads::GoogleAds::V2::Services::CampaignDraftService::Stub]
          class CampaignDraftServiceClient
            attr_reader :campaign_draft_service_stub

            # The default address of the service.
            SERVICE_ADDRESS = "googleads.googleapis.com".freeze

            # The default port of the service.
            DEFAULT_SERVICE_PORT = 443

            # The default set of gRPC interceptors.
            GRPC_INTERCEPTORS = []

            DEFAULT_TIMEOUT = 30

            PAGE_DESCRIPTORS = {
              "list_campaign_draft_async_errors" => Google::Gax::PageDescriptor.new(
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
              self::SERVICE_ADDRESS = CampaignDraftServiceClient::SERVICE_ADDRESS
              self::GRPC_INTERCEPTORS = CampaignDraftServiceClient::GRPC_INTERCEPTORS
            end

            CAMPAIGN_DRAFT_PATH_TEMPLATE = Google::Gax::PathTemplate.new(
              "customers/{customer}/campaignDrafts/{campaign_draft}"
            )

            private_constant :CAMPAIGN_DRAFT_PATH_TEMPLATE

            # Returns a fully-qualified campaign_draft resource name string.
            # @param customer [String]
            # @param campaign_draft [String]
            # @return [String]
            def self.campaign_draft_path customer, campaign_draft
              CAMPAIGN_DRAFT_PATH_TEMPLATE.render(
                :"customer" => customer,
                :"campaign_draft" => campaign_draft
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
              require "google/ads/google_ads/v2/services/campaign_draft_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V2::Services::Credentials.default

              @operations_client = OperationsClient.new(
                credentials: credentials,
                scopes: scopes,
                client_config: client_config,
                timeout: timeout,
                lib_name: lib_name,
                lib_version: lib_version,
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
                "campaign_draft_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v2.services.CampaignDraftService",
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
              @campaign_draft_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V2::Services::CampaignDraftService::Stub.method(:new)
              )

              @get_campaign_draft = Google::Gax.create_api_call(
                @campaign_draft_service_stub.method(:get_campaign_draft),
                defaults["get_campaign_draft"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
              @mutate_campaign_drafts = Google::Gax.create_api_call(
                @campaign_draft_service_stub.method(:mutate_campaign_drafts),
                defaults["mutate_campaign_drafts"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @promote_campaign_draft = Google::Gax.create_api_call(
                @campaign_draft_service_stub.method(:promote_campaign_draft),
                defaults["promote_campaign_draft"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'campaign_draft' => request.campaign_draft}
                end
              )
              @list_campaign_draft_async_errors = Google::Gax.create_api_call(
                @campaign_draft_service_stub.method(:list_campaign_draft_async_errors),
                defaults["list_campaign_draft_async_errors"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'resource_name' => request.resource_name}
                end
              )
            end

            # Service calls

            # Returns the requested campaign draft in full detail.
            #
            # @param resource_name [String]
            #   The resource name of the campaign draft to fetch.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V2::Resources::CampaignDraft]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Resources::CampaignDraft]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_draft_client = Google::Ads::GoogleAds::CampaignDraft.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::CampaignDraftServiceClient.campaign_draft_path("[CUSTOMER]", "[CAMPAIGN_DRAFT]")
            #   response = campaign_draft_client.get_campaign_draft(formatted_resource_name)

            def get_campaign_draft \
                resource_name,
                options: nil,
                &block
              req = {
                resource_name: resource_name
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::GetCampaignDraftRequest)
              @get_campaign_draft.call(req, options, &block)
            end

            # Creates, updates, or removes campaign drafts. Operation statuses are
            # returned.
            #
            # @param customer_id [String]
            #   The ID of the customer whose campaign drafts are being modified.
            # @param operations [Array<Google::Ads::GoogleAds::V2::Services::CampaignDraftOperation | Hash>]
            #   The list of operations to perform on individual campaign drafts.
            #   A hash of the same form as `Google::Ads::GoogleAds::V2::Services::CampaignDraftOperation`
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
            # @yieldparam result [Google::Ads::GoogleAds::V2::Services::MutateCampaignDraftsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V2::Services::MutateCampaignDraftsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_draft_client = Google::Ads::GoogleAds::CampaignDraft.new(version: :v2)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `operations`:
            #   operations = []
            #   response = campaign_draft_client.mutate_campaign_drafts(customer_id, operations)

            def mutate_campaign_drafts \
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
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::MutateCampaignDraftsRequest)
              @mutate_campaign_drafts.call(req, options, &block)
            end

            # Promotes the changes in a draft back to the base campaign.
            #
            # This method returns a Long Running Operation (LRO) indicating if the
            # Promote is done. Use [Operations.GetOperation] to poll the LRO until it
            # is done. Only a done status is returned in the response. See the status
            # in the Campaign Draft resource to determine if the promotion was
            # successful. If the LRO failed, use
            # {Google::Ads::GoogleAds::V2::Services::CampaignDraftService::ListCampaignDraftAsyncErrors CampaignDraftService::ListCampaignDraftAsyncErrors} to view the list of
            # error reasons.
            #
            # @param campaign_draft [String]
            #   The resource name of the campaign draft to promote.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @return [Google::Gax::Operation]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   campaign_draft_client = Google::Ads::GoogleAds::CampaignDraft.new(version: :v2)
            #   formatted_campaign_draft = Google::Ads::GoogleAds::V2::Services::CampaignDraftServiceClient.campaign_draft_path("[CUSTOMER]", "[CAMPAIGN_DRAFT]")
            #
            #   # Register a callback during the method call.
            #   operation = campaign_draft_client.promote_campaign_draft(formatted_campaign_draft) do |op|
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

            def promote_campaign_draft \
                campaign_draft,
                options: nil
              req = {
                campaign_draft: campaign_draft
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::PromoteCampaignDraftRequest)
              operation = Google::Gax::Operation.new(
                @promote_campaign_draft.call(req, options),
                @operations_client,
                Google::Protobuf::Empty,
                Google::Protobuf::Empty,
                call_options: options
              )
              operation.on_done { |operation| yield(operation) } if block_given?
              operation
            end

            # Returns all errors that occurred during CampaignDraft promote. Throws an
            # error if called before campaign draft is promoted.
            # Supports standard list paging.
            #
            # @param resource_name [String]
            #   The name of the campaign draft from which to retrieve the async errors.
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
            #   campaign_draft_client = Google::Ads::GoogleAds::CampaignDraft.new(version: :v2)
            #   formatted_resource_name = Google::Ads::GoogleAds::V2::Services::CampaignDraftServiceClient.campaign_draft_path("[CUSTOMER]", "[CAMPAIGN_DRAFT]")
            #
            #   # Iterate over all results.
            #   campaign_draft_client.list_campaign_draft_async_errors(formatted_resource_name).each do |element|
            #     # Process element.
            #   end
            #
            #   # Or iterate over results one page at a time.
            #   campaign_draft_client.list_campaign_draft_async_errors(formatted_resource_name).each_page do |page|
            #     # Process each page at a time.
            #     page.each do |element|
            #       # Process element.
            #     end
            #   end

            def list_campaign_draft_async_errors \
                resource_name,
                page_size: nil,
                options: nil,
                &block
              req = {
                resource_name: resource_name,
                page_size: page_size
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V2::Services::ListCampaignDraftAsyncErrorsRequest)
              @list_campaign_draft_async_errors.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
