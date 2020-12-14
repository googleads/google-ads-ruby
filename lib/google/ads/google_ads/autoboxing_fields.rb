require 'delegate'
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
            repeated_fields = []

            descriptor.each do |field|
              if field.type == :message && AutoboxingFields.is_value_field?(field.subtype.msgclass)
                repeated = field.label == :repeated
                if repeated
                  repeated_fields << field
                else
                  fields << field
                end

                AutoboxingFields.patch_field_for_autoboxing(field, repeated, self)
              end
            end

            AutoboxingFields.patch_constructor_for_autoboxing(fields, repeated_fields, self)
          end
        end

        def self.is_value_field?(class_name)
          AutoboxingMappings.has_type?(class_name)
        end

        def self.patch_constructor_for_autoboxing(fields, repeated_fields, klass_to_patch)
          orig_initialize = klass_to_patch.instance_method(:initialize)
          klass_to_patch.instance_eval do
            fields_map = fields.map { |field| [field.name.to_sym, field] }.to_h
            repeated_fields_map = repeated_fields.map { |field| [field.name.to_sym, field] }.to_h
            define_method(:initialize) do |**kwargs|
              new_kwargs = kwargs.dup
              if !kwargs.empty?
                kwargs.each do |kwarg, value|
                  if fields_map.include?(kwarg)
                    new_kwargs[kwarg] = AutoboxingMappings.wrapped_mapping(fields_map[kwarg].subtype.msgclass).call(value)
                  elsif repeated_fields_map.include?(kwarg)
                    mapping = AutoboxingMappings.wrapped_mapping(repeated_fields_map[kwarg].subtype.msgclass)
                    new_kwargs[kwarg] = value.map { |x| mapping.call(x) }
                  end
                end
              end

              orig_initialize.bind(self).call(**new_kwargs)
            end
          end
        end

        def self.patch_field_for_autoboxing(field, repeated, klass_to_patch)
          name = field.name
          mapping = AutoboxingMappings.wrapped_mapping(field.subtype.msgclass)

          if repeated
            klass_to_patch.instance_eval do
              define_method(name.to_sym) do
                @patched_repeated_fields ||= {}
                @patched_repeated_fields[name] ||= RepeatedFieldProxy.new(
                  send(:method_missing, name.to_sym),
                  mapping,
                )
                @patched_repeated_fields[name]
              end
            end
          else
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
end

class RepeatedFieldProxy < SimpleDelegator
  def initialize(collection, mapping)
    super(collection)
    @mapping = mapping
  end

  def <<(value)
    super(@mapping.call(value))
  end
end

module Google::Protobuf
  module MessageExts
    module ClassMethods
      def new(*args, &blk)
        if self.name.start_with?("Google::Ads::GoogleAds") &&
            !["V6"].any? { |v| self.name.include?(v) }
          Google::Ads::GoogleAds::AutoboxingFields.patch_class(self)
        end

        super
      end
    end
  end
end
