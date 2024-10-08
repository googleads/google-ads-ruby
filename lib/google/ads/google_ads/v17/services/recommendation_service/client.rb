# frozen_string_literal: true

# Copyright 2024 Google LLC
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
require "google/ads/google_ads/v17/services/recommendation_service_pb"

module Google
  module Ads
    module GoogleAds
      module V17
        module Services
          module RecommendationService
            ##
            # Client for the RecommendationService service.
            #
            # Service to manage recommendations.
            #
            class Client
              # @private
              API_VERSION = ""

              # @private
              DEFAULT_ENDPOINT_TEMPLATE = "googleads.$UNIVERSE_DOMAIN$"

              include Paths

              # @private
              attr_reader :recommendation_service_stub

              ##
              # Configure the RecommendationService Client class.
              #
              # See {::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @example
              #
              #   # Modify the configuration for all RecommendationService clients
              #   ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.configure do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def self.configure
                @configure ||= begin
                  default_config = Client::Configuration.new

                  default_config.timeout = 14_400.0
                  default_config.retry_policy = {
                    initial_delay: 5.0, max_delay: 60.0, multiplier: 1.3, retry_codes: [14, 4]
                  }

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the RecommendationService Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client::Configuration}
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
              # The effective universe domain
              #
              # @return [String]
              #
              def universe_domain
                @recommendation_service_stub.universe_domain
              end

              ##
              # Create a new RecommendationService client object.
              #
              # @example
              #
              #   # Create a client using the default configuration
              #   client = ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new
              #
              #   # Create a client using a custom configuration
              #   client = ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new do |config|
              #     config.timeout = 10.0
              #   end
              #
              # @yield [config] Configure the RecommendationService client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # These require statements are intentionally placed here to initialize
                # the gRPC module only when it's required.
                # See https://github.com/googleapis/toolkit/issues/446
                require "gapic/grpc"
                require "google/ads/google_ads/v17/services/recommendation_service_services_pb"

                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                # Use self-signed JWT if the endpoint is unchanged from default,
                # but only if the default endpoint does not have a region prefix.
                enable_self_signed_jwt = @config.endpoint.nil? ||
                                         (@config.endpoint == Configuration::DEFAULT_ENDPOINT &&
                                         !@config.endpoint.split(".").first.include?("-"))
                credentials ||= Credentials.default scope: @config.scope,
                                                    enable_self_signed_jwt: enable_self_signed_jwt
                if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end
                @quota_project_id = @config.quota_project
                @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

                @recommendation_service_stub = ::Gapic::ServiceStub.new(
                  ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Stub,
                  credentials: credentials,
                  endpoint: @config.endpoint,
                  endpoint_template: DEFAULT_ENDPOINT_TEMPLATE,
                  universe_domain: @config.universe_domain,
                  channel_args: @config.channel_args,
                  interceptors: @config.interceptors,
                  channel_pool_config: @config.channel_pool
                )
              end

              # Service calls

              ##
              # Applies given recommendations with corresponding apply parameters.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [DatabaseError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [QuotaError]()
              #   [RecommendationError]()
              #   [RequestError]()
              #   [UrlFieldError]()
              #
              # @overload apply_recommendation(request, options = nil)
              #   Pass arguments to `apply_recommendation` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload apply_recommendation(customer_id: nil, operations: nil, partial_failure: nil)
              #   Pass arguments to `apply_recommendation` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer with the recommendation.
              #   @param operations [::Array<::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationOperation, ::Hash>]
              #     Required. The list of operations to apply recommendations.
              #     If partial_failure=false all recommendations should be of the same type
              #     There is a limit of 100 operations per request.
              #   @param partial_failure [::Boolean]
              #     If true, successful operations will be carried out and invalid
              #     operations will return errors. If false, operations will be carried
              #     out as a transaction if and only if they are all valid.
              #     Default is false.
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationResponse]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationResponse]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/ads/google_ads/v17/services"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Ads::GoogleAds::V17::Services::ApplyRecommendationRequest.new
              #
              #   # Call the apply_recommendation method.
              #   result = client.apply_recommendation request
              #
              #   # The returned object is of type Google::Ads::GoogleAds::V17::Services::ApplyRecommendationResponse.
              #   p result
              #
              def apply_recommendation request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V17::Services::ApplyRecommendationRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.apply_recommendation.metadata.to_h

                # Set x-goog-api-client, x-goog-user-project and x-goog-api-version headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-api-version"] = API_VERSION unless API_VERSION.empty?
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.customer_id
                  header_params["customer_id"] = request.customer_id
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.apply_recommendation.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.apply_recommendation.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @recommendation_service_stub.call_rpc :apply_recommendation, request,
                                                      options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Dismisses given recommendations.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RecommendationError]()
              #   [RequestError]()
              #
              # @overload dismiss_recommendation(request, options = nil)
              #   Pass arguments to `dismiss_recommendation` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V17::Services::DismissRecommendationRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V17::Services::DismissRecommendationRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload dismiss_recommendation(customer_id: nil, operations: nil, partial_failure: nil)
              #   Pass arguments to `dismiss_recommendation` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer with the recommendation.
              #   @param operations [::Array<::Google::Ads::GoogleAds::V17::Services::DismissRecommendationRequest::DismissRecommendationOperation, ::Hash>]
              #     Required. The list of operations to dismiss recommendations.
              #     If partial_failure=false all recommendations should be of the same type
              #     There is a limit of 100 operations per request.
              #   @param partial_failure [::Boolean]
              #     If true, successful operations will be carried out and invalid
              #     operations will return errors. If false, operations will be carried in a
              #     single transaction if and only if they are all valid.
              #     Default is false.
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Ads::GoogleAds::V17::Services::DismissRecommendationResponse]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Ads::GoogleAds::V17::Services::DismissRecommendationResponse]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/ads/google_ads/v17/services"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Ads::GoogleAds::V17::Services::DismissRecommendationRequest.new
              #
              #   # Call the dismiss_recommendation method.
              #   result = client.dismiss_recommendation request
              #
              #   # The returned object is of type Google::Ads::GoogleAds::V17::Services::DismissRecommendationResponse.
              #   p result
              #
              def dismiss_recommendation request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V17::Services::DismissRecommendationRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.dismiss_recommendation.metadata.to_h

                # Set x-goog-api-client, x-goog-user-project and x-goog-api-version headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-api-version"] = API_VERSION unless API_VERSION.empty?
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.customer_id
                  header_params["customer_id"] = request.customer_id
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.dismiss_recommendation.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.dismiss_recommendation.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @recommendation_service_stub.call_rpc :dismiss_recommendation, request,
                                                      options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Generates Recommendations based off the requested recommendation_types.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RecommendationError]()
              #   [RequestError]()
              #
              # @overload generate_recommendations(request, options = nil)
              #   Pass arguments to `generate_recommendations` via a request object, either of type
              #   {::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
              #
              # @overload generate_recommendations(customer_id: nil, recommendation_types: nil, advertising_channel_type: nil, campaign_sitelink_count: nil, conversion_tracking_status: nil, bidding_info: nil, ad_group_info: nil, seed_info: nil)
              #   Pass arguments to `generate_recommendations` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param customer_id [::String]
              #     Required. The ID of the customer generating recommendations.
              #   @param recommendation_types [::Array<::Google::Ads::GoogleAds::V17::Enums::RecommendationTypeEnum::RecommendationType>]
              #     Required. List of eligible recommendation_types to generate. If the
              #     uploaded criteria isn't sufficient to make a recommendation, or the
              #     campaign is already in the recommended state, no recommendation will be
              #     returned for that type. Generally, a recommendation is returned if all
              #     required fields for that recommendation_type are uploaded, but there are
              #     cases where this is still not sufficient.
              #
              #     The following recommendation_types are supported for recommendation
              #     generation:
              #     KEYWORD, MAXIMIZE_CLICKS_OPT_IN, MAXIMIZE_CONVERSIONS_OPT_IN,
              #     MAXIMIZE_CONVERSION_VALUE_OPT_IN, SET_TARGET_CPA, SET_TARGET_ROAS,
              #     SITELINK_ASSET, TARGET_CPA_OPT_IN, TARGET_ROAS_OPT_IN
              #   @param advertising_channel_type [::Google::Ads::GoogleAds::V17::Enums::AdvertisingChannelTypeEnum::AdvertisingChannelType]
              #     Required. Advertising channel type of the campaign.
              #     The following advertising_channel_types are supported for recommendation
              #     generation:
              #     PERFORMANCE_MAX and SEARCH
              #   @param campaign_sitelink_count [::Integer]
              #     Optional. Number of sitelinks on the campaign.
              #     This field is necessary for the following recommendation_types:
              #     SITELINK_ASSET
              #   @param conversion_tracking_status [::Google::Ads::GoogleAds::V17::Enums::ConversionTrackingStatusEnum::ConversionTrackingStatus]
              #     Optional. Current conversion tracking status.
              #     This field is necessary for the following recommendation_types:
              #     MAXIMIZE_CLICKS_OPT_IN, MAXIMIZE_CONVERSIONS_OPT_IN,
              #     MAXIMIZE_CONVERSION_VALUE_OPT_IN, SET_TARGET_CPA, SET_TARGET_ROAS,
              #     TARGET_CPA_OPT_IN, TARGET_ROAS_OPT_IN
              #   @param bidding_info [::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest::BiddingInfo, ::Hash]
              #     Optional. Current bidding information of the campaign.
              #     This field is necessary for the following recommendation_types:
              #     MAXIMIZE_CLICKS_OPT_IN, MAXIMIZE_CONVERSIONS_OPT_IN,
              #     MAXIMIZE_CONVERSION_VALUE_OPT_IN, SET_TARGET_CPA, SET_TARGET_ROAS,
              #     TARGET_CPA_OPT_IN, TARGET_ROAS_OPT_IN
              #   @param ad_group_info [::Array<::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest::AdGroupInfo, ::Hash>]
              #     Optional. Current AdGroup Information.
              #     Supports information from a single AdGroup.
              #     This field is optional for the following recommendation_types:
              #     KEYWORD
              #   @param seed_info [::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest::SeedInfo, ::Hash]
              #     Optional. Seed information for Keywords.
              #     This field is necessary for the following recommendation_types:
              #     KEYWORD
              #
              # @yield [response, operation] Access the result along with the RPC operation
              # @yieldparam response [::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsResponse]
              # @yieldparam operation [::GRPC::ActiveCall::Operation]
              #
              # @return [::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsResponse]
              #
              # @raise [Google::Ads::GoogleAds::Error] if the RPC is aborted.
              #
              # @example Basic example
              #   require "google/ads/google_ads/v17/services"
              #
              #   # Create a client object. The client can be reused for multiple calls.
              #   client = Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new
              #
              #   # Create a request. To set request fields, pass in keyword arguments.
              #   request = Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest.new
              #
              #   # Call the generate_recommendations method.
              #   result = client.generate_recommendations request
              #
              #   # The returned object is of type Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsResponse.
              #   p result
              #
              def generate_recommendations request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request,
                                                   to: ::Google::Ads::GoogleAds::V17::Services::GenerateRecommendationsRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                metadata = @config.rpcs.generate_recommendations.metadata.to_h

                # Set x-goog-api-client, x-goog-user-project and x-goog-api-version headers
                metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Ads::GoogleAds::VERSION
                metadata[:"x-goog-api-version"] = API_VERSION unless API_VERSION.empty?
                metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

                header_params = {}
                if request.customer_id
                  header_params["customer_id"] = request.customer_id
                end

                request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
                metadata[:"x-goog-request-params"] ||= request_params_header

                options.apply_defaults timeout:      @config.rpcs.generate_recommendations.timeout,
                                       metadata:     metadata,
                                       retry_policy: @config.rpcs.generate_recommendations.retry_policy

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     @config.metadata,
                                       retry_policy: @config.retry_policy

                @recommendation_service_stub.call_rpc :generate_recommendations, request,
                                                      options: options do |response, operation|
                  yield response, operation if block_given?
                  return response
                end
                # rescue GRPC::BadStatus => grpc_error
                #  raise Google::Ads::GoogleAds::Error.new grpc_error.message
              end

              ##
              # Configuration class for the RecommendationService API.
              #
              # This class represents the configuration for RecommendationService,
              # providing control over timeouts, retry behavior, logging, transport
              # parameters, and other low-level controls. Certain parameters can also be
              # applied individually to specific RPCs. See
              # {::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client::Configuration::Rpcs}
              # for a list of RPCs that can be configured independently.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # @example
              #
              #   # Modify the global config, setting the timeout for
              #   # apply_recommendation to 20 seconds,
              #   # and all remaining timeouts to 10 seconds.
              #   ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.configure do |config|
              #     config.timeout = 10.0
              #     config.rpcs.apply_recommendation.timeout = 20.0
              #   end
              #
              #   # Apply the above configuration only to a new client.
              #   client = ::Google::Ads::GoogleAds::V17::Services::RecommendationService::Client.new do |config|
              #     config.timeout = 10.0
              #     config.rpcs.apply_recommendation.timeout = 20.0
              #   end
              #
              # @!attribute [rw] endpoint
              #   A custom service endpoint, as a hostname or hostname:port. The default is
              #   nil, indicating to use the default endpoint in the current universe domain.
              #   @return [::String,nil]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://rubydoc.info/gems/googleauth/Google/Auth/Credentials))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://rubydoc.info/gems/signet/Signet/OAuth2/Client))
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
              # @!attribute [rw] universe_domain
              #   The universe domain within which to make requests. This determines the
              #   default endpoint URL. The default value of nil uses the environment
              #   universe (usually the default "googleapis.com" universe).
              #   @return [::String,nil]
              #
              class Configuration
                extend ::Gapic::Config

                # @private
                # The endpoint specific to the default "googleapis.com" universe. Deprecated.
                DEFAULT_ENDPOINT = "googleads.googleapis.com"

                config_attr :endpoint,      nil, ::String, nil
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
                config_attr :universe_domain, nil, ::String, nil

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
                # Configuration for the channel pool
                # @return [::Gapic::ServiceStub::ChannelPool::Configuration]
                #
                def channel_pool
                  @channel_pool ||= ::Gapic::ServiceStub::ChannelPool::Configuration.new
                end

                ##
                # Configuration RPC class for the RecommendationService API.
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
                  # RPC-specific configuration for `apply_recommendation`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :apply_recommendation
                  ##
                  # RPC-specific configuration for `dismiss_recommendation`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :dismiss_recommendation
                  ##
                  # RPC-specific configuration for `generate_recommendations`
                  # @return [::Gapic::Config::Method]
                  #
                  attr_reader :generate_recommendations

                  # @private
                  def initialize parent_rpcs = nil
                    apply_recommendation_config = parent_rpcs.apply_recommendation if parent_rpcs.respond_to? :apply_recommendation
                    @apply_recommendation = ::Gapic::Config::Method.new apply_recommendation_config
                    dismiss_recommendation_config = parent_rpcs.dismiss_recommendation if parent_rpcs.respond_to? :dismiss_recommendation
                    @dismiss_recommendation = ::Gapic::Config::Method.new dismiss_recommendation_config
                    generate_recommendations_config = parent_rpcs.generate_recommendations if parent_rpcs.respond_to? :generate_recommendations
                    @generate_recommendations = ::Gapic::Config::Method.new generate_recommendations_config

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