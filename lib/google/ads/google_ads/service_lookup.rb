require 'google/ads/google_ads/error_transformer'
require 'google/ads/google_ads/search_stream_intercepting_factory'
require 'google/ads/google_ads/interceptors/logging_interceptor'

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
            logging_interceptor = Google::Ads::GoogleAds::Interceptors::LoggingInterceptor.new(logger)
          end

          version_alternates = {}
          Factories::VERSIONS.each do |v|
            version_alternates[v] = factory_at_version(v, logging_interceptor)
          end

          highest_factory = factory_at_version(
            Factories::HIGHEST_VERSION,
            logging_interceptor,
          )

          highest_factory = if Factories::HIGHEST_VERSION == :V3
            GoogleAds::SearchStreamInterceptingFactory.new(
              GoogleAds::ERROR_TRANSFORMER,
              highest_factory,
            )
          else
            highest_factory
          end
          VersionAlternate.new(highest_factory, version_alternates)
        end

        private

        def factory_at_version(version, logging_interceptor)
          factory = Factories.at_version(version).services.new(**{
            logging_interceptor: logging_interceptor,
            deprecation: deprecator
          }.merge(gax_service_params))

          factory
        end

        def gax_service_params
          {
            credentials: credentials_or_channel,
            metadata: headers,
            exception_transformer: GoogleAds::ERROR_TRANSFORMER,
            endpoint: endpoint
          }
        end

        def headers
          headers = {
            :"developer-token" => config.developer_token
          }

          if config.login_customer_id
            validate_login_customer_id
            # header values must be strings
            headers[:"login-customer-id"] = config.login_customer_id.to_s
          end

          headers
        end

        def validate_login_customer_id
          begin
            login_customer_id = Integer(config.login_customer_id)
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
