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

# We need to define all modules for all known versions in advance because of a
# generation issue where they are defined in a single line, which cannot be used
# to create new modules.
module Google
  module Ads
    module GoogleAds
      module V1
        module Common
        end
        module Enums
        end
        module Errors
        end
        module Resources
        end
        module Services
        end
      end
    end
  end
end

# this require needs to always come first to patch protobufs to have "autoboxing
# fields"
require 'google/ads/google_ads/autoboxing_fields'

require 'googleauth'

require 'google/ads/google_ads/patches'
require 'google/ads/google_ads/config'
require 'google/ads/google_ads/field_mask_util'
require 'google/ads/google_ads/lookup_util'
require 'google/ads/google_ads/wrapper_util'
require 'google/ads/google_ads/logging_interceptor'
require 'google/ads/google_ads/factories'
require 'google/ads/google_ads/errors'
require 'google/ads/google_ads/service_lookup'

require 'google/gax'

require 'logger'
require 'json'
require 'openssl'
require 'signet/oauth_2/client'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient

        DEFAULT_CONFIG_FILENAME = "google_ads_config.rb".freeze
        SCOPE = "https://www.googleapis.com/auth/adwords".freeze

        attr_reader :logger
        # Allow setting the lookup_util manually for users who use it before creating the client.
        attr_writer :lookup_util

        def initialize(config_path = nil, &block)
          if block_given?
            @config = Google::Ads::GoogleAds::Config.new

            yield @config
          else
            if config_path.nil?
              config_path = File.join(ENV['HOME'], DEFAULT_CONFIG_FILENAME)
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

        # Return a service for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignServiceClient.
        #
        # Raises ArgumentError if no service can be found for the provided type.
        def service(name=nil, version = default_api_version)
          service_path = ENV['GOOGLEADS_SERVICE_PATH']

          ServiceLookup.new(
            name,
            version,
            lookup_util,
            service_path,
            @logger,
            @config,
            get_credentials,
          ).call
        end

        def patch_lro_headers(class_to_return, headers)
          PatchLROHeaders.new(class_to_return, headers).call
        end

        # Return a resource or common entity for the provided entity type. For
        # example, passing :Campaign will return an instantiated Campaign.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def resource(name=nil, version=default_api_version)
          if name.nil?
            Factories.at_version(version).resources
          else
            lookup_util.resource(name, version)
          end
        end

        # Return an operation for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignOperation.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def operation(name=nil, version = default_api_version)
          if name.nil?
            Factories.at_version(version).operations
          else
            lookup_util.operation(name, version)
          end
        end

        # Return a reference to the enum class for the provided enum type. For
        # example, passing :CampaignStatus will return a reference to the
        # CampaignStatusEnum.
        #
        # Raises ArgumentError if no enum can be found for the provided type.
        def enum(name=nil, version = default_api_version)
          if name.nil?
            Factories.at_version(version).enums
          else
            lookup_util.enum(name, version)
          end
        end

        # Returns a reference to the FieldMaskUtil class for ease of access.
        def field_mask()
          Google::Ads::GoogleAds::FieldMaskUtil
        end

        # Returns a reference to the WrapperUtil class for ease of access.
        def wrapper()
          Google::Ads::GoogleAds::WrapperUtil
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
          PartialFailureErrorDecoder.decode(pfe)
        end

        private

        ERROR_TRANSFORMER = Proc.new do |gax_error|
          begin
            gax_error.status_details.each do |detail|
              # If there is an underlying GoogleAdsFailure, throw that one.
              if detail.is_a?(
                  Google::Ads::GoogleAds::V1::Errors::GoogleAdsFailure)
                raise Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                    detail)
              end
              if detail.is_a?(Google::Protobuf::Any)
                type = Google::Protobuf::DescriptorPool.generated_pool.lookup(
                    detail.type_name).msgclass
                failure = detail.unpack(type)
                raise Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                    failure)
              end
            end
          rescue Google::Ads::GoogleAds::Errors::GoogleAdsError
            # If we raised this, bubble it out.
            raise
          rescue NoMethodError
            # Sometimes status_details is just a String; in that case, we should
            # just raise the original exception.
          end
          # If we don't find an error of the correct type, or if we run into an
          # error while processing, just throw the original.
          raise gax_error
        end

        def get_credentials
          if @config.authentication
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
          raise 'config.impersonate required if keyfile specified' unless @config.impersonate
          keyfile = File.read(@config.keyfile)
          keyfile = JSON.parse(keyfile)
          Google::Auth::Credentials.new(
            Signet::OAuth2::Client.new(
              token_credential_uri: "https://accounts.google.com/o/oauth2/token",
              audience: "https://accounts.google.com/o/oauth2/token",
              issuer: keyfile.fetch("client_email"),
              signing_key: OpenSSL::PKey::RSA.new(keyfile.fetch("private_key")),
              person: @config.impersonate,
              scope: [SCOPE],
            )
          )
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
      end
    end
  end
end
