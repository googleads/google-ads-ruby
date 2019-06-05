require 'google/ads/google_ads/patch_lro_headers'

module Google
  module Ads
    module GoogleAds
      class ServiceLookup
        def initialize(name, version, lookup_util, service_path, logger, config, credentials_or_channel)
          @name = name
          @version = version
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

          if name.nil?
            services = Factories.at_version(version).services.new(**{
              service_path: service_path,
              logging_interceptor: logging_interceptor,
            }.merge(gax_service_params))
            apply_patch_delegator(services)
          else
            class_to_return = lookup_util.raw_service(name, version)
            setup_service_class(class_to_return)
            class_to_return.new(
              **gax_service_params
            )
          end
        end

        private

        def gax_service_params
          {
            credentials: credentials_or_channel,
            metadata: headers,
            exception_transformer: ERROR_TRANSFORMER
          }
        end

        def setup_service_class(service_class)
          service_path = @service_path
          logging_interceptor = @logging_interceptor
          class_to_return = Class.new(service_class) do
            unless service_path.nil? || service_path.empty?
              const_set('SERVICE_ADDRESS', service_path.freeze)
            end

            const_set('GRPC_INTERCEPTORS', [logging_interceptor].compact)
          end

          patch_lro_headers(class_to_return)
        end

        def apply_patch_delegator(services)
          patch_delegator = Class.new do
            def initialize(services, patch_callable)
              @services = services
              @patch_callable = patch_callable
            end

            def respond_to_missing?(sym, include_private=false)
              @services.respond_to?(sym, include_private)
            end

            def method_missing(name, *args)
              @services.public_send(name, *args) do |cls|
                @patch_callable.call(cls)
                cls
              end
            end
          end
          patch_delegator.new(services, method(:patch_lro_headers))
        end

        def headers
          headers = {
            :"developer-token" => config.developer_token
          }

          if config.login_customer_id
            validate_login_customer_id
            headers[:"login-customer-id"] = config.login_customer_id.to_s  # header values must be strings
          end

          headers
        end

        def patch_lro_headers(class_to_return)
          PatchLROHeaders.new(class_to_return, headers).call
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
