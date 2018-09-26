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
# File for all errors that will be used by the Google Ads API Library.

module Google
  module Ads
    module GoogleAds
      module Errors

        # Generic error class for non-specific errors.
        class Error < ::StandardError
        end

        # Raised when encountering an API-specific error, such as an entity
        # not found or a malformed query.
        class GoogleAdsError < Error
          attr_reader :failure

          def initialize(failure)
            @failure = failure
          end
        end
      end
    end
  end
end
