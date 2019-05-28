require 'google/gax'

module Google
  module Ads
    module GoogleAds
      class InfectLROHeaders
        def initialize(class_to_return, headers)
          @class_to_return = class_to_return
          @headers = headers
        end

        def call
          class_to_return = @class_to_return
          headers = @headers
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
      end
    end
  end
end
