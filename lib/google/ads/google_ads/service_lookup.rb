module Google
  module Ads
    module GoogleAds
      class ServiceLookup
        def initialize(lookup_util, service_path, logger, config, credentials_or_channel)
          @lookup_util = lookup_util
          @service_path = service_path
          @logger = logger
          @config = config
          @credentials_or_channel = credentials_or_channel
        end

        def call
          if logger
            logging_interceptor = Google::Ads::GoogleAds::LoggingInterceptor.new(logger)
          end

          version_alternates = {}
          Factories::VERSIONS.each do |v|
            version_alternates[v] = factory_at_version(v, logging_interceptor)
          end

          highest_factory = factory_at_version(
            Factories::HIGHEST_VERSION,
            logging_interceptor,
          )
          VersionAlternate.new(highest_factory, version_alternates)
        end

        private

        def factory_at_version(version, logging_interceptor)
          factory = Factories.at_version(version).services.new(**{
            service_path: service_path,
            logging_interceptor: logging_interceptor,
          }.merge(gax_service_params))

          factory
        end

        def gax_service_params
          {
            credentials: credentials_or_channel,
            metadata: headers,
            exception_transformer: ERROR_TRANSFORMER
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

        ERROR_TRANSFORMER = Proc.new do |gax_error|
          begin
            gax_error.status_details.each do |detail|
              # If there is an underlying GoogleAdsFailure, throw that one.
              if [
                Google::Ads::GoogleAds::V1::Errors::GoogleAdsFailure === detail,
                Google::Ads::GoogleAds::V2::Errors::GoogleAdsFailure === detail,
              ]
                raise Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                    detail
                )
              elsif detail.is_a?(Google::Protobuf::Any)
                type = Google::Protobuf::DescriptorPool.generated_pool.lookup(
                  detail.type_name
                ).msgclass
                failure = detail.unpack(type)

                raise Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                  failure
                )
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

        attr_reader :name
        attr_reader :version
        attr_reader :service_path
        attr_reader :logger
        attr_reader :config
        attr_reader :credentials_or_channel
        attr_reader :lookup_util
      end
    end
  end
end
