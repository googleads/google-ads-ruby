# frozen_string_literal: true

# Copyright 2021 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

# require "google/ads/google_ads/error"
require "google/ads/google_ads/v8/services/google_ads_service_pb"

module Google
  module Ads
    module GoogleAds
      module V8
        module Services
          module GoogleAdsService
            ##
            # Client for the GoogleAdsService service.
            #
            # Service to fetch data and metrics across resources.
            #
            class Client
              include Paths

              # @private
              attr_reader :google_ads_service_stub

              ##
              # Configure the GoogleAdsService Client class.
              #
              # See {::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client::Configuration}
              # for a description of the configuration fields.
              #
              # ## Example
              #
              # To modify the configuration for all GoogleAdsService clients:
              #
              #     ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client.configure do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def self.configure
                @configure ||= begin
                  default_config = Client::Configuration.new

                  default_config.timeout = 3600.0
                  default_config.retry_policy = {
                    initial_delay: 5.0,
                  max_delay: 60.0,
                  multiplier: 1.3,
                  retry_codes: [14, 4]
                  }

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the GoogleAdsService Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def configure
                yield @config if block_given?
                @config
              end

              ##
              # Create a new GoogleAdsService client object.
              #
              # ## Examples
              #
              # To create a new GoogleAdsService client with the default
              # configuration:
              #
              #     client = ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client.new
              #
              # To create a new GoogleAdsService client with a custom
              # configuration:
              #
              #     client = ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client.new do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the GoogleAdsService client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # These require statements are intentionally placed here to initialize
                # the gRPC module only when it's required.
                # See https://github.com/googleapis/toolkit/issues/446
                require "gapic/grpc"
                require "google/ads/google_ads/v8/services/google_ads_service_services_pb"

                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                # Use self-signed JWT if the scope and endpoint are unchanged from default,
                # but only if the default endpoint does not have a region prefix.
                enable_self_signed_jwt = @config.scope == Client.configure.scope &&
                                         @config.endpoint == Client.configure.endpoint &&
                                         !@config.endpoint.split(".").first.include?("-")
                credentials ||= Credentials.default scope: @config.scope,
                                                    enable_self_signed_jwt: enable_self_signed_jwt
                if credentials.is_a?(String) || credentials.is_a?(Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end
                @quota_project_id = @config.quota_project
                @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

                @google_ads_service_stub = ::Gapic::ServiceStub.new(
                  ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Stub,
                  credentials:  credentials,
                  endpoint:     @config.endpoint,
                  channel_args: @config.channel_args,
                  interceptors: @config.interceptors
                )
              end

              # Service calls

              ##
              # Returns all rows that match the search query.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ChangeEventError]()
              #   [ChangeStatusError]()
              #   [ClickViewError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QueryError]()
              #   [QuotaError]()
              #   [RequestError]()
              #
              # @overload search(request, options = nil)
              #   Pass arguments to `search` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload search(customer_id: nil, query: nil, page_token: nil, page_size: nil, validate_only: nil, return_total_results_count: nil, summary_row_setting: nil)
              #   Pass arguments to `search` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer being queried.
              #   @param query [::String]
              #     Required. The query string.
              #   @param page_token [::String]
              #     Token of the page to retrieve. If not specified, the first
              #     page of results will be returned. Use the value obtained from
              #     `next_page_token` in the previous response in order to request
              #     the next page of results.
              #   @param page_size [::Integer]
              #     Number of elements to retrieve in a single page.
              #     When too large a page is requested, the server may decide to
              #     further limit the number of returned resources.
              #   @param validate_only [::Boolean]
              #     If true, the request is validated but not executed.
              #   @param return_total_results_count [::Boolean]
              #     If true, the total number of results that match the query ignoring the
              #     LIMIT clause will be included in the response.
              #     Default is false.
              #   @param summary_row_setting [::Google::Ads::GoogleAds::V8::Enums::SummaryRowSettingEnum::SummaryRowSetting]
              #     Determines whether a summary row will be returned. By default, summary row
              #     is not returned. If requested, the summary row will be sent in a response
              #     by itself after all other query results are returned.
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Gapic::PagedEnumerable<::Google::Ads::GoogleAds::V8::Services::GoogleAdsRow>]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Gapic::PagedEnumerable<::Google::Ads::GoogleAds::V8::Services::GoogleAdsRow>]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              def search request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.search.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {
                  "customer_id" => request.customer_id
                }
                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.search.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.search.retry_policy
                options.apply_defaults metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @google_ads_service_stub.call_rpc :search, request, options: options do |response, operation|
                  response = ::Gapic::PagedEnumerable.new @google_ads_service_stub, :search, request, response,
                                                          operation, options
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Returns all rows that match the search stream query.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ChangeEventError]()
              #   [ChangeStatusError]()
              #   [ClickViewError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QueryError]()
              #   [QuotaError]()
              #   [RequestError]()
              #
              # @overload search_stream(request, options = nil)
              #   Pass arguments to `search_stream` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsStreamRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsStreamRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload search_stream(customer_id: nil, query: nil, summary_row_setting: nil)
              #   Pass arguments to `search_stream` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer being queried.
              #   @param query [::String]
              #     Required. The query string.
              #   @param summary_row_setting [::Google::Ads::GoogleAds::V8::Enums::SummaryRowSettingEnum::SummaryRowSetting]
              #     Determines whether a summary row will be returned. By default, summary row
              #     is not returned. If requested, the summary row will be sent in a response
              #     by itself after all other query results are returned.
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Enumerable<::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsStreamResponse>]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Enumerable<::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsStreamResponse>]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              def search_stream request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V8::Services::SearchGoogleAdsStreamRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.search_stream.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {
                  "customer_id" => request.customer_id
                }
                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.search_stream.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.search_stream.retry_policy
                options.apply_defaults metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @google_ads_service_stub.call_rpc :search_stream, request, options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Creates, updates, or removes resources. This method supports atomic
              # transactions with multiple types of resources. For example, you can
              # atomically create a campaign and a campaign budget, or perform up to
              # thousands of mutates atomically.
              #
              # This method is essentially a wrapper around a series of mutate methods. The
              # only features it offers over calling those methods directly are:
              #
              # - Atomic transactions
              # - Temp resource names (described below)
              # - Somewhat reduced latency over making a series of mutate calls
              #
              # Note: Only resources that support atomic transactions are included, so this
              # method can't replace all calls to individual services.
              #
              # ## Atomic Transaction Benefits
              #
              # Atomicity makes error handling much easier. If you're making a series of
              # changes and one fails, it can leave your account in an inconsistent state.
              # With atomicity, you either reach the desired state directly, or the request
              # fails and you can retry.
              #
              # ## Temp Resource Names
              #
              # Temp resource names are a special type of resource name used to create a
              # resource and reference that resource in the same request. For example, if a
              # campaign budget is created with `resource_name` equal to
              # `customers/123/campaignBudgets/-1`, that resource name can be reused in
              # the `Campaign.budget` field in the same request. That way, the two
              # resources are created and linked atomically.
              #
              # To create a temp resource name, put a negative number in the part of the
              # name that the server would normally allocate.
              #
              # Note:
              #
              # - Resources must be created with a temp name before the name can be reused.
              #   For example, the previous CampaignBudget+Campaign example would fail if
              #   the mutate order was reversed.
              # - Temp names are not remembered across requests.
              # - There's no limit to the number of temp names in a request.
              # - Each temp name must use a unique negative number, even if the resource
              #   types differ.
              #
              # ## Latency
              #
              # It's important to group mutates by resource type or the request may time
              # out and fail. Latency is roughly equal to a series of calls to individual
              # mutate methods, where each change in resource type is a new call. For
              # example, mutating 10 campaigns then 10 ad groups is like 2 calls, while
              # mutating 1 campaign, 1 ad group, 1 campaign, 1 ad group is like 4 calls.
              #
              # List of thrown errors:
              #   [AdCustomizerError]()
              #   [AdError]()
              #   [AdGroupAdError]()
              #   [AdGroupCriterionError]()
              #   [AdGroupError]()
              #   [AssetError]()
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [BiddingError]()
              #   [CampaignBudgetError]()
              #   [CampaignCriterionError]()
              #   [CampaignError]()
              #   [CampaignExperimentError]()
              #   [CampaignSharedSetError]()
              #   [CollectionSizeError]()
              #   [ContextError]()
              #   [ConversionActionError]()
              #   [CriterionError]()
              #   [CustomerFeedError]()
              #   [DatabaseError]()
              #   [DateError]()
              #   [DateRangeError]()
              #   [DistinctError]()
              #   [ExtensionFeedItemError]()
              #   [ExtensionSettingError]()
              #   [FeedAttributeReferenceError]()
              #   [FeedError]()
              #   [FeedItemError]()
              #   [FeedItemSetError]()
              #   [FieldError]()
              #   [FieldMaskError]()
              #   [FunctionParsingError]()
              #   [HeaderError]()
              #   [ImageError]()
              #   [InternalError]()
              #   [KeywordPlanAdGroupKeywordError]()
              #   [KeywordPlanCampaignError]()
              #   [KeywordPlanError]()
              #   [LabelError]()
              #   [ListOperationError]()
              #   [MediaUploadError]()
              #   [MutateError]()
              #   [NewResourceCreationError]()
              #   [NullError]()
              #   [OperationAccessDeniedError]()
              #   [PolicyFindingError]()
              #   [PolicyViolationError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              #   [ResourceCountLimitExceededError]()
              #   [SettingError]()
              #   [SharedSetError]()
              #   [SizeLimitError]()
              #   [StringFormatError]()
              #   [StringLengthError]()
              #   [UrlFieldError]()
              #   [UserListError]()
              #   [YoutubeVideoRegistrationError]()
              #
              # @overload mutate(request, options = nil)
              #   Pass arguments to `mutate` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V8::Services::MutateGoogleAdsRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V8::Services::MutateGoogleAdsRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload mutate(customer_id: nil, mutate_operations: nil, partial_failure: nil, validate_only: nil, response_content_type: nil)
              #   Pass arguments to `mutate` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer whose resources are being modified.
              #   @param mutate_operations [::Array<::Google::Ads::GoogleAds::V8::Services::MutateOperation, ::Hash>]
              #     Required. The list of operations to perform on individual resources.
              #   @param partial_failure [::Boolean]
              #     If true, successful operations will be carried out and invalid
              #     operations will return errors. If false, all operations will be carried
              #     out in one transaction if and only if they are all valid.
              #     Default is false.
              #   @param validate_only [::Boolean]
              #     If true, the request is validated but not executed. Only errors are
              #     returned, not results.
              #   @param response_content_type [::Google::Ads::GoogleAds::V8::Enums::ResponseContentTypeEnum::ResponseContentType]
              #     The response content type setting. Determines whether the mutable resource
              #     or just the resource name should be returned post mutation. The mutable
              #     resource will only be returned if the resource has the appropriate response
              #     field. E.g. MutateCampaignResult.campaign.
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Ads::GoogleAds::V8::Services::MutateGoogleAdsResponse]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Ads::GoogleAds::V8::Services::MutateGoogleAdsResponse]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              def mutate request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V8::Services::MutateGoogleAdsRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.mutate.metadata.to_h

                # Set x-goog-api-client and x-goog-user-project headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {
                  "customer_id" => request.customer_id
                }
                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.mutate.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.mutate.retry_policy
                options.apply_defaults metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @google_ads_service_stub.call_rpc :mutate, request, options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Configuration class for the GoogleAdsService API.
              #
              # This class represents the configuration for GoogleAdsService,
              # providing control over timeouts, retry behavior, logging, transport
              # parameters, and other low-level controls. Certain parameters can also be
              # applied individually to specific RPCs. See
              # {::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client::Configuration::Rpcs}
              # for a list of RPCs that can be configured independently.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # # Examples
              #
              # To modify the global config, setting the timeout for search
              # to 20 seconds, and all remaining timeouts to 10 seconds:
              #
              #     ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client.configure do |config|
              #       config.timeout = 10.0
              #       config.rpcs.search.timeout = 20.0
              #     end
              #
              # To apply the above configuration only to a new client:
              #
              #     client = ::Google::Ads::GoogleAds::V8::Services::GoogleAdsService::Client.new do |config|
              #       config.timeout = 10.0
              #       config.rpcs.search.timeout = 20.0
              #     end
              #
              # @!attribute [rw] endpoint
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"googleads.googleapis.com"`.
              #   @return [::String]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
              #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
              #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
              #    *  (`nil`) indicating no credentials
              #   @return [::Object]
              # @!attribute [rw] scope
              #   The OAuth scopes
              #   @return [::Array<::String>]
              # @!attribute [rw] lib_name
              #   The library name as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] lib_version
              #   The library version as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] channel_args
              #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
              #   `GRPC::Core::Channel` object is provided as the credential.
              #   @return [::Hash]
              # @!attribute [rw] interceptors
              #   An array of interceptors that are run before calls are executed.
              #   @return [::Array<::GRPC::ClientInterceptor>]
              # @!attribute [rw] timeout
              #   The call timeout in seconds.
              #   @return [::Numeric]
              # @!attribute [rw] metadata
              #   Additional gRPC headers to be sent with the call.
              #   @return [::Hash{::Symbol=>::String}]
              # @!attribute [rw] retry_policy
              #   The retry policy. The value is a hash with the following keys:
              #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #       trigger a retry.
              #   @return [::Hash]
              # @!attribute [rw] quota_project
              #   A separate project against which to charge quota.
              #   @return [::String]
              #
              class Configuration
                extend ::Gapic::Config

                config_attr :endpoint,      "googleads.googleapis.com", ::String
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client,
                             nil]
                  allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
                config_attr :interceptors,  nil, ::Array, nil
                config_attr :timeout,       nil, ::Numeric, nil
                config_attr :metadata,      nil, ::Hash, nil
                config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
                config_attr :quota_project, nil, ::String, nil

                # @private
                def initialize parent_config = nil
                  @parent_config = parent_config unless parent_config.nil?

                  yield self if block_given?
                end

                ##
                # Configurations for individual RPCs
                # @return [Rpcs]
                #
                def rpcs
                  @rpcs ||= begin
                    parent_rpcs = nil
                    parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                    Rpcs.new parent_rpcs
                  end
                end

                ##
                # Configuration RPC class for the GoogleAdsService API.
                #
                # Includes fields providing the configuration for each RPC in this service.
                # Each configuration object is of type `Gapic::Config::Method` and includes
                # the following configuration fields:
                #
                #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
                #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
                #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
                #     include the following keys:
                #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
                #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
                #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
                #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
                #         trigger a retry.
                #
                class Rpcs
                  ##
                  # RPC-specific configuration for `search`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :search
                  ##
                  # RPC-specific configuration for `search_stream`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :search_stream
                  ##
                  # RPC-specific configuration for `mutate`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :mutate

                  # @private
                  def initialize parent_rpcs = nil
                    search_config = parent_rpcs.search if parent_rpcs.respond_to? :search
                    @search = ::Gapic::Config::Method.new search_config
                    search_stream_config = parent_rpcs.search_stream if parent_rpcs.respond_to? :search_stream
                    @search_stream = ::Gapic::Config::Method.new search_stream_config
                    mutate_config = parent_rpcs.mutate if parent_rpcs.respond_to? :mutate
                    @mutate = ::Gapic::Config::Method.new mutate_config

                    yield self if block_given?
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
