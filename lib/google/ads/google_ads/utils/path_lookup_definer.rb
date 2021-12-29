#!/usr/bin/env ruby
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

require "google/ads/google_ads/utils/string_utils"

module Google
  module Ads
    module GoogleAds
      module Utils
        class PathLookupDefiner
          def initialize(target, name)
            @target = target
            @name = name
          end

          # Defines a path lookup method on the target object instance that
          # calls the underlying gapic path helper. While this implementation
          # looks pretty scary, all it's really doing is a bunch of argument
          # transforms from one kwarg form to another. There are a bunch of
          # class level helper methods below this call funciton that extract
          # some of the gnarlier behaviour. Usually class methods come before
          # instance methods, but they aren't super important to the
          # implementation here by comparison with this method, so I moved them
          # below.
          def call(version)
            name = @name
            @target.send(:define_singleton_method, name) do |*args, **kwargs|
              mod_host = Utils::PathLookupDefiner.load_path_helper(name, version)
              target_method = mod_host.method(:"#{name}_path")

              params = Utils::PathLookupDefiner.kwargs_from(target_method)

              Utils::PathLookupDefiner.verify_args(name, params, args, kwargs)

              if !args.empty?
                params.each_with_index do |arg, idx|
                  kwargs[arg] = args[idx]
                end
              end

              compound_paths = params.map { |arg_group|
                kwargs.fetch_values(*arg_group).join("~")
              }

              new_kwargs = Hash[params.zip(compound_paths)]

              target_method.call(**new_kwargs)
            end
          end

          def self.verify_args(name, params, args, kwargs)
            total_arg_count = params.length
            positional_form = "#{name}(#{params.join(", ")})"
            kwargs_form = "#{name}(#{params.map { |arg| "#{arg}:" }.join(", ")})"

            if kwargs.empty? && !args.empty?
              if args.length != total_arg_count
                raise ArgumentError, "must specify #{positional_form} if using " \
                  "positional arguments (DEPRECATED), or #{kwargs_form}"
              end
            elsif !args.empty?
              raise ArgumentError, "#{name} does not simultaneously accept " \
                "positional arguments and keyword arguments, must specify " \
                "#{kwargs_form}"
            elsif !(params.all? { |k| kwargs.include?(k) })
              raise ArgumentError, "must specify #{kwargs_form}"
            end
          end

          def self.kwargs_from(method)
            method.parameters.select { |param|
              param.first == :keyreq
            }.map { |param|
              param[1]
            }
          end

          def self.load_path_helper(name, version)
            require "google/ads/google_ads/#{version}/services/#{name}_service/paths"

            const_name = ::Google::Ads::GoogleAds::Utils.camelize(name.to_s)

            mod_host = Object.new
            mod = Kernel.const_get("Google::Ads::GoogleAds::#{version.upcase}::Services::#{const_name}Service::Paths")
            mod_host.extend(mod)
            mod_host
          end
        end
      end
    end
  end
end
