require 'google/protobuf/message_exts'
require 'google/protobuf/wrappers_pb'

module Google
  module Ads
    module GoogleAds
      module AutoboxingMappings
        def self.wrap_once(mappings)
          Hash[mappings.map { |field_type, mapping|
            [
              field_type,
              lambda { |value|
                if value == nil
                  nil
                elsif field_type === value
                  value
                else
                  field_type.new(value: mapping.call(value))
                end
              }
            ]
          }]
        end

        MAPPINGS = wrap_once({
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
          Google::Protobuf::FloatValue => lambda { |x| Float(x) },
          Google::Protobuf::DoubleValue => lambda { |x| Float(x) },
          Google::Protobuf::BytesValue => lambda { |x| x.force_encoding("ASCII-8BIT") },
        })

        def self.has_type?(type)
          MAPPINGS.keys.include?(type)
        end

        def self.wrapped_mapping(type)
          MAPPINGS.fetch(type)
        end
      end
    end
  end
end
