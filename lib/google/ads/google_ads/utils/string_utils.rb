# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# Utility that generates up resource names for entities given IDs.

module Google
  module Ads
    module GoogleAds
      module Utils
        # Takes a string and converts it from snake case to camel case. e.g:
        # foo_service becomes FooService
        def self.camelize(string)
          string.to_str.split("_").map(&:capitalize).join
        end

        # Takes a string and converts it from snake case to camel case with a
        # lower case first letter. e.g:
        # foo_service becomes fooService
        def self.lower_camelize(string)
          camelized = camelize(string)
          camelized[0] = camelized[0].downcase
          camelized
        end

        def self.underscore(string)
          string.to_str.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("-", "_").
            downcase
        end
      end
    end
  end
end
