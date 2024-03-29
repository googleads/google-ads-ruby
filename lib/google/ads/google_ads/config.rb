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
# Configuration setup for and storage for the API.

require 'uri'

module Google
  module Ads
    module GoogleAds
      class Config
        attr_accessor :refresh_token
        attr_accessor :client_id
        attr_accessor :client_secret
        attr_accessor :keyfile
        attr_accessor :impersonate
        attr_accessor :authentication

        attr_accessor :developer_token
        attr_accessor :login_customer_id
        attr_accessor :linked_customer_id
        attr_accessor :use_cloud_org_for_api_access

        attr_accessor :log_level
        attr_accessor :log_target
        attr_accessor :logger

        attr_accessor :treat_deprecation_warnings_as_errors
        attr_accessor :warn_on_all_deprecations

        attr_accessor :use_insecure_channel

        attr_accessor :api_endpoint

        def initialize(&block)
          @refresh_token = nil
          @client_id = nil
          @client_secret = nil
          @keyfile = nil
          @impersonate = nil
          @authentication = nil

          @developer_token = nil
          @login_customer_id = nil
          @linked_customer_id = nil
          @use_cloud_org_for_api_access = false

          @log_level = nil
          @log_target = nil
          @logger = nil

          @treat_deprecation_warnings_as_errors = false
          @warn_on_all_deprecations = false

          @use_insecure_channel = false

          @api_endpoint = nil

          yield self if block_given?
        end

        def configure(&block)
          yield self
        end

        def http_proxy=(uri)
          if uri.nil?
            ENV["http_proxy"] = nil
            return
          end

          u = URI.parse(uri)
          if u.scheme != "http" && u.scheme != "https"
            raise ArgumentError, "#{uri} has invalid scheme #{u.scheme}, should be http or https"
          end

          ENV["http_proxy"] = uri
        end

        def http_proxy
          ENV["http_proxy"]
        end
      end
    end
  end
end
