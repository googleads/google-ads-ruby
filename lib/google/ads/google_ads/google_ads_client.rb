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

require 'googleauth'

require 'google/ads/google_ads/patches'
require 'google/ads/google_ads/config'
require 'google/ads/google_ads/field_mask_util'
require 'google/ads/google_ads/lookup_util'
require 'google/ads/google_ads/wrapper_util'
require 'google/ads/google_ads/logging_interceptor'
require 'google/ads/google_ads/factories'
require 'google/ads/google_ads/errors'

require 'google/gax'

require 'logger'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient

        DEFAULT_CONFIG_FILENAME = 'google_ads_config.rb'

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

          # We need a local reference to refer to from within the class block
          # below.
          logger = @logger

          headers = {
            :"developer-token" => @config.developer_token
          }
          if @config.login_customer_id
            begin
              login_customer_id = Integer(@config.login_customer_id)
            rescue ArgumentError => e
              if e.message.start_with?("invalid value for Integer")
                raise ArgumentError.new("Invalid value for login_customer_id, must be integer")
              end
            end
            if login_customer_id <= 0 || login_customer_id > 9_999_999_999
              raise ArgumentError.new(
                "Invalid login_customer_id. Must be an integer " \
                "0 < x <= 9,999,999,999. Got #{login_customer_id}"
              )
            end
            headers[:"login-customer-id"] = login_customer_id.to_s  # header values must be strings
          end

          if logger
            logging_interceptor = Google::Ads::GoogleAds::LoggingInterceptor.new(logger)
          end

          if name.nil?
            services = Factories.at_version(version).services.new(
              service_path: service_path,
              logging_interceptor: logging_interceptor,
              credentials: get_updater_proc,
              metadata: headers,
              exception_transformer: ERROR_TRANSFORMER
            )

            infection_delegator = Class.new do
              def initialize(services, headers, infection_callable)
                @services = services
                @headers = headers
                @infection_callable = infection_callable
              end

              def respond_to_missing?(sym, include_private=false)
                @services.respond_to?(sym, include_private)
              end

              def method_missing(name, *args)
                @services.public_send(name, *args) do |cls|
                  @infection_callable.call(cls, @headers)
                  cls
                end
              end
            end
            infection_delegator.new(services, headers, method(:infect_lro_headers))
          else
            class_to_return = lookup_util.raw_service(name, version)
            class_to_return = Class.new(class_to_return) do
              unless service_path.nil? || service_path.empty?
                const_set('SERVICE_ADDRESS', service_path.freeze)
              end

              const_set('GRPC_INTERCEPTORS', [logging_interceptor].compact)
            end

            infect_lro_headers(class_to_return, headers)

            class_to_return.new(
              credentials: get_updater_proc,
              metadata: headers,
              exception_transformer: ERROR_TRANSFORMER
            )
          end
        end

        def infect_lro_headers(class_to_return, headers)
          return unless defined?(class_to_return::OperationsClient)
          opclient = class_to_return::OperationsClient

          # This instance evaluates in OperationsClient class object
          opclient.instance_eval do
            h = headers
            # This defines an instance variable on class_to_return::OperationsClient
            # itself, not instances of that class
            break if instance_variable_defined?(:@_hacked_initialize)
            @_hacked_initialize = true

            # This grabs the original instance method object that initializes
            # this class (e.g. the autogenerated method in gax-ruby)
            orig_initialize = instance_method(:initialize)

            # Redefine that method to take anything (because our callers are
            # autogenerated, and so we don't need to worry about these args
            # being correct)
            define_method(:initialize) do |*args, &blk|
              h2 = h
              # What we do in this next stanza is redefine construct_settings
              # to merge headers in to the appopriate place, during the constructor
              # execution, then invoke it, then put the implementation back.
              orig_construct_settings = Google::Gax.method(:construct_settings)
              begin
                # Instance evaling in Google::Gax class object, not in instances
                # of that object
                Google::Gax.instance_eval do
                  # start definition
                  define_singleton_method(:construct_settings) do |
                    service_names,
                    client_config,
                    config_overrides,
                    retry_names,
                    timeout,
                    bundle_descriptors: {},
                    page_descriptors: {},
                    metadata: {},
                    kwargs: {},
                    errors: []|

                  kwargs = kwargs.merge(h2)

                  orig_construct_settings.call(
                    service_names,
                    client_config,
                    config_overrides,
                    retry_names,
                    timeout,
                    bundle_descriptors: bundle_descriptors,
                    page_descriptors: page_descriptors,
                    metadata: metadata,
                    kwargs: kwargs,
                    errors: errors
                  )
                  end
                end

                # orig_initialize was grabbed on the OperationsClient class,
                # not on an OperationsClient instance, so we have to call
                # bind here to scope that instance_method object to a method
                # object on the instance
                orig_initialize.bind(self).call(*args, &blk)
              ensure
                # undefine our hacked method, and put a delegator back
                Google::Gax.instance_eval do
                  undef construct_settings

                  define_singleton_method(:construct_settings, &orig_construct_settings)
                end
              end
            end
          end
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

        def get_credentials()
          if @config.authentication
            @config.authentication
          else
            get_updater_proc
          end
        end

        # Provides the service a method by which to obtain an access token to
        # authenticate API requests.
        def get_updater_proc()
          return Signet::OAuth2::Client.new(
            token_credential_uri: 'https://www.googleapis.com/oauth2/v3/token',
            client_id: @config.client_id,
            client_secret: @config.client_secret,
            refresh_token: @config.refresh_token,
            scope: ['https://www.googleapis.com/auth/adwords']
          ).updater_proc
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
