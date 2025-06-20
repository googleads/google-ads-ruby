# Encoding: utf-8
#
# Copyright 2022 Google LLC
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

require "google/ads/google_ads/utils/build_path_lookup_class"

module Google
  module Ads
    module GoogleAds
      module Utils
        module V20
          PathLookupUtil = Utils.build_path_lookup_class(:v20)
        end
      end
    end
  end
end
