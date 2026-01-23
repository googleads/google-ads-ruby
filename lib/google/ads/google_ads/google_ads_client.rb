# Encoding: utf-8
#
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
# GoogleAds client class to configure settings and fetch services.

require 'googleauth'

require 'google/ads/google_ads/patches'
require 'google/ads/google_ads/config'
require 'google/ads/google_ads/field_mask_util'
require 'google/ads/google_ads/lookup_util'
require 'google/ads/google_ads/interceptors/logging_interceptor'
require 'google/ads/google_ads/factories'
require 'google/ads/google_ads/errors'
require 'google/ads/google_ads/service_lookup'
require 'google/ads/google_ads/deprecation'
require 'google/ads/google_ads/status_decoder'

require 'grpc'

require 'logger'
require 'json'
require 'openssl'
require 'signet/oauth_2/client'
require 'googleauth'
require 'delegate'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient

        DEFAULT_CONFIG_FILENAME = "google_ads_config.rb".freeze
        SCOPE = "https://www.googleapis.com/auth/adwords".freeze

        MAX_MESSAGE_LENGTH = "grpc.max_receive_message_length".freeze
        MAX_METADATA_SIZE = "grpc.max_metadata_size".freeze

        attr_reader :logger
        # Allow setting the lookup_util manually for users who use it before creating the client.
        attr_writer :lookup_util

        def initialize(config_path = nil, &block)
          if block_given?
            @config = Google::Ads::GoogleAds::Config.new

            yield @config
          else
            if config_path.nil?
              config_path = ENV.fetch("GOOGLE_ADS_CONFIGURATION_FILE_PATH",
                File.join(ENV['HOME'], DEFAULT_CONFIG_FILENAME))
            end

            unless File.exist?(config_path)
              raise ArgumentError,
                  sprintf('No configuration file found at location "%s"',
                  config_path)
            end
            file = File.read(config_path)

            eval_result = eval(file, binding, config_path)
            unless eval_result.instance_of?(Google::Ads::GoogleAds::Config)
              raise ArgumentError, sprintf(
                  'Configuration file did not produce expected type ' +
                  'Google::Ads::GoogleAds::Config, got "%s" instead',
                  eval_result.class
              )
            end
            @config = eval_result
          end

          begin
            @logger = create_default_logger
          rescue
            STDERR.puts(
                "Could not create default logger. Check your config file.")
          end
        end

        def configure(&block)
          yield @config
        end

        def load_environment_config
          # Generic variables
          @config.refresh_token = ENV.fetch("GOOGLE_ADS_REFRESH_TOKEN", @config.refresh_token)
          @config.client_id = ENV.fetch("GOOGLE_ADS_CLIENT_ID", @config.client_id)
          @config.client_secret = ENV.fetch("GOOGLE_ADS_CLIENT_SECRET", @config.client_secret)
          @config.keyfile = ENV.fetch("GOOGLE_ADS_JSON_KEY_FILE_PATH", @config.keyfile)
          @config.impersonate = ENV.fetch("GOOGLE_ADS_IMPERSONATED_EMAIL", @config.impersonate)
          @config.use_application_default_credentials = ENV.fetch("GOOGLE_ADS_USE_APPLICATION_DEFAULT_CREDENTIALS", @config.use_application_default_credentials)
          @config.developer_token = ENV.fetch("GOOGLE_ADS_DEVELOPER_TOKEN", @config.developer_token)
          @config.login_customer_id = ENV.fetch("GOOGLE_ADS_LOGIN_CUSTOMER_ID", @config.login_customer_id)
          @config.linked_customer_id = ENV.fetch("GOOGLE_ADS_LINKED_CUSTOMER_ID", @config.linked_customer_id)
          @config.api_endpoint = ENV.fetch("GOOGLE_ADS_ENDPOINT", @config.api_endpoint)

          # Client library-specific variables
          @config.log_level = ENV.fetch("GOOGLE_ADS_RUBY_LOG_LEVEL", @config.log_level)
          @config.http_proxy = ENV.fetch("GOOGLE_ADS_RUBY_HTTP_PROXY", @config.http_proxy)
          @config.use_cloud_org_for_api_access = ENV.fetch("GOOGLE_ADS_USE_CLOUD_ORG_FOR_API_ACCESS", @config.use_cloud_org_for_api_access)
          if @config.use_cloud_org_for_api_access.is_a?(String)
            @config.use_cloud_org_for_api_access = @config.use_cloud_org_for_api_access.downcase == "true"
          end
        end

        # Return a service for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignServiceClient.
        #
        # Raises ArgumentError if no service can be found for the provided type.
        def service
          ServiceLookup.new(
            lookup_util,
            @logger,
            @config,
            make_channel,
            endpoint,
            deprecator,
          ).call
        end

        def endpoint
          target.split(":443").first
        end

        def target
          default_target = "googleads.googleapis.com:443"
          target = @config.api_endpoint || default_target
        end

        def make_channel
          channel_args = {
            MAX_MESSAGE_LENGTH => 64*1024*1024,
            MAX_METADATA_SIZE => 16*1024*1024,
          }

          if !@config.use_insecure_channel
            call_creds = GRPC::Core::CallCredentials.new(get_credentials)
            chan_creds = GRPC::Core::ChannelCredentials.new.compose(call_creds)
            GRPC::Core::Channel.new(target, channel_args, chan_creds)
          else
            GRPC::Core::Channel.new(target, channel_args, :this_channel_is_insecure)
          end
        end

        def patch_lro_headers(class_to_return, headers)
          PatchLROHeaders.new(class_to_return, headers).call
        end

        # Return a resource or common entity for the provided entity type. For
        # example, passing :Campaign will return an instantiated Campaign.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def resource
          Factories.version_alternate_for(:resources)
        end

        def operation
          Factories.version_alternate_for(:operations)
        end

        def enum
          Factories.version_alternate_for(:enums)
        end

        # Returns a reference to the FieldMaskUtil class for ease of access.
        def field_mask()
          Google::Ads::GoogleAds::FieldMaskUtil
        end

        # Returns a reference to the PathLookupUtil to generate resource names.
        def path(version = default_api_version)
          lookup_util.path(version)
        end

        # Set the logger to use. This will only take effect on services fetched
        # after setting this value.
        def logger=(logger)
          @logger = logger
        end

        # Decode a partial failure error from a response.
        # See Google::Ads::GoogleAds::PartialFailureErrorDecoder for full
        # documentation.
        def decode_partial_failure_error(pfe)
          StatusDecoder.decode(pfe)
        end

        # Identical to decoding a partial failure error as above, but
        # duplicated so the client code is easier to follow.
        def decode_warning(warning)
          StatusDecoder.decode(warning)
        end

        private

        def get_credentials
          if @config.use_application_default_credentials
            get_application_default_credentials
          elsif @config.authentication
            @config.authentication
          elsif @config.keyfile
            get_service_account_credentials
          else
            get_updater_proc
          end
        end

        # Provides the service a method by which to obtain an access token to
        # authenticate API requests.
        def get_updater_proc
          Signet::OAuth2::Client.new(
            token_credential_uri: "https://www.googleapis.com/oauth2/v3/token",
            client_id: @config.client_id,
            client_secret: @config.client_secret,
            refresh_token: @config.refresh_token,
            scope: [SCOPE]
          ).updater_proc
        end

        # Provides a Google::Auth::Credentials initialized with a keyfile
        # specified in the config.
        def get_service_account_credentials
          keyfile = File.read(@config.keyfile)
          keyfile = JSON.parse(keyfile)
          Signet::OAuth2::Client.new(
            token_credential_uri: "https://accounts.google.com/o/oauth2/token",
            audience: "https://accounts.google.com/o/oauth2/token",
            issuer: keyfile.fetch("client_email"),
            signing_key: OpenSSL::PKey::RSA.new(keyfile.fetch("private_key")),
            person: @config.impersonate,
            scope: [SCOPE],
          ).updater_proc
        end
        
        # Provides a Google::Auth::Credentials initialized with Application
        # Default Credentials specified in the config.
        def get_application_default_credentials
          Google::Auth.get_application_default(SCOPE).updater_proc
        end

        # Create the default logger, useful if the user hasn't defined one.
        def create_default_logger()
          if @config.logger.nil?
            logger = Logger.new(@config.log_target)
            logger.level = Logger.const_get(@config.log_level)
            logger
          else
            @config.logger
          end
        end

        def lookup_util
          @lookup_util ||= Google::Ads::GoogleAds::LookupUtil.new
        end

        def default_api_version
          Google::Ads::GoogleAds.default_api_version
        end

        def deprecate(deprecation)
          deprecator.deprecate(deprecation)
        end

        def deprecator
          Google::Ads::GoogleAds::Deprecation.new(
            @config.treat_deprecation_warnings_as_errors,
            @config.warn_on_all_deprecations,
          )
        end
      end
    end
  end
end
