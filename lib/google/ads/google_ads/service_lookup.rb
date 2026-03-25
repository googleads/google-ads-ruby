require 'google/ads/google_ads/interceptors/logging_interceptor'
require 'google/ads/google_ads/interceptors/error_interceptor'
require 'google/ads/google_ads/interceptors/metadata_interceptor'

module Google
  module Ads
    module GoogleAds
      class ServiceLookup
        def initialize(
          lookup_util,
          logger,
          config,
          credentials_or_channel,
          endpoint,
          deprecator
        )
          @lookup_util = lookup_util
          @logger = logger
          @config = config
          @credentials_or_channel = credentials_or_channel
          @endpoint = endpoint
          @deprecator = deprecator
        end

        def call
          if logger
            logging_interceptor = GoogleAds::Interceptors::LoggingInterceptor.new(logger)
          end
          error_interceptor = GoogleAds::Interceptors::ErrorInterceptor.new
          metadata_interceptor = GoogleAds::Interceptors::MetadataInterceptor.new(
            config.developer_token,
            config.login_customer_id,
            config.linked_customer_id,
            config.use_cloud_org_for_api_access,
            config.ads_assistant
          )

          version_alternates = {}
          Factories::VERSIONS.each do |v|
            version_alternates[v] = factory_at_version(v, error_interceptor, logging_interceptor, metadata_interceptor)
          end

          highest_factory = factory_at_version(
            Factories::HIGHEST_VERSION,
            error_interceptor,
            logging_interceptor,
            metadata_interceptor,
          )

          VersionAlternate.new(highest_factory, version_alternates)
        end

        private

        def factory_at_version(version, error_interceptor, logging_interceptor, metadata_interceptor)
          factory = Factories.at_version(version).services.new(**{
            logging_interceptor: logging_interceptor,
            error_interceptor: error_interceptor,
            metadata_interceptor: metadata_interceptor,
            deprecation: deprecator
          }.merge(gax_service_params))

          factory
        end

        def gax_service_params
          {
            credentials: credentials_or_channel,
            metadata: headers,
            endpoint: endpoint
          }
        end

        def headers
          if config.login_customer_id
            validate_customer_id(:login_customer_id)
          end

          if config.linked_customer_id
            validate_customer_id(:linked_customer_id)
          end

          {}
        end

        def validate_customer_id(field)
          begin
            customer_id = -1
            if field == :login_customer_id
              customer_id = Integer(config.login_customer_id)
            elsif field == :linked_customer_id
              customer_id = Integer(config.linked_customer_id)
            else
              return
            end
          rescue ArgumentError => e
            if e.message.start_with?("invalid value for Integer")
              raise ArgumentError.new("Invalid value for #{field.to_s}, must be integer")
            end
          end
          if customer_id <= 0 || customer_id > 9_999_999_999
            raise ArgumentError.new(
              "Invalid #{field.to_s}. Must be an integer " \
              "0 < x <= 9,999,999,999. Got #{customer_id}"
            )
          end
        end

        attr_reader :name
        attr_reader :version
        attr_reader :logger
        attr_reader :config
        attr_reader :credentials_or_channel
        attr_reader :lookup_util
        attr_reader :endpoint
        attr_reader :deprecator
      end
    end
  end
end
