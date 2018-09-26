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
require 'google/ads/google_ads/wrapper_util'
require 'google/ads/google_ads/proto_lookup_util'
require 'google/ads/google_ads/path_lookup_util'

require 'google/ads/google_ads/errors'
require 'google/ads/google_ads/v0/errors/errors_pb'

require 'google/gax'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient
        API_VERSION = :V0

        DEFAULT_CONFIG_FILENAME = 'google_ads_config.rb'

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
          @proto_lookup_util =
              Google::Ads::GoogleAds::ProtoLookupUtil.new(API_VERSION)
          @path_lookup_util =
              Google::Ads::GoogleAds::PathLookupUtil.new(@proto_lookup_util)
        end

        def configure(&block)
          yield @config
        end

        # Return a service for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignServiceClient.
        #
        # Raises ArgumentError if no service can be found for the provided type.
        def service(name)
          service_path = ENV['GOOGLEADS_SERVICE_PATH']

          class_to_return = @proto_lookup_util.service(name)
          unless service_path.nil? || service_path.empty?
            class_to_return = Class.new(class_to_return) do
              const_set('SERVICE_ADDRESS', service_path.freeze)
            end
          end

          return class_to_return.new(
            credentials: get_updater_proc(),
            metadata: {:"developer-token" => @config.developer_token},
            exception_transformer: ERROR_TRANSFORMER
          )
        end

        # Return a resource or common entity for the provided entity type. For
        # example, passing :Campaign will return an instantiated Campaign.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def resource(name)
          @proto_lookup_util.resource(name).new
        end

        # Return an operation for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignOperation.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def operation(name)
          @proto_lookup_util.operation(name).new
        end

        # Return a reference to the enum class for the provided enum type. For
        # example, passing :CampaignStatus will return a reference to the
        # CampaignStatusEnum.
        #
        # Raises ArgumentError if no enum can be found for the provided type.
        def enum(name)
          @proto_lookup_util.enum(name)
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
        def path()
          @path_lookup_util
        end

        private

        ERROR_TRANSFORMER = Proc.new do |gax_error|
          begin
            gax_error.status_details.each do |detail|
              # If there is an underlying GoogleAdsFailure, throw that one.
              if detail.is_a?(
                  Google::Ads::GoogleAds::V0::Errors::GoogleAdsFailure)
                raise Google::Ads::GooglAads::Errors::GoogleAdsError.new(
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
      end
    end
  end
end
