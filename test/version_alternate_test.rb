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
# Tests the version alternate class

require 'minitest/autorun'
require 'google/ads/google_ads/version_alternate'

class TestVersionAlternate < Minitest::Test
  FakeTestClass = Class.new do
    def services
      @services ||= Object.new
    end
  end

  def setup
    @made_up_version_hash = {
      V1: FakeTestClass.new,
      V2: FakeTestClass.new,
    }

    @va = Google::Ads::GoogleAds::VersionAlternate.new(
      @made_up_version_hash.fetch(:V2),
      @made_up_version_hash
    )
  end

  def test_main_delegates
    assert_equal(
      @va.services,
      @made_up_version_hash.fetch(:V2).services
    )
  end

  def test_version_delegators
    assert_equal(
      @va.v1.services,
      @made_up_version_hash.fetch(:V1).services
    )

    assert_equal(
      @va.v2.services,
      @made_up_version_hash.fetch(:V2).services
    )
  end
end
