require 'google/protobuf/message_exts'
require 'google/protobuf/wrappers_pb'
module Google
  module Ads
    module GoogleAds
      module AutoboxingFields
        MAPPINGS = {
          Google::Protobuf::Int32Value => lambda { |x| Integer(x) },
          Google::Protobuf::Int64Value => lambda { |x| Integer(x) },
          Google::Protobuf::StringValue => lambda { |x| String(x) },
          Google::Protobuf::BoolValue => lambda { |x|
            case x
            when TrueClass, true, "true", "TRUE", "True", "1", 1
              true
            when FalseClass, false, "false", "FALSE", "False", "0", 0
              false
            else
              raise ArgumentError.new("Value #{x} is not boolish")
            end
          },
          Google::Protobuf::DoubleValue => lambda { |x| Float(x) },
          Google::Protobuf::BytesValue => lambda { |x| x.force_encoding("ASCII-8BIT") },
        }

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
          MAPPINGS.keys.include?(class_name)
        end

        def self.patch_constructor_for_autoboxing(fields, klass_to_patch)
          orig_initialize = klass_to_patch.instance_method(:initialize)
          klass_to_patch.instance_eval do
            define_method(:initialize) do |**kwargs|
              new_kwargs = Hash[kwargs.map { |name, value|
                field = fields.select { |x| x.name == name.to_s }.first
                actual_value = if field
                                 field.subtype.msgclass.new(value: MAPPINGS.fetch(field.subtype.msgclass).call(value))
                               else
                                 value
                               end
                [name, actual_value]
              }]
              orig_initialize.bind(self).call(**new_kwargs)
            end
          end
        end

        def self.patch_field_for_autoboxing(field, klass_to_patch)
          name = field.name
          field_klass = field.subtype.msgclass
          mapping = MAPPINGS.fetch(field_klass)

          klass_to_patch.instance_eval do
            define_method("#{name}=".to_sym) do |value|
              if value.nil?
                send(:method_missing, :"#{name}=", value)
              elsif field_klass === value
                send(:method_missing, :"#{name}=", value)
              else
                send(:method_missing, :"#{name}=", field_klass.new(value: mapping.call(value)))
              end
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
