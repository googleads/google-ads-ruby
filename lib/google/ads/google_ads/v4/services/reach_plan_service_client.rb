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
# https://github.com/googleapis/googleapis/blob/master/google/ads/google_ads/v4/services/reach_plan_service.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.

require "json"
require "pathname"

require "google/gax"

require "google/ads/google_ads/v4/services/reach_plan_service_pb"
require "google/ads/google_ads/v4/services/credentials"

module Google
  module Ads
    module GoogleAds
      module V4
        module Services
          # Reach Plan Service gives users information about audience size that can
          # be reached through advertisement on YouTube. In particular,
          # GenerateReachForecast provides estimated number of people of specified
          # demographics that can be reached by an ad in a given market by a campaign of
          # certain duration with a defined budget.
          #
          # @!attribute [r] reach_plan_service_stub
          #   @return [Google::Ads::GoogleAds::V4::Services::ReachPlanService::Stub]
          class ReachPlanServiceClient
            attr_reader :reach_plan_service_stub

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
              require "google/ads/google_ads/v4/services/reach_plan_service_services_pb"

              credentials ||= Google::Ads::GoogleAds::V4::Services::Credentials.default

              if credentials.is_a?(String) || credentials.is_a?(Hash)
                updater_proc = Google::Ads::GoogleAds::V4::Services::Credentials.new(credentials).updater_proc
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
                "reach_plan_service_client_config.json"
              )
              defaults = client_config_file.open do |f|
                Google::Gax.construct_settings(
                  "google.ads.googleads.v4.services.ReachPlanService",
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
              @reach_plan_service_stub = Google::Gax::Grpc.create_stub(
                service_path,
                port,
                chan_creds: chan_creds,
                channel: channel,
                updater_proc: updater_proc,
                scopes: scopes,
                interceptors: interceptors,
                &Google::Ads::GoogleAds::V4::Services::ReachPlanService::Stub.method(:new)
              )

              @list_plannable_locations = Google::Gax.create_api_call(
                @reach_plan_service_stub.method(:list_plannable_locations),
                defaults["list_plannable_locations"],
                exception_transformer: exception_transformer
              )
              @list_plannable_products = Google::Gax.create_api_call(
                @reach_plan_service_stub.method(:list_plannable_products),
                defaults["list_plannable_products"],
                exception_transformer: exception_transformer
              )
              @generate_product_mix_ideas = Google::Gax.create_api_call(
                @reach_plan_service_stub.method(:generate_product_mix_ideas),
                defaults["generate_product_mix_ideas"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
              @generate_reach_forecast = Google::Gax.create_api_call(
                @reach_plan_service_stub.method(:generate_reach_forecast),
                defaults["generate_reach_forecast"],
                exception_transformer: exception_transformer,
                params_extractor: proc do |request|
                  {'customer_id' => request.customer_id}
                end
              )
            end

            # Service calls

            # Returns the list of plannable locations (for example, countries & DMAs).
            #
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V4::Services::ListPlannableLocationsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V4::Services::ListPlannableLocationsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   reach_plan_client = Google::Ads::GoogleAds::ReachPlan.new(version: :v4)
            #   response = reach_plan_client.list_plannable_locations

            def list_plannable_locations options: nil, &block
              req = Google::Ads::GoogleAds::V4::Services::ListPlannableLocationsRequest.new
              @list_plannable_locations.call(req, options, &block)
            end

            # Returns the list of per-location plannable YouTube ad formats with allowed
            # targeting.
            #
            # @param plannable_location_id [Google::Protobuf::StringValue | Hash]
            #   Required. The ID of the selected location for planning. To list the available
            #   plannable location ids use ListPlannableLocations.
            #   A hash of the same form as `Google::Protobuf::StringValue`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V4::Services::ListPlannableProductsResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V4::Services::ListPlannableProductsResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   reach_plan_client = Google::Ads::GoogleAds::ReachPlan.new(version: :v4)
            #
            #   # TODO: Initialize `plannable_location_id`:
            #   plannable_location_id = {}
            #   response = reach_plan_client.list_plannable_products(plannable_location_id)

            def list_plannable_products \
                plannable_location_id,
                options: nil,
                &block
              req = {
                plannable_location_id: plannable_location_id
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V4::Services::ListPlannableProductsRequest)
              @list_plannable_products.call(req, options, &block)
            end

            # Generates a product mix ideas given a set of preferences. This method
            # helps the advertiser to obtain a good mix of ad formats and budget
            # allocations based on its preferences.
            #
            # @param customer_id [String]
            #   Required. The ID of the customer.
            # @param plannable_location_id [Google::Protobuf::StringValue | Hash]
            #   Required. The ID of the location, this is one of the ids returned by
            #   ListPlannableLocations.
            #   A hash of the same form as `Google::Protobuf::StringValue`
            #   can also be provided.
            # @param currency_code [Google::Protobuf::StringValue | Hash]
            #   Required. Currency code.
            #   Three-character ISO 4217 currency code.
            #   A hash of the same form as `Google::Protobuf::StringValue`
            #   can also be provided.
            # @param budget_micros [Google::Protobuf::Int64Value | Hash]
            #   Required. Total budget.
            #   Amount in micros. One million is equivalent to one unit.
            #   A hash of the same form as `Google::Protobuf::Int64Value`
            #   can also be provided.
            # @param preferences [Google::Ads::GoogleAds::V4::Services::Preferences | Hash]
            #   The preferences of the suggested product mix.
            #   An unset preference is interpreted as all possible values are allowed,
            #   unless explicitly specified.
            #   A hash of the same form as `Google::Ads::GoogleAds::V4::Services::Preferences`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V4::Services::GenerateProductMixIdeasResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V4::Services::GenerateProductMixIdeasResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   reach_plan_client = Google::Ads::GoogleAds::ReachPlan.new(version: :v4)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `plannable_location_id`:
            #   plannable_location_id = {}
            #
            #   # TODO: Initialize `currency_code`:
            #   currency_code = {}
            #
            #   # TODO: Initialize `budget_micros`:
            #   budget_micros = {}
            #
            #   # TODO: Initialize `preferences`:
            #   preferences = {}
            #   response = reach_plan_client.generate_product_mix_ideas(customer_id, plannable_location_id, currency_code, budget_micros, preferences)

            def generate_product_mix_ideas \
                customer_id,
                plannable_location_id,
                currency_code,
                budget_micros,
                preferences,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                plannable_location_id: plannable_location_id,
                currency_code: currency_code,
                budget_micros: budget_micros,
                preferences: preferences
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V4::Services::GenerateProductMixIdeasRequest)
              @generate_product_mix_ideas.call(req, options, &block)
            end

            # Generates a reach forecast for a given targeting / product mix.
            #
            # @param customer_id [String]
            #   Required. The ID of the customer.
            # @param currency_code [Google::Protobuf::StringValue | Hash]
            #   The currency code.
            #   Three-character ISO 4217 currency code.
            #   A hash of the same form as `Google::Protobuf::StringValue`
            #   can also be provided.
            # @param campaign_duration [Google::Ads::GoogleAds::V4::Services::CampaignDuration | Hash]
            #   Required. Campaign duration.
            #   A hash of the same form as `Google::Ads::GoogleAds::V4::Services::CampaignDuration`
            #   can also be provided.
            # @param cookie_frequency_cap [Google::Protobuf::Int32Value | Hash]
            #   Desired cookie frequency cap that will be applied to each planned product.
            #   This is equivalent to the frequency cap exposed in Google Ads when creating
            #   a campaign, it represents the maximum number of times an ad can be shown to
            #   the same user.
            #   If not specified no cap is applied.
            #
            #   This field is deprecated in v4 and will eventually be removed.
            #   Please use cookie_frequency_cap_setting instead.
            #   A hash of the same form as `Google::Protobuf::Int32Value`
            #   can also be provided.
            # @param cookie_frequency_cap_setting [Google::Ads::GoogleAds::V4::Services::FrequencyCap | Hash]
            #   Desired cookie frequency cap that will be applied to each planned product.
            #   This is equivalent to the frequency cap exposed in Google Ads when creating
            #   a campaign, it represents the maximum number of times an ad can be shown to
            #   the same user during a specified time interval.
            #   If not specified, no cap is applied.
            #
            #   This field replaces the deprecated cookie_frequency_cap field.
            #   A hash of the same form as `Google::Ads::GoogleAds::V4::Services::FrequencyCap`
            #   can also be provided.
            # @param min_effective_frequency [Google::Protobuf::Int32Value | Hash]
            #   Desired minimum effective frequency (the number of times a person was
            #   exposed to the ad) for the reported reach metrics [1-10].
            #   This won't affect the targeting, but just the reporting.
            #   If not specified, a default of 1 is applied.
            #   A hash of the same form as `Google::Protobuf::Int32Value`
            #   can also be provided.
            # @param targeting [Google::Ads::GoogleAds::V4::Services::Targeting | Hash]
            #   The targeting to be applied to all products selected in the product mix.
            #
            #   This is planned targeting: execution details might vary based on the
            #   advertising product, please consult an implementation specialist.
            #
            #   See specific metrics for details on how targeting affects them.
            #
            #   In some cases, targeting may be overridden using the
            #   PlannedProduct.advanced_product_targeting field.
            #   A hash of the same form as `Google::Ads::GoogleAds::V4::Services::Targeting`
            #   can also be provided.
            # @param planned_products [Array<Google::Ads::GoogleAds::V4::Services::PlannedProduct | Hash>]
            #   Required. The products to be forecast.
            #   The max number of allowed planned products is 15.
            #   A hash of the same form as `Google::Ads::GoogleAds::V4::Services::PlannedProduct`
            #   can also be provided.
            # @param options [Google::Gax::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout,
            #   retries, etc.
            # @yield [result, operation] Access the result along with the RPC operation
            # @yieldparam result [Google::Ads::GoogleAds::V4::Services::GenerateReachForecastResponse]
            # @yieldparam operation [GRPC::ActiveCall::Operation]
            # @return [Google::Ads::GoogleAds::V4::Services::GenerateReachForecastResponse]
            # @raise [Google::Gax::GaxError] if the RPC is aborted.
            # @example
            #   require "google/ads/google_ads"
            #
            #   reach_plan_client = Google::Ads::GoogleAds::ReachPlan.new(version: :v4)
            #
            #   # TODO: Initialize `customer_id`:
            #   customer_id = ''
            #
            #   # TODO: Initialize `currency_code`:
            #   currency_code = {}
            #
            #   # TODO: Initialize `campaign_duration`:
            #   campaign_duration = {}
            #
            #   # TODO: Initialize `cookie_frequency_cap`:
            #   cookie_frequency_cap = {}
            #
            #   # TODO: Initialize `cookie_frequency_cap_setting`:
            #   cookie_frequency_cap_setting = {}
            #
            #   # TODO: Initialize `min_effective_frequency`:
            #   min_effective_frequency = {}
            #
            #   # TODO: Initialize `targeting`:
            #   targeting = {}
            #
            #   # TODO: Initialize `planned_products`:
            #   planned_products = []
            #   response = reach_plan_client.generate_reach_forecast(customer_id, currency_code, campaign_duration, cookie_frequency_cap, cookie_frequency_cap_setting, min_effective_frequency, targeting, planned_products)

            def generate_reach_forecast \
                customer_id,
                currency_code,
                campaign_duration,
                cookie_frequency_cap,
                cookie_frequency_cap_setting,
                min_effective_frequency,
                targeting,
                planned_products,
                options: nil,
                &block
              req = {
                customer_id: customer_id,
                currency_code: currency_code,
                campaign_duration: campaign_duration,
                cookie_frequency_cap: cookie_frequency_cap,
                cookie_frequency_cap_setting: cookie_frequency_cap_setting,
                min_effective_frequency: min_effective_frequency,
                targeting: targeting,
                planned_products: planned_products
              }.delete_if { |_, v| v.nil? }
              req = Google::Gax::to_proto(req, Google::Ads::GoogleAds::V4::Services::GenerateReachForecastRequest)
              @generate_reach_forecast.call(req, options, &block)
            end
          end
        end
      end
    end
  end
end
