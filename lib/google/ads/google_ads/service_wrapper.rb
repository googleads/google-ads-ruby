require 'google/ads/google_ads/utils/string_utils'

module Google
  module Ads
    module GoogleAds
      class ServiceWrapper
        # @param service a generated gax client object
        # @param rpc_inputs [Hash] a hash from rpc method names on the passed
        #  service to their input types, e.g. for GoogleAdsService::Client a
        #  hash containing {search: SearchGoogleAdsRequest} etc.
        #
        def initialize(service:, rpc_inputs:, deprecation:)
          @service = service
          @rpc_inputs = rpc_inputs
          @deprecation = deprecation
        end

        def respond_to_missing?(m, include_private=false)
          service.respond_to?(m, include_private)
        end

        def method_missing(name, *args, **kwargs, &blk)
          # delegate with no request manipulation if the method isn't an
          # rpc, so that we don't elide any of the configuration or other
          # methods available on the gax clients
          unless rpc_inputs.include?(name)
            return service.public_send(name, *args, **kwargs, &blk)
          end

          rpc_input_class = rpc_inputs.fetch(name)
          request = rpc_input_class.new

          if kwargs.include?(:request) || kwargs.include?(:options)
            options = kwargs.delete(:options)

            kwargs.fetch(:request, {}).each do |name, value|
              write_field(request, value, name)
            end

            service.public_send(name, request, options)
          elsif !kwargs.empty? && args.empty?
            kwargs.each do |name, value|
              write_field(request, value, name)
            end

            service.public_send(name, request, nil)
          elsif args.empty?
            # no args specified at all, just pass through
            service.public_send(name, request, nil)
          else
            # this branch is the legacy version
            kwargs.each do |name, value|
              request.public_send("#{name}=", value)
            end

            # zip will fill with nils by default, so we truncate the number
            # of fields we set to match the argument length here.
            args_and_fields = args.zip(
              request_positional_args(rpc_input_class)[0...args.length]
            )

            field_names = []
            args_and_fields.each do |(arg, field)|
              write_field(request, arg, field)
              field_names << field.name
            end

            service_name_segments = service.class.name.split("::")
            service_name = GoogleAds::Utils.underscore(
              service_name_segments[service_name_segments.length-2]
            )
            method_name = "#{service_name}.#{name}"
            deprecation.deprecate(
              "Calling #{method_name} with positional " \
              "arguments is deprecated, please update it to use kwargs, e.g.: " \
              "#{method_name}" \
              "(#{field_names.map { |fn| "#{fn}: ..."}.join(", ")})"
            )

            service.public_send(name, request)
          end
        end

        private

        def request_positional_args(rpc_input_class)
          # one of fields are never positional arguments in the old monolithic
          # generator's code, so this selects all the one of fields in the
          # descriptor and puts their names in a set. Then we remove them
          # from the final array of args we return.
          one_of_fields = Set.new
          rpc_input_class.descriptor.each_oneof do |one_of|
            one_of.each do |field|
              one_of_fields.add(field.name)
            end
          end

          fields_to_reject = one_of_fields
          fields_to_reject.add("partial_failure")
          fields_to_reject.add("validate_only")

          rpc_input_class.descriptor.to_a.reject { |field|
            fields_to_reject.include?(field.name)
          }
        end

        def write_field(request, arg, field)
          if Symbol === field
            name = field.to_s
            field = request.class.descriptor.lookup(field.to_s)
            raise ArgumentError, "unknown field #{name}" if field.nil?
          end

          if field.label == :repeated
            unless Array === arg
              raise(
                ArgumentError,
                "Must pass an array to assign to repeated field #{field.name}",
              )
            end
            repeated = request.public_send(field.name)
            arg.each { |a| repeated << a }
          else
            request.public_send("#{field.name}=", arg)
          end
        end

        attr_reader :service
        attr_reader :rpc_inputs
        attr_reader :deprecation
      end
    end
  end
end
