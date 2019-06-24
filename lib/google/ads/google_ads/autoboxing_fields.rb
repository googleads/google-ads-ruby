require 'google/ads/google_ads/autoboxing_mappings'

module Google
  module Ads
    module GoogleAds
      module AutoboxingFields
        def self.patch_class(klass)
          return if klass.instance_variable_get(:@_patched_for_autoboxing_fields)
          klass.instance_variable_set(:@_patched_for_autoboxing_fields, true)

          klass.instance_eval do
            fields = []
            descriptor.each do |field|
              if field.type == :message && AutoboxingFields.is_value_field?(field.subtype.msgclass)
                fields << field
                AutoboxingFields.patch_field_for_autoboxing(field, self)
              end
            end

            AutoboxingFields.patch_constructor_for_autoboxing(fields, self)
          end
        end

        def self.is_value_field?(class_name)
          AutoboxingMappings.has_type?(class_name)
        end

        def self.patch_constructor_for_autoboxing(fields, klass_to_patch)
          orig_initialize = klass_to_patch.instance_method(:initialize)
          klass_to_patch.instance_eval do
            define_method(:initialize) do |**kwargs|
              new_kwargs = Hash[kwargs.map { |name, value|
                field = fields.select { |x| x.name == name.to_s }.first
                actual_value = AutoboxingMappings.wrapped_mapping(field.subtype.msgclass).call(value)
                [name, actual_value]
              }]
              orig_initialize.bind(self).call(**new_kwargs)
            end
          end
        end

        def self.patch_field_for_autoboxing(field, klass_to_patch)
          name = field.name
          mapping = AutoboxingMappings.wrapped_mapping(field.subtype.msgclass)

          klass_to_patch.instance_eval do
            define_method("#{name}=".to_sym) do |value|
              send(:method_missing, :"#{name}=", mapping.call(value))
            end
          end
        end
      end
    end
  end
end

module Google::Protobuf
  module MessageExts
    module ClassMethods
      def new(*args, &blk)
        if self.name.start_with?("Google::Ads::GoogleAds")
          Google::Ads::GoogleAds::AutoboxingFields.patch_class(self)
        end

        super
      end
    end
  end
end
