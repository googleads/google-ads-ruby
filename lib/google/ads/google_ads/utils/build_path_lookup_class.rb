#!/usr/bin/ruby
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

require "google/ads/google_ads/utils/path_lookup_definer"

module Google
  module Ads
    module GoogleAds
      module Utils
        def self.build_path_lookup_class(version)
          Class.new do
            define_method(:initialize) do
              @lookups = Set.new
              @non_path_methods = Set.new
            end

            define_method(:respond_to_missing?) do |name, include_private=false|
              validate_method_name(name) || super
            end

            define_method(:method_missing) do |name, *args, **kwargs|
              raise ArgumentError, "unknown path type #{name}" unless validate_method_name(name)
              if args.any? { |arg| arg.nil? }
                raise ArgumentError, "invalid args for #{name}: #{args.inspect}"
              end

              define_lookup_method(name, version)
              send(name, *args, **kwargs)
            end

            define_method(:define_lookup_method) do |name, version|
              Utils::PathLookupDefiner.new(self, name).call(version)
            end

            define_method(:validate_method_name) do |name|
              if !@non_path_methods.include?(name)
                return true if @lookups.include?(name)
                begin
                  require "google/ads/google_ads/#{version}/services/#{name}_service/paths"
                  @lookups.add(name)
                  return true
                rescue LoadError => e
                  @non_path_methods.add(name)
                end
                return false
              end
            end
          end
        end
      end
    end
  end
end
