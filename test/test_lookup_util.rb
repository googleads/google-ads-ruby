#!/usr/bin/env ruby
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
# Tests the LookupUtil class.

require 'minitest/autorun'

require 'google/ads/google_ads/lookup_util'

module Google
  module Ads
    module GoogleAds
      class LookupUtil
        public :path_lookup_util
      end
    end
  end
end

class TestLookupUtil < Minitest::Test
  def test_path_instantiation
    lookup_util = Google::Ads::GoogleAds::LookupUtil.new

    util = lookup_util.path_lookup_util(:V1)
    assert_instance_of(Google::Ads::GoogleAds::Utils::V1::PathLookupUtil, util)
    assert_raises do
      util = client.proto_lookup_util(:ABCD)
    end
  end
end
