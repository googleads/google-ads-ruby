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
# Utility for constructing field masks, which are necessary for update
# operations.

require "google/protobuf"

module Google
  module Ads
    module Googleads
      # Utility for constructing FieldMask objects.
      #
      # Copied from C# implementation courtesy of jonskeet@google.com
      class FieldMaskUtil
        # Construct a field mask containing any changes to the object made
        # in the given block.
        #
        # Example:
        #
        #   obj = MyObject.new
        #   obj.some_property = 1
        #
        #   mask = FieldMaskUtil.with obj do
        #     obj.other_property = 2
        #   end
        #
        #   # the mask will contain the changed property "other_property"
        #   api_client.mutate obj, mask
        #
        # @param obj [Object] the object to watch
        # @yield block used for determining changes to the object
        # @return [Google::Protobuf::FieldMask] the computed mask
        def self.with(obj)
          raise 'nil cannot be compared' if obj.nil?
          original = obj.class.decode(obj.class.encode(obj))
          yield
          compare original, obj
        end

        # Construct a field mask containing any fields set on the given object.
        #
        # Example:
        #
        #   obj = MyObject.new
        #   obj.some_property = 1
        #   obj.other_property = 2
        #
        #   mask = FieldMaskUtil.all_set_fields_of obj
        #
        #   # the mask will contain the present properties "some_property" and
        #   # "other_property"
        #   api_client.mutate obj, mask
        #
        # @param obj [Object] the object to watch
        # return [Google::Protobuf::FieldMask] the computed mask
        def self.all_set_fields_of(obj)
          new_instance = obj.class.new
          compare_obj(Google::Protobuf::FieldMask.new, '', new_instance, obj)
        end

        # Creates Google::Protobuf::FieldMask objects based on the
        # difference between two objects.
        #
        # @param original
        # @param modified
        # @return [Google::Protobuf::FieldMask] the computed mask
        def self.compare(original, modified)
          raise 'nil cannot be compared' if original.nil? || modified.nil?
          raise 'objects of different types cannot be compared' if original.class != modified.class
          compare_obj(Google::Protobuf::FieldMask.new, '', original, modified)
        end

        def self.compare_obj(mask, current_field, original, modified)
          descriptor = original.class.descriptor

          descriptor.entries.each do |field|
            field_path = get_path current_field, field.name

            # extract values
            original_value = original[field.name]
            modified_value = modified[field.name]

            if is_repeated?(original_value) || is_repeated?(modified_value)
              # repeated fields - must match exactly or add the field
              mask.paths << field_path unless original_value == modified_value
            else
              case field.type
              when :message
                if original_value != modified_value
                  # wrappers - do not include the .value part of the path
                  if is_wrapper? [original_value, modified_value]
                    mask.paths << field_path
                  elsif original_value.nil?
                    # new message, make a blank instance and then compare
                    # against it
                    original_value = modified[field.name].class.new
                    compare_obj mask, field_path, original_value, modified_value
                  elsif modified_value.nil?
                    # just emit the deleted field name
                    mask.paths << field_path
                  else
                    compare_obj mask, field_path, original_value, modified_value
                  end
                end
              else # primitive types
                mask.paths << field_path unless original_value == modified_value
              end
            end
          end

          mask
        end

        # Construts path string
        def self.get_path(path, field)
          path.nil? || path == '' ? field : "#{path}.#{field}"
        end

        WRAPPER_TYPES = [Google::Protobuf::DoubleValue,
                          Google::Protobuf::FloatValue,
                          Google::Protobuf::Int64Value,
                          Google::Protobuf::UInt64Value,
                          Google::Protobuf::Int32Value,
                          Google::Protobuf::UInt32Value,
                          Google::Protobuf::BoolValue,
                          Google::Protobuf::StringValue,
                          Google::Protobuf::BytesValue].freeze

        # Checks if the object is a wrapper type
        def self.is_wrapper?(obj)
          obj = [obj] unless obj.is_a?(Array)
          obj.any? { |x| WRAPPER_TYPES.count { |klass| klass == x.class } > 0 }
        end

        # Checks if the object is a repeated field
        def self.is_repeated?(obj)
          obj.is_a?(Google::Protobuf::RepeatedField)
        end

        private_class_method :compare_obj, :get_path, :is_wrapper?,
            :is_repeated?
      end
    end
  end
end
