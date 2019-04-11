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

module Google
  module Ads
    module GoogleAds
      class Config
        class << self
          attr_accessor :treat_deprecations_as_errors
        end

        attr_accessor :refresh_token
        attr_accessor :client_id
        attr_accessor :client_secret
        attr_accessor :developer_token
        attr_accessor :login_customer_id

        attr_accessor :log_level
        attr_accessor :log_target
        attr_accessor :logger

        def initialize(&block)
          @refresh_token = nil
          @client_id = nil
          @client_secret = nil
          @developer_token = nil
          @login_customer_id = nil

          @log_level = nil
          @log_target = nil
          @logger = nil
          yield self if block_given?
        end

        def configure(&block)
          yield self
        end
      end
    end
  end
end
