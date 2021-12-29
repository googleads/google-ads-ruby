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
# A utility to generate wrapped primitive values for use when assigning to
# API entities.

require 'google/protobuf/wrappers_pb'

module Google
  module Ads
    module GoogleAds
      class WrapperUtil
        def self.int32(v)
          Google::Protobuf::Int32Value.new(value: v)
        end

        def self.int64(v)
          Google::Protobuf::Int64Value.new(value: v)
        end

        def self.string(v)
          Google::Protobuf::StringValue.new(value: v)
        end

        def self.bool(v)
          Google::Protobuf::BoolValue.new(value: v)
        end

        def self.double(v)
          Google::Protobuf::DoubleValue.new(value: v)
        end

        def self.float(v)
          Google::Protobuf::FloatValue.new(value: v)
        end

        def self.bytes(v)
          Google::Protobuf::BytesValue.new(value: v)
        end
      end
    end
  end
end
